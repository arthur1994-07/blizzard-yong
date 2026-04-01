#include "pch.h"
#include "../../../SigmaCore/gassert.h"
#include "../../../SigmaCore/Log/LogMan.h"
#include "../../../SigmaCore/String/StringFormat.h"
#include "../../../RanLogic/Msg/GLContrlBaseMsg.h"
#include "../../../RanLogic/Msg/GLContrlCharJoinMsg.h"
#include "../../../RanLogic/Character/CharacterSlot/GLCharSlotMan.h"
#include "../../Msg/AgentMsg.h"

#include "./AdoExt.h"
#include "./ADOManager.h"

// ----------------------------------------------------------------------------
#include "../../../SigmaCore/DebugInclude.h"
// ----------------------------------------------------------------------------

namespace db
{

typedef DWORD (SCHARDATA2::*FUNC_GETMAKINGCHUNKSIZE)();
typedef BOOL (SCHARDATA2::*FUNC_GETCHUNKFILLDATA)( BYTE* pDest, const DWORD dwDestSize );

DWORD MakeCharSpecificChunk( _variant_t&				var,
							 sc::db::AdoExt&			Ado,
							 FUNC_GETMAKINGCHUNKSIZE	funGetMakingChunkSize,
							 FUNC_GETCHUNKFILLDATA		funGetChunkFillData,
							 SCHARDATA2*				pChar,
							 char*						szFuncText )
{
	GASSERT( funGetMakingChunkSize );
	GASSERT( funGetChunkFillData );
	GASSERT( pChar );

	DWORD			dwSize = (pChar->*funGetMakingChunkSize)();
	if( dwSize > 0 )
	{
		if( Ado.CreateChunk( var, dwSize ) )
		{
			BYTE*	pBuffer;
			if( sc::db::AccessVariantChunk( (void**)&pBuffer, var ) )
			{
				(pChar->*funGetChunkFillData)( pBuffer, dwSize );
				sc::db::UnaccessVariantChunk( var );
			}
		}
		else
		{
			sc::writeLogError(
				sc::string::format(
				"%1% Makechunk Cha %2% Size %3%",
				szFuncText,
				pChar->m_CharDbNum,
				dwSize));
		}
	}
	else
	{
		var = VT_NULL;
		dwSize	= sizeof( _variant_t );

		sc::writeLogError(
			sc::string::format(
			"%1% dwSize 0 Cha %2%",
			szFuncText,
			pChar->m_CharDbNum));
	}

	return dwSize;
}

typedef DWORD ( SCHAR_SLOT_DATA::*FUNC_GETMAKINGCHUNKSIZE_CHARSLOT_DATA )() const;
typedef BOOL ( SCHAR_SLOT_DATA::*FUNC_GETCHUNKFILLDATA_CHARSLOT_DATA )( BYTE* pDest, const DWORD dwDestSize ) const;

DWORD MakeCharSpecificChunk_CharSlotData ( _variant_t&								var
										 , sc::db::AdoExt&							Ado
										 , FUNC_GETMAKINGCHUNKSIZE_CHARSLOT_DATA	funGetMakingChunkSize
										 , FUNC_GETCHUNKFILLDATA_CHARSLOT_DATA		funGetChunkFillData
										 , const SCHAR_SLOT_DATA&					sCharSlotData )
{
	GASSERT( funGetMakingChunkSize );
	GASSERT( funGetChunkFillData );

	DWORD dwSize = (sCharSlotData.*funGetMakingChunkSize)();
	if( dwSize > 0 )
	{
		if( Ado.CreateChunk( var, dwSize ) )
		{
			BYTE*	pBuffer;
			if( sc::db::AccessVariantChunk( (void**)&pBuffer, var ) )
			{
				(sCharSlotData.*funGetChunkFillData)( pBuffer, dwSize );
				sc::db::UnaccessVariantChunk( var );
			}
		}
	}
	else
	{
		var = VT_NULL;
		dwSize	= sizeof( _variant_t );
	}

	return dwSize;
}

int AdoManager::UpdateUserLockerOption( DWORD UserNum, int Option )
{
	sc::db::AdoExt AdoGame( m_GameDBConnString );
	APPEND_IPARAM_INT( AdoGame, "@UserNum", UserNum );
	APPEND_IPARAM_INT( AdoGame, "@Option", Option );
	return AdoGame.ExecuteStoredProcedure( "dbo.sp_UpdateUserInvenOption" );
}

int AdoManager::SaveCharacter( LPVOID _pbuffer, bool bAutoSave /*= false*/ )
{
    if (!_pbuffer)
        return sc::db::DB_ERROR;

	int nDBRet = sc::db::DB_OK;

	SCHARDATA2* pCharData2 = reinterpret_cast<SCHARDATA2*> (_pbuffer);

	DWORD dwChaNum = pCharData2->m_CharDbNum;
	
	// 해킹한 캐릭터의 경우 레벨이 0 으로 세팅될 가능성이 많다.	
	if (dwChaNum == 0 || pCharData2->m_wLevel == 0)
		return sc::db::DB_ERROR;

	sc::writeLogInfo ( sc::string::format( "Start SaveCharacter %1%", dwChaNum ) );
    
    DWORD dwUserNum = pCharData2->GetUserID();
    DWORD dwSvrNum = pCharData2->m_dwServerID;
    DWORD dwChaID = pCharData2->m_CharDbNum;

	nDBRet = SaveCharacterBase( pCharData2, dwChaNum );

	if ( sc::db::DB_ERROR_OUTOFMEMORY == nDBRet )
	{
		return sc::db::DB_ERROR_OUTOFMEMORY;
	}
	
	//se::ByteStream ByteStream;
	//LPBYTE pBuffer = NULL;
	//DWORD dwSize = 0;
	
	// Skill 
    //SaveCharacterSkill(pCharData2);

	// Skill Quick Slot
    //SaveCharacterSkillQuickSlot(pCharData2);
	
	// 2003-11-27 : Add
	// Action Quick Slot
    SaveCharacterActionQuickSlot(pCharData2);	

	// Put on item
	//if ( sc::db::DB_ERROR_OUTOFMEMORY == SaveCharacterPutOnItems(pCharData2) )
	//{
	//	return sc::db::DB_ERROR_OUTOFMEMORY;
	//}
	SaveCharacterPutOnItemsNew( pCharData2 );
	
	// Inventory
	//if ( sc::db::DB_ERROR_OUTOFMEMORY == SaveCharacterInventory(pCharData2) )
	//{
	//	return sc::db::DB_ERROR_OUTOFMEMORY;
	//}
	SaveCharacterInventoryNew( pCharData2 );
	
	//if (m_ServiceProvider == SP_VIETNAM)
	//{
	//	// VT ADD Inventory Save
    //    SaveCharacterInventoryVietnam(pCharData2);		
	//}

	if (m_ServiceProvider == SP_HONGKONG)
	{
		// 대만 해킹문제로 인해서 로그아웃 하기전 ChaLevel이랑 ChaMoney 값 DB에 저장
        if (SaveCharacterTaiwan(pCharData2) == sc::db::DB_ERROR)
            return sc::db::DB_ERROR;
	}
/*
#if defined(TH_PARAM) || defined(_RELEASED)	|| defined(MY_PARAM) || defined(MYE_PARAM) 
	{
		NET_CHA_BBA_INFO_DH msg;
		msg.nmg.nType = NET_MSG_CHA_BAINFO_AC;
		GetChaBAInfo(dwUserNum, dwSvrNum, &msg);
		// 태국 말레이시아에 생성한 유저수를 저장한다.
		SetUserTempInfo(dwUserNum, msg.m_ChaServerTotalNum );
	}
#endif
*/
	// Character Quest information
	if ( sc::db::DB_ERROR_OUTOFMEMORY == SaveCharacterQuest(pCharData2) )
	{
		return sc::db::DB_ERROR_OUTOFMEMORY;
	}

	// 퀘스트 아이템 저장
	SaveCharacterQuestItems( pCharData2 );
	
    SaveCharacterCoolTime(pCharData2);

    SaveCharacterSkillFact(pCharData2);

	// 고용 소환수 정보 저장
	SaveCharacterHireSummon(pCharData2);

	// 캐릭터 슬롯 정보 저장
	SaveCharacterSlots(pCharData2);

    // 사용자 인벤토리 저장
    //SaveUserInven(pCharData2);
	SaveUserInvenNew( pCharData2 );
	
	// 유저락커 잠금 해제	
	if ( false == bAutoSave )
	{
		int UserInvenOption = 0;
		sc::db::AdoExt AdoGame( m_GameDBConnString );
		APPEND_IPARAM_INT( AdoGame, "@UserNum", pCharData2->GetUserID() );
		APPEND_IPARAM_INT( AdoGame, "@Option", UserInvenOption );
		AdoGame.ExecuteStoredProcedure( "dbo.sp_UpdateUserInvenOption" );
	}

	// LearnProductBook
	//pCharData2->GetLearnProductBook( ByteStream );
	//ByteStream.GetBuffer( pBuffer, dwSize );
	//if( pBuffer )
	//{
	//	std::string Query(
	//		sc::string::format(
	//			"UPDATE ChaInfo SET ChaInfo.ProductBook=? WHERE (ChaNum=%u)", dwChaNum ) );
	//	m_pGameDB->WriteImage( Query.c_str(), dwChaNum, (BYTE *)pBuffer, dwSize );

	//	pBuffer = NULL;
	//}

	sc::writeLogInfo ( sc::string::format( "End SaveCharacter %1%", dwChaNum ) );

	if( nDBRet == sc::db::DB_OK_CHAR_ERROR )
		return nDBRet;
	else 
		return sc::db::DB_OK;
}

int AdoManager::SaveCharacterBase(SCHARDATA2* pCharData2, DWORD ChaDbNum)
{
	int nRet = sc::db::DB_OK;

	if( pCharData2 == NULL )
		return sc::db::DB_ERROR;

	if (pCharData2->m_dwUserLvl < USER_GM4)
	{
		if( pCharData2->ValidationCharData() == TRUE)
		{
			nRet = sc::db::DB_OK_CHAR_ERROR;
		}
	}

    // 베트남 탐직방지 시스템의 추가로 캐릭터 저장하는 부분의 수정
    if (m_ServiceProvider == SP_VIETNAM)
    {
        std::string Query = sc::string::format(
            "UPDATE ChaInfo SET "
            "ChaBright=%1%, ChaLevel=%2%, ChaMoney=%3%, ChaDex=%4%, ChaIntel=%5%, "
            "ChaSchool=%6%, ChaHair=%7%, ChaFace=%8%, ChaLiving=%9%, ChaStrong=%10%, "
            "ChaPower=%11%, ChaSpirit=%12%, ChaStrength=%13%, ChaStRemain=%14%, ChaAttackP=%15%, "
            "ChaDefenseP=%16%, ChaFightA=%17%, ChaShootA=%18%, ChaMagicA=%19%, ChaExp=%20%, ChaSkillPoint=%21%, "
            "ChaHP=%22%, ChaMP=%23%, ChaSP=%24%, ChaPK=%25%, ChaStartMap=%26%, "
            "ChaStartGate=%27%, ChaPosX=%28%, ChaPosY=%29%, ChaPosZ=%30%, ChaSaveMap=%31%, "
            "ChaSavePosX=%32%, ChaSavePosY=%33%, ChaSavePosZ=%34%, ChaReturnMap=%35%, ChaReturnPosX=%36%, "
            "ChaReturnPosY=%37%, ChaReturnPosZ=%38%, saveMoney=%39%, saveExp=%40%, itemCount=%41%, "
            "ChaReExp=%42%, ChaSafeTime=%43%, ChaCP=44 "
            "WHERE ChaNum=%45%", 
            pCharData2->m_nBright, 
            pCharData2->m_wLevel, 
            pCharData2->GetInvenMoney(), 
            pCharData2->m_sStats.wDex, 
            pCharData2->m_sStats.wInt, 

            pCharData2->m_wSchool, 
            pCharData2->m_wHair, 
            pCharData2->m_wFace, 
            pCharData2->m_nLiving, 
            pCharData2->m_sStats.wStr, 

            pCharData2->m_sStats.wPow, 
            pCharData2->m_sStats.wSpi, 
            pCharData2->m_sStats.wSta, 
            pCharData2->m_wStatsPoint,

            pCharData2->m_powerAttack,
            pCharData2->m_powerDefence,

            pCharData2->m_powerAttribute[SKILL::EMAPPLY_MELEE], 
            pCharData2->m_powerAttribute[SKILL::EMAPPLY_RANGE],
			pCharData2->m_powerAttribute[SKILL::EMAPPLY_MAGIC],
            pCharData2->m_sExperience.lnNow, 
            pCharData2->m_dwSkillPoint, 

            pCharData2->m_sHP.nNow, 
            pCharData2->m_sMP.nNow, 
            pCharData2->m_sSP.nNow, 
            pCharData2->m_wPK, 
            pCharData2->m_sStartMapID.dwID,

            pCharData2->m_dwStartGate, 
            pCharData2->m_vStartPos.x, 
            pCharData2->m_vStartPos.y, 
            pCharData2->m_vStartPos.z,
            (int) pCharData2->m_sSaveMapID.dwID, 

            pCharData2->m_vSavePos.x, 
            pCharData2->m_vSavePos.y, 
            pCharData2->m_vSavePos.z, 
            (int) pCharData2->m_sLastCallMapID.dwID, 
            pCharData2->m_vLastCallPos.x,

            pCharData2->m_vLastCallPos.y, 
            pCharData2->m_vLastCallPos.z,            
            pCharData2->m_lVNGainSysMoney,
            pCharData2->m_lVNGainSysExp,
            pCharData2->m_dwVietnamInvenCount,		

            pCharData2->m_lnRestorableExp,
            (short)pCharData2->m_fCDMSafeTime,
            pCharData2->m_sCP.dwData,
			pCharData2->m_dwPKScore,
			pCharData2->m_dwPKDeath,
            ChaDbNum);

        sc::db::AdoExt AdoGame(m_GameDBConnString);
        if (AdoGame.Execute4Cmd(Query))
        {
            return sc::db::DB_ERROR;
        }
        else
        {
            sc::writeLogError("AdoManager::SaveCharacterBase");
            return sc::db::DB_ERROR;
        }
    }
    else
    {
        sc::db::AdoExt AdoGame(m_GameDBConnString);
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
        APPEND_IPARAM_INT  (AdoGame, "@ChaNum",        static_cast<int> (ChaDbNum));
		INT nChaMacroT = static_cast<int>(pCharData2->m_fRemainMacroTime);
		APPEND_IPARAM_INT  (AdoGame, "@ChaMacroT",     nChaMacroT);
		APPEND_IPARAM_INT  (AdoGame, "@SkillSlotNum",  static_cast<int>( pCharData2->m_wSlotIndex ) );
		APPEND_IPARAM_INT  (AdoGame, "@ChaRebornNum",     static_cast<int> (pCharData2->m_wRebornNum));
		APPEND_IPARAM_INT  (AdoGame, "@ChaPkScore",     static_cast<int> (pCharData2->m_dwPKScore));
		APPEND_IPARAM_INT  (AdoGame, "@ChaPkDeath",     static_cast<int> (pCharData2->m_dwPKDeath));

		HRESULT hResult = AdoGame.ExecuteStoredProcedureNew( "dbo.ChaInfoUpdateBase" );
		if ( E_OUTOFMEMORY == hResult )
		{
			return sc::db::DB_ERROR_OUTOFMEMORY;
		}

		if ( SUCCEEDED( hResult ) )
		{
			if( nRet == sc::db::DB_OK_CHAR_ERROR )
				return sc::db::DB_OK_CHAR_ERROR;
			else 
				return sc::db::DB_OK;
		}
		else
		{
			sc::writeLogError( "AdoManager::SaveCharacterBase" );
			return sc::db::DB_ERROR;
		}

    }
}

int AdoManager::SaveInventoryAndGameMoney( LPVOID _pbuffer )
{
    if ( !_pbuffer )
        return sc::db::DB_ERROR;

	int nDBRet = sc::db::DB_OK;
	SCHARDATA2* pCharData2 = reinterpret_cast< SCHARDATA2* >( _pbuffer );

	DWORD dwChaNum = pCharData2->m_CharDbNum;
	
	if ( dwChaNum == 0 || pCharData2->m_wLevel == 0 )
		return sc::db::DB_ERROR;
	
	// 게임머니만 세이브하려 했으나, 
	nDBRet = SaveCharacterBase( pCharData2, dwChaNum );

	// Inventory
    SaveCharacterInventory(pCharData2);
	

	if( nDBRet == sc::db::DB_OK_CHAR_ERROR )
		return sc::db::DB_OK_CHAR_ERROR;
	else
		return sc::db::DB_OK;
}

int AdoManager::SaveCharacterSkill(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;

    DWORD ChaDbNum = pChar->m_CharDbNum;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

    _variant_t	varBlob;
	DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
												AdoGame, 
												&SCHARDATA2::GetExpSkillsDataSize, 
												&SCHARDATA2::GetExpSkillsData,
												pChar,
												"SaveCharacterSkill" );

