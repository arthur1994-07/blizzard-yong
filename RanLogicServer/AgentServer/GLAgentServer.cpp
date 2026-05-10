#include "../pch.h"

#include "Psapi.h"
#pragma comment(lib, "Psapi.lib")

#include <boost/tr1/memory.hpp>

#include "../../SigmaCore/String/StringFormat.h"
#include "../../SigmaCore/Log/LogMan.h"
#include "../../SigmaCore/Util/SystemInfo.h"
#include "../../SigmaCore/Json/MinJson.h"
#include "../../SigmaCore/Util/DateTime.h"
#include "../../SigmaCore/String/MinGuid.h"
#include "../../SigmaCore/Math/SeqUniqueGuid.h"

#include "../../EngineLib/GUInterface/GameTextControl.h"
#include "../../EngineLib/DxTools/DebugSet.h"

#include "../../RanLogic/GLUseFeatures.h"
#include "../../RanLogic/GLogicDataMan.h"
#include "../../RanLogic/Msg/JsonMsgDefine.h"
#include "../../RanLogic/Msg/ClubMsg.h"
#include "../../RanLogic/Msg/LoginMsg.h"
#include "../../RanLogic/Market/GLSearchDelay.h"

#include "../AutoLevel/GLAutoLevelMan.h"
#include "../MapLayer/GLMapLayerMan.h"
#include "../ClubDeathMatch/GLClubDeathMatch.h"
#include "../Club/GLClubMan.h"
#include "../Database/DbAction/DbActionGame.h"
#include "../Database/DBAction/DbActionGameNotify.h"
#include "../Database/DBAction/DbActionGameItem.h "
#include "../Database/DbAction/DbActionGamePost.h"
#include "../Database/EmulDbMan.h"
#include "../Guidance/GuidanceAgent.h"
#include "../Net/NetCachePacket.h"
#include "../Party/GLPartyAgent.h"
#include "../Party/GLPartyManagerAgent.h"
#include "../PK/GLSchoolFreePK.h"
#include "../PK/GLFreePK.h"
#include "../PointShop/PointShopAgent.h"
#include "../Util/GLItemLimit.h"
#include "../CaptureTheField/CaptureTheFieldManager.h"
#include "../BuffManager/GLBuffManagerAG.h"
#include "../Club/GLClubAgent.h"
#include "../Club/GLClubManAgent.h"
#include "../GroupChat/GroupChatMan.h"
#include "../Character/CharNameCache.h"
#include "../TriggerSystem/ServerTriggerSystem.h"
#include "../PVE/PVESystem.h"
#include "../InstanceSystem/LogicAgent/InstanceSystemAgent.h"
#include "../MatchSystem/MatchingManager.h"
#include "../MatchSystem/MatchingCallbackTriggerManager.h"
#include "../TexasHoldem/GLTexasHoldemAgent.h"
#include "../Jackpot/GLJackpotDefine.h"

#include "../Server/AgentServer.h"

// Lotto System;
#include "../LottoSystem/GLLottoSystemManAgent.h"

// Country System;
#include "../Country/GLCountryManServer.h"
#include "../Country/GLVictoriousCountryManServer.h"

// Matching System;
#include "../TournamentManager/MatchingJoinManager.h"

// Move System;
#include "../Move/MoveManagerServer.h"

#include "./AgentClientMan.h"
#include "./GLAgentServer.h"
#include "./StateFieldServer/StateFieldServer.h"
// ----------------------------------------------------------------------------
#include "../../SigmaCore/DebugInclude.h"
// ----------------------------------------------------------------------------

// GLAgentServer& GLAgentServer::GetInstance()
// {
// 	static GLAgentServer Instance;
// 	return Instance;
// }

GLAgentServer::GLAgentServer(const bool bEmulator)
    : m_pMsgServer(NULL)
    , m_pDBMan(NULL)
	, m_pAdoMan(NULL)
    , m_dwMaxClient(0)
    //, m_PCArray(NULL)
    , m_fPERIOD_TIMER(0)
    , m_fPartyRecruitTime(10.0f) // ���� �ð��� �ٸ��ſ� Ʋ���� �ϱ����ؼ�
	, m_dwFIELDSVR_NUM(0)
    , m_pClubMan(NULL)
    , m_pPartyManager(NULL)
	, m_pInstanceManager(NULL)
	, m_pMatchingCore(NULL)
    , m_pItemLimit(NULL)
	, m_pEventManager(NULL)
	, m_bClubMasterMandate(TRUE)
	, m_bEmulator(bEmulator)
	, m_pFreePkGMCommand(FALSE)
{
	initPacketFunc();
	m_WorkEvent.Init();
	m_sEventState.Init();

	for (int c=0; c<MAX_CHANNEL_NUMBER; ++c)
	{
		for (int i=0; i<FIELDSERVER_MAX; ++i)
		{
			m_bFIELDSVR[c][i] = false;
			m_bFIELDSVR_ONLINE[c][i] = false;
		}
	}

	InitializeCriticalSectionAndSpinCount(&m_CSPCLock, sc::CRITICAL_SECTION_SPIN_COUNT);

    m_pCharMan          = new AgentCharMan(this);
    m_pGuidance			= new GLGuidanceAgentMan(this);
    m_pClubDeathMatchMan= new GLClubDeathMatchAgentMan(this);    
    m_pFreePK			= new GLFreePK(this);
    m_pAutoLevel		= new GLAutoLevelMan(this);
	m_pMapLayer		= new GLMapLayerMan(this);
    m_pSchoolFreePk		= new GLSchoolFreePKAgent(this);
    m_pPointShop		= new pointshop::PointShopAgent;

	m_pCTFMan			= new CaptureTheFieldManAgt(this);
    m_pBuffMan          = new buffmanager::GLBuffManagerAG(this);

	m_pGroupChatMan			= new ChatManager(this);

	m_pPrivateMarketSearchDelayMgr = new private_market::GLSearchDelayMgr();
	m_pPrivateMarketLogDelayMgr = new private_market::GLSearchDelayMgr();

	m_pStateFieldServer = new StateFieldServer::Manager(this);

	m_pTexasHoldemMgr = new TexasHoldem::GLTexasHoldemAgent( this );

	m_pJackpot = new GLJackpotMgr( this );

	// Lotto System;
	LottoSystem::GLLottoSystemManAgent::Instance()->SetAgentServer( this );

	// Matching System;
	MatchingSystem::CMatchingJoinManager::Instance()->SetServer( this );

	// Move System;
	MoveSystem::CMoveManagerServer::Instance()->SetServer( this );
}

GLAgentServer::~GLAgentServer(void)
{
	SAFE_DELETE(m_pStateFieldServer);
    SAFE_DELETE(m_pPointShop);
    SAFE_DELETE(m_pSchoolFreePk);
    SAFE_DELETE(m_pAutoLevel);
	SAFE_DELETE(m_pMapLayer);
    SAFE_DELETE(m_pFreePK);
    SAFE_DELETE(m_pPartyManager);
	SAFE_DELETE(m_pInstanceManager);
	SAFE_DELETE(m_pMatchingCore);
    SAFE_DELETE(m_pClubDeathMatchMan);
    SAFE_DELETE(m_pGuidance);
    SAFE_DELETE(m_pClubMan);
	SAFE_DELETE(m_pEventManager);
    
	//SAFE_DELETE_ARRAY(m_PCArray);
    //DeleteAllCharacterData();	
    m_CharData.clear();
    SAFE_DELETE(m_pItemLimit);

    SAFE_DELETE(m_pCTFMan);
    SAFE_DELETE(m_pBuffMan);

	SAFE_DELETE(m_pGroupChatMan);	//mjeon.groupchat

    SAFE_DELETE(m_pCharMan);

	SAFE_DELETE( m_pPrivateMarketSearchDelayMgr );
	SAFE_DELETE( m_pPrivateMarketLogDelayMgr );

	SAFE_DELETE( m_pTexasHoldemMgr );

	SAFE_DELETE( m_pJackpot );

	DeleteCriticalSection(&m_CSPCLock);
}

//void GLAgentServer::DeleteAllCharacterData()
//{    
//    m_CharData.clear();
//}

//void GLAgentServer::RegistCharacterData(GAEAID GaeaId, GLCharAG* pChar)
//{
//    if (!pChar)
//        return;
//
//    A_CHAR_DATA_ITER iter = m_CharData.find(GaeaId);
//    if (iter != m_CharData.end())        
//        m_CharData.erase(iter);
//    m_CharData.insert(A_CHAR_DATA_VALUE(GaeaId, pChar));
//}

//void GLAgentServer::UnRegistCharacterData(GAEAID GaeaId)
//{
//    A_CHAR_DATA_ITER iter = m_CharData.find(GaeaId);
//    if (iter != m_CharData.end())        
//        m_CharData.erase(iter);
//}

void GLAgentServer::AddGameDbJob(db::DbActionPtr spJob)
{
    if (m_pDBMan)
    {
        m_pDBMan->AddGameJob(spJob, m_pAdoMan);
        return;
    }

    if (spJob)
    {
        sc::writeLogError(
            sc::string::format(
                "GLAgentServer::AddGameDbJob m_pDBMan NULL %1%",
                typeid(*spJob).name()));
    }
}

void GLAgentServer::AddGameAdoJob(db::DbActionPtr spJob)
{
    if (m_pAdoMan)
    {
        m_pAdoMan->AddGameJob(spJob, m_pAdoMan);
        return;
    }
    
    if (spJob)
    {
        sc::writeLogError(
            sc::string::format(
                "GLAgentServer::AddGameAdoJob m_pAdoMan NULL %1%",
                typeid(*spJob).name()));
    }
}

void GLAgentServer::AddLogAdoJob(db::DbActionPtr spJob)
{
    if (m_pAdoMan)
    {
        m_pAdoMan->AddLogJob(spJob, m_pAdoMan);
        return;
    }

    if (spJob)
    {
        sc::writeLogError(
            sc::string::format(
                "GLAgentServer::AddLogAdoJob m_pAdoMan NULL %1%",
                typeid(*spJob).name()));
    }    
}

void GLAgentServer::AddUserAdoJob(db::DbActionPtr spJob)
{
    if (m_pAdoMan)
    {
        m_pAdoMan->AddUserJob(spJob, m_pAdoMan);
        return;
    }

    if (spJob)
    {
        sc::writeLogError(
            sc::string::format(
                "GLAgentServer::AddUserAdoJob m_pAdoMan NULL %1%",
                typeid(*spJob).name()));
    }    
}

void GLAgentServer::AddShopAdoJob(db::DbActionPtr spJob)
{
    if (m_pAdoMan)
    {
        m_pAdoMan->AddShopJob(spJob, m_pAdoMan);
        return;
    }
    
    if (spJob)
    {
        sc::writeLogError(
            sc::string::format(
                "GLAgentServer::AddShopAdoJob m_pAdoMan NULL %1%",
                typeid(*spJob).name()));
    }
}

DWORD GLAgentServer::GetFieldServer ( const SNATIVEID &sMapID )
{
	SMAPNODE* pMapNode = m_sMapList.FindMapNode ( sMapID );
	if (!pMapNode)
        return FIELDSERVER_MAX;
	return pMapNode->GetFieldServerNum();
}

GLCharAG* GLAgentServer::GetChar(const char* szName)
{
    if (!szName)
        return NULL;
    else
        return m_pCharMan->GetCharByChaName(std::string(szName));
}

GLCharAG* GLAgentServer::GetChar(const std::string& ChaName)
{
    return GetChar(ChaName.c_str());
}

//! �������� ����� �������� PGLCHARAG ��ȯ
GLCharAG* GLAgentServer::GetCharByUserAccount(const std::string& UserId)
{
	return m_pCharMan->GetCharByUserAccount(UserId);
}

void GLAgentServer::CheckAgentServer ( DWORD dwAgentNum, A_SERVER_INFO sAgentServerInfo )
{
	if ( dwAgentNum < 0 || dwAgentNum >= AGENTSERVER_MAX )
		return;

	// Agent ���� ��ȿ�� �˻�;
	sc::writeLogInfo ( sc::string::format(
		"Check AgentServer ... %1%",
		dwAgentNum ) );

	if ( sAgentServerInfo.IsValid() )
	{
		sc::writeLogInfo ( sc::string::format(
			"AgentServer ... %1% is Valid!",
			dwAgentNum ) );
	}
}

