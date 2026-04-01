#include "../../pch.h"
#include "../../../SigmaCore/gassert.h"
#include "../../../SigmaCore/Log/LogMan.h"
#include "../../../SigmaCore/String/StringFormat.h"
#include "../../../SigmaCore/Math/SeqUniqueGuid.h"
#include "../../../RanLogic/Msg/GLContrlBaseMsg.h"
#include "../../../RanLogic/Msg/GLContrlCharJoinMsg.h"
#include "../../Msg/AgentMsg.h"

#include "./ADOManager.h"

// ----------------------------------------------------------------------------
#include "../../../SigmaCore/DebugInclude.h"
// ----------------------------------------------------------------------------

namespace db
{
	//mjeon.ado
	// method 이름이 ...ExtraWithAdo 로 끝나는 함수들은 ODBC에 대한 DbAction 내에서 추가적인 처리부분을 ADO로 수행하기 위한
	//  것이다. 즉, 기존에 ODBC로 구현되어 있는 DbAction에 추가적인 기능/로직을 ADO로 구현하고자 할 때 호출되는 것들이다.
	

//! DB 캐릭터 상태 Online
int AdoManager::SetCharacterOnline(int nChaNum)							
{
    if (nChaNum < 0)
        return NET_ERROR;

    sc::db::AdoExt Ado(m_GameDBConnString);
    APPEND_RPARAM_INT(Ado);

    APPEND_IPARAM_INT(Ado, "@nChaNum", nChaNum);
    APPEND_IPARAM_INT(Ado, "@nChaOnline", 1);

    return ExecuteStoredProcedure("dbo.UpdateChaOnline", Ado);
}

int AdoManager::SetCharacterOffline(int nChaNum)						
{
    if (nChaNum < 0)
        return NET_ERROR;

    sc::db::AdoExt Ado(m_GameDBConnString);
    APPEND_RPARAM_INT(Ado);

    APPEND_IPARAM_INT(Ado, "@nChaNum", nChaNum);
    APPEND_IPARAM_INT(Ado, "@nChaOnline", 0);

    return ExecuteStoredProcedure("dbo.UpdateChaOnline", Ado);
}

//mjeon.ado
int AdoManager::SaveCharacterExtraWithAdo(LPVOID pvBuffer)
{
	if (!pvBuffer)
	{
		sc::writeLogError(std::string("AdoManager::SaveCharacterExtraWithAdo() - pvBuffer is NULL."));
        return sc::db::DB_ERROR;
	}

	SCHARDATA2* pCharData2 = reinterpret_cast<SCHARDATA2*>(pvBuffer);

	if(!pCharData2)
	{
		sc::writeLogError(std::string("AdoManager::SaveCharacterExtraWithAdo() - pCharData2 is NULL."));
		return sc::db::DB_ERROR;
	}

	UINT nChaNum = pCharData2->m_CharDbNum;	
	
	if (nChaNum == 0 || pCharData2->m_wLevel == 0)	// 해킹한 캐릭터의 경우 레벨이 0 으로 세팅될 가능성이 많다.
	{
		sc::writeLogError(sc::string::format("AdoManager::SaveCharacterExtraWithAdo() - Wrong Character! (ChaNum:%1%, Level:%2%).", nChaNum, pCharData2->m_wLevel));
		return sc::db::DB_ERROR;
	}

	//
	// LearnProductBook
	//
	//return SaveProductBook(nChaNum, pCharData2->m_setLearnProductBook);
	return S_OK;
}


// int AdoManager::SaveProductBook(UINT nChaNum, ProductBookContainer& setLearnProductBook)
// {	
// 	BOOST_FOREACH( DWORD nProductBook, setLearnProductBook )
// 	{
// 		sc::db::AdoExt ado(m_GameDBConnString);
// 
// 		APPEND_IPARAM_INT(ado, "@ChaNum", nChaNum);
// 		APPEND_IPARAM_INT(ado, "@BookID", nProductBook);
// 
// 		if (ExecuteStoredProcedure("dbo.sp_ProductBookSave", ado) != sc::db::DB_OK)
// 		{
// 			sc::writeLogError(std::string("AdoManager::SaveProductBook() - ExecuteStoredProcedure failure."));
// 
// 			return sc::db::DB_ERROR;
// 		}
// 	}
// 
// 	return sc::db::DB_OK;
// }

// int AdoManager::LoadProductBook(UINT nChaNum, ProductBookContainer& setLearnProductBook)
// {
// 	sc::db::AdoExt ado(m_GameDBConnString);
// 
// 	APPEND_IPARAM_INT(ado, "@ChaNum",	nChaNum);
// 
// 	if (ExecuteStoredProcedure("dbo.sp_ProductBookLoad", ado) != sc::db::DB_OK)
// 	{
// 		sc::writeLogError(std::string("AdoManager::LoadProductBook() - ExecuteStoredProcedure failure."));
// 
// 		return sc::db::DB_ERROR;
// 	}
// 
// 	BEGIN_GETCOLLECT(ado);
// 
// 	DWORD nProductBook = 0;
// 	ado.GetCollect("BookID", nProductBook);
// 
// 	setLearnProductBook.insert( nProductBook );
// 	
// 	END_GETCOLLECT(ado);
// 
// 
// 	return sc::db::DB_OK;
// }

int AdoManager::SetChaStorageDate(int nUserNum, int nStorageNum, __time64_t tTime)
{
    if (nStorageNum <= 0 || nStorageNum >= EMSTORAGE_CHANNEL - 1)
        return sc::db::DB_ERROR;

    CTime cTemp(tTime);
    CString strTime = cTemp.Format("%Y-%m-%d %H:%M:%S");

    int Return = sc::db::DB_ERROR;;
    
    switch (nStorageNum)
    {
    case 1:
        {
            sc::db::AdoExt AdoGame(m_GameDBConnString);
            APPEND_IPARAM_INT    (AdoGame, "@UserNum", nUserNum);
            APPEND_IPARAM_VARCHAR(AdoGame, "@ChaStorage", strTime.GetString(), strTime.GetLength());
            if (AdoGame.ExecuteStoredProcedure("dbo.UserInvenStorageUpdate2"))
                Return = sc::db::DB_OK;
        }
        break;
    case 2:
        {
            sc::db::AdoExt AdoGame(m_GameDBConnString);
            APPEND_IPARAM_INT    (AdoGame, "@UserNum", nUserNum);
            APPEND_IPARAM_VARCHAR(AdoGame, "@ChaStorage", strTime.GetString(), strTime.GetLength());
            if (AdoGame.ExecuteStoredProcedure("dbo.UserInvenStorageUpdate3"))
                Return = sc::db::DB_OK;
        }        
        break;
    case 3:
        {
            sc::db::AdoExt AdoGame(m_GameDBConnString);
            APPEND_IPARAM_INT    (AdoGame, "@UserNum", nUserNum);
            APPEND_IPARAM_VARCHAR(AdoGame, "@ChaStorage", strTime.GetString(), strTime.GetLength());
            if (AdoGame.ExecuteStoredProcedure("dbo.UserInvenStorageUpdate4"))
                Return = sc::db::DB_OK;
        }        
        break;
    default:
        Return = sc::db::DB_ERROR;
        break;
    }

    return Return;
}

int AdoManager::SetChaInvenNum(int nChaNum, WORD wInvenLine)
{
    if( nChaNum <= 0 )
        return sc::db::DB_ERROR;

    if (wInvenLine <= 0 || wInvenLine > GLCONST_CHAR::wInvenExtendLine)
        return sc::db::DB_ERROR;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_INT(AdoGame, "@ChaNum", nChaNum);
    APPEND_IPARAM_INT(AdoGame, "@ChaInvenLine", wInvenLine);
    if (AdoGame.ExecuteStoredProcedure("dbo.ChaInfoChaInvenLineUpdate"))
        return sc::db::DB_OK;
    else
        return sc::db::DB_ERROR;    
}

int AdoManager::SetChaExp(int nChaNum, LONGLONG llExp)
{
    if (nChaNum < 1 || llExp < 0)
        return sc::db::DB_ERROR;
    
    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    llExp = sc::db::AdjustMoney(llExp);
    APPEND_IPARAM_MONEY(AdoGame, "@llExp", llExp);
    APPEND_IPARAM_INT  (AdoGame, "@nChaNum", nChaNum);

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

	int nResult = 0;
	switch ( m_ServiceProvider )
	{
	case SP_HONGKONG:
		nResult = ExecuteStoredProcedureIntReturn("dbo.UpdateChaExp_3B2C75D1D26646AB9B3E561A3F6CD095", AdoGame, "@nReturn");
		break;
	default:
		nResult = ExecuteStoredProcedureIntReturn("dbo.UpdateChaExp", AdoGame, "@nReturn");
		break;
	}
	return nResult;
}

LONGLONG AdoManager::GetChaExp(int nChaNum)
{
    if (nChaNum < 1)
        return sc::db::DB_ERROR;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_INT(AdoGame, "@nChaNum", nChaNum);
    if (!AdoGame.Execute4Cmd("dbo.ChaInfoChaExpSelect"))
        return sc::db::DB_ERROR;

    if (AdoGame.GetEOF())
        return sc::db::DB_ERROR;
    
    LONGLONG llChaExp = 0;
    do
    {
        AdoGame.GetCollect("ChaExp", llChaExp);
    } while (AdoGame.Next());
    
    return llChaExp;
}

int AdoManager::RenameCharacter(DWORD dwChaNum, char* szCharName)
{
    if (!szCharName)
        return sc::db::DB_ERROR;

    SQLRETURN sReturn = 0;

    std::string strName(szCharName);
    sc::string::trim(strName, " ");
    sc::string::trim(strName, "'");
    
    // 캐릭터 이름이 허용된 길이를 넘는지 조사한다.
    if (strName.length() >= (CHR_ID_LENGTH-1))
    {
        sc::writeLogError(
            sc::string::format(
                "AdoManager::RenameCharacter %1% >= %2%",
                strName.length(),
                (CHR_ID_LENGTH-1)));
        return sc::db::DB_ERROR;
    }

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    APPEND_IPARAM_INT    (AdoGame, "@nChaNum", dwChaNum);
    APPEND_IPARAM_VARCHAR(AdoGame, "@szChaName", strName.c_str(), strName.length());

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

    return ExecuteStoredProcedureIntReturn("dbo.RenameCharacter", AdoGame, "@nReturn");
}

int AdoManager::SetChaHairColor(DWORD dwChaNum, int nHairColor)
{
    if (nHairColor < 0)
        return sc::db::DB_ERROR;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    APPEND_IPARAM_INT(AdoGame, "@nChaNum", dwChaNum);
    APPEND_IPARAM_INT(AdoGame, "@nChaHairColor", nHairColor);    

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

    return ExecuteStoredProcedureIntReturn("dbo.UpdateChaHairColor", AdoGame, "@nReturn");
}

int AdoManager::SetChaHairStyle(DWORD dwChaNum, int nHairStyle)
{
    if (nHairStyle < 0)
        return sc::db::DB_ERROR;
  
    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    APPEND_IPARAM_INT(AdoGame, "@nChaNum", dwChaNum);
    APPEND_IPARAM_INT(AdoGame, "@nChaHairStyle", nHairStyle);

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

    return ExecuteStoredProcedureIntReturn("dbo.UpdateChaHairStyle", AdoGame, "@nReturn");
}

int AdoManager::SetChaFaceStyle(DWORD dwChaNum, int nFaceStyle)
{
    if (nFaceStyle < 0)
        return sc::db::DB_ERROR;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    APPEND_IPARAM_INT(AdoGame, "@ChaNum", dwChaNum);
    APPEND_IPARAM_INT(AdoGame, "@ChaFaceStyle", nFaceStyle);

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

    return ExecuteStoredProcedureIntReturn("dbo.UpdateChaFaceStyle", AdoGame, "@nReturn");
}

int AdoManager::SetChaGenderChange(DWORD dwChaNum, int nClass, int nSex, int nFace, int nHair, int nHairColor)
{
    if (dwChaNum <= 0 || nClass <= 0 || nHairColor < 0)
    {
        sc::writeLogError("COdbcManager::SetChaGenderChange dwChaNum <= 0 || nClass <= 0 || nHairColor < 0");
        return sc::db::DB_ERROR;
    }

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    APPEND_IPARAM_INT(AdoGame, "@nChaNum", dwChaNum);
    APPEND_IPARAM_INT(AdoGame, "@nChaClass", nClass);
    APPEND_IPARAM_INT(AdoGame, "@nChaSex", nSex);
    APPEND_IPARAM_INT(AdoGame, "@nFace", nFace);
    APPEND_IPARAM_INT(AdoGame, "@nChaHair", nHair);
    APPEND_IPARAM_INT(AdoGame, "@nChaHairColor", nHairColor);

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

    return ExecuteStoredProcedureIntReturn("dbo.sp_UpdateChaGender", AdoGame, "@nReturn");
}

int AdoManager::SetChaSchoolChange(DWORD dwChaNum, int nSchool)
{
    if (nSchool < 0 || nSchool > 2)
    {
        sc::writeLogError("AdoManager::SetChaSchoolChange nSchool < 0 || nSchool > 2");
        return sc::db::DB_ERROR;
    }

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    APPEND_IPARAM_INT(AdoGame, "@nChaNum", dwChaNum);
    APPEND_IPARAM_INT(AdoGame, "@nChaSchool", nSchool);

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

	int nRet = ExecuteStoredProcedureIntReturn("dbo.sp_UpdateChaSchool", AdoGame, "@nReturn");

    return nRet;
}

int AdoManager::SetChaPhoneNumber(int nChaNum, const TCHAR* szPhoneNumber)
{
    if (nChaNum < 0 || szPhoneNumber == NULL)
        return sc::db::DB_ERROR;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    APPEND_IPARAM_INT    (AdoGame, "@nChaNum", nChaNum);
    APPEND_IPARAM_VARCHAR(AdoGame, "@szChaPhone", szPhoneNumber, strlen(szPhoneNumber));

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

    return ExecuteStoredProcedureIntReturn("dbo.UpdateChaFriendSms", AdoGame, "@nReturn");
}

int AdoManager::SetAllCharacterOffline()
{
    sc::db::AdoExt AdoGame(m_GameDBConnString);
    if (AdoGame.ExecuteStoredProcedure("dbo.UpdateAllCharacterOffline"))
        return sc::db::DB_OK;
    else
        return sc::db::DB_ERROR;
}

int AdoManager::GetinfofromCharDb(const char *szCharName, int *pnChaNum, int *pnUserNum, int *pClass, int *Lv)
{	
	if (!szCharName)
		return sc::db::DB_ERROR;

	std::string ChaName(szCharName);

	sc::db::AdoExt AdoGame(m_GameDBConnString);
	APPEND_IPARAM_VARCHAR(AdoGame, "@ChaName", ChaName.c_str(), ChaName.length());

	if (!AdoGame.ExecuteStoredProcedure("dbo.ChaInfoChaNumUserNumSelectII"))
		return sc::db::DB_ERROR;

	if (AdoGame.GetEOF())
		return sc::db::DB_ERROR;

	do
	{
		int nChaNum = 0;
		int nUserNum = 0;
		int nClass = 0;
		int nLv = 0;

		AdoGame.GetCollect("ChaNum", nChaNum);
		AdoGame.GetCollect("UserNum", nUserNum);
		AdoGame.GetCollect("ChaClass", nClass);
		AdoGame.GetCollect("ChaLevel", nLv);

		if (nChaNum >= 0)
			*pnChaNum = nChaNum;
		else
			return sc::db::DB_ERROR;

		if (nUserNum >= 0)
			*pnUserNum = nUserNum;
		else
			return sc::db::DB_ERROR;
		
		if (nClass >= 0)
			*pClass = nClass;
		else
			return sc::db::DB_ERROR;

		if (nLv >= 0)
			*Lv = nLv;
		else
			return sc::db::DB_ERROR;

	} while (AdoGame.Next());

	return sc::db::DB_OK;
}

int AdoManager::GetChaNum(const char *szCharName, int *pnChaNum, int *pnUserNum)
{
    if (!szCharName)
        return sc::db::DB_ERROR;

    std::string ChaName(szCharName);
    
    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_VARCHAR(AdoGame, "@ChaName", ChaName.c_str(), ChaName.length());

    if (!AdoGame.ExecuteStoredProcedure("dbo.ChaInfoChaNumUserNumSelect"))
        return sc::db::DB_ERROR;

    if (AdoGame.GetEOF())
        return sc::db::DB_ERROR;

    do
    {
        int nChaNum = 0;
        int nUserNum = 0;

        AdoGame.GetCollect("ChaNum", nChaNum);
        AdoGame.GetCollect("UserNum", nUserNum);

        if (nChaNum >= 0)
            *pnChaNum = nChaNum;
        else
            return sc::db::DB_ERROR;

        if (nUserNum >= 0)
            *pnUserNum = nUserNum;
        else
            return sc::db::DB_ERROR;
    } while (AdoGame.Next());

    return sc::db::DB_OK;
}


//! 실제 캐릭터 삭제 함수
//! -2 : 길드마스터 길드삭제가 필요하다
//! -1 : db error
//!  0 : 삭제성공
//!  1 : 극강부 남자 삭제
//!  2 : 극강부 여자 삭제
int AdoManager::DeleteCharacter(int nUsrNum, int nChaNum)
{
    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    APPEND_IPARAM_INT(AdoGame, "@ChaNum", nChaNum);

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

    return ExecuteStoredProcedureIntReturn("dbo.sp_delete_character", AdoGame, "@nReturn");
}

//! 캐릭터 삭제
int AdoManager::DelCharacter(int nUsrNum, int nChaNum, const char* szPass2)
{
	// 2차비번 삭제
    if (m_ServiceProvider == SP_HONGKONG )
    {
        if (!szPass2)
            return sc::db::DB_ERROR;

        std::string Pass2(szPass2);

        sc::db::AdoExt AdoUser(m_UserDBConnString);
        APPEND_RPARAM_INT(AdoUser);

        APPEND_IPARAM_INT(AdoUser, "@nUserNum", nUsrNum);
        APPEND_IPARAM_VARCHAR(AdoUser, "@nUserPass", Pass2.c_str(), Pass2.length());

        APPEND_OPARAM_INT(AdoUser, "@nReturn");

        if (ExecuteStoredProcedureIntReturn("dbo.sp_UserCheckPass", AdoUser, "@nReturn") == 0)
            return DeleteCharacter(nUsrNum, nChaNum);
        else 
            return sc::db::DB_ERROR;
    }
    else
    {        
        if (!szPass2)
            return sc::db::DB_ERROR;

        std::string Pass2(szPass2);

        sc::db::AdoExt AdoUser(m_UserDBConnString);
        APPEND_IPARAM_INT    (AdoUser, "@UserNum", nUsrNum);
        APPEND_IPARAM_VARCHAR(AdoUser, "@UserPass2", Pass2.c_str(), Pass2.length());

        if (!AdoUser.ExecuteStoredProcedure("dbo.UserInfoPass2Check"))
            return sc::db::DB_ERROR;

        if (AdoUser.GetEOF())
            return sc::db::DB_ERROR;
        
        return DeleteCharacter(nUsrNum, nChaNum);
    }
}

//! 캐릭터 삭제
int AdoManager::DaumDelCharacter(int nUsrNum, int nChaNum, const char* szPass2)				
{
    if (!szPass2)
        return sc::db::DB_ERROR;

    std::string Pass2(szPass2);

	// 2차비번을 사용하지 않는경우 문제가 발생됨
	// KRT에서만 발생되는 예외상황에서 처리하기 위해서 추가
	if( Pass2.empty() == true || Pass2 == "" )
	{
		sc::writeLogInfo(sc::string::format(" KR Del Char When 2ndPass OFF : nUsrNum %1%, nChaNum %2%", nUsrNum, nChaNum ));
		return DeleteCharacter(nUsrNum, nChaNum);
	}

    sc::db::AdoExt AdoUser(m_UserDBConnString);
    APPEND_RPARAM_INT(AdoUser);

    APPEND_IPARAM_INT(AdoUser, "@nUserNum", nUsrNum);
    APPEND_IPARAM_VARCHAR(AdoUser, "@nUserPass", Pass2.c_str(), Pass2.length());

    APPEND_OPARAM_INT(AdoUser, "@nReturn");

    if (ExecuteStoredProcedureIntReturn("dbo.sp_UserCheckPass", AdoUser, "@nReturn") == 0)
        return DeleteCharacter(nUsrNum, nChaNum);
    else 
        return sc::db::DB_ERROR;
    //return DeleteCharacter(nUsrNum, nChaNum);
}

int AdoManager::IdnDelCharacter(int nUsrNum, int nChaNum)				
{
    return DeleteCharacter(nUsrNum, nChaNum);
}

int AdoManager::GspDelCharacter(int nUsrNum, int nChaNum)				
{
    return DeleteCharacter(nUsrNum, nChaNum);
}

int AdoManager::TerraDelCharacter(int nUsrNum, int nChaNum)				
{
    return DeleteCharacter(nUsrNum, nChaNum);
}

int AdoManager::ExciteDelCharacter(int nUsrNum, int nChaNum)			
{
    return DeleteCharacter(nUsrNum, nChaNum);
}

int AdoManager::JapanDelCharacter(int nUsrNum, int nChaNum)				
{
    return DeleteCharacter(nUsrNum, nChaNum);
}

// GS, GM, US 가 같이 사용
int AdoManager::GsDelCharacter(int nUsrNum, int nChaNum, const char* szPass2)				
{
	if (!szPass2 && m_ServiceProvider == SP_GS )
        return sc::db::DB_ERROR;

	// GS에서 szPass2가 NULL 인경우는 위에서 예외처리했으므로 NULL이면 GM이나 US이다
	if( szPass2 != NULL && m_ServiceProvider == SP_GS )
	{
		std::string Pass2(szPass2);

		// 2차비번을 사용하지 않는경우 문제가 발생됨
		// KRT에서만 발생되는 예외상황에서 처리하기 위해서 추가
		if( Pass2.empty() == true || Pass2 == "" )
		{
			sc::writeLogError(sc::string::format(" GS Del Char When 2ndPass OFF : nUsrNum %1%, nChaNum %2%", nUsrNum, nChaNum ));
			return DeleteCharacter(nUsrNum, nChaNum);
		}

		sc::db::AdoExt AdoUser(m_UserDBConnString);
		APPEND_RPARAM_INT(AdoUser);

		APPEND_IPARAM_INT(AdoUser, "@nUserNum", nUsrNum);
		APPEND_IPARAM_VARCHAR(AdoUser, "@nUserPass", Pass2.c_str(), Pass2.length());

		APPEND_OPARAM_INT(AdoUser, "@nReturn");

		if (ExecuteStoredProcedureIntReturn("dbo.sp_UserCheckPass", AdoUser, "@nReturn") == 0)
			return DeleteCharacter(nUsrNum, nChaNum);
		else 
			return sc::db::DB_ERROR;
	}
    
	return DeleteCharacter(nUsrNum, nChaNum);
}

// int AdoManager::GetChaBAInfo(int nUsrNum, int nSvrGrp, NET_CHA_BBA_INFO_DH* ncbi)
// {
//     sc::writeLogError("Do not call this function. GetChaBAInfo");
//     return sc::db::DB_ERROR;
// }

int AdoManager::GetChaBAInfo(int UserNum, int SvrGrp, std::vector<int>& vChaNum)
{
    sc::db::AdoExt Ado(m_GameDBConnString);
    APPEND_IPARAM_INT(Ado, "@UserNum", UserNum);
    APPEND_IPARAM_INT(Ado, "@ServerGroup", SvrGrp);
    if (!Ado.Execute4Cmd("dbo.sp_ChaListAgent", adCmdStoredProc))
        return sc::db::DB_ERROR;
    
	if ( Ado.GetEOF() )
	{
		//Ado.PRINT(_T("ADO: There's no data. RecordSet is Empty."));
		return FALSE;
	}

    do
    {
        int ChaNum = 0;
        Ado.GetCollect("ChaNum", ChaNum);
        vChaNum.push_back(ChaNum);
    } while (Ado.Next());

    return sc::db::DB_OK;
}

int AdoManager::GetChaBInfo(int nUserNum, int nChaNum, SCHARINFO_LOBBY* sci)
{
    if (nUserNum <= 0 || nChaNum <= 0)
        return sc::db::DB_ERROR;

    sc::db::AdoExt Ado(m_GameDBConnString);
    APPEND_IPARAM_INT(Ado, "@UserNum", nUserNum);
    APPEND_IPARAM_INT(Ado, "@ChaNum", nChaNum);
	
    if (!Ado.Execute4Cmd("dbo.sp_GetChaLobbyInfo", adCmdStoredProc))	
        return sc::db::DB_ERROR;
    
	if ( Ado.GetEOF() )
	{
		//Ado.PRINT(_T("ADO: There's no data. RecordSet is Empty."));
		return FALSE;
	}

    int nRowCount = 0;
    do
    {
        sci->m_dwCharID = nChaNum;
        std::string ChaName;
        std::vector<BYTE> vBuffer;
        se::ByteStream bytestream;
        int CharClass = 0;
        WORD ChaLock = 0;
        Ado.GetCollect("GuNum",        sci->m_ClubDbNum);
        Ado.GetCollect("ChaName",      ChaName);           sci->SetName(ChaName);
        Ado.GetCollect("ChaClass",     CharClass);         sci->m_emClass = static_cast<EMCHARCLASS> (CharClass);
        Ado.GetCollect("ChaSchool",    sci->m_wSchool);        
        Ado.GetCollect("ChaDex",       sci->m_sStats.wDex);
        Ado.GetCollect("ChaIntel",     sci->m_sStats.wInt);
        Ado.GetCollect("ChaPower",     sci->m_sStats.wPow);
        Ado.GetCollect("ChaStrong",    sci->m_sStats.wStr);
        Ado.GetCollect("ChaSpirit",    sci->m_sStats.wSpi);
        Ado.GetCollect("ChaStrength",  sci->m_sStats.wSta);
        Ado.GetCollect("ChaLevel",     sci->m_wLevel);
        Ado.GetCollect("ChaHair",      sci->m_wHair);
        Ado.GetCollect("ChaFace",      sci->m_wFace);
        Ado.GetCollect("ChaBright",    sci->m_nBright);
        Ado.GetCollect("ChaSex",       sci->m_wSex);
        Ado.GetCollect("ChaHairColor", sci->m_wHairColor);
        Ado.GetCollect("ChaExp",       sci->m_sExperience.lnNow);
        Ado.GetCollect("ChaSaveMap",   sci->m_sSaveMapID.dwID);
		int HpNow = 0;
        Ado.GetCollect("ChaHP",        HpNow);    sci->m_sHP.wNow = static_cast<WORD> (HpNow);
        Ado.GetCollect("ChaLock",      ChaLock);  sci->m_Lock = (ChaLock == 0) ? false : true;
//         Ado.GetChunk("ChaPutOnItems",  vBuffer);
//         
//         // 착용아이템 정보
//         se::ByteStream ByteStream(vBuffer);
//         SETPUTONITEMS_BYBUF(sci->m_PutOnItems, ByteStream);

        nRowCount++;
    } while (Ado.Next());

	// 착용아이템 정보
	std::vector< SINVENITEM_SAVE > vecItems;
	ItemSelect( nChaNum, INVEN_PUTON, vecItems );
	SETPUTONITEMS_VECTOR_NEW( sci->m_PutOnItems, vecItems );
    
    // 반드시 nRowCount 가 1 이어야 한다.
    if (nRowCount != 1)
        return sc::db::DB_ERROR;
    else
        return sc::db::DB_OK;
}

int AdoManager::GetChaBInfoForMigration( int nUserNum, int nChaNum, SCHARINFO_LOBBY* sci )
{
	// 사용하지 않는다.
	/*
    if (nUserNum <= 0 || nChaNum <= 0)
        return sc::db::DB_ERROR;

    sc::db::AdoExt Ado(m_GameDBConnString);
    APPEND_IPARAM_INT(Ado, "@UserNum", nUserNum);
    APPEND_IPARAM_INT(Ado, "@ChaNum", nChaNum);
	
    if (!Ado.Execute4Cmd("dbo.sp_GetChaLobbyInfo", adCmdStoredProc))	
        return sc::db::DB_ERROR;
    
	if ( Ado.GetEOF() )
	{
		//Ado.PRINT(_T("ADO: There's no data. RecordSet is Empty."));
		return FALSE;
	}

    int nRowCount = 0;
    do
    {
        sci->m_dwCharID = nChaNum;
        std::string ChaName;
        std::vector<BYTE> vBuffer;
        se::ByteStream bytestream;
        int CharClass = 0;
        WORD ChaLock = 0;
        Ado.GetCollect("GuNum",        sci->m_ClubDbNum);
        Ado.GetCollect("ChaName",      ChaName);           sci->SetName(ChaName);
        Ado.GetCollect("ChaClass",     CharClass);         sci->m_emClass = static_cast<EMCHARCLASS> (CharClass);
        Ado.GetCollect("ChaSchool",    sci->m_wSchool);        
        Ado.GetCollect("ChaDex",       sci->m_sStats.wDex);
        Ado.GetCollect("ChaIntel",     sci->m_sStats.wInt);
        Ado.GetCollect("ChaPower",     sci->m_sStats.wPow);
        Ado.GetCollect("ChaStrong",    sci->m_sStats.wStr);
        Ado.GetCollect("ChaSpirit",    sci->m_sStats.wSpi);
        Ado.GetCollect("ChaStrength",  sci->m_sStats.wSta);
        Ado.GetCollect("ChaLevel",     sci->m_wLevel);
        Ado.GetCollect("ChaHair",      sci->m_wHair);
        Ado.GetCollect("ChaFace",      sci->m_wFace);
        Ado.GetCollect("ChaBright",    sci->m_nBright);
        Ado.GetCollect("ChaSex",       sci->m_wSex);
        Ado.GetCollect("ChaHairColor", sci->m_wHairColor);
        Ado.GetCollect("ChaExp",       sci->m_sExperience.lnNow);
        Ado.GetCollect("ChaSaveMap",   sci->m_sSaveMapID.dwID);
		int HpNow = 0;
        Ado.GetCollect("ChaHP",        HpNow);    sci->m_sHP.wNow = static_cast<WORD> (HpNow);
        Ado.GetCollect("ChaLock",      ChaLock);  sci->m_Lock = (ChaLock == 0) ? false : true;
        Ado.GetChunk("ChaPutOnItems",  vBuffer);
        
        // 착용아이템 정보
        se::ByteStream ByteStream(vBuffer);
        SETPUTONITEMS_BYBUF_FOR_MIGRATION(sci->m_PutOnItems, ByteStream);

        nRowCount++;
    } while (Ado.Next());
    
    // 반드시 nRowCount 가 1 이어야 한다.
    if (nRowCount != 1)
        return sc::db::DB_ERROR;
    else*/
        return sc::db::DB_OK;
}

int AdoManager::GetChaBInfoAll(int UserDbNum, int ServerGroup, std::vector<SCHARINFO_LOBBY>& vCharInfo)
{
    if (UserDbNum <= 0)
        return sc::db::DB_ERROR;

    sc::db::AdoExt Ado(m_GameDBConnString);
    APPEND_IPARAM_INT(Ado, "@UserNum", UserDbNum);
    APPEND_IPARAM_INT(Ado, "@ServerGroup", ServerGroup);

    if (!Ado.Execute4Cmd("dbo.sp_ChaListAgentAll", adCmdStoredProc))	
        return sc::db::DB_ERROR;
    
	/*
    if (0 == Ado.GetRecordCount())
    {
        sc::writeLogError(
            sc::string::format(
                "GetChaBInfoAll RecordCount 0 User Num %1%",
                UserDbNum));
    }
	*/

	if ( Ado.GetEOF() )
	{
		//Ado.PRINT(_T("ADO: There's no data. RecordSet is Empty."));
		return FALSE;
	}

    do
    {
        SCHARINFO_LOBBY CharInfo;        
        
        std::string ChaName;
        //std::vector<BYTE> vBuffer;
        //se::ByteStream bytestream;
        int CharClass = 0;
        WORD ChaLock = 0;
        int HpNow = 0;
        int ChaNum = 0;

        Ado.GetCollect("GuNum",        CharInfo.m_ClubDbNum);
        Ado.GetCollect("ChaNum",       ChaNum);            CharInfo.m_dwCharID = static_cast<DWORD> (ChaNum);
        Ado.GetCollect("ChaName",      ChaName);           CharInfo.SetName(ChaName);
        Ado.GetCollect("ChaClass",     CharClass);         CharInfo.m_emClass = static_cast<EMCHARCLASS> (CharClass);
        Ado.GetCollect("ChaSchool",    CharInfo.m_wSchool);        
        Ado.GetCollect("ChaDex",       CharInfo.m_sStats.wDex);
        Ado.GetCollect("ChaIntel",     CharInfo.m_sStats.wInt);
        Ado.GetCollect("ChaPower",     CharInfo.m_sStats.wPow);
        Ado.GetCollect("ChaStrong",    CharInfo.m_sStats.wStr);
        Ado.GetCollect("ChaSpirit",    CharInfo.m_sStats.wSpi);
        Ado.GetCollect("ChaStrength",  CharInfo.m_sStats.wSta);
        Ado.GetCollect("ChaLevel",     CharInfo.m_wLevel);
        Ado.GetCollect("ChaHair",      CharInfo.m_wHair);
        Ado.GetCollect("ChaFace",      CharInfo.m_wFace);
        Ado.GetCollect("ChaBright",    CharInfo.m_nBright);
        Ado.GetCollect("ChaSex",       CharInfo.m_wSex);
        Ado.GetCollect("ChaHairColor", CharInfo.m_wHairColor);
        Ado.GetCollect("ChaExp",       CharInfo.m_sExperience.lnNow);
        Ado.GetCollect("ChaSaveMap",   CharInfo.m_sSaveMapID.dwID);
        
        Ado.GetCollect("ChaHP",        HpNow);    CharInfo.m_sHP.wNow = static_cast<WORD> (HpNow);
        Ado.GetCollect("ChaLock",      ChaLock);  CharInfo.m_Lock = (ChaLock == 0) ? false : true;
        //Ado.GetChunk("ChaPutOnItems",  vBuffer);

		// #item
		// 우선 여기만 처리하고, 나중에 필리핀 이전관련 처리 한다.
        // 착용아이템 정보
		{
			std::vector< SINVENITEM_SAVE > vecItems;
			ItemSelect( ChaNum, INVEN_PUTON, vecItems );
			SETPUTONITEMS_VECTOR_NEW( CharInfo.m_PutOnItems, vecItems );
		}

//         se::ByteStream ByteStream(vBuffer);
//         SETPUTONITEMS_BYBUF(CharInfo.m_PutOnItems, ByteStream);

        vCharInfo.push_back(CharInfo);
        
    } while (Ado.Next());

	{
		// 란모바일 계정 연동 여부 설정
		int nMobileChaNum = 0;
		sc::db::AdoExt AdoMobile(m_RanMobileDBConnString);
		APPEND_IPARAM_INT(AdoMobile, "@UserNum", UserDbNum);
		APPEND_IPARAM_INT(AdoMobile, "@ServerGroup", ServerGroup);

		if (!AdoMobile.Execute4Cmd("dbo.sp_GetRMChaInfoForLobby", adCmdStoredProc))	
			return sc::db::DB_ERROR;

		if ( !AdoMobile.GetEOF() )
		{
			do
			{
				AdoMobile.GetCollect("ChaNum", nMobileChaNum);            

				for (size_t i=0; i<vCharInfo.size(); ++i)
				{
					if( vCharInfo[i].m_dwCharID == static_cast<DWORD> (nMobileChaNum) )
					{
						vCharInfo[i].m_bRanMobile = true;
					}
				}
		        
			} while (AdoMobile.Next());
		}
	}

    return sc::db::DB_OK;
}

int AdoManager::GetChaBInfoAllForMigration( int UserDbNum, int ServerGroup, std::vector< SCHARINFO_LOBBY >& vCharInfo )
{
	// 이제 사용하지 않는 함수이다.
	/*
    if ( UserDbNum <= 0 )
        return sc::db::DB_ERROR;

    sc::db::AdoExt Ado( m_GameDBConnString );
    APPEND_IPARAM_INT( Ado, "@UserNum", UserDbNum );
    APPEND_IPARAM_INT( Ado, "@ServerGroup", ServerGroup );

    if ( !Ado.Execute4Cmd( "dbo.sp_ChaListAgentAll", adCmdStoredProc ) )	
        return sc::db::DB_ERROR;
    
	if ( Ado.GetEOF() )
	{
		return FALSE;
	}

    do
    {
        SCHARINFO_LOBBY CharInfo;        
        
        std::string ChaName;
        std::vector< BYTE > vBuffer;
        se::ByteStream bytestream;
        int CharClass = 0;
        WORD ChaLock = 0;
        int HpNow = 0;
        int ChaNum = 0;

        Ado.GetCollect( "GuNum",        CharInfo.m_ClubDbNum );
        Ado.GetCollect( "ChaNum",       ChaNum );            CharInfo.m_dwCharID = static_cast<DWORD> (ChaNum);
        Ado.GetCollect( "ChaName",      ChaName );           CharInfo.SetName(ChaName);
        Ado.GetCollect( "ChaClass",     CharClass );         CharInfo.m_emClass = static_cast<EMCHARCLASS> (CharClass);
        Ado.GetCollect( "ChaSchool",    CharInfo.m_wSchool );        
        Ado.GetCollect( "ChaDex",       CharInfo.m_sStats.wDex );
        Ado.GetCollect( "ChaIntel",     CharInfo.m_sStats.wInt );
        Ado.GetCollect( "ChaPower",     CharInfo.m_sStats.wPow );
        Ado.GetCollect( "ChaStrong",    CharInfo.m_sStats.wStr );
        Ado.GetCollect( "ChaSpirit",    CharInfo.m_sStats.wSpi );
        Ado.GetCollect( "ChaStrength",  CharInfo.m_sStats.wSta );
        Ado.GetCollect( "ChaLevel",     CharInfo.m_wLevel );
        Ado.GetCollect( "ChaHair",      CharInfo.m_wHair );
        Ado.GetCollect( "ChaFace",      CharInfo.m_wFace );
        Ado.GetCollect( "ChaBright",    CharInfo.m_nBright );
        Ado.GetCollect( "ChaSex",       CharInfo.m_wSex );
        Ado.GetCollect( "ChaHairColor", CharInfo.m_wHairColor );
        Ado.GetCollect( "ChaExp",       CharInfo.m_sExperience.lnNow );
        Ado.GetCollect( "ChaSaveMap",   CharInfo.m_sSaveMapID.dwID );
        
        Ado.GetCollect( "ChaHP",        HpNow );    CharInfo.m_sHP.wNow = static_cast<WORD> (HpNow);
        Ado.GetCollect( "ChaLock",      ChaLock );  CharInfo.m_Lock = (ChaLock == 0) ? false : true;
        Ado.GetChunk( "ChaPutOnItems",  vBuffer );

		if ( 1 == IsMigrationTarget( ChaNum ) )
		{
			// 착용아이템 정보
			se::ByteStream ByteStream( vBuffer );
			SETPUTONITEMS_BYBUF_FOR_MIGRATION( CharInfo.m_PutOnItems, ByteStream );
		}
		else
		{
			// 착용아이템 정보
			se::ByteStream ByteStream( vBuffer );
			SETPUTONITEMS_BYBUF( CharInfo.m_PutOnItems, ByteStream );
		}

        vCharInfo.push_back( CharInfo );
        
    } while ( Ado.Next() );

	
#ifdef _RANMOBILE
	// 란모바일 계정 연동 여부 설정
	int nMobileChaNum = 0;
	sc::db::AdoExt AdoMobile(m_RanMobileDBConnString);
    APPEND_IPARAM_INT(AdoMobile, "@UserNum", UserDbNum);
    APPEND_IPARAM_INT(AdoMobile, "@ServerGroup", ServerGroup);

    if (!AdoMobile.Execute4Cmd("dbo.sp_GetRMChaInfoForLobby", adCmdStoredProc))	
        return sc::db::DB_ERROR;

	if ( !AdoMobile.GetEOF() )
	{
		do
		{
			AdoMobile.GetCollect("ChaNum",       nMobileChaNum);            

			for (size_t i=0; i<vCharInfo.size(); ++i)
			{
				if( vCharInfo[i].m_dwCharID == static_cast<DWORD> (nMobileChaNum) )
				{
					vCharInfo[i].m_bRanMobile = true;
				}
			}
	        
		} while (AdoMobile.Next());
	}
#endif
*/
    return sc::db::DB_OK;
}

// 2차비번
int AdoManager::Certification2ndPassword(int nUserNumber, int nChaNum, const char* sz2ndPass)
{
    if (!sz2ndPass)
        return sc::db::DB_ERROR;

    std::string strPassword(sz2ndPass);

    sc::db::AdoExt AdoUser(m_UserDBConnString);
    APPEND_RPARAM_INT(AdoUser);

    APPEND_IPARAM_INT(AdoUser, "@nUserNum", nUserNumber);
    APPEND_IPARAM_VARCHAR(AdoUser, "@nUserPass", strPassword.c_str(), strPassword.length());
	APPEND_OPARAM_INT(AdoUser, "@nReturn");


	int nRet = AdoUser.ExecuteStoredProcedureIntReturn("dbo.sp_User2ndPasswordCheck", "@nReturn");

	return nRet;
}

// 2차비번
int AdoManager::Update2ndPassword(int nUserNumber, int nChaNum, const char* sz2ndPass)
{
    if (!sz2ndPass)
        return sc::db::DB_ERROR;

    std::string strPassword(sz2ndPass);

    sc::db::AdoExt AdoUser(m_UserDBConnString);
    APPEND_RPARAM_INT(AdoUser);

    APPEND_IPARAM_INT(AdoUser, "@nUserNum", nUserNumber);
    APPEND_IPARAM_VARCHAR(AdoUser, "@nUserPass", strPassword.c_str(), strPassword.length());
	APPEND_OPARAM_INT(AdoUser, "@nReturn");


	int nRet = AdoUser.ExecuteStoredProcedureIntReturn("dbo.sp_UpdateNew2ndPassword", "@nReturn");

	return nRet;
}
//////////////////////

int AdoManager::GetCharacterInfo(int nUserNumber, int nChaNum, GLCHARAG_DATA* pChaData)
{
    MIN_STATIC_ASSERT(GLCHARAG_DATA::VERSION <= 0x0002);

    if (!pChaData)
    {
        sc::writeLogError("AdoManager::GetCharacterInfo pCharData NULL");
        return sc::db::DB_ERROR;
    }
    
    sc::db::AdoExt Ado(m_GameDBConnString);
    Ado.AppendIParamInteger("@ChaNum",  nChaNum);
    Ado.AppendIParamInteger("@UserNum", nUserNumber);

    if (!Ado.ExecuteStoredProcedure("dbo.sp_GetChaAgentInfo"))
        return sc::db::DB_ERROR;

    if (Ado.GetEOF())
    {
        sc::writeLogError(
            sc::string::format(
                "AdoManager::GetCharacterInfo Cha %1% User %2%",
                nChaNum,
                nUserNumber));
        return sc::db::DB_ERROR;
    }

    do
    {
        int nUserNum = 0;
        int nSGNum   = 0;
        int nGuNum   = 0; // Club 번호
        std::string ChaName;
        std::string ChaPhoneNumber;
        int nChaClass = 0; int nChaLevel = 0; int nChaBright = 0; 
        int nChaStartMap = 0; int nChaStartGate = 0;
        float fChaPosX = 0; float fChaPosY = 0; float fChaPosZ = 0;
        int nChaSaveMap = 0;
        float fChaSavePosX = 0; float fChaSavePosY = 0; float fChaSavePosZ = 0;
        int nChaSchool = 0;
        _variant_t sChaGuSecede; // 클럽탈퇴시간

        Ado.GetCollect("UserNum", nUserNum);
        Ado.GetCollect("SGNum", nSGNum);
        Ado.GetCollect("ChaName", ChaName);
        Ado.GetCollect("ChaLevel", nChaLevel);
        Ado.GetCollect("ChaClass", nChaClass);
        Ado.GetCollect("ChaBright", nChaBright);
        Ado.GetCollect("ChaStartMap", nChaStartMap);
        Ado.GetCollect("ChaStartGate", nChaStartGate);
        Ado.GetCollect("ChaPosX", fChaPosX);
        Ado.GetCollect("ChaPosY", fChaPosY);
        Ado.GetCollect("ChaPosZ", fChaPosZ);
        Ado.GetCollect("ChaSaveMap", nChaSaveMap);
        Ado.GetCollect("ChaSavePosX", fChaSavePosX);
        Ado.GetCollect("ChaSavePosY", fChaSavePosY);
        Ado.GetCollect("ChaSavePosZ", fChaSavePosZ);
        Ado.GetCollect("ChaSchool", nChaSchool);
        Ado.GetCollect("GuNum", nGuNum);
        Ado.GetCollect("ChaGuSecede", sChaGuSecede);
        
        pChaData->m_UserDbNum = (DWORD) nUserNum;
        pChaData->m_dwServerID = (DWORD) nSGNum;

        if (!ChaName.empty())
            pChaData->SetChaName(ChaName.c_str());

        pChaData->m_wLevel  = (WORD) nChaLevel;
        pChaData->m_emClass = EMCHARCLASS(nChaClass);
        pChaData->m_wLevel	= (WORD) nChaLevel;
        pChaData->m_nBright	= nChaBright;

        pChaData->m_sStartMapID.dwID = (DWORD) nChaStartMap;

        pChaData->m_dwStartGate		= (DWORD) nChaStartGate;
        pChaData->m_vStartPos.x		= (float) fChaPosX;
        pChaData->m_vStartPos.y		= (float) fChaPosY;
        pChaData->m_vStartPos.z		= (float) fChaPosZ;

        pChaData->m_sSaveMapID.dwID = (DWORD) nChaSaveMap;
        pChaData->m_vSavePos.x		= (float) fChaSavePosX; 
        pChaData->m_vSavePos.y		= (float) fChaSavePosY; 
        pChaData->m_vSavePos.z		= (float) fChaSavePosZ;

        pChaData->m_wSchool         = (WORD) nChaSchool;
        pChaData->m_ClubDbNum         = (DWORD) nGuNum;

        pChaData->m_tSECEDE = sc::time::GetTime(sChaGuSecede);
    } while (Ado.Next());

    return sc::db::DB_OK;
}

int AdoManager::SetCharacterOption( int ChaNum, int CharacterOption )
{
	if ( ChaNum < 1 )
		return sc::db::DB_ERROR;

	sc::db::AdoExt AdoGame( m_GameDBConnString );
	APPEND_RPARAM_INT( AdoGame );

	APPEND_IPARAM_INT( AdoGame, "@ChaNum", ChaNum );
	APPEND_IPARAM_INT( AdoGame, "@CharacterOption", CharacterOption );    

	APPEND_OPARAM_INT( AdoGame, "@Return" );

	return ExecuteStoredProcedureIntReturn( "dbo.sp_SetCharacterOption", AdoGame, "@Return" );
}

int AdoManager::GetCharacterOption( int ChaNum )
{
	sc::db::AdoExt ado( m_GameDBConnString );
	APPEND_IPARAM_INT( ado, "@ChaNum",	ChaNum );
	APPEND_OPARAM_INT( ado, "@Return");

	return ExecuteStoredProcedureIntReturn( "dbo.sp_GetCharacterOption", ado, "@Return" );
}

int AdoManager::GetUserInvenOption( int UserNum, int& Option )
{
	sc::db::AdoExt Ado( m_GameDBConnString );
	Ado.AppendIParamInteger( "@UserNum", UserNum );

	if ( !Ado.ExecuteStoredProcedure( "dbo.sp_GetUserInvenOption" ) )
		return sc::db::DB_ERROR;

	if ( Ado.GetEOF() )
	{
		sc::writeLogError( sc::string::format( "AdoManager::GetUserInvenOption EOF usernum %1%", UserNum ) );
		return sc::db::DB_ERROR;
	}

	do
	{
		Ado.GetCollect( "UserInvenOption", Option );
	} while ( Ado.Next() );

	return sc::db::DB_OK;
}

int	AdoManager::GetCharacterInfoExtraWithAdo(int nUserNumber, int nChaNum, SCHARDATA2* pCharData2)
{
	if(!pCharData2)
	{
		sc::writeLogError(std::string("AdoManager::CreateNewCharacterExtraWithAdo() - pCharData2 is NULL."));
		return sc::db::DB_ERROR;
	}
	
	//
	// LearnProductBook
	//
	//return LoadProductBook(nChaNum, OUT pCharData2->m_setLearnProductBook);
    return S_OK;
}

//! 직전귀환 카드 사용을 위한 포지션을 저장한다.
int AdoManager::SetLastCallPos(int nChaNum, DWORD dwMapID, D3DXVECTOR3 vPos)
{
    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_RPARAM_INT(AdoGame);

    APPEND_IPARAM_INT  (AdoGame, "@nChaReturnMap",  static_cast<int> (dwMapID));
    APPEND_IPARAM_FLOAT(AdoGame, "@fChaReturnPosX", vPos.x);
    APPEND_IPARAM_FLOAT(AdoGame, "@fChaReturnPosY", vPos.y);
    APPEND_IPARAM_FLOAT(AdoGame, "@fChaReturnPosZ", vPos.z);
    APPEND_IPARAM_INT  (AdoGame, "@nChaNum",        nChaNum);

    APPEND_OPARAM_INT(AdoGame, "@nReturn");
        
    return ExecuteStoredProcedureIntReturn("dbo.UpdateChaLastCallPos", AdoGame, "@nReturn");
}

//! 새로운 캐릭터를 생성한다.
int AdoManager::CreateNewCharacter(SCHARDATA2* pCharData2)
{
    if(!pCharData2)
    {
        sc::writeLogError(std::string("AdoManager::CreateNewCharacter() - pCharData2 is NULL."));
        return sc::db::DB_ERROR;
    }

    DWORD dwUserNum = pCharData2->GetUserID(); // 사용자번호
    DWORD dwSvrNum  = pCharData2->m_dwServerID; // 서버그룹번호



	sc::db::AdoExt AdoUser(m_UserDBConnString);
    APPEND_RPARAM_INT(AdoUser);

	APPEND_IPARAM_INT(AdoUser, "@dwUserNum", dwUserNum);
	APPEND_OPARAM_INT(AdoUser, "@nReturn");

	// GM 계정은 캐릭터 생성 불가, GS만 적용되도록 수정함
	int nReturn = 0;
	switch ( m_ServiceProvider )
	{
	case SP_GS:
		nReturn = ExecuteStoredProcedureIntReturn( "dbo.sp_GetUserType", AdoUser, "@nReturn" );
		break;
	default:
		break;
	}

	if ( nReturn >= USER_USER_GM )
		return sc::db::DB_CHA_GM;

    sc::db::AdoExt AdoGame(m_GameDBConnString);

    APPEND_IPARAM_INT(AdoGame, "@dwUserNum", dwUserNum);
    APPEND_IPARAM_INT(AdoGame, "@dwSvrNum", dwSvrNum);
    APPEND_IPARAM_VARCHAR(AdoGame, "@szName", pCharData2->m_szName, strlen(pCharData2->m_szName));
    APPEND_IPARAM_INT(AdoGame, "@emTribe", pCharData2->m_emTribe);
    APPEND_IPARAM_INT(AdoGame, "@emClass", pCharData2->m_emClass);

    APPEND_IPARAM_INT(AdoGame, "@wSchool", pCharData2->m_wSchool);
    APPEND_IPARAM_INT(AdoGame, "@wHair", pCharData2->m_wHair);
    APPEND_IPARAM_INT(AdoGame, "@wFace", pCharData2->m_wFace);
    APPEND_IPARAM_INT(AdoGame, "@nLiving", pCharData2->m_nLiving);

    APPEND_IPARAM_INT(AdoGame, "@nBirght", pCharData2->m_nBright);
    APPEND_IPARAM_INT(AdoGame, "@wLevel", pCharData2->m_wLevel);
    APPEND_IPARAM_MONEY(AdoGame, "@lnMoney", pCharData2->GetInvenMoney());
    APPEND_IPARAM_INT(AdoGame, "@wDex", pCharData2->m_sStats.wDex);
    APPEND_IPARAM_INT(AdoGame, "@wInt", pCharData2->m_sStats.wInt);

    APPEND_IPARAM_INT(AdoGame, "@wStr", pCharData2->m_sStats.wStr);
    APPEND_IPARAM_INT(AdoGame, "@sPow", pCharData2->m_sStats.wPow);
    APPEND_IPARAM_INT(AdoGame, "@wSpi", pCharData2->m_sStats.wSpi);
    APPEND_IPARAM_INT(AdoGame, "@wSta", pCharData2->m_sStats.wSta);
    APPEND_IPARAM_INT(AdoGame, "@wStatsPoint", pCharData2->m_wStatsPoint);

    APPEND_IPARAM_INT(AdoGame, "@wAP", pCharData2->m_powerAttack);
    APPEND_IPARAM_INT(AdoGame, "@WDP", pCharData2->m_powerDefence);
    APPEND_IPARAM_INT(AdoGame, "@wPA", pCharData2->m_powerAttribute[SKILL::EMAPPLY_MELEE]);
    APPEND_IPARAM_INT(AdoGame, "@wSA", pCharData2->m_powerAttribute[SKILL::EMAPPLY_RANGE]);
	APPEND_IPARAM_INT(AdoGame, "@wMA", pCharData2->m_powerAttribute[SKILL::EMAPPLY_MAGIC]);
    APPEND_IPARAM_MONEY(AdoGame, "@lnExperience", pCharData2->m_sExperience.lnNow);

    APPEND_IPARAM_INT(AdoGame, "@dwSkillPoint", pCharData2->m_dwSkillPoint);
    APPEND_IPARAM_INT(AdoGame, "@dwHP", pCharData2->m_sHP.nNow);
    APPEND_IPARAM_INT(AdoGame, "@dwMP", pCharData2->m_sMP.nNow);
    APPEND_IPARAM_INT(AdoGame, "@dwSP", pCharData2->m_sSP.nNow);
    APPEND_IPARAM_INT(AdoGame, "@wPK", pCharData2->m_wPK);

    APPEND_IPARAM_INT(AdoGame, "@dwStartMapID", pCharData2->m_sStartMapID.dwID);
    APPEND_IPARAM_INT(AdoGame, "@dwStartGate", pCharData2->m_dwStartGate);
    APPEND_IPARAM_FLOAT(AdoGame, "@fStartPosX", pCharData2->m_vStartPos.x);
    APPEND_IPARAM_FLOAT(AdoGame, "@fStartPosY", pCharData2->m_vStartPos.y);
    APPEND_IPARAM_FLOAT(AdoGame, "@fStartPosZ", pCharData2->m_vStartPos.z);

    APPEND_IPARAM_INT(AdoGame, "@wHairColor", pCharData2->m_wHairColor);
    APPEND_IPARAM_INT(AdoGame, "@wSex", pCharData2->m_wSex);
    APPEND_IPARAM_MONEY(AdoGame, "@lnReExp", pCharData2->m_lnRestorableExp);

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

    int Result = ExecuteStoredProcedureIntReturn("dbo.sp_CreateNewCharacter", AdoGame, "@nReturn");
    if ( Result == sc::db::DB_ERROR )
    {
        return sc::db::DB_CHA_DUF;
    }

    int nChaNewNum = Result;
    pCharData2->m_CharDbNum = nChaNewNum;

    se::ByteStream ByteStream( 40960 );
    LPBYTE pBuffer = NULL;
    DWORD dwSize = 0;

    sc::db::AdoExt AdoUpdateCharInfo(m_GameDBConnString);

    APPEND_IPARAM_INT(AdoUpdateCharInfo, "@nChaNum", nChaNewNum);

    // Character Skill 
    pCharData2->GETEXPSKILLS_BYBUF(ByteStream);		
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
		_variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CreateNewCharacter Makechunk ChaSkills ChaNum %1% Size %2%",
                    nChaNewNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CreateNewCharacter dwSize 0 ChaNum %1%",
                nChaNewNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaSkills", varBlob, dwSize);

        pBuffer = NULL;
    }	