	APPEND_IPARAM_IMAGE(AdoGame, "@ChaSkills", varBlob, dwSize);

    if (AdoGame.ExecuteStoredProcedure("dbo.ChaInfoUpdateChaSkills"))
        return sc::db::DB_OK;
    else
        return sc::db::DB_ERROR;
}

int AdoManager::SaveCharacterSkillQuickSlot(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;

    DWORD ChaDbNum = pChar->m_CharDbNum;
   
    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

    _variant_t	varBlob;
	DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
												AdoGame, 
												&SCHARDATA2::GetSkillQuickSlotDataSize, 
												&SCHARDATA2::GetSkillQuickSlotData,
												pChar,
												"SaveCharacterSkillQuickSlot" );

    APPEND_IPARAM_IMAGE(AdoGame, "@ChaSkillSlot", varBlob, dwSize);

    if (AdoGame.ExecuteStoredProcedure("dbo.ChaInfoUpdateChaSkillSlot"))
        return sc::db::DB_OK;
    else
        return sc::db::DB_ERROR;    
}

int AdoManager::SaveCharacterActionQuickSlot(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;

    DWORD ChaDbNum = pChar->m_CharDbNum;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

    _variant_t	varBlob;
	DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
												AdoGame, 
												&SCHARDATA2::GetActionQuickSlotDataSize, 
												&SCHARDATA2::GetActionQuickSlotData,
												pChar,
												"SaveCharacterSkillActionQuickSlot" );

    APPEND_IPARAM_IMAGE(AdoGame, "@ChaActionSlot", varBlob, dwSize);

    if (AdoGame.ExecuteStoredProcedure("dbo.ChaInfoUpdateChaActionSlot"))
        return sc::db::DB_OK;
    else
        return sc::db::DB_ERROR;
}