HRESULT GLAgentServer::Create(
    DWORD dwMaxClient,
    DxMsgServer* pMsgServer, /*DxConsoleMsg *pConsoleMsg,*/
    db::IDbManager* pDBMan,
	db::IDbManager* pAdoMan,
    char* szMapList,
    F_SERVER_INFO* pFieldInfo,
    EMSERVICE_PROVIDER ServiceProvider,
    bool bToolMode)
{
	HRESULT hr;
	GASSERT(pMsgServer || m_bEmulator);
	//GASSERT(pConsoleMsg);
	GASSERT(pDBMan || m_bEmulator);
	GASSERT(pAdoMan || m_bEmulator);
	
	m_PresetTime = CTime::GetCurrentTime();	    

	F_SERVER_INFO _sFIELDServer[FIELDSERVER_MAX];
	if (!pFieldInfo)
        pFieldInfo = _sFIELDServer;

	m_dwMaxClient = dwMaxClient;
	m_pMsgServer = pMsgServer;
	//m_pConsoleMsg = pConsoleMsg;
	m_pDBMan = pDBMan;
	m_pAdoMan = pAdoMan;
	
	m_ServiceProvider = ServiceProvider;

	if (!m_pDBMan)
	{
		sc::writeLogWarn(std::string("--- DB Manager runs on Emulator mode! ---"));
        m_pDBMan = new GLEmulatorDBMan(NULL, db::EMULATOR_SERVER, ServiceProvider); //Dummy DbManager for Emulator.
	}
	
	SAFE_DELETE(m_pPartyManager);
	m_pPartyManager = new GLPartyManagerAgent(this, m_dwMaxClient);



    // ���� ���� �ε�
    m_pGuidance->Load(GLCONST_CHAR::vecGUIDANCE_FILE, bToolMode);

    // Ŭ�� ������ġ �ε�
    m_pClubDeathMatchMan->Load(GLCONST_CHAR::vecClubDM_FILE, bToolMode);

    // �ڵ� ���� ���� ���� �ε�
    m_pAutoLevel->LOAD(std::string("AutoLevelSet.alsf"));

    //DeleteAllCharacterData();
	//SAFE_DELETE_ARRAY(m_PCArray);
	//m_PCArray = new PGLCHARAG[m_dwMaxClient];
	//SecureZeroMemory(m_PCArray, sizeof(GLCharAG*) * m_dwMaxClient);
    m_CharData.clear();

	if (!szMapList)
	{
        hr = m_sMapList.LoadMapList(FALSE, pFieldInfo, FIELDSERVER_MAX, m_bEmulator); // "mapslist.mst"
		if (FAILED(hr))
            return E_FAIL;
	}
	else
	{
		hr = m_sMapList.LoadMapList(FALSE, pFieldInfo, FIELDSERVER_MAX, m_bEmulator);
		if (FAILED(hr))
            return E_FAIL;
	}
	

    //
    //Load Script
    //
    std::string strScriptPath(sc::getAppPath());
    strScriptPath.append("\\Data\\GLogicServer\\");
    strScriptPath.append("scripts\\");

    //bjju.buffmanager
    //

    if ( GLUseFeatures::GetInstance().IsUsingCaptureTheField() )
    {
        std::string strBuffManagerScriptPath(strScriptPath);    
        strBuffManagerScriptPath.append(GLogicData::GetInstance().GetBuffManagerScriptName());

        m_pBuffMan->LoadScript(strBuffManagerScriptPath.c_str());
    }

	SAFE_DELETE(m_pItemLimit);
    m_pItemLimit = new GLItemLimit(pMsgServer, pDBMan, pAdoMan, UINT_MAX);
	m_pItemLimit->ReadMaxKey();
    m_pItemLimit->ReadLogItem();

	m_dwSvrGroupNum = m_pMsgServer->GetServerGroup();

	m_dwBaseGaeaId = m_dwSvrGroupNum * BASE_GAEAID;//m_dwMaxClient;	//���������� �ִ� ������ ���� �ٸ� �� �����Ƿ� ����� ū ��(10��)�� ��ü�Ѵ�.	

	for (DWORD i=0; i<m_dwMaxClient; ++i)
        m_FreePCGIDs.push_back(m_dwBaseGaeaId + i);	//<== ������ ���� ����ũ�� GaeaId�� ����
	/*
	for (DWORD i=0; i<m_dwMaxClient; ++i)
        m_FreePCGIDs.push_back ( i );
	*/
	
	//SecureZeroMemory(m_pLandMan, sizeof(GLAGLandMan*)*MAXLANDMID*MAXLANDSID);

    bool _bUsed[MAX_LAND_MID];
    for ( DWORD _i(MAX_LAND_MID); _i--; )
        _bUsed[_i] = false;

	sc::writeLogInfo("LandMan Init");
	GLMapList::FIELDMAP map_list = m_sMapList.GetMapList();
	GLMapList::FIELDMAP_ITER iter = map_list.begin ();
	GLMapList::FIELDMAP_ITER iter_end = map_list.end ();
	for ( ; iter!=iter_end; ++iter )
	{
		const SMAPNODE *pMapNode = &(*iter).second;
        const SNATIVEID& mapID = pMapNode->GetId();
        const DWORD dwMainMapID(mapID.wMainID);
        const DWORD dwSubMapID(mapID.wSubID);

		//LandMan ������ �ʱ�ȭ.
		//
        GLAGLandManager* pNewLandMan(NULL);

        LandManagerMapIter iteratorLandManager(m_mapLandMan.find(dwMainMapID));
        const bool bExist(iteratorLandManager != m_mapLandMan.end());
        if ( bExist == false )
            pNewLandMan = new GLAGLandManager(this, dwMainMapID);
        else
            pNewLandMan = iteratorLandManager->second;

        const bool bOK(pNewLandMan->loadLevelFile(mapID, pMapNode->m_LevelFile.c_str(), m_sMapList.GetAxisMan()));
        if ( bOK == false )
		{
			CString strTemp = pMapNode->m_LevelFile.c_str();
			strTemp += " File Load Fail.";
			MessageBox ( NULL, strTemp, "ERROR", MB_OK );

			SAFE_DELETE(pNewLandMan);
            if ( bExist == true )
                m_mapLandMan.erase(iteratorLandManager);

			continue;
		}
        pNewLandMan->setMapID(mapID, mapID, pMapNode->IsPeaceZone(), pMapNode->IsPkZone());

        _bUsed[dwMainMapID] = true; // �⺻ ������ ��� �Ǵ� �κ��� �� üũ �� ��;
		InsertMap(pNewLandMan);
	}	

    SAFE_DELETE(m_pInstanceManager);
    m_pInstanceManager = new InstanceSystem::ManagerAgent(this, _bUsed);
    m_pInstanceManager->initialize();

	SAFE_DELETE(m_pEventManager);
	m_pEventManager = new GLEvent::ManagerAgent(this);

	SAFE_DELETE(m_pMatchingCore);
	m_pMatchingCore = new MatchingSystem::MatchingCore(this);
	m_pMatchingCore->OnLoad();	

	//ĳ���� �ʱ� ���� �� �� �ʱ� ���� Gate�� ���������� �����ϴ��� ����.
	//
	if ( !GLUseFeatures::GetInstance().IsUsingWorldBattle() )
	{
		sc::writeLogInfo("Check Start Gate");
		for ( WORD i=0; i<GLCONST_CHAR::wSCHOOLNUM; ++i )
		{
			SNATIVEID nidSTARTMAP = GLCONST_CHAR::nidSTARTMAP[i];
			DWORD dwSTARTGATE = GLCONST_CHAR::dwSTARTGATE[i];

			GLAGLandMan* pLandMan = GetLand(nidSTARTMAP);
			if (!pLandMan)
			{
				std::string ErrMsg = sc::string::format(
					"Charactor Start Map Error. %1% MapID %2%/%3% not found.",
					GLogicData::GetInstance().GetMapListFileName(),
					nidSTARTMAP.wMainID,
					nidSTARTMAP.wSubID);
				MessageBox(NULL, ErrMsg.c_str(), "ERROR", MB_OK|MB_ICONEXCLAMATION);			
				continue;
			}

			DxLandGateMan* pGateMan = pLandMan->GetLandGateMan();
			PDXLANDGATE pGate = pGateMan->FindLandGate(dwSTARTGATE);
			if (!pGate)
			{
				std::string ErrMsg = sc::string::format(
					"Charactor Start Map GATE not found.\n %1% map %2% GATEID must check.",
					pLandMan->GetFileName(),
					dwSTARTGATE);
				MessageBox(NULL, ErrMsg.c_str(), "ERROR", MB_OK);
				continue;
			}
		}
	}

	//�ʵ� ���� ��ȿ�� �˻�.
	//
	sc::writeLogInfo("FieldServer Check");
	m_dwFIELDSVR_NUM = 0;
	for ( unsigned int _index(MAX_CHANNEL_NUMBER); _index--; )
		m_dwFIELDSVR_NUM_PER_CHANNEL[_index] = 0;

	for ( int c=0; c<MAX_CHANNEL_NUMBER; ++c )
	{
		for ( int i=0; i<FIELDSERVER_MAX; ++i )
		{
			m_bFIELDSVR[c][i] = false;
			m_bFIELDSVR_ONLINE[c][i] = false;
		}
	}
	
	for ( int _channel=0; _channel<MAX_CHANNEL_NUMBER; ++_channel )
	{
		for ( int i=0; i<FIELDSERVER_MAX; ++i )
		{
			if ( pFieldInfo[_channel*MAX_CHANNEL_NUMBER+i].IsValid() )
			{
				++m_dwFIELDSVR_NUM;
				++m_dwFIELDSVR_NUM_PER_CHANNEL[_channel];
				m_bFIELDSVR[_channel][i] = true;

				if ( pFieldInfo[_channel*MAX_CHANNEL_NUMBER+i].bCreateInstanceLand )
				{
					SFIELDSERVER_INFO sTempFieldServerInfo;
					sTempFieldServerInfo.nChannelNum = _channel;
					sTempFieldServerInfo.nFieldNum = i;
					m_vecCreatableInstanceField.push_back( sTempFieldServerInfo );
				}
			}
		}
	}

	//Ŭ���� ������ db���� �о�´�.
	//
	sc::writeLogInfo("ClubMan Init");
    SAFE_DELETE(m_pClubMan);
    m_pClubMan = new GLClubManAgent(this);
	m_pClubMan->LoadFromDB(pDBMan, m_pAdoMan);

	sc::writeLogInfo("Guid Db Load");
	VECGUID_DB vecGuidDb;
	m_pDBMan->GetClubRegion(vecGuidDb);

    size_t GuidSize = vecGuidDb.size();
    sc::writeLogInfo(sc::string::format("Guidance size %1%", GuidSize));
    for (size_t i=0; i<GuidSize; ++i)
    {
        const GLGUID_DB& GuidInfo = vecGuidDb[i];
        sc::writeLogInfo(
            sc::string::format(
                "Guidance ID %1% Club %2% Commission %3%",
                GuidInfo.m_dwID,
                GuidInfo.m_dwCLUBID,
                GuidInfo.m_fCommissionPer));
    }

	m_pGuidance->SetState(vecGuidDb);
	m_pGuidance->SetMapState();


	

	m_pClubDeathMatchMan->SetMapState();

	// �̺�Ʈ�� ���������� ���
	m_pFreePK->RESET();

	// ���� ����� �̺�Ʈ�� �ʱ�ȭ
	m_WorkEvent.Init();

	// �⼮�� ��������� ����
	if ( GLCONST_ATTENDANCE::bUse ) 
	{
		SNATIVEID sID = NATIVEID_NULL();	
		for ( DWORD i = 0; i < GLCONST_ATTENDANCE::dwMAXREWARD; ++i )
		{
			sID = GLCONST_ATTENDANCE::vecAttendReward[i].idReward;
			if (sID == NATIVEID_NULL())
                continue;

			AddGameAdoJob(
                db::DbActionPtr(
                    new db::ShopItemMapInsert(sID.wMainID, sID.wSubID)));
		}
	}

	


	//
	//mjeon.CaptureTheField
	//  CTF must be initialized after loading all maps.
	//
	if ( GLUseFeatures::GetInstance().IsUsingCaptureTheField() )
	{
		m_pCTFMan->Initialize();

		//DB���� CTF ���� ����Ʈ�� �����´�.
		m_pCTFMan->LoadFromDB(pDBMan, m_pAdoMan);
	}

	/************************************************************************/
	/* GLCountryManagerServer                                               */
	/************************************************************************/
	Country::GLCountryManServer::Instance()->LoadData();

	Country::GLVictoriousCountryManServer::Instance()->SetServer( this );
	Country::GLVictoriousCountryManServer::Instance()->LoadDBAction();
	/************************************************************************/

	/************************************************************************/
	/* CMatchingJoinManager                                                 */
	/************************************************************************/
	MatchingSystem::CMatchingJoinManager::Instance()->OnLoad();
	/************************************************************************/

	//mjeon.groupchat
	m_pGroupChatMan->Initialize();

	// ���λ��� �˻� ������ ����
	if ( m_pPrivateMarketSearchDelayMgr )
	{
		m_pPrivateMarketSearchDelayMgr->SetDelay( private_market::GLPrivateMarketDefine::Instance()->GetSearchDelayMillisecond() );
	}

	// ���λ��� �α� ������ ����
	if ( m_pPrivateMarketLogDelayMgr )
	{
		m_pPrivateMarketLogDelayMgr->SetDelay( private_market::GLPrivateMarketDefine::Instance()->GetLogDelayMillisecond() );
	}

	if ( m_pTexasHoldemMgr )
	{
		m_pTexasHoldemMgr->LoadChipMap( pAdoMan );
	}

	// Jackpot.luc load
	if ( m_pJackpot )
	{
		std::string strJackpotFileName( "Jackpot.luc" );
		std::string strJackpotFilePath( sc::getAppPath() );
		strJackpotFilePath.append( "\\Data\\GLogicServer\\" );
		strJackpotFilePath.append( strJackpotFileName );
		m_pJackpot->Load( strJackpotFilePath );
	}

	TriggerSystem::InitServerTriggerSystem();
	PVESystem::InitPVEDB();
    PVESystem::InitPVECache();

	// Lotto System;
	InitializeLottoSystem();

	sc::writeLogInfo("Create OK");
	return S_OK;
}

const DWORD GLAgentServer::CreateInstantMap(const SNATIVEID& baseMapID, const DWORD dwFieldChannel, const DWORD dwFieldID)
{
	// ���ο� Instance ID �� �޾ƿ´�;
    const DWORD _instanceMapID(m_pInstanceManager->getInstanceMapID());
    if ( _instanceMapID >= MAX_LAND_MID )
        return GAEAID_NULL;

	// Map List �� �ִ� ������ �˾ƺ���;
    SMAPNODE* const pMapNode(m_sMapList.FindMapNode(baseMapID));
	if ( pMapNode == NULL )
		return GAEAID_NULL;

	// Instance ID �� Map List �� Map ID �� ������ �δ��� ������ �� ����;
	// ���� �Ϲ� Map ������ Instance ���� ������ ���� �����ǰ� �ֱ� �����̴�;
	if ( NULL != m_sMapList.FindMapNode( SNATIVEID( _instanceMapID, 0 ) ) )
		return GAEAID_NULL;

	// Base Land ������ �޾ƿ´� ( ���� Land );
    const GLAGLandManager* const pBaseLandMan(GetLandManager(baseMapID));
	if ( pBaseLandMan == NULL )
		return GAEAID_NULL;

	// Base Land ������ �̿��� �δ� Land �� �����Ѵ� ( ���� Land );
    GLAGLandManager* const pTargetLandMan(new GLAGLandManager(*pBaseLandMan, _instanceMapID, dwFieldChannel, dwFieldID));
    if ( pTargetLandMan == NULL )
        return GAEAID_NULL;

	// �δ� ���� ����Ʈ�� �߰��Ѵ�;
    m_vecInstantMapId.push_back(_instanceMapID);	

	// ������ �Ϸ�Ǿ��⶧���� ���� Instance ID �� �������ش�;
    m_pInstanceManager->popInstanceMapID();

	// �߰��Ѵ�;
    InsertMap(pTargetLandMan);

	sc::writeLogInfo( sc::string::format( "[ Instnace Log ] [ Create Instance Map : %1% ]", _instanceMapID ) );

    return _instanceMapID;
}

BOOL GLAgentServer::DeleteInstantMap(const DWORD instanceMapID)
{
	GLAGLandManager* pLandMan(GetLandManager(instanceMapID));
	if( pLandMan == NULL )
		return FALSE;

	VEC_INSTANT_MAPID_ITER MapID_iter = std::find(m_vecInstantMapId.begin(), m_vecInstantMapId.end(), instanceMapID);
	if (MapID_iter != m_vecInstantMapId.end())
		m_vecInstantMapId.erase(MapID_iter);

	MatchingSystem::MatchingCallbackTriggerManager * pMCTM = MatchingSystem::MatchingCallbackTriggerManager::GetInstance();

	MatchingSystem::DestroyTrigger* destroytrigger = NULL;

	MatchingSystem::DestroyTriggerVectorIter biter = pMCTM->m_DestroyTriggerList.begin();
	MatchingSystem::DestroyTriggerVectorIter eiter = pMCTM->m_DestroyTriggerList.end();

	for (;biter!= eiter; )
	{
		destroytrigger = *biter;
		if(destroytrigger->_instanceID ==instanceMapID )
		{
			MatchingSystem::DestroyReceipt receipt;
			receipt._bDestroyComplete = true;
			receipt._instanceMapID = instanceMapID;
			biter = pMCTM->m_DestroyTriggerList.erase(biter);
			destroytrigger->Call(&receipt);
			
			// ��� �� Ʈ���Ŵ� ���� �Ѵ�.
			if(destroytrigger != NULL)
				SAFE_DELETE(destroytrigger);
			break;
		}
		else
		{
			++biter;
		}
	}

	
    LandManagerMapIter _iteratorLandManager(m_mapLandMan.find(instanceMapID));
    if ( _iteratorLandManager == m_mapLandMan.end() )
        return TRUE;
	
    GLAGLandManager* pLandManager(_iteratorLandManager->second);
    SAFE_DELETE(pLandManager);
    m_mapLandMan.erase(_iteratorLandManager);

    m_pInstanceManager->pushInstanceMapID(instanceMapID);

	sc::writeLogInfo( sc::string::format( "[ Instnace Log ] [ Delete Instance Map : %1% ]", instanceMapID ) );

	return TRUE;
}