    // Character Skill Quick Slot
    pCharData2->GETSKILL_QUICKSLOT(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
		_variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CreateNewCharacter Makechunk ChaSkillsSlot ChaNum %1% Size %2%",
                    nChaNewNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CreateNewCharacter dwSize 0 ChaNum %1%",
                nChaNewNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaSkillsSlot", varBlob, dwSize);

        pBuffer = NULL;
    }

    // Character Action Quick Slot
    pCharData2->GETACTION_QUICKSLOT(ByteStream);		
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
		_variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CreateNewCharacter Makechunk ChaActionSlot ChaNum %1% Size %2%",
                    nChaNewNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CreateNewCharacter dwSize 0 ChaNum %1%",
                nChaNewNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaActionSlot", varBlob, dwSize);

        pBuffer = NULL;
    }

    // Character Put on item
    /*pCharData2->GETPUTONITEMS_BYBUF(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
		_variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CreateNewCharacter Makechunk ChaPutOnItems ChaNum %1% Size %2%",
                    nChaNewNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CreateNewCharacter dwSize 0 ChaNum %1%",
                nChaNewNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaPutOnItems", varBlob, dwSize);

        pBuffer = NULL;
    }*/

    // Character SkillFact
    pCharData2->GETSKILLFACT_BYBUF(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
		_variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CreateNewCharacter Makechunk ChaSkillFact ChaNum %1% Size %2%",
                    nChaNewNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CreateNewCharacter dwSize 0 ChaNum %1%",
                nChaNewNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaSkillFact", varBlob, dwSize);

        pBuffer = NULL;
    }

    // Character Inventory
    /*ByteStream.ClearBuffer();
    pCharData2->GETINVENTORYE_BYBUF(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
		_variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CreateNewCharacter Makechunk ChaInven ChaNum %1% Size %2%",
                    nChaNewNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CreateNewCharacter dwSize 0 ChaNum %1%",
                nChaNewNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaInven", varBlob, dwSize);

        pBuffer = NULL;
    }*/

    // Character Quest information
    pCharData2->GETQUESTPLAY(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
		_variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CreateNewCharacter Makechunk ChaQuest ChaNum %1% Size %2%",
                    nChaNewNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CreateNewCharacter dwSize 0 ChaNum %1%",
                nChaNewNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaQuest", varBlob, dwSize);

        pBuffer = NULL;
    }

    if (ExecuteStoredProcedure("dbo.sp_UpdateNewCharacter", AdoUpdateCharInfo) != sc::db::DB_OK)
    {
        sc::writeLogError(std::string("AdoManager::CreateNewCharacter() - sp_UpdateNewCharacter failed."));
    }

	// 착용 아이템
	std::vector< SINVENITEM_SAVE > vecItemsPuton;
	pCharData2->GETPUTONITEMS_BYVECTOR( vecItemsPuton );
	size_t ItemSizePuton = vecItemsPuton.size();
	for ( size_t loop = 0; loop < ItemSizePuton; loop++ )
	{
		SINVENITEM_SAVE& sItem = vecItemsPuton[loop];
		sc::SeqUniqueGUID::Instance()->getGUID( sItem.sItemCustom.guid );
		sItem.sItemCustom.GenerateBasicStat( false );
		sItem.sItemCustom.GenerateLinkSkill();
		sItem.sItemCustom.GenerateAddOption();
		ItemInsert( pCharData2->m_CharDbNum, INVEN_PUTON, &vecItemsPuton[loop], INSERT_PUTON_ITEM_NEW_CHA );
	}

	// 인벤토리
	std::vector< SINVENITEM_SAVE > vecItemsInven;
	pCharData2->m_cInventory.GET_ITEM_BY_VECTOR( vecItemsInven );
	size_t ItemSizeInven = vecItemsInven.size();
	for ( size_t loop = 0; loop < ItemSizeInven; loop++ )
	{
		SINVENITEM_SAVE& sItem = vecItemsInven[loop];
		sc::SeqUniqueGUID::Instance()->getGUID( sItem.sItemCustom.guid );
		sItem.sItemCustom.GenerateBasicStat( false );
		sItem.sItemCustom.GenerateLinkSkill();
		sItem.sItemCustom.GenerateAddOption();
		ItemInsert( pCharData2->m_CharDbNum, INVEN_INVEN, &vecItemsInven[loop], INSERT_INVEN_ITEM_NEW_CHA );
	}

	// 퀘스트 아이템 저장하기
	{
		// 진행 퀘스트
		GLQuestPlay::MAPQUEST& quest = pCharData2->m_cQuestPlay.GetQuestProc();
		GLQuestPlay::MAPQUEST_CITER iter = quest.begin();
		GLQuestPlay::MAPQUEST_CITER iter_end = quest.end();
		for ( ; iter != iter_end; ++iter )
		{
			std::vector< SINVENITEM_SAVE > vecItems;
			GLQUESTPROG* pQuestProg = (*iter).second;
			if ( !pQuestProg )
			{
				continue;
			}
			pQuestProg->m_sINVENTORY.GET_ITEM_BY_VECTOR( vecItems );
			size_t ItemSize = vecItems.size();
			for ( size_t loop = 0; loop < ItemSize; loop++ )
			{
				// Quest Item 일 경우에 Costume 의 MID, SID 가 Quest 의 MID,SID 이다.
				SINVENITEM_SAVE& sItem = vecItems[loop];
				sc::SeqUniqueGUID::Instance()->getGUID( sItem.sItemCustom.guid );
				sItem.sItemCustom.GenerateBasicStat( false );
				sItem.sItemCustom.GenerateLinkSkill();
				sItem.sItemCustom.GenerateAddOption();
				sItem.sItemCustom.nidDISGUISE.wMainID = pQuestProg->m_sNID.wMainID;
				sItem.sItemCustom.nidDISGUISE.wSubID = pQuestProg->m_sNID.wSubID;
				ItemInsert( pCharData2->m_CharDbNum, INVEN_QUEST_PROC, &vecItems[loop], INSERT_QUEST_ITEM_NEW_CHA );
			}
		}
	}

	{
		// 완료 퀘스트
		GLQuestPlay::MAPQUEST& quest = pCharData2->m_cQuestPlay.GetQuestEnd();
		GLQuestPlay::MAPQUEST_CITER iter = quest.begin();
		GLQuestPlay::MAPQUEST_CITER iter_end = quest.end();
		for ( ; iter != iter_end; ++iter )
		{
			std::vector< SINVENITEM_SAVE > vecItems;
			GLQUESTPROG* pQuestProg = (*iter).second;
			if ( !pQuestProg )
			{
				continue;
			}
			pQuestProg->m_sINVENTORY.GET_ITEM_BY_VECTOR( vecItems );
			size_t ItemSize = vecItems.size();
			for ( size_t loop = 0; loop < ItemSize; loop++ )
			{
				// Quest Item 일 경우에 Costume 의 MID, SID 가 Quest 의 MID,SID 이다.
				SINVENITEM_SAVE& sItem = vecItems[loop];
				sc::SeqUniqueGUID::Instance()->getGUID( sItem.sItemCustom.guid );
				sItem.sItemCustom.GenerateBasicStat( false );
				sItem.sItemCustom.GenerateLinkSkill();
				sItem.sItemCustom.GenerateAddOption();
				sItem.sItemCustom.nidDISGUISE.wMainID = pQuestProg->m_sNID.wMainID;
				sItem.sItemCustom.nidDISGUISE.wSubID = pQuestProg->m_sNID.wSubID;
				ItemInsert( pCharData2->m_CharDbNum, INVEN_QUEST_END, &vecItems[loop], INSERT_QUEST_END_ITEM_NEW_CHA );
			}
		}
	}

    // User Inventory
    // 1. Check User Inven		
    // 2. If exist skip
    // 3. not exist, write iventory image
    //bool bInven = CheckInven(m_pConfigOld->GetServerGroup(), dwUserNum);
    bool bInven = CheckInven(m_pServer->ServerGroup(), dwUserNum);
    if (!bInven)
    {
        MakeUserInven(m_pServer->ServerGroup(), dwUserNum);
    }

    if (m_ServiceProvider == SP_HONGKONG)
    {
        // 대만,홍콩
        // 캐릭터 생성시 Temp Table에 캐릭터 레벨과 금액 정보를 암호화 해서 저장해 두는 부분
        int nReturn = InsertCharInfoTemp( nChaNewNum );
    }

	// 인벤토리 라인 수;
	WORD wInvenLine = pCharData2->GetOnINVENLINE();
	if( 0 < wInvenLine )
	{
		SetChaInvenNum( nChaNewNum,wInvenLine );
	}

    return nChaNewNum;
}