int AdoManager::SaveCharacterPutOnItems(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;

    DWORD ChaDbNum = pChar->m_CharDbNum;
  
    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

    _variant_t	varBlob;
	DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
												AdoGame, 
												&SCHARDATA2::GetPutOnItemsDataSize, 
												&SCHARDATA2::GetPutOnItemsData,
												pChar,
												"SaveCharacterPutOnItems" );

    APPEND_IPARAM_IMAGE(AdoGame, "@ChaPutOnItems", varBlob, dwSize);

	HRESULT hResult = AdoGame.ExecuteStoredProcedureNew( "dbo.ChaInfoUpdateChaPutOnItems" );
	if ( E_OUTOFMEMORY == hResult )
	{
		return sc::db::DB_ERROR_OUTOFMEMORY;
	}

	if ( SUCCEEDED( hResult ) )
	{
		return sc::db::DB_OK;
	}
	else
	{
		sc::writeLogError( "AdoManager::SaveCharacterPutOnItems" );
		return sc::db::DB_ERROR;
	}
}

int AdoManager::SaveCharacterPutOnItemsNew( SCHARDATA2* pChar )
{
	if ( !pChar )
		return sc::db::DB_ERROR;

	DWORD ChaDbNum = pChar->m_CharDbNum;

	std::vector< SINVENITEM_SAVE > vecItems;
	pChar->GETPUTONITEMS_BYVECTOR( vecItems );

	size_t ItemSize = vecItems.size();
	for ( size_t loop = 0; loop < ItemSize; loop++ )
	{
		SINVENITEM_SAVE& sItem = vecItems[loop];
		int DbState = sItem.sItemCustom.GetDbState();
		if ( db::DB_INSERT == DbState )
		{
			ItemInsert( ChaDbNum, INVEN_PUTON, &vecItems[loop], INSERT_PUTON_ITEM );
		}
		else if ( db::DB_UPDATE == DbState )
		{
			ItemUpdate( ChaDbNum, INVEN_PUTON, &vecItems[loop], UPDATE_PUTON_ITEM );
		}
		else if ( db::DB_DELETE == DbState )
		{
			ItemDelete( vecItems[loop].sItemCustom.GetGuid(), db::DB_DELETE, DELETE_PUTON_ITEM );
		}
		else
		{
			sc::writeLogError( sc::string::format( "AdoManager::SaveCharacterPutOnItemsNew unknown type %1%", DbState ) );
		}
	}
	return sc::db::DB_OK;
}