HRESULT GLAgentServer::InsertMap(GLAGLandManager* pNewLandMan)
{
    const DWORD instanceMapID(pNewLandMan->getInstanceMapID());

    GASSERT(instanceMapID < MAX_LAND_MID);

    // ���ſ��� sID�� �δ� ���� ��ȣ�� ��� �Ͽ�����, ����� mID�� ���� ID�� �����;
    //	GASSERT(sMapID.wSubID<MAXLANDSID);	//�δ��� SID�� �δ� ��ü�� ���� ��ȣ�� ���ǰ� �ִ�.(Land�� ���Ͽ��ο� ������� �� �δ��� �����ɶ����� 1�� ����)

    LandManagerMapIter iteratorLandManager(m_mapLandMan.find(instanceMapID));
    if ( iteratorLandManager != m_mapLandMan.end() )
    {
        GLAGLandManager* pLandManager(iteratorLandManager->second);
        SAFE_DELETE(pLandManager);
        m_mapLandMan.erase(iteratorLandManager);

    }

    m_mapLandMan.insert(LandManagerPair(instanceMapID, pNewLandMan));

    return S_OK;
}

HRESULT GLAgentServer::CleanUp()
{
	m_FreePCGIDs.clear();
	m_sMapList.CleanUpMapList();
	m_cAGPeriod.CleanUp();

	DWORD dwMapID = 0;

	for (MAP_LANDMANAG_ITER iter = m_mapLandMan.begin(); iter != m_mapLandMan.end(); ++iter)
	{
		SAFE_DELETE(iter->second);
	}

	m_mapLandMan.clear();

    PVESystem::DestroyPVECache();
	PVESystem::DestroyPVEDB();
	TriggerSystem::DestroyServerTriggerSystem();
	PVESystem::DestroyPVEIndun();	// ������Ʈ ���� stop �Ŀ� crash ������ �߻��ؼ� ���������� �������ִ� �ڵ� �߰�

	// Lotto System;
	DestroyLottoSystem();

	return S_OK;
}

GLCharAG* GLAgentServer::CreateChar(
    GLCHARAG_DATA* pCharData,
    DWORD ClientSlot,
    int nChannel,
    const SChinaTime& chinaTime,
    EMIP_BONUS_CLASS emIPBonus,
    wb::EM_COUNTRY Country,
	CRYPT_KEY cKey )
{	
	if (!pCharData)
        return NULL;
	
	if (!CreateCharCheck(pCharData, ClientSlot))
        return NULL;	

	//	Note ĳ���� ���̾� ID ����.
	//
	if ( m_FreePCGIDs.empty() )
		return CreateCharFail(NULL, ClientSlot);

	DWORD dwGaeaID = m_FreePCGIDs.front();
	m_FreePCGIDs.pop_front();

	// ĳ���� �ʱ�ȭ
	GLCharAG* pChar = new GLCharAG(this, Country);

	pChar->m_ClientSlot			= ClientSlot;
	pChar->m_nChannel			= nChannel;
	pChar->m_nOriginChannel		= nChannel;
	pChar->m_dwGaeaID			= dwGaeaID;
	pChar->SetIp(pCharData->m_szIp);

	// �±� ���̹� ī�� ���
	pChar->m_emIPBonus = emIPBonus;

	// �߱� �ð�
	pChar->m_sChinaTime = chinaTime;
	// �̺�Ʈ �ð� //** Add EventTime
	pChar->m_sEventTime.loginTime = chinaTime.loginTime;
	pChar->m_sEventTime.currentGameTime = 0;
	// ��Ʈ�� Ž�� ���� �ý��� �ð�
	pChar->m_sVietnamSystem = pCharData->m_sVietnamSystem;
	// ���� �������� �������� �ƴ���
	//pChar->m_bTracingUser = pCharData->m_bTracingUser;
	// �α��� �ð�
	//pChar->m_tLoginTime = CTime::GetCurrentTime().GetTime();

	// ĳ���� ���
	HRESULT hr = pChar->CreateChar(pCharData);
	if (FAILED(hr))
	{
        sc::writeLogError(
            sc::string::format(
                "CreateChar Name %1% DbNum %2%",
                pCharData->m_szName,
                pCharData->ChaDbNum()));
		return CreateCharFail(pChar, ClientSlot);
	}

	// ���̾� Array�� ���    
	//m_PCArray[pChar->GaeaId()] = pChar;    
    CraeteCharRegist(pChar);

	//LAND ����Ʈ���� ����.
	GLAGLandMan* pNEW_LAND = GetLand(pChar->GetCurrentMap().getGaeaMapID());
	if (pNEW_LAND)
        pNEW_LAND->DropPC(pChar->ChaDbNum());

    // ĳ���Ͱ� Field server �� Ȥ�� ���� �ִٸ� �����ؾ� �Ѵ�.
    // ĳ���� �ʵ� ������ ���� ���� �޼���
    GLMSG::SNETPC_FIELDSVR_CHARCHK MsgAF;
	MsgAF.dwClientID = pChar->ClientSlot();
	MsgAF.dwGaeaID = pChar->GaeaId();	
	MsgAF.dwUserID = pChar->m_UserDbNum;
	MsgAF.dwCharID = pChar->m_CharDbNum;
	MsgAF.SetName(pChar->m_szName);
	SENDTOALLCHANNEL(&MsgAF);

    // ĳ���Ͱ� ��������
    cp::NET_CHAR_JOIN_AH MsgAC(pChar->UserDbNum(), pChar->ChaDbNum());
    SENDTOCACHE(&MsgAC);

    // club �� Login �ð� ����
    std::tr1::shared_ptr<GLClubAgent> spClub = GetClub(pChar->GetClubDbNum());
    if (spClub)
        spClub->SetMemberLastPlayTime(pChar->ChaDbNum(), sc::time::GetCurrentTime());

    // Ŭ�� ���� ����
    SendClubInfo(ClientSlot, pChar->GetClubDbNum());

	if ( cKey.guid != GUID_NULL )
	{
		pChar->SetCryptKey( cKey );
	}

	return pChar;	//	ĳ���� ���� ����.    
}

void GLAgentServer::CraeteCharRegist(GLCharAG* pChar)
{
    if (!pChar)
        return;

    // ���̾� Array�� ���
    RegisterCharacter(pChar->GaeaId(), pChar);
    //m_PCArray[pChar->GaeaId()] = pChar;

    // Ȱ�� ����Ʈ�� ���
    //pChar->m_pPCNode = m_PCList.ADDTAIL ( pChar );

    //PC NAME map �� ���
    m_pCharMan->ChaNameAdd(std::string(pChar->m_szName), pChar);

    // UserAcount map �� ���
    m_pCharMan->UserAccountAdd(std::string(pChar->m_szUserName), pChar);

    //PC Client map �� ���
    m_pCharMan->NetworkSlotAdd(pChar->ClientSlot(), pChar->GaeaId());

    //PC IP map �� ���.
    //	GASSERT ( m_PCIpMap.find(pPChar->m_szIp)==m_PCIpMap.end() );
    //	m_PCIpMap[ std::string(pPChar->m_szIp) ] = pPChar;

    //USER Number map �� ���.
    m_pCharMan->UserDbNumGaeaIdAdd(pChar->m_UserDbNum, pChar->GaeaId());

    //CID map �� ���.
    m_pCharMan->ChaDbNumGaeaIdAdd(pChar->m_CharDbNum, pChar->GaeaId());
}

bool GLAgentServer::CreateCharCheck(GLCHARAG_DATA* pCharData, DWORD ClientSlot) 
{
    //���� IP�� �̹� ���ӵǾ� �ִ��� �˻��մϴ�.
    //name_iter = m_PCIpMap.find(pchar_data->m_szIp);
    //if ( name_iter != m_PCIpMap.end() )
    //{
    //	PGLCHARAG pChar = (*name_iter).second;

    //	//	�����ڿ��� DropOut �޽����� �����ϴ�.
    //	GLMSG::SNET_DROP_OUT_FORCED NetMsgForced;
    //	NetMsgForced.dwCharID = pChar->m_dwCharID;
    //	NetMsgForced.emForced = EMDROPOUT_REQLOGIN;
    //	SENDTOCLIENT ( dwClientID, &NetMsgForced );

    //	//	��� �ʵ忡 ���� ���� �޼���.
    //	SENDTOALLCHANNEL ( &NetMsgForced );

    //	//	���� �����ڿ��� DropOut �޽����� �����ϴ�.
    //	SENDTOCLIENT ( pChar->m_dwClientID, &NetMsgForced );

    //	//	���� �����ڸ� DropOut ��ŵ�ϴ�.
    //	DropOutPC ( pChar->m_dwGaeaID );

    //	m_pConsoleMsg->Write( _T("m_PCIpMap failed") );

    //	return false;
    //}

    //���� ĳ���Ͱ� �̹� ���ӵǾ� �ִ��� �˻��մϴ�
    GLCharAG* pCharName = m_pCharMan->GetCharByChaName(pCharData->m_szName);
    if (pCharName)
    {
        GLMSG::SNET_DROP_OUT_FORCED NetMsgForced;
        NetMsgForced.dwChaNum = pCharName->m_CharDbNum;
        NetMsgForced.emForced = EMDROPOUT_REQLOGIN;

        //	��� �ʵ忡 ���� ���� �޼���.
        SENDTOALLCHANNEL(&NetMsgForced);

        //	���� �����ڿ��� DropOut �޽����� �����ϴ�.
        SENDTOCLIENT(pCharName->ClientSlot(), &NetMsgForced);

        //	���� �����ڸ� DropOut ��ŵ�ϴ�.
        DropOutChar(pCharName->GaeaId());
        sc::writeLogWarn(sc::string::format(
            "CreateChar: evicted ghost session for char[%s] on slot[%u], retrying new login",
            pCharData->m_szName, ClientSlot));
        // Fall through — ghost evicted, maps are clean, new login can proceed
    }

    GLCharAG* pCharAccount = m_pCharMan->GetCharByUserAccount(pCharData->m_szUserName);
    if (pCharAccount)
    {
        //	�����ڿ��� DropOut �޽����� �����ϴ�.
        GLMSG::SNET_DROP_OUT_FORCED NetMsgForced;
        NetMsgForced.dwChaNum = pCharAccount->ChaDbNum();
        NetMsgForced.emForced = EMDROPOUT_REQLOGIN;
        SENDTOCLIENT(ClientSlot, &NetMsgForced);

        // ��� �ʵ忡 ���� ���� �޼���.
        SENDTOALLCHANNEL(&NetMsgForced);

        //	���� �����ڸ� DropOut ��ŵ�ϴ�.
        DropOutChar(pCharAccount->GaeaId());

        //	���� �����ڿ��� DropOut �޽����� �����ϴ�.
        SENDTOCLIENT(pCharAccount->ClientSlot(), &NetMsgForced);

        sc::writeLogError(std::string("m_UAccountMap failed"));

        return false;
    }

    DWORD UserGaeaId = m_pCharMan->GetGaeaIdByUserDbNum(pCharData->m_UserDbNum);
    if (UserGaeaId != GAEAID_NULL)
    {
        GLCharAG* pChar = GetChar(UserGaeaId);

        //	�����ڿ��� DropOut �޽����� �����ϴ�.
        GLMSG::SNET_DROP_OUT_FORCED NetMsgForced;
        NetMsgForced.dwChaNum = pChar->m_CharDbNum;
        NetMsgForced.emForced = EMDROPOUT_REQLOGIN;
        SENDTOCLIENT(ClientSlot, &NetMsgForced);

        //	��� �ʵ忡 ���� ���� �޼���.
        SENDTOALLCHANNEL(&NetMsgForced);

        //	���� �����ڿ��� DropOut �޽����� �����ϴ�.
        SENDTOCLIENT(pChar->ClientSlot(), &NetMsgForced);

        //	���� �����ڸ� DropOut ��ŵ�ϴ�.
        DropOutChar(pChar->GaeaId());

        sc::writeLogError(std::string("m_UserNumberMap failed"));

        return false;
    }

    DWORD OldGaeaId = m_pCharMan->GetGaeaIdByClientSlot(ClientSlot);
    if (OldGaeaId != GAEAID_NULL)
    {
        // �����ڿ��� DropOut �޽����� �����ϴ�
        GLMSG::SNET_DROP_OUT_FORCED NetMsgForced;
        NetMsgForced.dwChaNum = pCharData->ChaDbNum();
        NetMsgForced.emForced = EMDROPOUT_REQLOGIN;
        SENDTOCLIENT(ClientSlot, &NetMsgForced);

        // ���� �����ڸ� DropOut ��ŵ�ϴ�
        DropOutChar(OldGaeaId);
        sc::writeLogError(std::string("m_PCClientIDMAP failed"));
        return false;
    }
    return true;
}

void GLAgentServer::SendClubInfo(DWORD ClientSlot, DWORD ClubDbNum)
{
    m_pClubMan->SendClubInfo(ClientSlot, ClubDbNum);
}

//! ĳ���� ���� ����
GLCharAG* GLAgentServer::CreateCharFail( GLCharAG* pChar, DWORD dwClientID /*Client <-> Agent ���� ClientID*/ )
{
    // pChar �� NULL �� �� �ִ�.
    SAFE_DELETE(pChar);

    // ���� �õ��ڿ���  �޽����� �����ϴ�.
    GLMSG::SNETLOBBY_CHARJOIN_FB NetMsgFB(EMCJOIN_FB_ERROR);	
    SENDTOCLIENT(dwClientID, &NetMsgFB);
    sc::writeLogError(std::string("SNETLOBBY_CHARJOIN_FB failed"));
    return NULL;
}

HRESULT GLAgentServer::DropOutChar(DWORD GaeaID)
{
	GLCharAG* pChar = GetChar(GaeaID);
	if (!pChar)
        return E_FAIL;

	this->m_pMatchingCore->DropOutChar(pChar->ChaDbNum());

    pChar->Offline();

	// Ȱ�� ����Ʈ���� ����
	//if (pChar->m_pPCNode)
	//	m_PCList.DELNODE(pChar->m_pPCNode);

	// ���̾� ID ��ȯ
	m_FreePCGIDs.push_back(GaeaID);
	//m_PCArray[GaeaID] = NULL;
    UnregisterCharacter(GaeaID);

	// ĳ���� �̸� ����
    m_pCharMan->ChaNameDel(pChar->m_szName);

	// ĳ���� IP ����
	{
//		CHAR_MAP_ITER iter = m_PCIpMap.find(pPChar->m_szIp);
//		if ( iter!=m_PCIpMap.end() )			m_PCIpMap.erase(iter);
	}

	// User Account ����
    m_pCharMan->UserAccountDel(pChar->m_szUserName);

	// Character Client map ���� ����
    m_pCharMan->NetworkSlotDel(pChar->ClientSlot());

	// PC UserNumber map ���� ����
    m_pCharMan->UserDbNumGaeaIdDel(pChar->m_UserDbNum);

	// CID map ���� ����
    m_pCharMan->ChaDbNumGaeaIdDel(pChar->m_CharDbNum);

	//LAND ����Ʈ���� ����.
	GLAGLandMan* pOLD_LAND = GetLand(pChar->GetCurrentMap().getGaeaMapID());
	if (pOLD_LAND)
        pOLD_LAND->DropOutPC(pChar->ChaDbNum());

/*
	//	�����ڿ��� DropOut �޽����� �����ϴ�.
	GLMSG::SNET_DROP_OUT_FORCED NetMsgForced;
	NetMsgForced.emForced = EMDROPOUT_REQLOGIN;
	SendField ( dwGaeaID, &NetMsgForced );
*/
    // ĳ���� �������� �˸�
    //cp::NET_CHAR_CLOSE_AC MsgAC(UserDbNum, ChaDbNum);
    //SENDTOCACHE(&MsgAC);

	//�޸� ����
	SAFE_DELETE(pChar);

	return S_OK;
}

