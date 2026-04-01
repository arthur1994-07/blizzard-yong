#include "../pch.h"
#include "../../SigmaCore/Util/SystemInfo.h"

#include "./CaptureTheFieldManager.h"
#include "./CaptureTheFieldScriptMan.h"

#include "../../RanLogic/GLUseFeatures.h"
#include "../../RanLogic/GLogicDataMan.h"

#include "../Land/GLLandMan.h"
#include "../FieldServer/GLGaeaServer.h"


// ----------------------------------------------------------------------------
#include "../../SigmaCore/DebugInclude.h"
// ----------------------------------------------------------------------------

static const int nLastDayOfMonth[CaptureTheFieldMan::MONTH_OF_YEAR] = { 31,28,31,30,31,30,31,31,30,31,30,31 };

class GLLandMan;


CaptureTheFieldMan::CaptureTheFieldMan()
:m_dwID(SNATIVEID(false).dwID)
,m_state(CTF_STATE_STOP)
,m_dwPVEMapID(SNATIVEID(false).dwID)
,m_dwPVPMapID(SNATIVEID(false).dwID)
,m_dwCertificationID1(SNATIVEID(false).dwID)
,m_dwCertificationID2(SNATIVEID(false).dwID)
,m_dwCertificationID3(SNATIVEID(false).dwID)
,m_dwGateStart(0)
,m_dwGateExit1(0)
,m_dwGateExit2(0)
,m_nPlayTimeM(30)
,m_nMaxRebirthTime(0)
,m_nChannel(0)
,m_nUpdatePlayersFreq(10000)
,m_fUpdatePlayerPositionFreq(1.0f)
,m_nContributionPoint4Winner(0)
,m_nContributionPoint4Loser(0)
,m_nContributionPointMax(50)
,m_wSchoolAuthed(SCHOOL_NONE)
,m_wRequiredLevel(1)
,m_bConsecutivelyCapturel(TRUE)
,m_dwConsecutivelyNumber(0)
,m_bConsecutively(FALSE)
,m_bPrevConsecutively(FALSE)
,m_dwDamage(0)
,m_dwRecovery(0)
/*dmk14 item reward*/
,m_sItemRewardWin(SNATIVEID(false))
,m_sItemRewardLost(SNATIVEID(false))
,m_dwQtyRewardWin(0)
,m_dwQtyRewardLost(0)
,m_nStartTimeIndexPrev(0)
{
	m_pScriptMan = new CaptureTheFieldScriptMan();

	for (int i=0; i<SCHOOL_NUM; i++)
		m_dwGateRevival[i] = 0;

	
}


CaptureTheFieldMan::~CaptureTheFieldMan()
{
	SAFE_DELETE(m_pScriptMan);
}