// ChaInfo Backup.
int AdoManager::CharacterInfoBackup(SCHARDATA2* pCharData2)
{
    if(!pCharData2)
    {
        sc::writeLogError(std::string("AdoManager::CharacterInfoBackup() - pCharData2 is NULL."));
        return sc::db::DB_ERROR;
    }

    DWORD dwChaNum = pCharData2->CharDbNum();
    DWORD dwUserNum = pCharData2->GetUserID(); // 사용자번호
    DWORD dwSvrNum  = pCharData2->m_dwServerID; // 서버그룹번호

    sc::db::AdoExt AdoGame(m_GameDBConnString);

    APPEND_IPARAM_INT(AdoGame, "@dwChaNum", dwChaNum);
    APPEND_IPARAM_VARCHAR(AdoGame, "@szUserName", pCharData2->m_szUID, strlen(pCharData2->m_szUID));
    APPEND_IPARAM_INT(AdoGame, "@dwUserNum", dwUserNum);
    APPEND_IPARAM_INT(AdoGame, "@dwSvrNum", dwSvrNum);
    APPEND_IPARAM_VARCHAR(AdoGame, "@szName", pCharData2->m_szName, strlen(pCharData2->m_szName));
    APPEND_IPARAM_INT(AdoGame, "@emTribe", pCharData2->m_emTribe);
    APPEND_IPARAM_INT(AdoGame, "@emClass", pCharData2->m_emClass);

    APPEND_IPARAM_INT(AdoGame, "@wSchool", pCharData2->m_wSchool);
    APPEND_IPARAM_INT(AdoGame, "@wHair", pCharData2->m_wHair);
    APPEND_IPARAM_INT(AdoGame, "@wFace", pCharData2->m_wFace);
    APPEND_IPARAM_INT(AdoGame, "@nLiving", pCharData2->m_nLiving);

    APPEND_IPARAM_INT(AdoGame, "@nBirght", pCharData2->m_nBright);
    APPEND_IPARAM_INT(AdoGame, "@wLevel", pCharData2->m_wLevel);
    APPEND_IPARAM_MONEY(AdoGame, "@lnMoney", pCharData2->GetInvenMoney());
    APPEND_IPARAM_INT(AdoGame, "@wDex", pCharData2->m_sStats.wDex);
    APPEND_IPARAM_INT(AdoGame, "@wInt", pCharData2->m_sStats.wInt);

    APPEND_IPARAM_INT(AdoGame, "@wStr", pCharData2->m_sStats.wStr);
    APPEND_IPARAM_INT(AdoGame, "@sPow", pCharData2->m_sStats.wPow);
    APPEND_IPARAM_INT(AdoGame, "@wSpi", pCharData2->m_sStats.wSpi);
    APPEND_IPARAM_INT(AdoGame, "@wSta", pCharData2->m_sStats.wSta);
    APPEND_IPARAM_INT(AdoGame, "@wStatsPoint", pCharData2->m_wStatsPoint);

    APPEND_IPARAM_INT(AdoGame, "@wAP", pCharData2->m_powerAttack);
    APPEND_IPARAM_INT(AdoGame, "@WDP", pCharData2->m_powerDefence);
    APPEND_IPARAM_INT(AdoGame, "@wPA", pCharData2->m_powerAttribute[SKILL::EMAPPLY_MELEE]);
    APPEND_IPARAM_INT(AdoGame, "@wSA", pCharData2->m_powerAttribute[SKILL::EMAPPLY_RANGE]);
	APPEND_IPARAM_INT(AdoGame, "@wMA", pCharData2->m_powerAttribute[SKILL::EMAPPLY_MAGIC]);
    APPEND_IPARAM_MONEY(AdoGame, "@lnExperience", pCharData2->m_sExperience.lnNow);

    APPEND_IPARAM_INT(AdoGame, "@dwSkillPoint", pCharData2->m_dwSkillPoint);
    APPEND_IPARAM_INT(AdoGame, "@dwHP", pCharData2->m_sHP.nNow);
    APPEND_IPARAM_INT(AdoGame, "@dwMP", pCharData2->m_sMP.nNow);
    APPEND_IPARAM_INT(AdoGame, "@dwSP", pCharData2->m_sSP.nNow);
    APPEND_IPARAM_INT(AdoGame, "@wPK", pCharData2->m_wPK);

    APPEND_IPARAM_INT(AdoGame, "@dwStartMapID", pCharData2->m_sStartMapID.dwID);
    APPEND_IPARAM_INT(AdoGame, "@dwStartGate", pCharData2->m_dwStartGate);
    APPEND_IPARAM_FLOAT(AdoGame, "@fStartPosX", pCharData2->m_vStartPos.x);
    APPEND_IPARAM_FLOAT(AdoGame, "@fStartPosY", pCharData2->m_vStartPos.y);
    APPEND_IPARAM_FLOAT(AdoGame, "@fStartPosZ", pCharData2->m_vStartPos.z);

    APPEND_IPARAM_INT(AdoGame, "@wHairColor", pCharData2->m_wHairColor);
    APPEND_IPARAM_INT(AdoGame, "@wSex", pCharData2->m_wSex);
    APPEND_IPARAM_MONEY(AdoGame, "@lnReExp", pCharData2->m_lnRestorableExp);

    APPEND_OPARAM_INT(AdoGame, "@nReturn");

    int Result = ExecuteStoredProcedureIntReturn("dbo.InsertChaInfoBackup", AdoGame, "@nReturn");
    if ( Result == sc::db::DB_ERROR )
    {
        sc::writeLogError(std::string("AdoManager::CharacterInfoBackup() - InsertChaInfoBackup failed."));

        return sc::db::DB_CHA_DUF;
    }

    int nInsertNum = Result;

    se::ByteStream ByteStream( 40960 );
    LPBYTE pBuffer = NULL;
    DWORD dwSize = 0;

    sc::db::AdoExt AdoUpdateCharInfo(m_GameDBConnString);

    APPEND_IPARAM_INT(AdoUpdateCharInfo, "@nInsertNum", nInsertNum);

    // Character Skill 
    pCharData2->GETEXPSKILLS_BYBUF(ByteStream);		
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
        _variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CharacterInfoBackup Makechunk ChaSkills InserNum %1% Size %2%",
                    nInsertNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CharacterInfoBackup dwSize 0 InserNum %1%",
                nInsertNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaSkills", varBlob, dwSize);

        pBuffer = NULL;
    }	

    // Character Skill Quick Slot
    pCharData2->GETSKILL_QUICKSLOT(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
        _variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CharacterInfoBackup Makechunk ChaSkillsSlot InserNum %1% Size %2%",
                    nInsertNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CharacterInfoBackup dwSize 0 InserNum %1%",
                nInsertNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaSkillsSlot", varBlob, dwSize);

        pBuffer = NULL;
    }

    // Character Action Quick Slot
    pCharData2->GETACTION_QUICKSLOT(ByteStream);		
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
        _variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CharacterInfoBackup Makechunk ChaActionSlot InserNum %1% Size %2%",
                    nInsertNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CharacterInfoBackup dwSize 0 InserNum %1%",
                nInsertNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaActionSlot", varBlob, dwSize);

        pBuffer = NULL;
    }

    // Character Put on item
    pCharData2->GETPUTONITEMS_BYBUF(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
        _variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CharacterInfoBackup Makechunk ChaPutOnItems InserNum %1% Size %2%",
                    nInsertNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CharacterInfoBackup dwSize 0 InserNum %1%",
                nInsertNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaPutOnItems", varBlob, dwSize);

        pBuffer = NULL;
    }

    // Character SkillFact
    pCharData2->GETSKILLFACT_BYBUF(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
        _variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CharacterInfoBackup Makechunk ChaSkillFact InserNum %1% Size %2%",
                    nInsertNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CharacterInfoBackup dwSize 0 InserNum %1%",
                nInsertNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaSkillFact", varBlob, dwSize);

        pBuffer = NULL;
    }

    // Character Inventory
    ByteStream.ClearBuffer();
    pCharData2->GETINVENTORYE_BYBUF(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
        _variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CharacterInfoBackup Makechunk ChaInven InserNum %1% Size %2%",
                    nInsertNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CharacterInfoBackup dwSize 0 InserNum %1%",
                nInsertNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaInven", varBlob, dwSize);

        pBuffer = NULL;
    }

    // Character Quest information
    pCharData2->GETQUESTPLAY(ByteStream);
    ByteStream.GetBuffer(pBuffer, dwSize);
    if (pBuffer != NULL)
    {
        _variant_t varBlob;
        if (dwSize > 0)
        {
            if (!AdoUpdateCharInfo.MakeChunk(varBlob, ByteStream, dwSize))
            {
                sc::writeLogError(
                    sc::string::format(
                    "CharacterInfoBackup Makechunk ChaQuest InserNum %1% Size %2%",
                    nInsertNum,
                    dwSize));
            }
        }
        else
        {
            varBlob = VT_NULL;
            dwSize = sizeof(_variant_t);

            sc::writeLogError(
                sc::string::format(
                "CharacterInfoBackup dwSize 0 InserNum %1%",
                nInsertNum));
        }
        APPEND_IPARAM_IMAGE(AdoUpdateCharInfo, "@ChaQuest", varBlob, dwSize);

        pBuffer = NULL;
    }

    if (ExecuteStoredProcedure("dbo.UpdateChaInfoBackup", AdoUpdateCharInfo) != sc::db::DB_OK)
    {
        sc::writeLogError(std::string("AdoManager::CharacterInfoBackup() - UpdateChaInfoBackup failed."));
    }

    return nInsertNum;
}