BOOL GLAgentServer::ReserveDropOutPC(DWORD dwGaeaID)
{
    sc::CriticalSectionOwnerLock OwnerLock(m_CSPCLock);
    m_RegDropOutPC.push_back(dwGaeaID);
	return TRUE;
}

BOOL GLAgentServer::ClearReservedDropOutPC ()
{
	sc::CriticalSectionOwnerLock OwnerLock(m_CSPCLock);
	{
		PCGID_ITER iter = m_RegDropOutPC.begin ();
		PCGID_ITER iter_end = m_RegDropOutPC.end ();
		for ( ; iter!=iter_end; ++iter)
		{
			DWORD dwGaeaID = (*iter);
			GLCharAG* pChar = GetChar(dwGaeaID);
			if (pChar)
			    DropOutChar(dwGaeaID);
		}
		m_RegDropOutPC.clear ();
	}

	return TRUE;
}

HRESULT GLAgentServer::FrameMove(float fTime, float fElapsedTime, const CTime& CurrentTime)
{
    // ���� ��ȭ ����.
    GLPeriod::GetInstance().FrameMove(fTime, fElapsedTime);

	//
	//mjeon.groupchat
	//
	m_pGroupChatMan->FrameMove();

	Timer::Manager& _managerTimer(Timer::Manager::getInstance());
	_managerTimer.update(fTime, fElapsedTime);

	//
	//mjeon.CaptureTheField
	//
	FrameMoveCTF(fElapsedTime);

    // �������� ����.
    FrameMoveGuidance(fElapsedTime);
    
    // Ŭ������ ��ġ ����.
    FrameMoveClubDeathMatch(fElapsedTime);

	if ( m_pJackpot )
	{
		m_pJackpot->FrameMove( fElapsedTime );
	}

    // �ڵ����� ����
    m_pAutoLevel->FrameMove();

	// ĳ���� ����
    for (AGENT_CHAR_DATA_ITER iter=m_CharData.begin(); iter!=m_CharData.end(); ++iter)
    {
        GLCharAG* pChar = iter->second;

        if ( pChar == NULL )
			continue;

		if ( iter->first != pChar->m_dwGaeaID )
		{
			sc::writeLogError("GLAgentServer::FrameMove, iter->first != pChar->m_dwGaeaID");
			continue;
		}

        if ( pChar->FrameMove(fTime, fElapsedTime) == E_FAIL )
		{
			NET_CLOSE_CLIENT _closeClient(pChar->ChaDbNum());
			SENDTOMYSELF(&_closeClient);
		}
    }

	// ������ ������ �ʴ� ���������̸�� ( GM �������� ���� )
	m_pFreePK->FrameMove( fElapsedTime );

	//���� ����Ʈ�� ��ϵ� ĳ���� ������Ʈ �������ֱ�
	ClearReservedDropOutPC ();

	//��Ƽ ������Ʈ	
	m_pPartyManager->FrameMove ( fTime, fElapsedTime );

	// �ν��Ͻ� �Ŵ��� ������Ʈ;
	m_pInstanceManager->frameMove(fTime, fElapsedTime, CurrentTime);

	m_pMatchingCore->OnFrameMove(fTime, fElapsedTime, CurrentTime);

	// �̺�Ʈ �Ŵ��� ������Ʈ;
	m_pEventManager->frameMove(fTime, fElapsedTime, CurrentTime.GetTime());

	//�ð� ����� ��ũ�� ���߱� ���� ������Ʈ �Լ�
	m_fPERIOD_TIMER += fElapsedTime;
	if ( m_fPERIOD_TIMER > 60.0f )
	{
		m_fPERIOD_TIMER = 0.0f;
		
		GLMSG::SNET_PERIOD NetPeriod;
		NetPeriod.sPRERIODTIME = GLPeriod::GetInstance().GetPeriod();
		SENDTOALLCHANNEL ( &NetPeriod );
	}

	//	��Ƽ���� ä�� �ð� üũ ( 60�ʸ��� ���� ) 
	m_fPartyRecruitTime += fElapsedTime;
	if ( m_fPartyRecruitTime > 60.0f )
	{
		m_fPartyRecruitTime = 0.0f;

		MAP_PARTY_RECRUIT_TIME_ITER iter = m_mapPartyRecruitTime.begin();
		MAP_PARTY_RECRUIT_TIME_ITER iter_end = m_mapPartyRecruitTime.end();

		__time64_t curTime = CTime::GetCurrentTime().GetTime();
		__time64_t partyTime;

		for ( ; iter != iter_end;  ) 
		{
			partyTime = iter->second;

			if ( partyTime < curTime ) 
			{
				m_mapPartyRecruitTime.erase( iter++ );
			}
			else
			{
				++iter;
			}
		}
	}

	// Ŭ�� ����
	m_pClubMan->FrameMoveAgent(fTime, fElapsedTime, CurrentTime);

	if( m_sEventState.bEventStart && m_sEventState.dwEventEndMinute != 0 )
	{
		CTimeSpan timeSpan = CTimeSpan( 0, 0, m_sEventState.dwEventEndMinute, 0 );
		CTime endTime = m_sEventState.EventStartTime + timeSpan;
		CTime currentTime = CTime::GetCurrentTime();

		if( endTime.GetMonth()  == currentTime.GetMonth() && 
			endTime.GetDay()    == currentTime.GetDay() && 
			endTime.GetHour()   == currentTime.GetHour() && 
			endTime.GetMinute() == currentTime.GetMinute() )
		{
			m_sEventState.bEventStart      = false;
			m_sEventState.dwEventEndMinute = 0;

			GLMSG::SNET_GM_LIMIT_EVENT_END nmg;
			SENDTOALLCHANNEL ( &nmg );
		}
	}

	TestCreateInstantMap( fElapsedTime );

	// �δ� ���� �ð��� ���� ������Ʈ
	{
		MAP_ENTRYLIMIT_ITER iter = m_mapEntryLimitInfo.begin();
		for( ; iter != m_mapEntryLimitInfo.end();)
		{		
			iter->second.remove_if( std::mem_fun_ref(&SENTRYLIMITINFO::IsEntryLimitEnd) );

			if( iter->second.empty() )
			{
				m_mapEntryLimitInfo.erase(iter++);
			}else{
				++iter;
			}

		}
	}

	// �п��� ���� pk �ý��� ����.
	m_pSchoolFreePk->FrameMove(fElapsedTime);

	// �ֱ�/�̺�Ʈ ���� Ŭ���� ����
	m_cAGPeriod.FrameMove(this, fTime, fElapsedTime);

    // PVE 
    PVESystem::FrameMove(fElapsedTime);

	// TexasHoldem
	if ( m_pTexasHoldemMgr )
	{
		m_pTexasHoldemMgr->FrameMove( fElapsedTime );
	}

	// Lotto System;
	FrameMoveLottoSystem( fElapsedTime, CurrentTime );

	// Country System;
	Country::GLVictoriousCountryManServer* pVCountryMan =
		Country::GLVictoriousCountryManServer::Instance();
	if ( !pVCountryMan )
		return FALSE;

	pVCountryMan->OnFrameMove( fElapsedTime );

	// Matching System;
	MatchingSystem::CMatchingJoinManager::Instance()->OnFrameMove( fElapsedTime, CurrentTime );

	return S_OK;
}


bool GLAgentServer::StartPartyConfront(
    const GLPartyID PartyID_A,
    const GLPartyID PartyID_B,
    const SNATIVEID &sMapID,
    const SCONFT_OPTION &sOption,
    const DWORD* pMBR_A,
    const DWORD* pMBR_B,
    const D3DXVECTOR3& vPos)
{
	GLPartyAgent* const pPartyA = m_pPartyManager->GetParty(PartyID_A);
	GLPartyAgent* const pPartyB = m_pPartyManager->GetParty(PartyID_B);
	if ( (pPartyA == NULL) || (pPartyB == NULL) )
        return false;

	GLPartyAgent::MEMBER_ITER iter, iter_end;

	WORD wSCHOOL_A = pPartyA->GetMASTER_SCHOOL(this);
	WORD wSCHOOL_B = pPartyB->GetMASTER_SCHOOL(this);

	SCONFT_OPTION sOPT_A = sOption;
	SCONFT_OPTION sOPT_B = sOption;

	sOPT_A.wMY_SCHOOL = wSCHOOL_A;
	sOPT_A.wTAR_SCHOOL = wSCHOOL_B;

	sOPT_B.wMY_SCHOOL = wSCHOOL_B;
	sOPT_B.wTAR_SCHOOL = wSCHOOL_A;

	int i(0);

	//A �� '��Ƽ���' �ʱ�ȭ.
	//
	pPartyA->m_CurrentConfrontMember.clear();
	pPartyA->m_StartConfrontMember.clear();

	for ( i=0; i<MAXPARTY; ++i )
	{
		DWORD dwMBR = pMBR_A[i];
		if ( dwMBR == GAEAID_NULL )	
            continue;

		PGLCHARAG pChar = GetChar ( dwMBR );
		if ( !pChar )
            continue;
		if ( pChar->GetCurrentMap().getGaeaMapID() != sMapID )
            continue;

		//��Ƽ���� ������� ����.
		//
		pChar->m_sCONFTING.RESET();
		pChar->m_sCONFTING.emTYPE = EMCONFT_PARTY;
		pChar->m_sCONFTING.dwTAR_ID = PartyID_B.GetID();
		pChar->m_sCONFTING.sOption = sOPT_A;

		pPartyA->addConfrontMember ( dwMBR );
	}

	if ( pPartyA->getNConfrontMember()==0 )
        return false;
	
	//B �� '��Ƽ���' �ʱ�ȭ.
	//
	pPartyB->m_CurrentConfrontMember.clear();
	pPartyB->m_StartConfrontMember.clear();

	for ( i=0; i<MAXPARTY; ++i )
	{
		DWORD dwMBR = pMBR_B[i];
		if ( dwMBR == GAEAID_NULL )
            continue;

		PGLCHARAG pChar = GetChar ( dwMBR );
		if ( !pChar )
            continue;
		if ( pChar->GetCurrentMap().getGaeaMapID() != sMapID )	
            continue;

		//��Ƽ���� ������� ����.
		//
		pChar->m_sCONFTING.RESET();
		pChar->m_sCONFTING.emTYPE = EMCONFT_PARTY;
		pChar->m_sCONFTING.dwTAR_ID = PartyID_A.GetID();
		pChar->m_sCONFTING.sOption = sOPT_B;

		pPartyB->addConfrontMember ( dwMBR );
	}

	if ( pPartyB->getNConfrontMember()==0 )
        return false;

	//�б��� ��Ƽ ������� �˻�.
	//
	bool bSCHOOL(false);
	if ( sOption.bSCHOOL )
	{
		if ( wSCHOOL_A != wSCHOOL_B )
		{
			bool bSAME_SCHOOL = pPartyA->IsSAME_SCHOOL(this) && pPartyB->IsSAME_SCHOOL(this);
			bool bCONFT_NUM = pPartyA->getNConfrontMember()>=GLCONST_CHAR::wCONFRONT_SCHOOL_LIMIT_NUM && pPartyB->getNConfrontMember()>=GLCONST_CHAR::wCONFRONT_SCHOOL_LIMIT_NUM;
			if ( bSAME_SCHOOL && bCONFT_NUM )
			{
				bSCHOOL = true;
			}
		}
	}
	sOPT_A.bSCHOOL = sOPT_B.bSCHOOL = bSCHOOL;

	//��Ƽ��� ���� �ʱ�ȭ.
	//
	pPartyA->m_ConfrontOption = sOPT_A;
	pPartyA->m_ConfrontTargetPartyID = PartyID_B;
	pPartyA->m_fConfrontTimer = 0.0f;
	pPartyA->refreshConfrontMember();

	pPartyB->m_ConfrontOption = sOPT_B;
	pPartyB->m_ConfrontTargetPartyID = PartyID_A;
	pPartyB->m_fConfrontTimer = 0.0f;
	pPartyB->refreshConfrontMember();

	//�б��� ��Ƽ ����� ���۵Ǿ����ϴ�. ��� �÷��̾�� �޽��� ����.
	//
	if ( sOPT_A.bSCHOOL )
	{
        std::string strText;
		const char *szMAP_NAME = m_sMapList.GetMapName ( sMapID );
		if ( szMAP_NAME )
		{
			strText = sc::string::format(
                ID2SERVERTEXT("EMCONFRONT_START_PARTY"), 
				szMAP_NAME,
                GLCONST_CHAR::GETSCHOOLNAME(wSCHOOL_A),
                GLCONST_CHAR::GETSCHOOLNAME(wSCHOOL_B));
		}

		GLMSG::SNET_SERVER_GENERALCHAT NetMsg;
		if (NetMsg.SETTEXT(strText))
        {
            msgpack::sbuffer SendBuffer;
            msgpack::pack(SendBuffer, NetMsg);
		    SENDTOALLCLIENT(NET_MSG_SERVER_GENERALCHAT, SendBuffer);
        }
	}

	//�ʵ忡 ��� �ʱ�ȭ �޽���.
	//		�޽����� ���۵� my, tar school �� ������ �ʴ´�.
	GLMSG::SNETPC_CONFRONTPTY_START2_FLD NetMsgFld(sMapID, PartyID_A, PartyID_B, vPos, sOPT_A);

    int nindex(0);
	iter = pPartyA->m_CurrentConfrontMember.begin();
	iter_end = pPartyA->m_CurrentConfrontMember.end();
	for ( ; iter!=iter_end; ++iter )
	{
		NetMsgFld.dwPARTY_A_MEMBER[nindex++] = (*iter);
	}

	nindex = (0);
	iter = pPartyB->m_CurrentConfrontMember.begin();
	iter_end = pPartyB->m_CurrentConfrontMember.end();
	for ( ; iter!=iter_end; ++iter )
	{
		NetMsgFld.dwPARTY_B_MEMBER[nindex++] = (*iter);
	}

	SENDTOALLCHANNEL(&NetMsgFld);
	return true;
}

void GLAgentServer::ResetFieldInfo()
{
	// ��� �̷������ ��Ƽ ��ü ������ ���� ������ �� �� ���� �����ӿ� ó���Ѵ�.
	ReserveTask( RESERVED_TASK_PARTY_CLEAR );
}

void GLAgentServer::ReserveTask( RESERVED_TASK_TYPE eTaskType )
{
	m_ReservedTask.push_back( eTaskType );
}