BOOL CaptureTheFieldMan::Initialize()
{
	if (!GLUseFeatures::GetInstance().IsUsingCaptureTheField())
		return FALSE;

	//
	//Load Script
	//
	std::string strScriptPath(sc::getAppPath());
	strScriptPath.append("\\Data\\GLogicServer\\");
	strScriptPath.append("scripts\\");

	std::string strCTFScriptPath(strScriptPath);    
    strCTFScriptPath.append(GLogicData::GetInstance().GetCaptureTheFieldScriptName());

	m_pScriptMan->LoadScript(strCTFScriptPath.c_str());
	
	if (!m_pScriptMan->IsLoaded())
	{
		sc::writeLogError(std::string("CaptureTheFieldMan::Initialize() failure. Script MUST be loaded to run this feature."));

		return FALSE;
	}


	//
	// Initialization using script.
	//
	m_dwID					= SNATIVEID(1, 0).dwID;		//NOT USED YET!
	
	//
	//MapID
	//
	m_dwPVEMapID			= SNATIVEID(m_pScriptMan->GetConfigWORD("PvEMapMID"), m_pScriptMan->GetConfigWORD("PvEMapSID")).dwID;
	m_dwPVPMapID			= SNATIVEID(m_pScriptMan->GetConfigWORD("PvPMapMID"), m_pScriptMan->GetConfigWORD("PvPMapSID")).dwID;
	
	//
	//NPCs
	//
	m_dwCertificationID1	= SNATIVEID(m_pScriptMan->GetConfigWORD("Certification1MID"), m_pScriptMan->GetConfigWORD("Certification1SID")).dwID;
	m_dwCertificationID2	= SNATIVEID(m_pScriptMan->GetConfigWORD("Certification2MID"), m_pScriptMan->GetConfigWORD("Certification2SID")).dwID;
	m_dwCertificationID3	= SNATIVEID(m_pScriptMan->GetConfigWORD("Certification3MID"), m_pScriptMan->GetConfigWORD("Certification3SID")).dwID;
	
	m_nChannel				= m_pScriptMan->GetConfigUINT("Channel");

	//
	//Gates
	//
	m_dwGateStart			= m_pScriptMan->GetConfigUINT("GateStart");

	m_dwGateExit1			= m_pScriptMan->GetConfigUINT("GateExit1");
	m_dwGateExit2			= m_pScriptMan->GetConfigUINT("GateExit2");


	m_dwGateRevival[SCHOOL_SM]	= m_pScriptMan->GetConfigUINT("GateRevivalSM");
	m_dwGateRevival[SCHOOL_HA]	= m_pScriptMan->GetConfigUINT("GateRevivalHA");
	m_dwGateRevival[SCHOOL_BH]	= m_pScriptMan->GetConfigUINT("GateRevivalBH");

	m_dwMapIDKickOut[SCHOOL_SM]		= SNATIVEID(m_pScriptMan->GetConfigWORD("KickOutMapMIDSM"), m_pScriptMan->GetConfigWORD("KickOutMapSIDSM")).dwID;
	m_dwGateKickOut[SCHOOL_SM]		= m_pScriptMan->GetConfigUINT("KickOutGateIDSM");

	m_dwMapIDKickOut[SCHOOL_HA]		= SNATIVEID(m_pScriptMan->GetConfigWORD("KickOutMapMIDHA"), m_pScriptMan->GetConfigWORD("KickOutMapSIDHA")).dwID;
	m_dwGateKickOut[SCHOOL_HA]		= m_pScriptMan->GetConfigUINT("KickOutGateIDHA");

	m_dwMapIDKickOut[SCHOOL_BH]		= SNATIVEID(m_pScriptMan->GetConfigWORD("KickOutMapMIDBH"), m_pScriptMan->GetConfigWORD("KickOutMapSIDBH")).dwID;
	m_dwGateKickOut[SCHOOL_BH]		= m_pScriptMan->GetConfigUINT("KickOutGateIDBH");

	
	m_nReadyDurationM		= m_pScriptMan->GetConfigUINT("ReadyDurationM");
	GASSERT(m_nReadyDurationM > 0);
	m_ctsReadyDurationM		= CTimeSpan(0, 0, m_nReadyDurationM, 0);


	m_nRewardTimeM			= m_pScriptMan->GetConfigUINT("RewardTimeM");
	GASSERT(m_nRewardTimeM > 0);
	m_ctsRewardTimeM		= CTimeSpan(0, 0, m_nRewardTimeM, 0);

	
	m_nStartCycleH			= m_pScriptMan->GetConfigUINT("StartCycleH");	
	GASSERT(m_nStartCycleH > 0);
	m_nStartCycleS			= m_nStartCycleH * 3600;
	m_ctsStartCycleH		= CTimeSpan(0, m_nStartCycleH, 0, 0);
	

	m_nPlayTimeM			= m_pScriptMan->GetConfigUINT("PlayTimeM");
	GASSERT(m_nPlayTimeM > 0);
	m_ctsPlayTimeM			= CTimeSpan(0, 0, m_nPlayTimeM, 0);

	// Schedule loading from script
	m_vecSchedule.clear();
	DWORD dwNum				= m_pScriptMan->GetConfigUINT("ScheduleNum");
	CString strDay,strHour,strMinute;
	for( DWORD i=0; i<dwNum; i++ )
	{
		strDay.Format("Scedule_Day_%d", i );
		strHour.Format("Scedule_Hour_%d", i );
		strMinute.Format("Scedule_Minute_%d", i );

		CAPTURE_THE_FLAG_SCHED sched;
		sched.wStartDay = m_pScriptMan->GetConfigUINT( strDay.GetString() );
		sched.wStartHour = m_pScriptMan->GetConfigUINT( strHour.GetString() );
		sched.wStartMinute = m_pScriptMan->GetConfigUINT( strMinute.GetString() );

		if ( sched.wStartDay < 1 || sched.wStartDay > 7 )	continue;
		if ( sched.wStartHour >= 24 )						continue;
		if ( sched.wStartMinute >= 60 )						continue;

		m_vecSchedule.push_back( sched );
	}
	std::sort( m_vecSchedule.begin(), m_vecSchedule.end() );
	FindScheduleFirst();

	// Old cycle-based time init (replaced by schedule system)
	//m_ctStartTime			= CTime::GetCurrentTime() + m_ctsStartCycleH;
	//m_ctStopTime			= m_ctStartTime + m_ctsPlayTimeM;
	//m_ctExtraTime			= m_ctStopTime + m_ctsRewardTimeM;
	//m_ctReadyTime			= m_ctStartTime - m_ctsReadyDurationM;

	m_nMaxNumOfJoiners		= m_pScriptMan->GetConfigUINT("MaxNumOfJoiners");
	
	//
	// nMaxNumOfPlayers < CTF_PLAYER_NUM_LIMIT (60) <-- 이 값보다 큰 값으로 설정하고자 할 경우네는 프로그래머에게 문의
	//
	m_nMaxNumOfPlayers		= m_pScriptMan->GetConfigUINT("MaxNumOfPlayers");

	//
	// Script에서 설정하는 각 학원 별 CTF Player의 인원 수는 이 값을 넘어서는 안된다.
	//
	GASSERT( m_nMaxNumOfPlayers >= SCHOOL_NUM );
	GASSERT(m_nMaxNumOfPlayers <= CTF_PLAYER_NUM_LIMIT_PER_SCHOOL);


	m_nMaxRebirthTime		= m_pScriptMan->GetConfigUINT("MaxRebirthTimeS");
	
	m_nUpdatePlayersFreq	= m_pScriptMan->GetConfigUINT("UpdatePlayersFreq");		//msec

	m_fUpdatePlayerPositionFreq	= m_pScriptMan->GetConfigfloat("UpdateMinimapFreq");//msec

	m_nContributionPoint4Winner	= m_pScriptMan->GetConfigUINT("ContributionPoint4Winner");
	m_nContributionPoint4Loser	= m_pScriptMan->GetConfigUINT("ContributionPoint4Loser");
	m_nContributionPointMax		= m_pScriptMan->GetConfigUINT("ContributionPointMax");

	m_wRequiredLevel			= m_pScriptMan->GetConfigUINT("RequiredLevel");

	m_bConsecutivelyCapturel	= m_pScriptMan->GetConfigbool("ConsecutivelyCapturel") == true ? TRUE : FALSE;

	m_dwConsecutivelyNumber		= m_pScriptMan->GetConfigUINT("ConsecutivelyNumber");

	m_dwDamage					= m_pScriptMan->GetConfigUINT("Damage");
	m_dwRecovery				= m_pScriptMan->GetConfigUINT("Recovery");

	/*dmk14 item reward*/
	m_sItemRewardWin	= SNATIVEID(m_pScriptMan->GetConfigWORD("PvPWinRewardMID"), m_pScriptMan->GetConfigWORD("PvPWinRewardSID")).dwID;
	m_sItemRewardLost	= SNATIVEID(m_pScriptMan->GetConfigWORD("PvPLostRewardMID"), m_pScriptMan->GetConfigWORD("PvPLostRewardSID")).dwID;
	m_dwQtyRewardWin	= m_pScriptMan->GetConfigUINT("PvPWinRewardQty");
	m_dwQtyRewardLost	= m_pScriptMan->GetConfigUINT("PvPLostRewardQty");
	/*dmk14 item reward*/


	// I will make vector size to limited number of consecutive
	// because of it doesn't need to save over count 
	// in this case if 100 numbers saved than it can do
	// ex) if 3
	// if AAA, A cannot join
	// if ABC, AAB etc.. everyone can join
	for(DWORD i= 0; i <m_dwConsecutivelyNumber; i++)
		SetConsecutively(SCHOOL_NONE);
	
	//
	// Some Log Structures HERE .
	//
	HookAfterInit();

	return TRUE;
}