int AdoManager::SaveCharacterInventoryNew( SCHARDATA2* pChar )
{
	if ( !pChar )
		return sc::db::DB_ERROR;

	DWORD ChaDbNum = pChar->m_CharDbNum;

	std::vector< SINVENITEM_SAVE > vecItems;
	pChar->m_cInventory.GET_ITEM_BY_VECTOR( vecItems );

	size_t ItemSize = vecItems.size();
	for ( size_t loop = 0; loop < ItemSize; loop++ )
	{
		SINVENITEM_SAVE& sItem = vecItems[loop];
		int DbState = sItem.sItemCustom.GetDbState();
		if ( db::DB_INSERT == DbState )
		{
			ItemInsert( ChaDbNum, INVEN_INVEN, &vecItems[loop], INSERT_INVEN_ITEM );
		}
		else if ( db::DB_UPDATE == DbState )
		{
			ItemUpdate( ChaDbNum, INVEN_INVEN, &vecItems[loop], UPDATE_INVEN_ITEM );
		}
		else if ( db::DB_DELETE == DbState )
		{
			ItemDelete( vecItems[loop].sItemCustom.GetGuid(), db::DB_DELETE, DELETE_INVEN_ITEM );
		}
		else
		{
			sc::writeLogError( sc::string::format( "AdoManager::SaveCharacterInventoryNew unknown type %1%", DbState ) );
		}
	}
	return sc::db::DB_OK;
}

int AdoManager::SaveUserInvenNew( SCHARDATA2* pChar )
{
	if ( !pChar )
		return sc::db::DB_ERROR;

	if ( !pChar->m_bServerStorage )
		return sc::db::DB_ERROR;

	DWORD UserNum = pChar->GetUserID();

	__int64 llMoney = pChar->GetStorageMoney();
	if ( llMoney < 0 )
	{
		sc::writeLogError( sc::string::format( "$$$$$ Unusual money DB tried save.... $$$$$, %1%, %2%", UserNum, llMoney ) );
		llMoney = 0;
	}

	llMoney = sc::db::AdjustMoney( llMoney );

	sc::db::AdoExt AdoGame( m_GameDBConnString );
	APPEND_IPARAM_INT( AdoGame, "@nUserNum", UserNum );
	APPEND_IPARAM_MONEY( AdoGame, "@llMoney",  llMoney );
	switch ( m_ServiceProvider )
	{
	case SP_HONGKONG:
		AdoGame.ExecuteStoredProcedure("dbo.UpdateUserMoney_3B2C75D1D26646AB9B3E561A3F6CD095");
		break;
	default:
		AdoGame.ExecuteStoredProcedure("dbo.UpdateUserMoney");
		break;
	}

	std::vector< SINVENITEM_SAVE > vecItems;
	pChar->GETSTORAGE_BYVECTOR( vecItems );

	size_t ItemSize = vecItems.size();
	for ( size_t loop = 0; loop < ItemSize; loop++ )
	{
		SINVENITEM_SAVE& sItem = vecItems[loop];
		int DbState = sItem.sItemCustom.GetDbState();
		if ( db::DB_INSERT == DbState )
		{
			ItemInsert( UserNum, INVEN_LOCKER, &vecItems[loop], INSERT_USER_LOCKER_ITEM );
		}
		else if ( db::DB_UPDATE == DbState )
		{
			ItemUpdate( UserNum, INVEN_LOCKER, &vecItems[loop], UPDATE_USER_LOCKER_ITEM );
		}
		else if ( db::DB_DELETE == DbState )
		{
			ItemDelete( vecItems[loop].sItemCustom.GetGuid(), db::DB_DELETE, DELETE_USER_LOCKER_ITEM );
		}
		else
		{
			sc::writeLogError( sc::string::format( "AdoManager::SaveUserInvenNew unknown type %1%", DbState ) );
		}
	}

	return sc::db::DB_OK;
}