void GLAgentServer::ExecuteReservedTask()
{
	// ��Ƽ ��ü ���� ó��
	BOOST_FOREACH( const RESERVED_TASK_TYPE& eTaskType, m_ReservedTask )
	{
		switch ( eTaskType )
		{
		case RESERVED_TASK_PARTY_CLEAR:
			{
				if ( m_pPartyManager )
				{
					m_pPartyManager->DeleteParty();
				}
			}
			break;
		default:
			break;
		}
	}

	m_ReservedTask.clear();
}

void GLAgentServer::GroupChatSyncConfig(DWORD dwClientID)
{
	m_pGroupChatMan->SyncConfig(dwClientID);
}


void GLAgentServer::ChangeNameMap(GLCharAG* pChar, const char* pszOldName, const char* pszNewName)
{
	if (!pChar)
        return;
    
    m_pCharMan->ChaNameDel(pChar->m_szName);

    pChar->SetChaName(pszNewName);

    m_pCharMan->ChaNameAdd(pChar->m_szName, pChar);
}

void GLAgentServer::ChangeNameMap(GLCharAG* pChar, const TCHAR* pszPhoneNumber)
{
    /*
	CHAR_MAP_ITER name_iter = m_CharNameMap.find( pChar->m_szName );
	if ( name_iter != m_CharNameMap.end() )
	{
		StringCchCopy( name_iter->second->m_szPhoneNumber, SMS_RECEIVER, pszPhoneNumber );
	}
    */
}

//! ���� �ʵ弭�� ���� ���� ����
BOOL GLAgentServer::GameJoinToFieldSvr(NET_MSG_GENERIC* nmg, DWORD dwClientID, DWORD dwGaeaID)
{
	GLMSG::SNETPC_SAVECHARPOSRST_FROMDB* pNetMsg = (GLMSG::SNETPC_SAVECHARPOSRST_FROMDB*)nmg; // (DB->Agent)

	GLCharAG* pChar = GetCharByDbNum(pNetMsg->dwCharID);
	if (!pChar)
        return FALSE;

	//if (m_pMsgServer->ConnectFieldSvr(pChar->ClientSlot(), pNetMsg->dwFieldServer, pChar->GaeaId(), pChar->m_nChannel ) != NET_OK)
	if (m_pMsgServer->SetUpFieldInfo(pChar->ClientSlot(), pNetMsg->dwFieldServer, pChar->GaeaId(), pChar->m_nChannel ) != NET_OK)	
	{
        // ĳ���Ͱ� ������ �ʵ弭���� ������ ������
        sc::writeLogError(
            sc::string::format(
                "Can't connect field. FIELDID %1% Char Slot %2% Cha Name %3%",
			    pNetMsg->dwFieldServer,
                pChar->ClientSlot(),
                pChar->m_szName));
		return FALSE;
	}

	//	ĳ���� ���� ���� ����
	NET_GAME_JOIN_FIELDSVR MsgAF(pChar->GetCountry());
	MsgAF.emType			= EMJOINTYPE_FIRST;
	MsgAF.dwSlotAgentClient	= pChar->ClientSlot();
	MsgAF.SetUserId(pChar->m_szUserName);
	MsgAF.nUserNum			= pChar->m_UserDbNum;
	MsgAF.dwUserLvl			= pChar->m_dwUserLvl;
	MsgAF.nChaNum			= pChar->m_CharDbNum;
	MsgAF.dwGaeaID			= pChar->GaeaId();
    MsgAF.PartyID		    = pChar->GetPartyID();
    MsgAF.tPREMIUM			= pChar->m_tPREMIUM;
	MsgAF.tCHATBLOCK		= pChar->m_tCHATBLOCK;

	MsgAF.sStartMap			= pChar->m_sStartMapID;
	MsgAF.dwStartGate		= pChar->m_dwStartGate;
	MsgAF.vStartPos			= pChar->m_vStartPos;

	MsgAF.dwActState		= pChar->m_dwActState;
	MsgAF.bUseArmSub		= pChar->m_bUseArmSub;

	MsgAF.emIPBonus			= pChar->m_emIPBonus;

	MsgAF.sChinaTime		= pChar->m_sChinaTime;
	MsgAF.sVietnamGainSystem = pChar->m_sVietnamSystem;

	MsgAF.dwCountryID		= pChar->GetCountryInfo().dwID;

	if ( pChar->GetCryptKey().guid != GUID_NULL )
	{
		MsgAF.ckey = pChar->GetCryptKey();
	}

	SENDTOFIELD(pChar->ClientSlot(), &MsgAF);

	//�ɸ����� ���� ���� �ʵ弭�� �� ���� �� ID ����
	SetCurrentField(pChar, pNetMsg->dwFieldServer, pChar->m_sStartMapID);
	return TRUE;
}


/*
 * dwClubID�� ���� Ŭ�������� ��Ƽ�� ���� �ְ�,
 * �ش� ��Ƽ�� ��� Ŭ������ �����ϸ� �ѾƳ�;
*/
void GLAgentServer::ClubBattlePartyCheck(DWORD dwClubID, DWORD dwClubIDTar)
{    
	std::tr1::shared_ptr<GLClubAgent> pCLUB = m_pClubMan->GetClub ( dwClubID );
	if ( pCLUB == NULL )
        return;
	
    CLUBMEMBERS& Members = pCLUB->GetMembers();
	CLUBMEMBERS_ITER pos = Members.begin();
	CLUBMEMBERS_ITER end = Members.end();
	for ( ; pos!=end; ++pos)
	{
		GLCharAG* const pClubMember = GetCharByDbNum((*pos).first);
		if ( pClubMember == NULL )
			continue;

		const GLPartyID& PartyID = pClubMember->GetPartyID();
		if ( PartyID.isValidParty() == false )
			continue;

		GLPartyMemberGaeaIDs PartyMemberGaeaIDs;
		const EMPARTY_ERROR_TYPE emErrorType = m_pPartyManager->GetPartyMemberGaeaIDs(PartyID, PartyMemberGaeaIDs);
		if ( emErrorType != EMPARTY_ERROR_OK )
		{
			sc::writeLogError(std::string("GLAgentServer::ClubBattlePartyCheck() - Party/Expedition does not exist."));
			m_pPartyManager->SendErrorMsg(PartyID, pClubMember->GaeaId(), emErrorType, "ClubBattlePartyCheck");
			pClubMember->ResetPartyID();
			continue;
		}

		for ( DWORD _i = PartyMemberGaeaIDs.nMember; _i; --_i )
		{
			const DWORD dwMemberGaeaID = PartyMemberGaeaIDs.dwGaeaIDs[_i - 1];
			GLCharAG* const pPartyMember = GetChar(dwMemberGaeaID);
			if ( pPartyMember == NULL )
			{
				m_pPartyManager->removePartyMember(PartyID, dwMemberGaeaID);
				continue;
			}

			if ( pPartyMember->m_ClubDbNum == dwClubIDTar )
				m_pPartyManager->removePartyMember(PartyID, dwMemberGaeaID);			
		}
	}
}

void GLAgentServer::AllianceBattlePartyCheck( DWORD dwClubID, DWORD dwClubIDTar )
{
	std::tr1::shared_ptr<GLClubAgent> pCLUB = m_pClubMan->GetClub ( dwClubID );
	if ( pCLUB == NULL )
        return;

	CLUB_ALLIANCE_ITER pos = pCLUB->m_setAlliance.begin();
	CLUB_ALLIANCE_ITER end = pCLUB->m_setAlliance.end();
	for ( ; pos!=end; ++pos )
	{
		const GLCLUBALLIANCE &sALLIANCE = pos->second;
		std::tr1::shared_ptr<GLClubAgent> pClubP = m_pClubMan->GetClub ( sALLIANCE.m_dwID );
		if ( pClubP == NULL )
            continue;
				
        CLUBMEMBERS& Members = pCLUB->GetMembers();
		CLUBMEMBERS_ITER pos = Members.begin();
		CLUBMEMBERS_ITER end = Members.end();
		for ( ; pos!=end; ++pos)
		{
			GLCharAG* const pClubMember = GetCharByDbNum((*pos).first);
			if ( pClubMember == NULL )
				continue;

			const GLPartyID& PartyID = pClubMember->GetPartyID();
			if ( PartyID.isValidParty() == false )
				continue;

			GLPartyMemberGaeaIDs PartyMemberGaeaIDs;
			const EMPARTY_ERROR_TYPE emErrorType = m_pPartyManager->GetPartyMemberGaeaIDs(PartyID, PartyMemberGaeaIDs);
			if ( emErrorType != EMPARTY_ERROR_OK )
			{
				sc::writeLogError(std::string("GLAgentServer::ClubBattlePartyCheck() - Party/Expedition does not exist."));
				m_pPartyManager->SendErrorMsg(PartyID, pClubMember->GaeaId(), emErrorType, "AllianceBattlePartyCheck");
				pClubMember->ResetPartyID();
				continue;
			}

			for ( DWORD _i = PartyMemberGaeaIDs.nMember; _i; --_i )
			{
				const DWORD dwMemberGaeaID = PartyMemberGaeaIDs.dwGaeaIDs[_i - 1];
				GLCharAG* const pPartyMember = GetChar(dwMemberGaeaID);
				if ( pPartyMember == NULL )
				{
					if ( m_pPartyManager->removePartyMember(PartyID, dwMemberGaeaID) == false )
					{
						pClubMember->ResetPartyID();
						break;
					}
					continue;
				}

				if ( pPartyMember->m_ClubDbNum == dwClubIDTar )
				{
					if ( m_pPartyManager->removePartyMember(PartyID, dwMemberGaeaID) == false )
						pClubMember->ResetPartyID();
				}
			}
		}
		
	}

	return;
}

HRESULT GLAgentServer::StartClubBattle( DWORD dwClubID, GLCLUBBATTLE sClubBattle )
{
	// ���� Ŭ����Ʋ ���� �߰�
	std::tr1::shared_ptr<GLClubAgent> pClubP = m_pClubMan->GetClub( dwClubID );
	std::tr1::shared_ptr<GLClubAgent> pClubS = m_pClubMan->GetClub( sClubBattle.m_dwCLUBID );
	if( !pClubP || !pClubS )
        return S_FALSE;

	//	�ʵ忡 �˸�.
	GLMSG::SNET_CLUB_BATTLE_BEGIN_FLD NetMsgFld;
	NetMsgFld.dwChiefClubID = pClubP->m_DbNum;
	NetMsgFld.dwIndianClubID = pClubS->m_DbNum;
	NetMsgFld.tStartTime = sClubBattle.m_tStartTime;	
	NetMsgFld.tEndTime = sClubBattle.m_tEndTime;	
	NetMsgFld.bAlliance = sClubBattle.m_bAlliance;
	SENDTOALLCHANNEL(&NetMsgFld);

	//	Ŭ���̾�Ʈ�鿡 �˸�. 
	GLMSG::SNET_CLUB_BATTLE_BEGIN_CLT2 NetMsgClt;
	NetMsgClt.dwClubID = pClubP->m_DbNum;	
	StringCchCopy ( NetMsgClt.szClubName, CHAR_SZNAME, pClubP->Name() );	
	NetMsgClt.tStartTime = sClubBattle.m_tStartTime;	
	NetMsgClt.tEndTime = sClubBattle.m_tEndTime;	
	NetMsgClt.bAlliance = sClubBattle.m_bAlliance;	

    std::string strText;

	if ( sClubBattle.m_bAlliance )
	{
		CLUB_ALLIANCE_ITER pos = pClubP->m_setAlliance.begin();
		CLUB_ALLIANCE_ITER end = pClubP->m_setAlliance.end();
		for ( ; pos!=end; ++pos )
		{
			const GLCLUBALLIANCE &sALLIANCE = pos->second;
			std::tr1::shared_ptr<GLClubAgent> pClub = m_pClubMan->GetClub ( sALLIANCE.m_dwID );			
			if ( !pClub )
                continue;
			
			pClub->ADDBATTLECLUB( sClubBattle );
		}

		sClubBattle.m_dwCLUBID = pClubP->m_DbNum;
		sClubBattle.SetName(pClubP->Name());

		pos = pClubS->m_setAlliance.begin();
		end = pClubS->m_setAlliance.end();
		for ( ; pos!=end; ++pos )
		{
			const GLCLUBALLIANCE &sALLIANCE = pos->second;
			std::tr1::shared_ptr<GLClubAgent> pClub = m_pClubMan->GetClub ( sALLIANCE.m_dwID );
			
			if ( !pClub )
                continue;
			
			pClub->ADDBATTLECLUB( sClubBattle );
		}

		SENDTOALLIANCECLIENT ( pClubS->m_DbNum, &NetMsgClt );	
		
		NetMsgClt.dwClubID = pClubS->m_DbNum;	
		NetMsgClt.SetName(pClubS->m_szName);
		SENDTOALLIANCECLIENT(pClubP->m_DbNum, &NetMsgClt);

		AllianceBattlePartyCheck( pClubS->m_DbNum, pClubP->m_DbNum );
		
		strText = sc::string::format(ID2SERVERTEXT( "ALLIANCE_BATTLE_BEGIN" ), pClubP->Name(), pClubS->Name());
	}
	else
	{	
		pClubP->ADDBATTLECLUB( sClubBattle );
		
		// ����� Ŭ����Ʋ ���� �߰�
		sClubBattle.m_dwCLUBID = pClubP->m_DbNum;
		sClubBattle.SetName(pClubP->Name());
		pClubS->ADDBATTLECLUB( sClubBattle );
		SENDTOCLUBCLIENT ( pClubS->m_DbNum, &NetMsgClt );
		
		NetMsgClt.dwClubID = pClubS->m_DbNum;	
		NetMsgClt.SetName(pClubS->Name());
		SENDTOCLUBCLIENT(pClubP->m_DbNum, &NetMsgClt);

		ClubBattlePartyCheck( pClubS->m_DbNum, pClubP->m_DbNum );

		strText = sc::string::format(ID2SERVERTEXT("CLUB_BATTLE_BEGIN"), pClubP->Name(), pClubS->Name());
	}	

	GLMSG::SNET_SERVER_GENERALCHAT SendData;
	if (SendData.SETTEXT(strText))
    {
        msgpack::sbuffer SendBuffer;
        msgpack::pack(SendBuffer, SendData);
	    SENDTOALLCLIENT(NET_MSG_SERVER_GENERALCHAT, SendBuffer);
    }

	return S_OK;
}

void GLAgentServer::SetEventExp( bool bEvent, float fScale )
{
	if ( bEvent )
	{
		if( fScale < 1.0f )
            fScale = 1.0f;
		if( fScale > 4.0f )	
            fScale = 4.0f;

		GLMSG::NET_GM_EVENT_EXP_CAF NetMsg(0, fScale);	    		
		SENDTOALLCHANNEL(&NetMsg);

		m_WorkEvent.bWorkEvent[EVENT_EXP] = bEvent;
		m_WorkEvent.exp_Event = NetMsg;
	
	}
	else
	{
		GLMSG::NET_GM_EVENT_EXP_END_CAF NetMsg;		
		SENDTOALLCHANNEL(&NetMsg);
		m_WorkEvent.bWorkEvent[EVENT_EXP] = FALSE;
	}
}

void GLAgentServer::SetEventItem( bool bEvent, float fScale )
{
	if ( bEvent )
	{
		if ( fScale > 10.0f )
            fScale = 10.0f;

		GLMSG::SNET_GM_EVEN_ITEM_GEN NetMsg;

		NetMsg.fRATE = fScale;
	    		
		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_ITEM] = bEvent;
		m_WorkEvent.item_Event	  = NetMsg;
		
	}
	else
	{
		GLMSG::SNET_GM_EVEN_ITEM_GEN_END NetMsg;
		
		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_ITEM] = FALSE;
	}
}