void CaptureTheFieldMan::AddRewardBuff(SNATIVEID id, WORD wLevel)
{   
	m_vecRewardBuffs.push_back(CTF_REWARD_BUFF(id.dwID, wLevel));
}


void CaptureTheFieldMan::GetRewardBuff(UINT idx, OUT CTF_REWARD_BUFF &rewardBuff)
{
    GASSERT( idx < (UINT)m_vecRewardBuffs.size() );

    rewardBuff.dwID     = m_vecRewardBuffs[idx].dwID;
    rewardBuff.wLevel   = m_vecRewardBuffs[idx].wLevel;
}

void CaptureTheFieldMan::FindScheduleFirst()
{
	/* reference gs schedule old 
	m_ctStartTime			= CTime::GetCurrentTime() + m_ctsStartCycleH;
	m_ctStopTime			= m_ctStartTime + m_ctsPlayTimeM;
	m_ctExtraTime			= m_ctStopTime + m_ctsRewardTimeM;

	m_ctReadyTime			= m_ctStartTime - m_ctsReadyDurationM;
	*/
	if ( m_vecSchedule.empty() )	return;
	m_sScheduleNext.dwIndex = UINT_MAX;

	if ( m_vecSchedule.size() == 1 )
	{
		m_sScheduleNext.dwIndex = 0;
		m_sScheduleNext.sStartSched = m_vecSchedule[0];

		CTime tCur = CTime::GetCurrentTime();
	    int nYear = tCur.GetYear();
		int nMonth = tCur.GetMonth();
		int nDay = tCur.GetDay();

		CTime cTemp ( nYear, nMonth, nDay, m_sScheduleNext.sStartSched.wStartHour, m_sScheduleNext.sStartSched.wStartMinute, 0 );

		m_ctStartTime		= cTemp;
		m_ctStopTime		= m_ctStartTime + m_ctsPlayTimeM;
		m_ctExtraTime		= m_ctStopTime + m_ctsRewardTimeM;
		m_ctReadyTime		= m_ctStartTime - m_ctsReadyDurationM;

		CString strFormat;
		strFormat.Format("CTF Schedule First Set: Year(%d) Month:(%d) Day(%d) Hour(%d)", cTemp.GetYear(), cTemp.GetMonth(), cTemp.GetDay(), cTemp.GetHour() );
		sc::writeLogInfo( strFormat.GetString() );
	}
	else
	{
		CTime ctimecur = CTime::GetCurrentTime();

		//expensive loop
		int nminutes = 0;
		while(1)
		{
			CTime cTemp;
			for ( size_t i=0; i<m_vecSchedule.size(); i++ )
			{
				if ( m_vecSchedule[i].wStartDay != (WORD)ctimecur.GetDayOfWeek() )	continue;
				if ( m_vecSchedule[i].wStartHour != (WORD)ctimecur.GetHour() )		continue;
				if ( m_vecSchedule[i].wStartMinute != (WORD)ctimecur.GetMinute() )	continue;

				m_sScheduleNext.dwIndex = i;
				m_sScheduleNext.sStartSched = m_vecSchedule[i];

				CTime tCur = CTime::GetCurrentTime();
				int nYear = tCur.GetYear();
				int nMonth = tCur.GetMonth();
				int nDay = tCur.GetDay();
				cTemp = CTime( nYear, nMonth, nDay, m_sScheduleNext.sStartSched.wStartHour, m_sScheduleNext.sStartSched.wStartMinute, 0 );

				m_ctStartTime		= cTemp;
				m_ctStopTime		= m_ctStartTime + m_ctsPlayTimeM;
				m_ctExtraTime		= m_ctStopTime + m_ctsRewardTimeM;
				m_ctReadyTime		= m_ctStartTime - m_ctsReadyDurationM;
			}

			CString strFormat;
			strFormat.Format("CTF Schedule First Set: Index(%d) Year(%d) Month:(%d) Day(%d) Hour(%d)", m_sScheduleNext.dwIndex, cTemp.GetYear(), cTemp.GetMonth(), cTemp.GetDay(), cTemp.GetHour() );
			sc::writeLogInfo( strFormat.GetString() );

			if ( m_sScheduleNext.dwIndex != UINT_MAX )
				break;

			//week limit
			if ( nminutes >= 11000/*10080*/ )
				break;

			CTimeSpan span( 0, 0, 1, 0 );
			ctimecur += span;
			nminutes ++;
			Sleep(0);
		}
	}
}