//mjeon.ado
int AdoManager::CreateNewCharacterExtraWithAdo(SCHARDATA2* pCharData2)
{
	if(!pCharData2)
	{
		sc::writeLogError(std::string("AdoManager::CreateNewCharacterExtraWithAdo() - pCharData2 is NULL."));
		return sc::db::DB_ERROR;
	}

	UINT nChaNum = pCharData2->m_CharDbNum;	
	
	if (nChaNum == 0 || pCharData2->m_wLevel == 0)	// 해킹한 캐릭터의 경우 레벨이 0 으로 세팅될 가능성이 많다.
	{
		sc::writeLogError(sc::string::format("AdoManager::CreateNewCharacterExtraWithAdo() - Wrong Character! (ChaNum:%1%, Level:%2%, ChaName:%3%).", nChaNum, pCharData2->m_wLevel, pCharData2->m_szName));
		return sc::db::DB_ERROR;
	}

	//
	// LearnProductBook
	//
	//return SaveProductBook(nChaNum, pCharData2->m_setLearnProductBook);
	return S_OK;
}

int AdoManager::InsertCharInfoTemp(int nChaNum)
{
    sc::db::AdoExt AdoGame(m_GameDBConnString);

    char szTempMoney[CHAR_TEMPMONEY];
    LONGLONG lnTempMoney = 0;
    lnTempMoney <<= 0x04;
    sprintf( szTempMoney, "%I64d", lnTempMoney );
    size_t i;
    for( i = 0; i < strlen(szTempMoney); i++ )
    {
        szTempMoney[i] += 20;
    }

    int ChaNum = nChaNum;
    int nChaLevel = 1;

	APPEND_IPARAM_INT(AdoGame, "@nChaLevel", nChaLevel);
	APPEND_IPARAM_VARCHAR( AdoGame, "@lnChaMoney", szTempMoney, strlen( szTempMoney ) );
	APPEND_IPARAM_INT(AdoGame, "@nChaNum", ChaNum);

    if (ExecuteStoredProcedure("dbo.sp_InsertChaLastInfo", AdoGame) != sc::db::DB_OK)
    {
        sc::writeLogError(std::string("AdoManager::InsertCharInfoTemp() - sp_InsertChaLastInfo failed."));

        return sc::db::DB_ERROR;
    }

    return sc::db::DB_OK;
}