void GLAgentServer::SetEventMoney( bool bEvent, float fScale )
{
	
	if ( bEvent )
	{
		if ( fScale > 10.0f )
            fScale = 10.0f;

		GLMSG::SNET_GM_EVEN_MONEY_GEN NetMsg;

		NetMsg.fRATE = fScale;
	    		
		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_MONEY] = bEvent;
		m_WorkEvent.money_Event	  = NetMsg;
		
	}
	else
	{
		GLMSG::SNET_GM_EVEN_MONEY_GEN_END NetMsg;
		
		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_MONEY] = FALSE;
	}
}

void GLAgentServer::SetEventGrade( bool bEvent, float fScale )
{
	if ( bEvent )
	{
		if ( fScale > 90.0f )
            fScale = 90.0f;
		if ( fScale < 0.0f )
            fScale = 0.0f;

		GLMSG::SNET_GM_EVENT_GRADE NetMsg;

		NetMsg.fRATE = fScale;
	    		
		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_GRADE] = bEvent;
		m_WorkEvent.grade_Event	  = NetMsg;
		
	}
	else
	{
		GLMSG::SNET_GM_EVENT_GRADE_END NetMsg;
		
		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_GRADE] = FALSE;
	}

}

void GLAgentServer::SetEventEx( bool bEvent, EMGM_EVENT_TYPE type, WORD wValue )
{

	if ( bEvent )
	{
		if( wValue < 1 )
            wValue = 1;
		else if( wValue > 50 )
            wValue = 50;

		GLMSG::SNET_GM_EVENT_EX NetMsg;

		NetMsg.wValue = wValue;
		NetMsg.emType = type;
	    		
		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_EXTYPE] = bEvent;
		m_WorkEvent.ex_Event	  = NetMsg;
		
	}
	else
	{
		GLMSG::SNET_GM_EVENT_EX_END NetMsg;

		NetMsg.emType = type;		
		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_EXTYPE] = FALSE;
	}
}

void GLAgentServer::SetEventLimit ( bool bEvent, SEventState sEventState )
{
	if ( bEvent )
	{
		GLMSG::SNET_GM_LIMIT_EVENT_BEGIN NetMsg;

		NetMsg.start_Lv = sEventState.MinEventLevel;
		NetMsg.end_Lv = sEventState.MaxEventLevel;
		NetMsg.play_Time = sEventState.EventPlayTime;
		NetMsg.buster_Time = sEventState.EventBusterTime;
		NetMsg.itemGain_Rate = sEventState.fItemGainRate;
		NetMsg.expGain_Rate = sEventState.fExpGainRate;

		m_sEventState = sEventState;
		m_sEventState.bEventStart = bEvent;
		m_sEventState.EventStartTime  = CTime::GetCurrentTime();
		m_sEventState.EventPlayTime *= 60;
		m_sEventState.EventBusterTime *= 60;


		CTime crtTime = CTime::GetCurrentTime();
		//for ( DWORD i=0; i<m_dwMaxClient; ++i )
		//{
		//	PGLCHARAG pChar = m_PCArray[i];
		//	if ( pChar )
		//	{
		//		pChar->m_sEventTime.loginTime = crtTime.GetTime();
		//	}
		//}
        for (AGENT_CHAR_DATA_ITER iter=m_CharData.begin(); iter!=m_CharData.end(); ++iter)
        {
            GLCharAG* pChar = iter->second;
            if (pChar)
                pChar->m_sEventTime.loginTime = crtTime.GetTime();
        }
	    		
		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_LIMIT] = bEvent;
		m_WorkEvent.limit_Event = NetMsg;		
	}
	else
	{
		m_sEventState.bEventStart = bEvent;

		GLMSG::SNET_GM_LIMIT_EVENT_END NetMsg;

		SENDTOALLCHANNEL ( &NetMsg );

		m_WorkEvent.bWorkEvent[EVENT_LIMIT] = bEvent;
	}
	
}

GLCharAG* GLAgentServer::GetChar(const GAEAID dwGaeaID)
{
    AGENT_CHAR_DATA_ITER iter = m_CharData.find(dwGaeaID);
    if (iter != m_CharData.end())
        return iter->second;
    else
        return NULL;
}

void GLAgentServer::RegisterCharacter(DWORD GaeaId, GLCharAG* pChar)
{
    AGENT_CHAR_DATA_ITER iter = m_CharData.find(GaeaId);
    if (iter != m_CharData.end())
        m_CharData.erase(iter);
    m_CharData.insert(AGENT_CHAR_DATA_VALUE(GaeaId, pChar));    
}

void GLAgentServer::UnregisterCharacter(DWORD GaeaId)
{
    AGENT_CHAR_DATA_ITER iter = m_CharData.find(GaeaId);
    if (iter != m_CharData.end())
        m_CharData.erase(iter);
}

GLCharAG* GLAgentServer::GetCharByDbNum(const DWORD ChaDbNum)
{
    DWORD GaeaId = m_pCharMan->GetGaeaIdByChaDbNum(ChaDbNum);
    if (GaeaId != GAEAID_NULL)
        return GetChar(GaeaId);
    else
        return NULL;
}

GLCharAG* GLAgentServer::GetCharByUserDbNum(const DWORD ChaDbNum)
{
    DWORD GaeaId = m_pCharMan->GetGaeaIdByUserDbNum(ChaDbNum);
    if (GaeaId != GAEAID_NULL)
        return GetChar(GaeaId);
    else
        return NULL;
}

GLAGLandMan* GLAgentServer::GetLand(const MapID& sMapID)
{
	const SNATIVEID _gaeaMapID(sMapID.getGaeaMapID());
	return GetLand(_gaeaMapID);
}
GLAGLandMan* GLAgentServer::GetLand(const SNATIVEID& sMapID)
{
    GLAGLandManager* const pLandManager(GetLandManager(sMapID.wMainID));
    if ( pLandManager == NULL )
        return NULL;

    return pLandManager->getLand(sMapID.wSubID);    
}

GLAGLandManager* GLAgentServer::GetLandManager(const MapID& sMapID)
{
	const SNATIVEID _gaeaMapID(sMapID.getGaeaMapID());
	return GetLandManager(_gaeaMapID);
}
GLAGLandManager* GLAgentServer::GetLandManager(const SNATIVEID& sMapID)
{
	const DWORD dwMapID(sMapID.wMainID);
	return GetLandManager(dwMapID);    
}
GLAGLandManager* GLAgentServer::GetLandManager(const DWORD dwMapID)
{
    LandManagerMapIter iteratorLandManager(m_mapLandMan.find(dwMapID));
    if ( iteratorLandManager == m_mapLandMan.end() )
        return NULL;


    GLAGLandManager* pLandManager(iteratorLandManager->second);
    return pLandManager;

}

const SNATIVEID GLAgentServer::GetToMapIDByGateID(const DWORD dwGaeaID, const DWORD dwGateID)
{
	GLCharAG* const pChar(GetChar(dwGaeaID));
	if ( pChar == NULL )
		goto GetMapIDByGateID_error;

	GLAGLandMan* pCurrentLandMan(GetLand(pChar->GetCurrentMap().getBaseMapID()));
	if ( pCurrentLandMan == NULL )
		goto GetMapIDByGateID_error;

	DxLandGateMan* const pCurrentGateMan(pCurrentLandMan->GetLandGateMan());
	DxLandGate* const pCurrentGate(pCurrentGateMan->FindLandGate(dwGateID));
	if ( pCurrentGate == NULL )
		goto GetMapIDByGateID_error;

	const SNATIVEID& nextMapID = pCurrentGate->GetToMapID();
	GLAGLandMan* const pNextLandMan(GetLand(nextMapID));
	if ( pNextLandMan == NULL )
		goto GetMapIDByGateID_error;

	DxLandGateMan* const pNextGateMan(pNextLandMan->GetLandGateMan());
	DxLandGate* const pNextGate(pNextGateMan->FindLandGate(pCurrentGate->GetToGateID()));
	if ( pNextGate == NULL )
		goto GetMapIDByGateID_error;

	return nextMapID;

GetMapIDByGateID_error:
	return SNATIVEID(false);
}

void GLAgentServer::SENDTOCACHE(NET_MSG_GENERIC* pMsg)
{
    if (m_pMsgServer)
        m_pMsgServer->SendCache(pMsg);
}

void GLAgentServer::SENDTOCACHE(EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    if (m_pMsgServer)
        m_pMsgServer->SendCache(MsgType, PackBuffer, UseCrc);
}

void GLAgentServer::SENDTOCACHE(EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
        if (m_pMsgServer)
            m_pMsgServer->SendCache(MsgType, *spBuffer, UseCrc);
}

void GLAgentServer::SENDTOMATCH(EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    if (m_pMsgServer)
        m_pMsgServer->SendMatch(MsgType, PackBuffer, UseCrc);
}

void GLAgentServer::SENDTOMATCH(NET_MSG_GENERIC *msg)
{
	if (m_pMsgServer)
        m_pMsgServer->SendMatch(msg);
}

void GLAgentServer::SENDTOMYSELF(NET_MSG_GENERIC *msg)
{
	if ( m_pMsgServer == NULL )
		return;

	m_pMsgServer->SendMySelf(0, msg);		
}
void GLAgentServer::SENDTOMYSELF(EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
	if ( m_pMsgServer == NULL )
		return;

	m_pMsgServer->SendMySelf(0, MsgType, PackBuffer, UseCrc);
}

//mjeon.AF
void GLAgentServer::SENDTOCLIENT(NET_MSG_GENERIC* nmg, DWORD dwChaNum)
{
	if (m_pMsgServer)
        m_pMsgServer->SendClient(nmg, dwChaNum);
}

void GLAgentServer::SENDTOCLIENT(EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, DWORD dwChaNum, bool UseCrc)
{
    if (m_pMsgServer)
        m_pMsgServer->SendClient(MsgType, PackBuffer, dwChaNum, UseCrc);
}

void GLAgentServer::SENDTOCLIENT(EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, DWORD dwChaNum, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
        if (m_pMsgServer)
            m_pMsgServer->SendClient(MsgType, *spBuffer, dwChaNum, UseCrc);
}

void GLAgentServer::SENDTOCLIENT(DWORD dwClientID, NET_MSG_GENERIC* nmg)
{
    if (m_pMsgServer)
        m_pMsgServer->SendClient(dwClientID, nmg);
}

void GLAgentServer::SENDTOCLIENT(DWORD dwClientID, EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    if (m_pMsgServer)
    {
        NET_MSG_PACK MsgPack;
        if (MsgPack.SetData(MsgType, PackBuffer, UseCrc))
            SENDTOCLIENT(dwClientID, &MsgPack);
    }
}

void GLAgentServer::SENDTOCLIENT(DWORD dwClientID, EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
    {
        if (m_pMsgServer)
        {
            NET_MSG_PACK MsgPack;
            if (MsgPack.SetData(MsgType, *spBuffer, UseCrc))
                SENDTOCLIENT(dwClientID, &MsgPack);
        }
    }
    
}

void GLAgentServer::SENDTOAGENT ( NET_MSG_GENERIC* pMsg )
{
	if ( NULL == m_pMsgServer )
		return;

	m_pMsgServer->SendAgent( pMsg );
}

void GLAgentServer::SENDTOAGENT ( EMNET_MSG MsgType
								, const msgpack::sbuffer& PackBuffer
								, bool UseCrc )
{
	if ( NULL == m_pMsgServer )
		return;

	m_pMsgServer->SendAgent( MsgType, PackBuffer, UseCrc );
}

void GLAgentServer::SENDTOAGENT ( EMNET_MSG MsgType
								, const std::vector< std::tr1::shared_ptr< msgpack::sbuffer > >& vecSpBuffer
								, bool UseCrc )
{
	if ( NULL == m_pMsgServer )
		return;

	BOOST_FOREACH ( const std::tr1::shared_ptr< msgpack::sbuffer >& spBuffer, vecSpBuffer )
		m_pMsgServer->SendAgent( MsgType, *spBuffer, UseCrc );
}

void GLAgentServer::SENDTOAGENT ( DWORD dwClientID
								, NET_MSG_GENERIC* pMsg )
{
	if ( NULL == m_pMsgServer )
		return;

	m_pMsgServer->SendAgent( dwClientID, pMsg );
}

void GLAgentServer::SENDTOAGENT ( DWORD dwClientID
								, EMNET_MSG MsgType
								, const msgpack::sbuffer& PackBuffer
								, bool UseCrc )
{
	if ( NULL == m_pMsgServer )
		return;

	m_pMsgServer->SendAgent( dwClientID, MsgType, PackBuffer, UseCrc );
}

void GLAgentServer::SENDTOAGENT ( DWORD dwClientID
								, EMNET_MSG MsgType
								, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer
								, bool UseCrc )
{
	if ( NULL == m_pMsgServer )
		return;

	BOOST_FOREACH ( const std::tr1::shared_ptr< msgpack::sbuffer >& spBuffer, vecSpBuffer )
		m_pMsgServer->SendAgent( dwClientID, MsgType, *spBuffer, UseCrc );
}

int GLAgentServer::SENDTOAGENT_SERVERGROUP ( DWORD dwServerGroup
											, NET_MSG_GENERIC* pMsg )
{
	if ( NULL == m_pMsgServer )
		return NET_ERROR;

	return m_pMsgServer->SendAgent_ServerGroup( dwServerGroup, pMsg );
}

int GLAgentServer::SENDTOAGENT_SERVERGROUP ( DWORD dwServerGroup
											, EMNET_MSG MsgType
											, const msgpack::sbuffer& PackBuffer
											, bool UseCrc )
{
	if ( NULL == m_pMsgServer )
		return NET_ERROR;

	return m_pMsgServer->SendAgent_ServerGroup( dwServerGroup, MsgType, PackBuffer, UseCrc );
}

int GLAgentServer::SENDTOAGENT_SERVERGROUP ( DWORD dwServerGroup
											, EMNET_MSG MsgType
											, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer
											, bool UseCrc )
{
	if ( NULL == m_pMsgServer )
		return NET_ERROR;

	BOOST_FOREACH ( const std::tr1::shared_ptr< msgpack::sbuffer >& spBuffer, vecSpBuffer )
		m_pMsgServer->SendAgent_ServerGroup( dwServerGroup, MsgType, *spBuffer, UseCrc );

	return NET_OK;
}

int GLAgentServer::SENDTOWORLDBATTLE ( NET_MSG_GENERIC* pMsg )
{
	CAgentServer* pServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pServer )
		return NET_ERROR;

	return SENDTOAGENT_SERVERGROUP( pServer->GetWorldBattleServerNumberInfo(), pMsg );
}

int GLAgentServer::SENDTOWORLDBATTLE ( EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc )
{
	CAgentServer* pServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pServer )
		return NET_ERROR;

	return SENDTOAGENT_SERVERGROUP( pServer->GetWorldBattleServerNumberInfo(), MsgType, PackBuffer, UseCrc );
}

int GLAgentServer::SENDTOWORLDBATTLE ( EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, bool UseCrc )
{
	CAgentServer* pServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pServer )
		return NET_ERROR;

	return SENDTOAGENT_SERVERGROUP( pServer->GetWorldBattleServerNumberInfo(), MsgType, vecSpBuffer, UseCrc );
}