int AdoManager::SaveCharacterInventory(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;

    DWORD ChaDbNum = pChar->m_CharDbNum;

    sc::db::AdoExt AdoGame(m_GameDBConnString);

	APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

	_variant_t varBlob;
	DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
												AdoGame, 
												&SCHARDATA2::GetInventoryDataSize, 
												&SCHARDATA2::GetInventoryData,
												pChar,
												"SaveCharacterInventory" );

	APPEND_IPARAM_IMAGE(AdoGame, "@ChaInven", varBlob, dwSize);

	HRESULT hResult = AdoGame.ExecuteStoredProcedureNew( "dbo.ChaInfoUpdateChaInven" );
	if ( E_OUTOFMEMORY == hResult )
	{
		return sc::db::DB_ERROR_OUTOFMEMORY;
	}

	if ( SUCCEEDED( hResult ) )
	{
		return sc::db::DB_OK;
	}
	else
	{
		sc::writeLogError( "AdoManager::SaveCharacterInventory" );
		return sc::db::DB_ERROR;
	}
}

int AdoManager::SaveCharacterInventoryVietnam(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;

    DWORD ChaDbNum = pChar->m_CharDbNum;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

    _variant_t	varBlob;
	DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
												AdoGame, 
												&SCHARDATA2::GetVTAddInventoryDataSize, 
												&SCHARDATA2::GetVTAddInventoryData,
												pChar,
												"SaveCharacterInventoryVietnam" );

    APPEND_IPARAM_IMAGE(AdoGame, "@VTAddInven", varBlob, dwSize);

    if (AdoGame.ExecuteStoredProcedure("dbo.ChaInfoUpdateChaInvenVietnam"))
        return sc::db::DB_OK;
    else
        return sc::db::DB_ERROR;
}

int AdoManager::SaveCharacterTaiwan(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;

    DWORD ChaDbNum = pChar->m_CharDbNum;
    {
/*
        dbo.sp_InsertChaLastInfo
            @nChaLevel int,
            @lnChaMoney varchar(100),
            @nChaNum int
*/
        // 대만 해킹문제로 인해서 로그아웃 하기전 ChaLevel이랑 ChaMoney 값 DB에 저장
        // 저장할 GameMoney를 암호화 한다.
        std::string EncryptMoney = ENCRYPTMONEY(pChar->GetInvenMoney());
        char szTempMoney[CHAR_TEMPMONEY] = {0};
        StringCchCopy(szTempMoney, CHAR_TEMPMONEY, EncryptMoney.c_str());
        
        sc::db::AdoExt AdoGame(m_GameDBConnString);
        APPEND_IPARAM_INT    (AdoGame, "@nChaLevel",  pChar->m_wLevel);
        APPEND_IPARAM_VARCHAR(AdoGame, "@lnChaMoney", szTempMoney, strlen(szTempMoney));
        APPEND_IPARAM_INT    (AdoGame, "@nChaNum",    ChaDbNum);
        
        if (!AdoGame.ExecuteStoredProcedure("dbo.sp_InsertChaLastInfo"))
            return sc::db::DB_ERROR;
    }

    {
/*
        CREATE PROCEDURE [dbo].[sp_InsertUserLastInfo]
            @nUserNum int,
            @lnUserMoney varchar(100)
*/
        std::string UserMoney = ENCRYPTMONEY(pChar->GetStorageMoney());
        char szTempMoney[CHAR_TEMPMONEY] = {0};
        StringCchCopy(szTempMoney, CHAR_TEMPMONEY, UserMoney.c_str());

        sc::db::AdoExt AdoGame2(m_GameDBConnString);
        APPEND_IPARAM_INT    (AdoGame2, "@nUserNum",    pChar->GetUserID());
        APPEND_IPARAM_VARCHAR(AdoGame2, "@lnUserMoney", szTempMoney, strlen(szTempMoney));

        if (!AdoGame2.ExecuteStoredProcedure("dbo.sp_InsertUserLastInfo"))
            return sc::db::DB_ERROR;
    }

    return sc::db::DB_OK;
}

int AdoManager::SaveCharacterQuest(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;

    DWORD ChaDbNum = pChar->m_CharDbNum;

	sc::db::AdoExt AdoGame(m_GameDBConnString);
	APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

	_variant_t	varBlob;
	DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
												AdoGame, 
												&SCHARDATA2::GetQuestPlayDataSize, 
												&SCHARDATA2::GetQuestPlayData,
												pChar,
												"SaveCharacterQuest" );

    APPEND_IPARAM_IMAGE( AdoGame, "@ChaQuest", varBlob, dwSize );

	HRESULT hResult = AdoGame.ExecuteStoredProcedureNew( "dbo.ChaInfoUpdateChaQuest" );
	if ( E_OUTOFMEMORY == hResult )
	{
		return sc::db::DB_ERROR_OUTOFMEMORY;
	}

	if ( SUCCEEDED( hResult ) )
	{
		return sc::db::DB_OK;
	}
	else
	{
		sc::writeLogError( "AdoManager::SaveCharacterQuest" );
		return sc::db::DB_ERROR;
	}
}