int AdoManager::LoadChaExtraInfo(UINT nChaNum, int &nContributionPoint)
{
	sc::db::AdoExt ado(m_GameDBConnString);

	APPEND_IPARAM_INT(ado, "@ChaNum",	nChaNum);

	if (ExecuteStoredProcedure("dbo.sp_GetChaExtraInfo", ado) != sc::db::DB_OK)
	{
		sc::writeLogError(std::string("AdoManager::LoadChaExtraInfo() - ExecuteStoredProcedure failure."));

		return sc::db::DB_ERROR;
	}

	BEGIN_GETCOLLECT(ado);

	ado.GetCollect("ContributionPoint", nContributionPoint);
	
	END_GETCOLLECT(ado);


	return sc::db::DB_OK;
}

int AdoManager::GetChaResetInfo( DWORD dwChaDbNum )
{
	sc::db::AdoExt ado( m_GameDBConnString );
	APPEND_IPARAM_INT( ado, "@nChaNum",	static_cast< int >( dwChaDbNum ) );
	APPEND_OPARAM_INT( ado, "@nReturn");

	return ExecuteStoredProcedureIntReturn( "dbo.sp_GetChaResetInfo", ado, "@nReturn" );
}

int AdoManager::IsMigrationTarget( DWORD dwChaDbNum )
{
	sc::db::AdoExt ado( m_GameDBConnString );
	APPEND_IPARAM_INT( ado, "@nChaNum",	static_cast< int >( dwChaDbNum ) );
	APPEND_OPARAM_INT( ado, "@nReturn");

	return ExecuteStoredProcedureIntReturn( "dbo.sp_GetMigrationTarget", ado, "@nReturn" );
}