void GLAgentServer::SENDTOFIELD(DWORD dwClientID, NET_MSG_GENERIC* nmg)
{
    if (m_pMsgServer)
        m_pMsgServer->SendField(dwClientID, nmg);
}

void GLAgentServer::SENDTOFIELD(DWORD dwClientID, EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    if (m_pMsgServer)
        m_pMsgServer->SendField(dwClientID, MsgType, PackBuffer, UseCrc);
}

void GLAgentServer::SENDTOFIELD(DWORD dwClientID, EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
        if (m_pMsgServer)
            m_pMsgServer->SendField(dwClientID, MsgType, *spBuffer, UseCrc);
}

//
//mjeon.SendField�� ����ϵ��� ���� : �޽��� ������ ���� �ʴ´�.
//
void GLAgentServer::SENDTOFIELD(DWORD dwChannel, DWORD dwFieldSvrNum, NET_MSG_GENERIC* nmg)
{
    if (m_pMsgServer)
        m_pMsgServer->SendField(dwChannel, dwFieldSvrNum, nmg);
}

void GLAgentServer::SENDTOFIELD(DWORD dwChannel, DWORD dwFieldSvrNum, EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    if (m_pMsgServer)
        m_pMsgServer->SendField(dwChannel, dwFieldSvrNum, MsgType, PackBuffer, UseCrc);
}

void GLAgentServer::SENDTOFIELD(DWORD dwChannel, DWORD dwFieldSvrNum, EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
        if (m_pMsgServer)
            m_pMsgServer->SendField(dwChannel, dwFieldSvrNum, MsgType, *spBuffer, UseCrc);
    
}
//
//�Ʒ��� �Լ��� SendClient�� ���: �޽����� ���� ������ �����Ѵ�.
//
void GLAgentServer::SENDTOFIELDSVR(int nChannel, int nField, NET_MSG_GENERIC* nmg)
{
    if (m_pMsgServer)
        m_pMsgServer->SendFieldSvr(nField, nmg, nChannel);
}

void GLAgentServer::SENDTOFIELDSVR(int nChannel, int nField, EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    if (m_pMsgServer)
        m_pMsgServer->SendFieldSvr(nField, MsgType, PackBuffer, nChannel, UseCrc);
}

void GLAgentServer::SENDTOFIELDSVR(int nChannel, int nField, EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
        if (m_pMsgServer)
            m_pMsgServer->SendFieldSvr(nField, MsgType, *spBuffer, nChannel, UseCrc);
}

void GLAgentServer::SENDTOCHANNEL(NET_MSG_GENERIC* nmg, int nChannel)
{
    if (m_pMsgServer)
        m_pMsgServer->SendChannel(nmg, nChannel);
}

void GLAgentServer::SENDTOCHANNEL(EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, int nChannel, bool UseCrc)
{
    if (m_pMsgServer)
        m_pMsgServer->SendChannel(MsgType, PackBuffer, nChannel, UseCrc);
}

void GLAgentServer::SENDTOCHANNEL(EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, int nChannel, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
        if (m_pMsgServer)
            m_pMsgServer->SendChannel(MsgType, *spBuffer, nChannel, UseCrc);
}

int GLAgentServer::SENDTOALLCHANNEL(NET_MSG_GENERIC* nmg)
{
    if (m_pMsgServer)
        return m_pMsgServer->SendAllChannel(nmg);

	return 0;
}

int GLAgentServer::SENDTOALLCHANNEL(EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    NET_MSG_PACK MsgPack;
    if (MsgPack.SetData(MsgType, PackBuffer, UseCrc))
        return SENDTOALLCHANNEL(&MsgPack);

	return 0;
}

int GLAgentServer::SENDTOALLCHANNEL(EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
    {
        NET_MSG_PACK MsgPack;
        if (MsgPack.SetData(MsgType, *spBuffer, UseCrc))
            return SENDTOALLCHANNEL(&MsgPack);
    }
   
    return 0;
}
void GLAgentServer::SENDTOALLCLIENT(NET_MSG_GENERIC* nmg)
{    
    for (AGENT_CHAR_DATA_ITER iter=m_CharData.begin(); iter!=m_CharData.end(); ++iter)
    {
        GLCharAG* pChar = iter->second;
        if (pChar)
            SENDTOCLIENT(pChar->ClientSlot(), nmg);
    }
}

void GLAgentServer::SENDTOALLCLIENT(EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    NET_MSG_PACK MsgPack;
    if (MsgPack.SetData(MsgType, PackBuffer, UseCrc))
        SENDTOALLCLIENT(&MsgPack);
}

void GLAgentServer::SENDTOALLCLIENT(EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
    {
        NET_MSG_PACK MsgPack;
        if (MsgPack.SetData(MsgType, *spBuffer, UseCrc))
            SENDTOALLCLIENT(&MsgPack);
    }
}

void GLAgentServer::SENDTOALLCLIENT(NET_MSG_GENERIC* nmg, int nChannel)
{   
    for (AGENT_CHAR_DATA_ITER iter=m_CharData.begin(); iter!=m_CharData.end(); ++iter)
    {
        GLCharAG* pChar = iter->second;
        if (pChar && pChar->m_nChannel == nChannel)
            SENDTOCLIENT(pChar->ClientSlot(), nmg);
    }
}

void GLAgentServer::SENDTOALLCLIENT(EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, int nChannel, bool UseCrc)
{
    NET_MSG_PACK MsgPack;
    if (MsgPack.SetData(MsgType, PackBuffer, UseCrc))
        SENDTOALLCLIENT(&MsgPack, nChannel);

}

void GLAgentServer::SENDTOALLCLIENT(EMNET_MSG MsgType, const std::vector<std::tr1::shared_ptr<msgpack::sbuffer>>& vecSpBuffer, int nChannel, bool UseCrc)
{
    BOOST_FOREACH( const std::tr1::shared_ptr<msgpack::sbuffer>& spBuffer, vecSpBuffer )
    {
        NET_MSG_PACK MsgPack;
        if (MsgPack.SetData(MsgType, *spBuffer, UseCrc))
            SENDTOALLCLIENT(&MsgPack);
    }

}

void GLAgentServer::SENDTOCLUBCLIENT(DWORD dwClubID, NET_MSG_GENERIC* nmg)
{
    m_pClubMan->SendClubClient(dwClubID, nmg);
}

void GLAgentServer::SENDTOCLUBCLIENT(DWORD dwClubID, EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    m_pClubMan->SendClubClient(dwClubID, MsgType, PackBuffer, UseCrc);
}

void GLAgentServer::SENDTOALLIANCECLIENT(DWORD dwClubID, EMNET_MSG MsgType, const msgpack::sbuffer& PackBuffer, bool UseCrc)
{
    NET_MSG_PACK MsgPack;
    if (MsgPack.SetData(MsgType, PackBuffer, UseCrc))
        SENDTOALLIANCECLIENT(dwClubID, &MsgPack);
}

void GLAgentServer::SENDTOALLIANCECLIENT ( DWORD dwClubID, NET_MSG_GENERIC* nmg )
{
    std::tr1::shared_ptr<GLClubAgent> pCLUB = m_pClubMan->GetClub ( dwClubID );
    if (!pCLUB)
        return;

    CLUB_ALLIANCE_ITER pos = pCLUB->m_setAlliance.begin();
    CLUB_ALLIANCE_ITER end = pCLUB->m_setAlliance.end();
    for ( ; pos!=end; ++pos )
    {
        const GLCLUBALLIANCE &sALLIANCE = pos->second;	
        SENDTOCLUBCLIENT( sALLIANCE.m_dwID, nmg );
    }
}

void GLAgentServer::SENDTOCLIENT_RELAY ( DWORD _dwDbNum
									   , DWORD _dwClientID
									   , NET_MSG_GENERIC_RELAY_AGENT* _pMsg )
{
	// ���� ������ ��� �ƹ��͵� ���� �ʴ´�;
	if ( IsSubServer() )
	{
		return;
	}

	// Client ID �� �ٸ� ������( Agent ) �̶�� �ش� �������� Agent �� ������;
	if ( IsAgentClientSlot( _dwClientID ) )
	{
		// �������� �������� ĳ���� DBNum ������ �־�� �Ѵ�;
		_pMsg->dwChaNum = _dwDbNum;

		// ��� ���������� �����Ѵ�;
		_pMsg->emRelayType = NET_MSG_GENERIC_RELAY_AGENT::EMMSG_RELAY_TYPE_AGENTTOCLIENT;

		SENDTOAGENT( _dwClientID, _pMsg );
	}
	// ���� ������ ��쿡�� �׳� ������;
	else
	{
		SENDTOCLIENT( _pMsg, _dwDbNum );
	}
}

void GLAgentServer::SENDTOCLIENT_RELAY_BYSVRGROUP ( DWORD _dwDbNum
												  , DWORD _dwServerGroup
												  , NET_MSG_GENERIC_RELAY_AGENT* _pMsg )
{
	// ���� ������ ��쿡�� �׳� ������;
	if ( GetServerGroup() == _dwServerGroup )
	{
		GLCharAG* pChar = GetCharByDbNum( _dwDbNum );
		if ( pChar )
			SENDTOCLIENT_RELAY( _dwDbNum, pChar->ClientSlot(), _pMsg );

		return;
	}

	// �������� �ٸ��ٸ� ������ �������� Agent Client Slot ID �� ���Ѵ�;
	const DWORD dwClientID = GetClientSlotID_ServerGroup( _dwServerGroup );
	if ( dwClientID == MAXDWORD )
		return;

	SENDTOCLIENT_RELAY( _dwDbNum, dwClientID, _pMsg );
}

void GLAgentServer::SENDTOFIELD_RELAY ( DWORD _dwDbNum
									  , DWORD _dwClientID
									  , NET_MSG_GENERIC_RELAY_AGENT* _pMsg )
{
	// ���� ������ ��� �ƹ��͵� ���� �ʴ´�;
	if ( IsSubServer() )
	{
		return;
	}

	// Client ID �� �ٸ� ������( Agent ) �̶�� �ش� �������� Agent �� ������;
	if ( IsAgentClientSlot( _dwClientID ) )
	{
		// �������� �������� ĳ���� DBNum ������ �־�� �Ѵ�;
		// �Ǽ��ϴ� ��츦 ����Ͽ� �ѹ� �� �����Ѵ�;
		_pMsg->dwChaNum = _dwDbNum;

		// ��� ���������� �����Ѵ�;
		_pMsg->emRelayType = NET_MSG_GENERIC_RELAY_AGENT::EMMSG_RELAY_TYPE_AGENTTOFIELD;

		SENDTOAGENT( _dwClientID, _pMsg );
	}
	// ���� ������ ��쿡�� �׳� ������;
	else
	{
		SENDTOFIELD( _dwClientID, _pMsg );
	}
}

void GLAgentServer::SENDTOFIELD_RELAY_BYSVRGROUP ( DWORD _dwDbNum
												 , DWORD _dwServerGroup
												 , NET_MSG_GENERIC_RELAY_AGENT* _pMsg )
{
	// ���� ������ ��쿡�� �׳� ������;
	if ( GetServerGroup() == _dwServerGroup )
	{
		GLCharAG* pChar = GetCharByDbNum( _dwDbNum );
		if ( pChar )
			SENDTOFIELD_RELAY( _dwDbNum, pChar->ClientSlot(), _pMsg );

		return;
	}

	// �������� �ٸ��ٸ� ������ �������� Agent Client Slot ID �� ���Ѵ�;
	const DWORD dwClientID = GetClientSlotID_ServerGroup( _dwServerGroup );
	if ( dwClientID == MAXDWORD )
		return;

	if ( IsAgentClientSlot( dwClientID ) )
	{
		SENDTOFIELD_RELAY( _dwDbNum, dwClientID, _pMsg );
	}
}

void GLAgentServer::SENDTOALLCLIENT_RELAY ( NET_MSG_GENERIC_RELAY_AGENT* _pMsg )
{
	// ���� ������ ��� �ƹ��͵� ���� �ʴ´�;
	if ( IsSubServer() )
	{
		return;
	}

	// ��� ���������� �����Ѵ�;
	_pMsg->emRelayType = NET_MSG_GENERIC_RELAY_AGENT::EMMSG_RELAY_TYPE_AGENTTOALLCLIENT;

	SENDTOAGENT( _pMsg );
	SENDTOALLCLIENT( _pMsg );
}

const bool GLAgentServer::IsSubServer ()
{
	CAgentServer* pServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pServer )
		return false;

	return pServer->IsSubServer();
}

const bool GLAgentServer::IsAgentClientSlot ( DWORD _dwClientSlotID )
{
	CAgentServer* pServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pServer )
		return false;

	return pServer->IsAgentClientSlot( _dwClientSlotID );
}

const bool GLAgentServer::IsFieldClientSlot ( DWORD _dwClientSlotID )
{
	CAgentServer* pServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pServer )
		return false;

	return pServer->IsFieldClientSlot( _dwClientSlotID );
}

const DWORD GLAgentServer::GetServerGroup_ClientSlotID ( DWORD _dwClientSlotID )
{
	CAgentServer* pServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pServer )
		return MAXDWORD;

	return pServer->GetServerGroup_ClientSlotID( _dwClientSlotID );
}

const DWORD GLAgentServer::GetClientSlotID_ServerGroup ( DWORD _dwServerGroup )
{
	CAgentServer* pServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pServer )
		return AGENTSERVER_MAX;

	return pServer->GetClientSlotID_ServerGroup( _dwServerGroup );
}

bool GLAgentServer::IsAgentOnline ( DWORD dwAgentNum )
{
	if ( dwAgentNum < 0 || dwAgentNum >= AGENTSERVER_MAX )
		return false;

	CAgentServer* pServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pServer )
		return false;

	DWORD dwSlotNum = pServer->GetAgentSlotNum( dwAgentNum );

	return pServer->IsSlotOnline ( dwSlotNum );
}

bool GLAgentServer::IsFieldOnline(DWORD Channel, DWORD FieldNum)
{
	if (Channel >= MAX_CHANNEL_NUMBER || FieldNum >= FIELDSERVER_MAX)
		return false;
	else
		return m_bFIELDSVR_ONLINE[Channel][FieldNum];
}

void GLAgentServer::SetFieldOnline(DWORD Channel, DWORD FieldNum, bool Set)
{
    if (Channel < MAX_CHANNEL_NUMBER && FieldNum < FIELDSERVER_MAX)
        m_bFIELDSVR_ONLINE[Channel][FieldNum] = Set;
}

void GLAgentServer::ChangeChannelUser( DWORD dwClient, int nPreChannel, int nAfterChannel )
{
	CAgentServer* pBaseAgentServer = static_cast< CAgentServer* >( m_pMsgServer );
	if ( NULL == pBaseAgentServer )
		return;

	pBaseAgentServer->ChangeChannelUser( dwClient, nPreChannel, nAfterChannel );
}