int AdoManager::SaveCharacterQuestItems( SCHARDATA2* pChar )
{
	if ( !pChar )
		return sc::db::DB_ERROR;

	DWORD ChaDbNum = pChar->m_CharDbNum;
	
	{
		// 진행 퀘스트
		GLQuestPlay::MAPQUEST& quest = pChar->m_cQuestPlay.GetQuestProc();
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
				sItem.sItemCustom.nidDISGUISE.wMainID = pQuestProg->m_sNID.wMainID;
				sItem.sItemCustom.nidDISGUISE.wSubID = pQuestProg->m_sNID.wSubID;

				int DbState = sItem.sItemCustom.GetDbState();
				if ( db::DB_INSERT == DbState )
				{
					ItemInsert( ChaDbNum, INVEN_QUEST_PROC, &vecItems[loop], INSERT_QUEST_ITEM );
				}
				else if ( db::DB_UPDATE == DbState )
				{
					ItemUpdate( ChaDbNum, INVEN_QUEST_PROC, &vecItems[loop], UPDATE_QUEST_ITEM );
				}
				else if ( db::DB_DELETE == DbState )
				{
					ItemDelete( vecItems[loop].sItemCustom.GetGuid(), db::DB_DELETE, DELETE_QUEST_ITEM );
				}
				else
				{
					sc::writeLogError( sc::string::format( "AdoManager::SaveCharacterQuestItems proc unknown type %1% guid %2% mid %3% sid %4%", 
						DbState, 
						sc::string::uuidToString( vecItems[loop].sItemCustom.GetGuid() ).c_str(),
						vecItems[loop].sItemCustom.GetNativeID().wMainID, 
						vecItems[loop].sItemCustom.GetNativeID().wSubID ) );
				}
			}
		}
	}

	{
		// 완료 퀘스트
		GLQuestPlay::MAPQUEST& quest = pChar->m_cQuestPlay.GetQuestEnd();
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
				sItem.sItemCustom.nidDISGUISE.wMainID = pQuestProg->m_sNID.wMainID;
				sItem.sItemCustom.nidDISGUISE.wSubID = pQuestProg->m_sNID.wSubID;

				int DbState = sItem.sItemCustom.GetDbState();
				if ( db::DB_INSERT == DbState )
				{
					ItemInsert( ChaDbNum, INVEN_QUEST_END, &vecItems[loop], INSERT_QUEST_END_ITEM );
				}
				else if ( db::DB_UPDATE == DbState )
				{
					ItemUpdate( ChaDbNum, INVEN_QUEST_END, &vecItems[loop], UPDATE_QUEST_END_ITEM );
				}
				else if ( db::DB_DELETE == DbState )
				{
					ItemDelete( vecItems[loop].sItemCustom.GetGuid(), db::DB_DELETE, DELETE_QUEST_END_ITEM );
				}
				else
				{
					sc::writeLogError( sc::string::format( "AdoManager::SaveCharacterQuestItems(End) proc unknown type %1% guid %2% mid %3% sid %4%", 
						DbState, 
						sc::string::uuidToString( vecItems[loop].sItemCustom.GetGuid() ).c_str(),
						vecItems[loop].sItemCustom.GetNativeID().wMainID, 
						vecItems[loop].sItemCustom.GetNativeID().wSubID ) );
				}
			}
		}
	}
	return sc::db::DB_OK;
}

int AdoManager::SavePetInven( int nChaNum, int nPetNum, std::vector< SINVENITEM_SAVE >& vecItems )
{
	size_t ItemSize = vecItems.size();
	for ( size_t loop = 0; loop < ItemSize; loop++ )
	{
		// Pet puton Item 일 경우 아이템 테이블에 ChaNum 이 PetNum 이다. 
		SINVENITEM_SAVE& sItem = vecItems[loop];
		int DbState = sItem.sItemCustom.GetDbState();
		if ( db::DB_INSERT == DbState )
		{
			ItemInsert( nPetNum, INVEN_PET, &vecItems[loop], INSERT_PET_ITEM );
		}
		else if ( db::DB_UPDATE == DbState )
		{
			ItemUpdate( nPetNum, INVEN_PET, &vecItems[loop], UPDATE_PET_ITEM );
		}
		else if ( db::DB_DELETE == DbState )
		{
			ItemDelete( vecItems[loop].sItemCustom.GetGuid(), db::DB_DELETE, DELETE_PET_ITEM );
		}
		else
		{
			sc::writeLogError( sc::string::format( "AdoManager::SavePetInven unknown type %1%", DbState ) );
		}
	}
	return sc::db::DB_OK;
}

int AdoManager::SaveVehicleInven( int nVehicle, int nCharNum, std::vector< SINVENITEM_SAVE >& vecItems )
{
	size_t ItemSize = vecItems.size();
	for ( size_t loop = 0; loop < ItemSize; loop++ )
	{
		// Pet puton Item 일 경우 아이템 테이블에 ChaNum 이 PetNum 이다. 
		SINVENITEM_SAVE& sItem = vecItems[loop];
		int DbState = sItem.sItemCustom.GetDbState();
		if ( db::DB_INSERT == DbState )
		{
			ItemInsert( nVehicle, INVEN_VEHICLE, &vecItems[loop], INSERT_VEHICLE_ITEM );
		}
		else if ( db::DB_UPDATE == DbState )
		{
			ItemUpdate( nVehicle, INVEN_VEHICLE, &vecItems[loop], UPDATE_VEHICLE_ITEM );
		}
		else if ( db::DB_DELETE == DbState )
		{
			ItemDelete( vecItems[loop].sItemCustom.GetGuid(), db::DB_DELETE, DELETE_VEHICLE_ITEM );
		}
		else
		{
			sc::writeLogError( sc::string::format( "AdoManager::SaveVehicleInven unknown type %1%", DbState ) );
		}
	}
	return sc::db::DB_OK;
}

int AdoManager::SaveCharacterCoolTime(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;
    
    DWORD ChaDbNum = pChar->m_CharDbNum;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

    _variant_t varBlob;
	DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
												AdoGame, 
												&SCHARDATA2::GetItemCoolTimeDataSize, 
												&SCHARDATA2::GetItemCoolTimeData,
												pChar,
												"SaveCharacterCoolTime" );

    APPEND_IPARAM_IMAGE(AdoGame, "@ChaCoolTime", varBlob, dwSize);

    if (AdoGame.ExecuteStoredProcedure("dbo.ChaInfoUpdateChaCoolTime"))
        return sc::db::DB_OK;
    else
        return sc::db::DB_ERROR;
}