int AdoManager::SetMigrationTarget( DWORD dwChaDbNum )
{
	sc::db::AdoExt ado( m_GameDBConnString );
	APPEND_IPARAM_INT( ado, "@nChaNum", dwChaDbNum );

	if ( ExecuteStoredProcedure( "dbo.sp_SetMigrationTarget", ado ) != sc::db::DB_OK )
	{
		sc::writeLogError( std::string( "AdoManager::SetMigrationTarget() - ExecuteStoredProcedure failure." ) );
		return sc::db::DB_ERROR;
	}

	return sc::db::DB_OK;	
}

/*			
DB_OK_CHAR_WORLDBATTLE_ERROR = -6,
DB_OK_CHAR_WORLDBATTLE_VALIDATION_ERROR = -7,
DB_OK_CHAR_WORLDBATTLE_NAME_ERROR = -8,
			*/

int AdoManager::TransDBDataToWorldBattle(SCHARDATA2* pCharData2, DWORD dwChaNum)
{
	int nRet = sc::db::DB_OK;

	if( pCharData2 == NULL )
		return sc::db::DB_ERROR;

	if (pCharData2->m_dwUserLvl < USER_GM4)
	{
		if( pCharData2->ValidationCharData() == TRUE)
		{
			nRet = sc::db::DB_OK_CHAR_WORLDBATTLE_VALIDATION_ERROR;
		}
	}

	//std::string strCountry("TEST_");
	std::string strUserID(pCharData2->m_szUID);
	std::string strChaName(pCharData2->m_szName);

	//strUserID = strCountry + strUserID;
	//strChaName = strCountry + strChaName;

	if( strUserID.length() >= 20 || strChaName.length() >= 33 )
		return sc::db::DB_OK_CHAR_WORLDBATTLE_NAME_ERROR;
 
	sc::string::trim(strUserID);
	sc::string::trim(strChaName);

	sc::db::AdoExt AdoGame(m_GameDBConnString);
	APPEND_RPARAM_INT(AdoGame);
	
	APPEND_IPARAM_VARCHAR(AdoGame, "@UserID", strUserID.c_str(), strUserID.length());
	APPEND_IPARAM_VARCHAR(AdoGame, "@ChaName", strChaName.c_str(), strChaName.length());
	APPEND_IPARAM_INT  (AdoGame, "@ChaBright",     pCharData2->m_nBright);
	APPEND_IPARAM_INT  (AdoGame, "@ChaLevel",      static_cast<int> (pCharData2->m_wLevel));

	LONGLONG ChaMoney = sc::db::AdjustMoney(pCharData2->GetInvenMoney());
	APPEND_IPARAM_MONEY(AdoGame, "@ChaMoney",      ChaMoney);

	APPEND_IPARAM_INT  (AdoGame, "@ChaDex",        static_cast<int> (pCharData2->m_sStats.wDex));
	APPEND_IPARAM_INT  (AdoGame, "@ChaIntel",      static_cast<int> (pCharData2->m_sStats.wInt));
	APPEND_IPARAM_INT  (AdoGame, "@ChaSchool",     static_cast<int> (pCharData2->m_wSchool));
	APPEND_IPARAM_INT  (AdoGame, "@ChaHair",       static_cast<int> (pCharData2->m_wHair));
	APPEND_IPARAM_INT  (AdoGame, "@ChaFace",       static_cast<int> (pCharData2->m_wFace));
	APPEND_IPARAM_INT  (AdoGame, "@ChaLiving",     pCharData2->m_nLiving);
	APPEND_IPARAM_INT  (AdoGame, "@ChaStrong",     static_cast<int> (pCharData2->m_sStats.wStr));
	APPEND_IPARAM_INT  (AdoGame, "@ChaPower",      static_cast<int> (pCharData2->m_sStats.wPow));
	APPEND_IPARAM_INT  (AdoGame, "@ChaSpirit",     static_cast<int> (pCharData2->m_sStats.wSpi));
	APPEND_IPARAM_INT  (AdoGame, "@ChaStrength",   static_cast<int> (pCharData2->m_sStats.wSta));
	APPEND_IPARAM_INT  (AdoGame, "@ChaStRemain",   static_cast<int> (pCharData2->m_wStatsPoint));
	APPEND_IPARAM_INT  (AdoGame, "@ChaAttackP",    pCharData2->m_powerAttack);
	APPEND_IPARAM_INT  (AdoGame, "@ChaDefenseP",   pCharData2->m_powerDefence);
	APPEND_IPARAM_INT  (AdoGame, "@ChaFightA",	pCharData2->m_powerAttribute[SKILL::EMAPPLY_MELEE]);
	APPEND_IPARAM_INT  (AdoGame, "@ChaShootA",	pCharData2->m_powerAttribute[SKILL::EMAPPLY_RANGE]);
	APPEND_IPARAM_INT  (AdoGame, "@ChaMagicA",	pCharData2->m_powerAttribute[SKILL::EMAPPLY_MAGIC]);

	LONGLONG ChaExp = sc::db::AdjustMoney(pCharData2->m_sExperience.lnNow);
	APPEND_IPARAM_MONEY(AdoGame, "@ChaExp",        ChaExp);

	APPEND_IPARAM_INT  (AdoGame, "@ChaSkillPoint", static_cast<int> (pCharData2->m_dwSkillPoint));
	APPEND_IPARAM_INT  (AdoGame, "@ChaHP",         pCharData2->m_sHP.nNow);
	APPEND_IPARAM_INT  (AdoGame, "@ChaMP",         pCharData2->m_sMP.nNow);
	APPEND_IPARAM_INT  (AdoGame, "@ChaSP",         pCharData2->m_sSP.nNow);
	APPEND_IPARAM_INT  (AdoGame, "@ChaPK",         static_cast<int> (pCharData2->m_wPK));
	APPEND_IPARAM_INT  (AdoGame, "@ChaStartMap",   static_cast<int> (pCharData2->m_sStartMapID.dwID));
	APPEND_IPARAM_INT  (AdoGame, "@ChaStartGate",  static_cast<int> (pCharData2->m_dwStartGate));
	APPEND_IPARAM_FLOAT(AdoGame, "@ChaPosX",       pCharData2->m_vStartPos.x);
	APPEND_IPARAM_FLOAT(AdoGame, "@ChaPosY",       pCharData2->m_vStartPos.y);
	APPEND_IPARAM_FLOAT(AdoGame, "@ChaPosZ",       pCharData2->m_vStartPos.z);
	APPEND_IPARAM_INT  (AdoGame, "@ChaSaveMap",    static_cast<int> (pCharData2->m_sSaveMapID.dwID));
	APPEND_IPARAM_FLOAT(AdoGame, "@ChaSavePosX",   pCharData2->m_vSavePos.x);
	APPEND_IPARAM_FLOAT(AdoGame, "@ChaSavePosY",   pCharData2->m_vSavePos.y);
	APPEND_IPARAM_FLOAT(AdoGame, "@ChaSavePosZ",   pCharData2->m_vSavePos.z);
	APPEND_IPARAM_INT  (AdoGame, "@ChaReturnMap",  static_cast<int> (pCharData2->m_sLastCallMapID.dwID));
	APPEND_IPARAM_FLOAT(AdoGame, "@ChaReturnPosX", pCharData2->m_vLastCallPos.x);
	APPEND_IPARAM_FLOAT(AdoGame, "@ChaReturnPosY", pCharData2->m_vLastCallPos.y);
	APPEND_IPARAM_FLOAT(AdoGame, "@ChaReturnPosZ", pCharData2->m_vLastCallPos.z);

	LONGLONG ChaReExp = sc::db::AdjustMoney(pCharData2->m_lnRestorableExp);
	APPEND_IPARAM_MONEY(AdoGame, "@ChaReExp",      ChaReExp);

	APPEND_IPARAM_SMALL(AdoGame, "@ChaSafeTime",   sc::db::AdjustSmallInt(pCharData2->m_fCDMSafeTime));
	APPEND_IPARAM_INT  (AdoGame, "@ChaCP",         static_cast<int> (pCharData2->m_sCP.dwData));
	APPEND_IPARAM_INT  (AdoGame, "@ChaNum",        static_cast<int> (dwChaNum));

	APPEND_OPARAM_INT(AdoGame, "@nReturn");
	
	nRet = AdoGame.ExecuteStoredProcedureIntReturn("dbo.sp_TransWorldBattle", "@nReturn");


    return nRet;
}

int AdoManager::CalculateExpCompressor( DWORD dwChaDbNum, __int64 nCurExp, __int64 nCompressedExp )
{
	sc::db::AdoExt AdoGame(m_GameDBConnString);

	APPEND_IPARAM_INT(AdoGame, "@ChaNum",	dwChaDbNum);
	LONGLONG curExp = sc::db::AdjustMoney(nCurExp);
	APPEND_IPARAM_MONEY(AdoGame, "@CurExp",      curExp);
	LONGLONG compressedExp = sc::db::AdjustMoney(nCompressedExp);
	APPEND_IPARAM_MONEY(AdoGame, "@CompressedExp",      compressedExp);

	if (ExecuteStoredProcedure("dbo.sp_ExpCompressed", AdoGame) != sc::db::DB_OK)
	{
		sc::writeLogError(std::string("AdoManager::CalculateExpCompressor() - ExecuteStoredProcedure failure."));

		return sc::db::DB_ERROR;
	}

	return sc::db::DB_OK;

}


} // namespace db