void GLAgentServer::FriendOfflineRequest( const std::string& ReqCharName, const std::string& TargetCharName )
{
    if( ReqCharName.empty() || TargetCharName.empty() )
        return;

    // Cache ���� ã�ƺ���.
    std::tr1::shared_ptr<CHAR_BASE_CACHE_DATA> spChaData = GetCharCacheData(TargetCharName);

    if (spChaData)
    {
        sc::MGUID NewGuid;
        sc::SeqUniqueGUID::Instance()->getGUID( NewGuid );
        json_spirit::Object JsonObj;
        {
            JsonObj.push_back( json_spirit::Pair( "M", gamelogic::notify::FRIEND_ADD ) );
            JsonObj.push_back( json_spirit::Pair( "1", ReqCharName ) );
        }

        AddGameAdoJob(
            db::DbActionPtr(
                new db::NotifyInsert( 
                    spChaData->ChaDbNum(),
                    gamelogic::notify::FRIEND_ADD, 
                    NewGuid, 
                    json_spirit::write(JsonObj) )));
    }
    else
    {
        // �������� �ʴ´ٸ� DB ���� ��ȸ�ؾ� �Ѵ�.
        // �����Ѵٸ� ĳ�� �� �� �Լ��� �ٽ� ȣ��ȴ�.
		AddGameAdoJob(
			db::DbActionPtr(
			new db::GetinfofromChaDb(
			0, 
			0, 
			TargetCharName, 
			charnamechache::REQUEST_SERVER_REQFIREND, 
			ReqCharName.c_str() )));
		/*
        AddGameAdoJob(
            db::DbActionPtr(
                new db::GetChaDbNum(
                    0, 
                    0, 
                    TargetCharName, 
                    charnamechache::REQUEST_SERVER_REQFIREND, 
                    ReqCharName.c_str() )));*/

    }
}

void GLAgentServer::SetClubMasterMandate( bool bBool )
{
	m_bClubMasterMandate = bBool;
}

bool GLAgentServer::IsClubMasterMandate()
{
	return m_bClubMasterMandate;
}

void GLAgentServer::SetFreePkGMCommand( bool bBool )
{
	m_pFreePkGMCommand = bBool;
}

bool GLAgentServer::IsFreePkGmCommand()
{
	return m_pFreePkGMCommand;
}

void GLAgentServer::SetFreePkMode( bool bBool)
{
	GLCONST_CHAR::bSCHOOL_FREE_PK = bBool;
}

void GLAgentServer::SENDCLUBLOG(DWORD ClubDbNum, club::EM_LOG_TYPE LogType, const std::string& LogMsg)
{
    if (!m_pMsgServer)
        return;

    NET_CLUB_LOG SendData;
    SendData.m_ClubDbNum = ClubDbNum;
    SendData.m_Type      = static_cast<BYTE> (LogType);
    SendData.m_LogMsg    = LogMsg;

    msgpack::sbuffer SendBuffer;
    msgpack::pack(SendBuffer, SendData);
    
    m_pMsgServer->SendCache(NET_MSG_CLUB_LOG, SendBuffer);
}

void GLAgentServer::TxtLogToDb()
{
    if (m_pItemLimit)
        m_pItemLimit->TxtLogToDB();
}

void GLAgentServer::ChaNameDbNumAdd(const std::string& ChaName, DWORD ChaDbNum, DWORD UserDbNum, EMUSERTYPE UserType)
{
    m_pCharMan->ChaNameDbNumAdd(ChaName, ChaDbNum, UserDbNum, UserType);
}

void GLAgentServer::ChaNameDbNumAdd(const std::string& ChaName, DWORD ChaDbNum, DWORD UserDbNum, EMUSERTYPE UserType,int iClass, int iLv)
{
	m_pCharMan->ChaNameDbNumAdd(ChaName, ChaDbNum, UserDbNum, UserType, iClass, iLv);
}

DWORD GLAgentServer::GetChaDbNumByChaName(const std::string& ChaName)
{
    return m_pCharMan->GetChaDbNumByChaName(ChaName);
}

std::string GLAgentServer::GetChaNameByDbNum(DWORD ChaDbNum)
{
    return m_pCharMan->GetChaNameByDbNum(ChaDbNum);
}

std::tr1::shared_ptr<CHAR_BASE_CACHE_DATA> GLAgentServer::GetCharCacheData(const std::string& ChaName)
{
    return m_pCharMan->GetCharCacheData(ChaName);
}

std::tr1::shared_ptr<CHAR_BASE_CACHE_DATA> GLAgentServer::GetCharCacheData(DWORD ChaDbNum)
{
    return m_pCharMan->GetCharCacheData(ChaDbNum);
}

void GLAgentServer::registTimerEvent(const callbackTimerFunction& _functionCallbackTimer, Timer::Parameter& _parameter, const float _fTimeInterval)
{
	GLAgentServer::AGENT_CHAR_DATA& _mapCharacter(m_CharData);
	for ( AGENT_CHAR_DATA_ITER _iteratorCharacter(_mapCharacter.begin()); _iteratorCharacter != _mapCharacter.end(); ++_iteratorCharacter )
	{
		GLCharAG* _pCharacter(_iteratorCharacter->second);
		if ( _pCharacter == NULL )
			continue;

		_pCharacter->registTimerEvent(_functionCallbackTimer, _parameter, _fTimeInterval);
	}
}
void GLAgentServer::registTimerEvent(const unsigned int _dbNum, const callbackTimerFunction& _functionCallbackTimer, Timer::Parameter& _parameter, const float _fTimeInterval)
{
	const unsigned int _gaeaID(m_pCharMan->GetGaeaIdByChaDbNum(_dbNum));
	if ( _gaeaID == GAEAID_NULL )
		return;

	GLCharAG* const _pCharacter(GLAgentServer::GetChar(_gaeaID));
	if ( _pCharacter == NULL )
		return;

	_parameter.valueInteger2 = _dbNum;
	_pCharacter->registTimerEvent(_functionCallbackTimer, _parameter, _fTimeInterval);
}


void GLAgentServer::SynchronizeUseFeatures ( DWORD dwClientID )
{
	GLMSG::SNET_SYNC_USE_FEATURES_AC sMsg;
	
	for ( int i=0; i<GLUseFeatures::EMUSE_FEATURE_SIZE; ++i )
		sMsg.bUseFeatures[ i ] = GLUseFeatures::GetInstance().IsUsingUseFeature( i );

	SENDTOCLIENT( dwClientID, &sMsg );
}

void GLAgentServer::SynchronizeUseFeaturesJoinWorldBattle ( DWORD dwClientID )
{
	GLMSG::SNET_SYNC_USE_FEATURES_JOINWORLDBATTLE_AC sMsg;
	
	sMsg.emUserFeatures = GLUseFeatures::EMUSE_FEATURE_JOINWORLDBATTLE;
	sMsg.bUseFeatures = GLUseFeatures::GetInstance().IsUsingUseFeature( GLUseFeatures::EMUSE_FEATURE_JOINWORLDBATTLE );

	SENDTOCLIENT( dwClientID, &sMsg );
}

void GLAgentServer::MatchingSystemSyncState ( const DWORD dwClientID, const DWORD dwChaNum )
{
	if ( !GLUseFeatures::GetInstance().IsUsingTournament() )
		return;

	MatchingSystem::CMatchingJoinManager::Instance()->SyncState( dwClientID, dwChaNum );
}

void GLAgentServer::InsertErrorItem( sc::MGUID& guid, int CallType )
{
	// ��� �׼� ���� ȣ������.
	__time64_t Date = CTime::GetCurrentTime().GetTime();

	AddGameAdoJob(
		db::DbActionPtr( 
		new db::ItemInsertError( guid, CallType, Date ) ) );
}

void GLAgentServer::UpdateItemInvenType( DWORD Owner, const SITEMCUSTOM& sItemCustom, INVEN_TYPE InvenType, WORD PosX, WORD PosY, DWORD Channel /*= 0*/ )
{
	// db action ���� �ʿ�
	// guid, ����� �κ�Ÿ��, ��ǥ �ʿ��ϴ�.
	// sItemCustom �� �κ�Ÿ��enum INVEN_TYPE ����
	// ������ ���� ���� �������, ���� ��ġ�� ����Ǵ� ��쿡 ���ȴ�. ���� ��� â���� �ִ� �������� �κ��丮�� �̵��� ���
	// ����â���� �κ��丮�� �̵��� ���, �κ��丮���� �κ��丮�� �̵��� ����
	// ��񿡼� ���� ��ġ��, ��ǥ���� �����Ѵ�. ������ �����׸� ��ü ������Ʈ ����� ���̱� ���� �뵵�ϴ�.
	// ����Ǵ� ������ġ�� â����� ä���̶� ��ǥ�� ó���� �ʿ��ϴ�.
	// Target ���� �ؾ��ϴ��� �ٽ� �����ؾ� �Ѵ�. ���� ���
	// �κ��̳� �̷��� ĳ���͹�ȣ, ������Ŀ�� ������ȣ�̴�.

	AddGameAdoJob(
		db::DbActionPtr( 
		new db::ItemUpdatePos( Owner, InvenType, sItemCustom.GetGuid(), PosX, PosY, 9079, Channel ) ) );
}

BOOL GLAgentServer::PostSendSystemMail( 
									   DWORD dwRecverDbNum, 
									   std::string& strRecverName, 
									   SITEMCUSTOM& sItem, 
									   LONGLONG llAttachedMoney, 
									   UINT iDesign, 
									   UINT nSenderSystem, 
									   std::string &strSenderName, 
									   std::string &strTitle, 
									   std::string &strContent, 
									   bool bAttachMoneyLimit /*= true*/ )
{
	if ( sItem.IS_GUID_NULL() )
	{
		sc::writeLogError( std::string( "PostSendSystemMail(): sItem.IS_GUID_NULL()" ) );
		return FALSE;
	}

	SPOSTINFO PostInfo;
	ZeroMemory( &PostInfo, sizeof( SPOSTINFO ) );

	PostInfo.byPostState	= EMPOST_UNREAD;

	const DWORD dwAttachedItemID = sItem.GetNativeID().dwID;
	if ( dwAttachedItemID != SNATIVEID( false ).dwID )
	{
		PostInfo.bAttach01 = TRUE;

		if ( llAttachedMoney > 0 )
		{
			PostInfo.byPostType = EMPOST_MONEYITEM;
		}
		else
		{
			PostInfo.byPostType		= EMPOST_ITEM;
		}
	}
	else
	{
		if ( llAttachedMoney > 0 )
		{
			PostInfo.byPostType = EMPOST_MONEY;
		}
		else
		{
			PostInfo.byPostType = EMPOST_TEXT;
		}
	}

	PostInfo.byPostClass = EMPOST_SYSTEM;
	PostInfo.iSender = nSenderSystem;
	PostInfo.iRecver = dwRecverDbNum;

	StringCchCopy( PostInfo.RecverName, sizeof( PostInfo.RecverName ), strRecverName.c_str() );
	StringCchCopy( PostInfo.SenderName, sizeof( PostInfo.SenderName ), strSenderName.c_str() );

	PostInfo.iDesign = iDesign;
	PostInfo.llCharge = 0;
	StringCchCopy( PostInfo.Title, sizeof( PostInfo.Title ), strTitle.c_str() );
	StringCchCopy( PostInfo.Content, sizeof( PostInfo.Content ), strContent.c_str() );
	PostInfo.llAttachMoney = llAttachedMoney;
	PostInfo.idAttach01 = dwAttachedItemID;

	if ( PostInfo.Title[0] == NULL || PostInfo.Content[0] == NULL )
	{
		sc::writeLogError( std::string( "PostSendSystemMail(): Title or Content is empty" ) );
		return FALSE;
	}

	if ( PostInfo.bAttach01 )
	{
		const SITEM* pITEM = GLogicData::GetInstance().GetItem( PostInfo.idAttach01 );
		if ( !pITEM )
		{
			sc::writeLogError( sc::string::format( 
				"PostSendSystemMail(): AttachedItemID(%1%, %2%) is wrong.", 
				PostInfo.idAttach01.wMainID, PostInfo.idAttach01.wSubID ) );
			PostInfo.bAttach01 = FALSE;
		}
		else
			PostInfo.bAttach01 = TRUE;
	}

	if ( PostInfo.llCharge > 0 )
	{
		sc::writeLogError( std::string( "PostSendSystemMail(): llCharge > 0. System mail cannot charge." ) );
		return FALSE;
	}
	else if ( PostInfo.llCharge < 0 )
	{
		sc::writeLogError( std::string( "PostSendSystemMail(): llCharge < 0." ) );
		return FALSE;
	}

	if ( PostInfo.llAttachMoney >= 0 )
	{
		if ( true == bAttachMoneyLimit && PostInfo.llAttachMoney > 0 && ( PostInfo.llAttachMoney > GLCONST_POST::llPOST_MAX_ATTACH_MONEY ) )
		{
			sc::writeLogError( std::string( "PostSendSystemMail(): AttachedMoney exceeds the limitation." ) );
			return FALSE;
		}
	}
	else if ( PostInfo.llAttachMoney < 0 )
	{
		sc::writeLogError( std::string( "PostSendSystemMail(): AttachedMoney is less than 0." ) );
		return FALSE;
	}

	AddGameAdoJob( db::DbActionPtr( new CPostSendSystemMailAgent( PostInfo, sItem ) ) );

	return TRUE;
}

BOOL GLAgentServer::MsgJackpotNotify( NET_MSG_GENERIC* nmg, DWORD dwClientID, DWORD dwGaeaID )
{
	SENDTOALLCLIENT( nmg );
	return TRUE;
}

BOOL GLAgentServer::MsgJackpotOption( NET_MSG_GENERIC* nmg, DWORD dwClientID, DWORD dwGaeaID )
{
	GLMSG::NET_JACKPOT_OPTION* pNetMsg = ( GLMSG::NET_JACKPOT_OPTION* ) nmg;

	GLCharAG* pChar = GetChar( dwGaeaID );
	if ( !pChar )
	{
		return FALSE;
	}

	if ( pChar->m_dwUserLvl < USER_MASTER )
	{
		return FALSE;
	}

	if ( !m_pJackpot )
	{
		return FALSE;
	}

	switch ( pNetMsg->Case )
	{
	case 0:
		{
			m_pJackpot->SetUse( false );
		}
		break;
	case 1:
		{
			m_pJackpot->SetUse( true );
		}
		break;
	case 2:
		{
			m_pJackpot->DeleteUserDefinedJackpot();
		}
		break;
	case 3:
		{
			const SITEM* pITEM = GLogicData::GetInstance().GetItem( pNetMsg->ItemID );
			if ( !pITEM )
			{
				return FALSE;
			}

			// pNetMsg->DelaySeconds ���� �ʿ�

			JACKPOT Jackpot;
			Jackpot.DelaySeconds = pNetMsg->DelaySeconds;
			Jackpot.RequiredLevel = pNetMsg->RequiredLevel;
			Jackpot.ItemID = pNetMsg->ItemID;
			Jackpot.GameMoney = pNetMsg->GameMoney;
			Jackpot.bMain = pNetMsg->bMain;

			m_pJackpot->AddUserDefinedJackpot( Jackpot );
		}
		break;
	}

	return TRUE;
}

void GLAgentServer::InsertAutoJoinClub( int ClubNum )
{
	m_AutoJoinClub.push_back( ClubNum );
}

bool GLAgentServer::IsAutoJoinClub( int ClubNum )
{
	std::vector< int >::iterator AutoJoinClubIter = std::find( m_AutoJoinClub.begin(), m_AutoJoinClub.end(), ClubNum );
	if ( AutoJoinClubIter != m_AutoJoinClub.end() )
		return true;
	else
		return false;
}