int AdoManager::SaveUserInven(SCHARDATA2* pChar)
{
    if (!pChar)
	{
        return sc::db::DB_ERROR;
	}

    DWORD UserNum = pChar->GetUserID();

	if (!pChar->m_bServerStorage)
	{
		sc::writeLogError ( sc::string::format( "[ User Inven ] [ Failed Save User Inven, %1% ]", UserNum ) );

		// 돈 복사의 위험이 있어 리턴시키지 않는다;
		//return sc::db::DB_ERROR;
	}

    {
        // --------------------------------------------------------------------
        
        __int64 llMoney = pChar->GetStorageMoney();
        if (llMoney < 0)
        {
            sc::writeLogError(
                sc::string::format(
                    "$$$$$ Unusual money DB tried save.... $$$$$, %1%, %2%", UserNum, llMoney));
            llMoney = 0;
        }

        llMoney = sc::db::AdjustMoney(llMoney);

        sc::db::AdoExt AdoGame(m_GameDBConnString);
        APPEND_IPARAM_INT  (AdoGame, "@nUserNum", UserNum);
        APPEND_IPARAM_MONEY(AdoGame, "@llMoney",  llMoney);
		switch ( m_ServiceProvider )
		{
		case SP_HONGKONG:
			AdoGame.ExecuteStoredProcedure("dbo.UpdateUserMoney_3B2C75D1D26646AB9B3E561A3F6CD095");
			break;
		default:
			AdoGame.ExecuteStoredProcedure("dbo.UpdateUserMoney");

			//sc::writeLogInfo ( sc::string::format( "[ User Inven ] [ Succeed Save User Inven, %1% ]", UserNum ) );
			break;
		}
    }

    {
        // --------------------------------------------------------------------
        sc::db::AdoExt AdoGame2(m_GameDBConnString);
        APPEND_IPARAM_INT(AdoGame2, "@UserNum", UserNum);

        _variant_t	varBlob;
		DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
													AdoGame2, 
													&SCHARDATA2::GetStorageDataSize, 
													&SCHARDATA2::GetStorageData,
													pChar,
													"SaveUserInven" );

        APPEND_IPARAM_IMAGE(AdoGame2, "@UserInven", varBlob, dwSize);

        if( !AdoGame2.ExecuteStoredProcedure("dbo.UserInvenUpdate") )
            return sc::db::DB_ERROR;
    }

    return sc::db::DB_OK;
}

int AdoManager::SaveCharacterSkillFact(SCHARDATA2* pChar)
{
    if (!pChar)
        return sc::db::DB_ERROR;

    DWORD ChaDbNum = pChar->m_CharDbNum;

    sc::db::AdoExt AdoGame(m_GameDBConnString);
    APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

    _variant_t	varBlob;
	DWORD		dwSize = MakeCharSpecificChunk( varBlob, 
												AdoGame, 
												&SCHARDATA2::GetSkillFactDataSize, 
												&SCHARDATA2::GetSkillFactData,
												pChar,
												"SaveCharacterSkillFact" );

    APPEND_IPARAM_IMAGE(AdoGame, "@ChaSkillFact", varBlob, dwSize);

    if (AdoGame.ExecuteStoredProcedure("dbo.ChaInfoUpdateChaSkillFact"))
        return sc::db::DB_OK;
    else
        return sc::db::DB_ERROR;
}

int AdoManager::SaveCharacterHireSummon(SCHARDATA2* pChar)
{
	if ( !pChar )
		return sc::db::DB_ERROR;

	DWORD ChaDbNum = pChar->m_CharDbNum;
	SNATIVEID sBasicSummonID = pChar->m_sBasicSummonID;

	sc::db::AdoExt AdoGame( m_GameDBConnString );
	APPEND_IPARAM_BIGINT(AdoGame, "@CrowID", sBasicSummonID.Id() );
	APPEND_IPARAM_INT(AdoGame, "@CrowMainID", static_cast< int >( sBasicSummonID.Mid() ) );
	APPEND_IPARAM_INT(AdoGame, "@CrowSubID", static_cast< int >( sBasicSummonID.Sid() ) );
	APPEND_IPARAM_INT(AdoGame, "@ChaNum", ChaDbNum);

	if ( AdoGame.ExecuteStoredProcedure( "dbo.sp_ChaHireSummonInfoInsert" ) )
	{
		//sc::writeLogInfo ( "Save Character Hire Summon." );
		return sc::db::DB_OK;
	}
	else
		return sc::db::DB_ERROR;
}

int AdoManager::SaveCharacterSlots ( SCHARDATA2* pChar )
{
	if ( NULL == pChar )
		return sc::db::DB_ERROR;

	for ( int i=0; i<EMCHAR_SLOT_DATA_SIZE; ++i )
	{
		sc::db::AdoExt AdoGame( m_GameDBConnString );

		const SCHAR_SLOT_DATA& sSlotData =
			GLCharSlotMan::Instance()->GetSlotData( pChar->CharDbNum(), i );

		//if ( true == sSlotData.m_bLockSlot )
		//	continue;

		//	@ChaNum
		//	@SkillSlotNum
		//	@ChaPower
		//	@ChaStrong
		//	@ChaStrength
		//	@ChaSpirit
		//	@ChaDex
		//	@ChaIntel
		//	@ChaStRemain
		//	@ChaSkillPoint
		//	@ChaSkills
		//	@ChaSkillSlot
		//	@bLockSlot

		APPEND_IPARAM_INT( AdoGame, "@ChaNum", static_cast< int >( pChar->m_CharDbNum ) );
		APPEND_IPARAM_INT( AdoGame, "@SkillSlotNum", i );

		APPEND_IPARAM_INT( AdoGame, "@ChaPower", static_cast< int >( sSlotData.m_sStats.wPow ) );
		APPEND_IPARAM_INT( AdoGame, "@ChaStrong", static_cast< int >( sSlotData.m_sStats.wStr ) );
		APPEND_IPARAM_INT( AdoGame, "@ChaStrength", static_cast< int >( sSlotData.m_sStats.wSta ) );
		APPEND_IPARAM_INT( AdoGame, "@ChaSpirit", static_cast< int >( sSlotData.m_sStats.wSpi ) );
		APPEND_IPARAM_INT( AdoGame, "@ChaDex", static_cast< int >( sSlotData.m_sStats.wDex ) );
		APPEND_IPARAM_INT( AdoGame, "@ChaIntel", static_cast< int >( sSlotData.m_sStats.wInt ) );

		APPEND_IPARAM_INT( AdoGame, "@ChaStRemain", static_cast< int >( sSlotData.m_wStatsPoint ) );
		APPEND_IPARAM_INT( AdoGame, "@ChaSkillPoint", static_cast< int >( sSlotData.m_dwSkillPoint ) );

		{
			_variant_t varBlob;
			DWORD dwSize = MakeCharSpecificChunk_CharSlotData(
				varBlob, 
				AdoGame, 
				&SCHAR_SLOT_DATA::GetExpSkillsDataSize, 
				&SCHAR_SLOT_DATA::GetExpSkillsData,
				sSlotData );

			APPEND_IPARAM_IMAGE( AdoGame, "@ChaSkills", varBlob, dwSize );
		}

		{
			_variant_t	varBlob;
			DWORD dwSize = MakeCharSpecificChunk_CharSlotData(
				varBlob,
				AdoGame,
				&SCHAR_SLOT_DATA::GetSkillQuickSlotDataSize,
				&SCHAR_SLOT_DATA::GetSkillQuickSlotData,
				sSlotData );

			APPEND_IPARAM_IMAGE( AdoGame, "@ChaSkillSlot", varBlob, dwSize );
		}

		//APPEND_IPARAM_TINYINT( AdoGame, "@bLockSlot", static_cast< BYTE >( sSlotData.m_bLockSlot ) );
		APPEND_IPARAM_TINYINT( AdoGame, "@bLockSlot", static_cast< BYTE >( pChar->m_arrLockSlotState[ i ] ) );

		if ( FALSE == AdoGame.ExecuteStoredProcedure( "dbo.ChaInfoUpdateChaSlots" ) )
		{
			sc::writeLogError( "[ Character Slot ] [ Failed dbo.ChaInfoUpdateChaSlots ]" );
			return sc::db::DB_ERROR;
		}
	}

	return sc::db::DB_OK;
}