bool CaptureTheFieldMan::FindScheduleNext()
{
	if ( m_sScheduleNext.dwIndex == UINT_MAX )	return false;

	DWORD dwnewidx = m_sScheduleNext.dwIndex + 1;
	if ( dwnewidx >= (DWORD)m_vecSchedule.size() )	dwnewidx = 0;

	m_sScheduleNext.dwIndex = dwnewidx;
	m_sScheduleNext.sStartSched = m_vecSchedule[dwnewidx];

	CTime tCur = CTime::GetCurrentTime();
	int nYear = tCur.GetYear();
	int nMonth = tCur.GetMonth();
	int nDay = tCur.GetDay();

	if ( m_sScheduleNext.sStartSched.wStartDay != (WORD)tCur.GetDayOfWeek() )
	{
		int nLastDay = GetLastDayOfMonth( nYear, nMonth );
		if( nLastDay > nDay ) nDay++;
		else 
		{
			nDay = 1;
			if( nMonth < 12 ) nMonth++;
			else nMonth = 1;
		}
	}
	CTime cTemp ( nYear, nMonth, nDay, m_sScheduleNext.sStartSched.wStartHour, m_sScheduleNext.sStartSched.wStartMinute, 0 );

	CString strFormat;
	strFormat.Format("CTF Next Schedule Set: Index(%d) Year(%d) Month:(%d) Day(%d) Hour(%d)", dwnewidx, cTemp.GetYear(), cTemp.GetMonth(), nDay, cTemp.GetHour() );
	sc::writeLogInfo( strFormat.GetString() );

	m_ctStartTime		= cTemp;
	m_ctStopTime		= m_ctStartTime + m_ctsPlayTimeM;
	m_ctReadyTime		= m_ctStartTime - m_ctsReadyDurationM;

	return true;
}

bool CaptureTheFieldMan::IsLeafMonth( int nYear )
{
	if ( !(nYear%4) && (nYear%100) || !(nYear%400) )  return true;
	
	return false;
}

int CaptureTheFieldMan::GetLastDayOfMonth( int nYear, int nMonth )
{
	if ( nMonth == 2 && IsLeafMonth( nYear ) )	return 29;

	return nLastDayOfMonth[nMonth-1];
}