int AdoManager::SaveChaExtraInfo(UINT nChaNum, int nContributionPoint)
{
    sc::db::AdoExt ado(m_GameDBConnString);

    APPEND_IPARAM_INT(ado, "@ChaNum",			nChaNum);
    APPEND_IPARAM_INT(ado, "@ContributionPoint",nContributionPoint);

    if (ExecuteStoredProcedure("dbo.sp_SetChaExtraInfo", ado) != sc::db::DB_OK)
    {
        sc::writeLogError(std::string("AdoManager::SaveChaExtraInfo() - ExecuteStoredProcedure failure."));

        return sc::db::DB_ERROR;
    }

    //BEGIN_GETCOLLECT(ado);
    //ado.GetCollect("ContributionPoint", nContributionPoint);	
    //END_GETCOLLECT(ado);


    return sc::db::DB_OK;	
}

//! 캐릭터의 위치정보를 저장한다.
//! \param dwChaNum 캐릭터 번호
//! \param dwStartmapID 시작하는 맵 번호
//! \param dwStartGate 시작하는 게이트 번호
//! \param fStartPosX 시작하는 X 좌표
//! \param fStartPosY 시작하는 Y 좌표
//! \param fStartPosZ 시작하는 Z 좌표
//! \param dwSaveMapID 마지막으로 플레이한 맵 번호
//! \param fSavePosX 마지막으로 플레이한 X 좌표
//! \param fSavePosY 마지막으로 플레이한 Y 좌표
//! \param fSavePosZ 마지막으로 플레이한 Z 좌표
//! \param dwLastCallMapID 시작 귀환카드에 저장된 맵 번호
//! \param fLastCallPosX 시작 귀환카드에 저장된 X 좌표
//! \param fLastCallPosY 시작 귀환카드에 저장된 Y 좌표
//! \param fLastCallPosZ 시작 귀환카드에 저장된 Z 좌표
//! \return sc::db::DB_OK, sc::db::DB_ERROR
int AdoManager::SaveChaPos(
    DWORD dwChaNum,
    DWORD dwStartMapID,
    DWORD dwStartGate,
    FLOAT fStartPosX,
    FLOAT fStartPosY,
    FLOAT fStartPosZ,
    DWORD dwSaveMapID,
    FLOAT fSavePosX,
    FLOAT fSavePosY,
    FLOAT fSavePosZ,
    DWORD dwLastCallMapID,
    FLOAT fLastCallPosX,
    FLOAT fLastCallPosY,
    FLOAT fLastCallPosZ)
{
    sc::db::AdoExt AdoGame(m_GameDBConnString);
    
    APPEND_IPARAM_INT  (AdoGame, "@ChaNum",        static_cast<int> (dwChaNum));
    APPEND_IPARAM_INT  (AdoGame, "@ChaStartMap",   static_cast<int> (dwStartMapID));
    APPEND_IPARAM_INT  (AdoGame, "@ChaStartGate",  static_cast<int> (dwStartGate));
    APPEND_IPARAM_FLOAT(AdoGame, "@ChaStartPosX",  fStartPosX);
    APPEND_IPARAM_FLOAT(AdoGame, "@ChaStartPosY",  fStartPosY);
    APPEND_IPARAM_FLOAT(AdoGame, "@ChaStartPosZ",  fStartPosZ);
    APPEND_IPARAM_INT  (AdoGame, "@ChaSaveMap",    static_cast<int> (dwSaveMapID));
    APPEND_IPARAM_FLOAT(AdoGame, "@ChaSavePosX",   fSavePosX);
    APPEND_IPARAM_FLOAT(AdoGame, "@ChaSavePosY",   fSavePosY);
    APPEND_IPARAM_FLOAT(AdoGame, "@ChaSavePosZ",   fSavePosZ);
    APPEND_IPARAM_INT  (AdoGame, "@ChaReturnMap",  static_cast<int> (dwLastCallMapID));
    APPEND_IPARAM_FLOAT(AdoGame, "@ChaReturnPosX", fLastCallPosX);
    APPEND_IPARAM_FLOAT(AdoGame, "@ChaReturnPosY", fLastCallPosY);
    APPEND_IPARAM_FLOAT(AdoGame, "@ChaReturnPosZ", fLastCallPosZ);

    if (AdoGame.ExecuteStoredProcedure("dbo.ChaInfoUpdateChaPos"))
        return sc::db::DB_OK;
    else
        return sc::db::DB_ERROR;
}

// ----------------------------------------------------------------------------
} // namespace db
// ----------------------------------------------------------------------------
