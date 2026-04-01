#include "pch.h"
#include "../../RanLogicClient/RebuildCard/RebuildCard.h"
#include "../../RanLogicClient/NPCTalk/GLNpcTalkClient.h"

#include "../../RanGfxUI/GfxInterface.h"
#include "../../RanLogicClient/Widget/GLWidgetScript.h"

#include "../../RanLogic/GLogicDataMan.h"
#include "../../RanLogicClient/GLGaeaClient.h"
#include "../../RanLogic/GLUseFeatures.h"
#include "../../enginelib/GUInterface/GameTextControl.h"


#include "../Tooltip/GLItemTooltip.h"
#include "../../RanLogic/RandomAddon/RandomAddon.h" 
#include "../../RanLogic/Item/ItemBasicStat/GLItemBasicStatMan.h"

RebuildCard::RebuildCard(void)
: m_wFixedBasicStatIndex ( 0 )
, m_pItemStamp ( NULL )
{
	
}

RebuildCard::RebuildCard( const RebuildCard& value )
: m_wFixedBasicStatIndex ( 0 )
, m_pItemStamp ( NULL )
{

}

/*RebuildCard::~RebuildCard(void)
{
}*/

RebuildCard& RebuildCard::GetInstance(void)
{
	static RebuildCard m_RebuildCard;
	return m_RebuildCard;
}

const bool RebuildCard::InitRebuild(void)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if(pClient)
	{
		pClient->GetCharacter()->InitRebuildData();
		m_wFixedBasicStatIndex = 0;
		return true;
	}
	return false;
}

void RebuildCard::SetPreInventoryItem( WORD wPosX, WORD wPosY )
{
	m_sPreIventoryItem.SET( wPosX, wPosY );
}

void RebuildCard::GetPreInventoryItemPos( WORD& wOutPosX, WORD& wOutPosY )
{
	wOutPosX = m_sPreIventoryItem.wPosX;
	wOutPosY = m_sPreIventoryItem.wPosY;
}

void RebuildCard::ResetPreInventoryItem()
{
	m_sPreIventoryItem.RESET();
}

const int RebuildCard::GetRandomOLock(void) const
{
	if ( m_pItemStamp == NULL )
		return 0;

	return m_pItemStamp->sSuitOp.wReModelNum;
}

const int RebuildCard::GetOptionMaxSize(void) const
{
	return static_cast<int>(ITEM_RANDOMOP_UTILL::FixOption::FIX_MAXSIZE);
}

const LONGLONG RebuildCard::GetRebuildCost(void) const
{
	
	LONGLONG llRebuildCost(0);
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if(pClient)
	{
		llRebuildCost = pClient->GetCharacter()->GetRebuildCost();
	}

	return llRebuildCost;
}

const LONGLONG RebuildCard::GetRebuildInput(void) const
{

	LONGLONG llRebuildInput(0);
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if(pClient)
	{
		llRebuildInput = pClient->GetCharacter()->GetRebuildInput();
	}

	return llRebuildInput;
}

lua_tinker::table RebuildCard::GetRandomOpt(void) const
{
	lua_tinker::table tbRandomOpt( GLWidgetScript::GetInstance().GetLuaState() );

	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	const SITEMCUSTOM& sRebuildItem = pClient->GetCharacter()->GET_REBUILD_ITEM_BACKUP();

	int nDisplayCount = 1;
	for ( DWORD _i(0); _i < ITEM_RANDOMOP_UTILL::FixOption::FIX_MAXSIZE; ++_i )
	{
		lua_tinker::table tbOption( GLWidgetScript::GetInstance().GetLuaState() );

		const int nType( sRebuildItem.getOptType(_i) );
		if ( nType == RandomOption::RANDOM_OPTION_NULL )
			continue;
		
		const DWORD nCountFix( sRebuildItem.getOptCount(_i) );
		float fValue( sRebuildItem.getOptValue(_i) * COMMENT::ITEM_RANDOM_OPT_SCALE[nType] );
		const bool bPerRandOpt( sRebuildItem.IsPerRandOpt(nType) );
		DWORD dwRandomAbilityColor( ITEM_INFOR_COLOR::dwRandomAbility );
		
		tbOption.set( "nType", nType );
		tbOption.set( "nCountFix", nCountFix );
		tbOption.set( "fValue", fValue );
		tbOption.set( "bPerRandOpt", bPerRandOpt );
		tbOption.set( "dwColor", dwRandomAbilityColor);

		tbRandomOpt.set( nDisplayCount++, tbOption );
	}
	
	return tbRandomOpt;	
}

lua_tinker::table RebuildCard::GetRebuild_RandomOpt(void) const
{
	lua_tinker::table tbResult( GLWidgetScript::GetInstance().GetLuaState() )
		, tbRandomOpt( GLWidgetScript::GetInstance().GetLuaState() )
		, tbCacheRandomOpt( GLWidgetScript::GetInstance().GetLuaState() );

	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	const SITEMCUSTOM& sRebuildItem = pClient->GetCharacter()->GET_REBUILD_ITEM();
	const SITEMCUSTOM& sCacheRebuildItem = pClient->GetCharacter()->GET_REBUILD_ITEM_BACKUP();

	int nDisplayCount = 1
		, nCacheDispCount = 1;
	for ( DWORD _i(0); _i < ITEM_RANDOMOP_UTILL::FixOption::FIX_MAXSIZE; ++_i )
	{
		const int nType( sRebuildItem.getOptType(_i) );
		if ( nType != RandomOption::RANDOM_OPTION_NULL )
		{
			lua_tinker::table tbOption( GLWidgetScript::GetInstance().GetLuaState() );
			const DWORD nCountFix( sRebuildItem.getOptCount(_i) );
			float fValue( sRebuildItem.getOptValue(_i) * COMMENT::ITEM_RANDOM_OPT_SCALE[nType] );
			const bool bPerRandOpt( sRebuildItem.IsPerRandOpt(nType) );
			DWORD dwRandomAbilityColor( ITEM_INFOR_COLOR::dwRandomAbility );

			tbOption.set( "nType", nType );
			tbOption.set( "nCountFix", nCountFix );
			tbOption.set( "fValue", fValue );
			tbOption.set( "bPerRandOpt", bPerRandOpt );
			tbOption.set( "dwColor", dwRandomAbilityColor);

			tbRandomOpt.set( nDisplayCount++, tbOption );
		}
		const int nCacheType = sCacheRebuildItem.getOptType(_i);
		if ( nCacheType != RandomOption::RANDOM_OPTION_NULL )
		{
			lua_tinker::table tbOption( GLWidgetScript::GetInstance().GetLuaState() );
			const DWORD nCountFix( sCacheRebuildItem.getOptCount(_i) );
			float fValue( sCacheRebuildItem.getOptValue(_i) * COMMENT::ITEM_RANDOM_OPT_SCALE[nCacheType] );
			const bool bPerRandOpt( sCacheRebuildItem.IsPerRandOpt(nCacheType) );
			DWORD dwRandomAbilityColor( ITEM_INFOR_COLOR::dwRandomAbility );

			tbOption.set( "nType", nCacheType );
			tbOption.set( "nCountFix", nCountFix );
			tbOption.set( "fValue", fValue );
			tbOption.set( "bPerRandOpt", bPerRandOpt );
			tbOption.set( "dwColor", dwRandomAbilityColor);

			tbCacheRandomOpt.set( nCacheDispCount++, tbOption );
		}
	}

	tbResult.set( "origin", tbRandomOpt );
	tbResult.set( "cache", tbCacheRandomOpt );
	return tbResult;	
}

lua_tinker::table RebuildCard::GetBasicStats ( void ) const
{
	lua_tinker::table tbBasicStats( GLWidgetScript::GetInstance().GetLuaState() );

	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return tbBasicStats;

	const SITEMCUSTOM& sRebuildItem = pClient->GetCharacter()->GET_REBUILD_ITEM_BACKUP();

	SITEM* pItem = GLogicData::GetInstance().GetItem( sRebuildItem.GetNativeID() );
	if ( NULL == pItem )
		return tbBasicStats;

	int nDisplatIndex = 1;

	if ( pItem->IsEditableBasicAttackDamage() )
	{
		const GLPADATA& sBasicAttackDamage = sRebuildItem.GetBasicAttackDamage();
		lua_tinker::table tbOption( GLWidgetScript::GetInstance().GetLuaState() );
		tbOption.set( "nType", 1 );
		tbOption.set( "nValue1", sBasicAttackDamage.GetLow() );
		tbOption.set( "nValue2", sBasicAttackDamage.GetHigh() );

		tbBasicStats.set( nDisplatIndex++, tbOption );
	}

	if ( pItem->IsEditableBasicDefence() )
	{
		const int nBasicDefence = sRebuildItem.GetBasicDefence();
		lua_tinker::table tbOption( GLWidgetScript::GetInstance().GetLuaState() );
		tbOption.set( "nType", 2 );
		tbOption.set( "nValue1", nBasicDefence );
		tbOption.set( "nValue2", 0 );

		tbBasicStats.set( nDisplatIndex++, tbOption );
	}

	return tbBasicStats;
}

lua_tinker::table RebuildCard::GetItemSkill ( void ) const
{
	lua_tinker::table tbItemSkill( GLWidgetScript::GetInstance().GetLuaState() );

	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return tbItemSkill;

	const SITEMCUSTOM& sRebuildItem = pClient->GetCharacter()->GET_REBUILD_ITEM_BACKUP();

	SITEM* pItem = GLogicData::GetInstance().GetItem( sRebuildItem.GetNativeID() );
	if ( NULL == pItem )
		return tbItemSkill;

	int nDisplatIndex = 1;

	lua_tinker::table tbOption( GLWidgetScript::GetInstance().GetLuaState() );
	if ( -1 != pItem->GetLinkSkillIndex() )
	{
		tbOption.set( "bRebuild", true );

		tbItemSkill.set( nDisplatIndex++, tbOption );
	}
	else
	{
		tbOption.set( "bRebuild", false );

		tbItemSkill.set( nDisplatIndex++, tbOption );
	}

	return tbItemSkill;
}

lua_tinker::table RebuildCard::GetRebuildRange() const
{
    lua_State* L = GLWidgetScript::GetInstance().GetLuaState();
    lua_tinker::table tb(L);

    GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
    bool bRebuildAvailable = false;
    if (pClient)
    {
        const SITEMCUSTOM& sItem = pClient->GetCharacter()->GET_REBUILD_ITEM();
        if (sItem.GetNativeID() != NATIVEID_NULL())
        {
            bRebuildAvailable = true;

            const SITEM* pDef = GLogicData::GetInstance().GetItem(sItem.GetNativeID());
            if (pDef)
            {
                // TODO: Fix the Range Value
                // 뿓 BASIC STAT RANGE 뿓  
                //
				{
					lua_tinker::table basic(L);

					/* --- Damage --- */
					if (pDef->IsEditableBasicAttackDamage())
					{
						const EMITEMLEVEL lvl  = pDef->GetItemLevel();
						const int t            = pDef->GetBasicAttackDamageType();
						const int idx          = pDef->GetBasicAttackDamageIndex();

						int low  = 0;
						int high = 0;

						if (t >= 0 && idx >= 0)
						{
							GLPADATA r =
								GLItemBasicStatMan::Instance()->GetAttackDamageRange_MakeItem(lvl, t, idx);
							low  = r.GetLow();
							high = r.GetHigh();
						}

						lua_tinker::table dmg(L);
						dmg.set("Min", low);
						dmg.set("Max", high);
						basic.set("Damage", dmg);
					}

					/* --- Defence --- */
					if (pDef->IsEditableBasicDefence())
					{
						const EMITEMLEVEL lvl = pDef->GetItemLevel();
						const int t           = pDef->GetBasicDefenceType();
						const int idx         = pDef->GetBasicDefenceIndex();

						int valMin = 0;
						int valMax = 0;
						if (t >= 0 && idx >= 0)
						{
							GLPADATA r = GLItemBasicStatMan::Instance()->GetDefenceRange_MakeItem(lvl, t, idx);
							valMin = r.GetLow();
							valMax = r.GetHigh();
						}

						lua_tinker::table def(L);
						def.set("Min", valMin);
						def.set("Max", valMax);
						basic.set("Defence", def);
					}

					tb.set("BasicStat", basic);
				}

					//
					// 뿓 RANDOM-OPTION RANGE 뿓  FIXED 26/6/2025
				{
					lua_tinker::table ro(L),
									 types(L),
									 mins(L),
									 maxs(L),
									 isFloat(L);


					const char* szSetName = pDef->GetRandomOptFile();
					const RandomOption::Entity* pROEntity = 
						RandomOption::Manager::getInstance().find(szSetName);
				    
					WORD wMaxGain = 0;
					if (pROEntity)
					{
						wMaxGain = pROEntity->GetMaxGain();

						const RandomOption::ValueBunchVector* pValueBunches = 
							pROEntity->getVectorValueBunch(RandomOption::GENERATE_REMODEL);
				        
						if (pValueBunches)
						{
							int idx = 1;
							for (RandomOption::ValueBunchVector::const_iterator it = pValueBunches->begin(); 
								 it != pValueBunches->end(); 
								 ++it)
							{
								const RandomOption::ValueBunch& bunch = *it;
								RandomOption::RANDOM_OPTION optType = bunch.getTypeRandomOption();
				                
								if (optType == RandomOption::RANDOM_OPTION_NULL)
									continue;

								bool bIsFloat = false;
								if (optType < RandomOption::RANDOM_OPTION_NSIZE)
								{
									bIsFloat = !RandomOption::bValueInteger[optType];
								}
				                
								float fMin = 0.0f, fMax = 0.0f;
								if (bIsFloat)
								{
									fMin = bunch.getValueFloatLow();
									fMax = bunch.getValueFloatHigh();
								}
								else
								{
									fMin = static_cast<float>(bunch.getValueIntegerLow());
									fMax = static_cast<float>(bunch.getValueIntegerHigh());
								}

								types.set(idx, static_cast<int>(optType));
								mins.set(idx, fMin);
								maxs.set(idx, fMax);
								isFloat.set(idx, bIsFloat);
								++idx;
							}
						}
					}

					ro.set("Type",    types);
					ro.set("Min",     mins);
					ro.set("Max",     maxs);
					ro.set("IsFloat", isFloat);
					ro.set("MaxGain", wMaxGain);
					tb.set("RandomOption", ro);
				}
                //
				// 뿓 ADDON-OPTION RANGE 뿓 Fixed 3/8/2025 (Show possible ranges, not current)
                //
				{
                    lua_tinker::table ao(L), types(L), mins(L), maxs(L), isFloat(L);

                    const char* szAddonScript = pDef->sSuitOp.szRandomAddonScript;
                    RandomAddon::Entity ent;

					WORD wMaxGain = SITEMCUSTOM_ADDON::ADDON_SIZE;
					WORD wMaxGainFromItem = 0;
					{
						const size_t nSlots = sizeof(pDef->sSuitOp.sADDON) / sizeof(pDef->sSuitOp.sADDON[0]);
						for (size_t i = 0; i < nSlots; ++i)
						{
							if (pDef->sSuitOp.sADDON[i].emTYPE == EMADD_RANDOM)
								++wMaxGainFromItem;
						}
					}
					if (wMaxGainFromItem > 0)
						wMaxGain = std::min<WORD>(wMaxGainFromItem, SITEMCUSTOM_ADDON::ADDON_SIZE);

                    if (RandomAddon::Manager::GetInstance().Find(szAddonScript, ent))
                    {
                        const RandomAddon::VEC_BUNCH& bunches = ent.vecBunchRemodel;

						if (wMaxGainFromItem == 0)
						{
							WORD validCnt = 0;
							for (RandomAddon::VEC_BUNCH::const_iterator it = bunches.begin();
								 it != bunches.end(); ++it)
							{
								EMITEM_ADDON emType = it->emAddon;
								if (emType == EMADD_NONE ||
									emType == EMADDEX_INC_NONE ||
									emType == EMADDEX_INCR_NONE)
									continue;
								++validCnt;
							}

							if (validCnt > 0)
								wMaxGain = std::min<WORD>(validCnt, SITEMCUSTOM_ADDON::ADDON_SIZE);
						}

                        int idx = 1;
                        for (RandomAddon::VEC_BUNCH::const_iterator it = bunches.begin();
                             it != bunches.end(); ++it)
                        {
                            const RandomAddon::Bunch& b = *it;
                            EMITEM_ADDON emType = b.emAddon;

                            if (emType == EMADD_NONE ||
                                emType == EMADDEX_INC_NONE ||
                                emType == EMADDEX_INCR_NONE)
                                continue;

							bool bIsFloat = !ITEM::bAddonValueInteger[emType];
							float fMin = 0.0f;
							float fMax = 0.0f;

							if (!b.vecValue.empty())
							{
								const RandomAddon::Value* pBest = NULL;
								for (RandomAddon::VEC_VALUE::const_iterator vit = b.vecValue.begin();
									 vit != b.vecValue.end(); ++vit)
								{
									if (pBest == NULL || pBest->fRateChoose < vit->fRateChoose)
										pBest = &(*vit);
								}

								if (pBest)
								{
									fMin = bIsFloat ? pBest->fValueLow  : static_cast<float>(pBest->nValueLow);
									fMax = bIsFloat ? pBest->fValueHigh : static_cast<float>(pBest->nValueHigh);
								}
							}
							else
							{
								fMin = bIsFloat ? b.fValueLow  : static_cast<float>(b.nValueLow);
								fMax = bIsFloat ? b.fValueHigh : static_cast<float>(b.nValueHigh);
							}

                            types.set(idx,   static_cast<int>(emType));
                            mins .set(idx,   fMin);
                            maxs .set(idx,   fMax);
                            isFloat.set(idx, bIsFloat);
                            ++idx;
                        }
                    }

                    ao.set("Type",    types);
                    ao.set("Min",     mins);
                    ao.set("Max",     maxs);
                    ao.set("IsFloat", isFloat);
                    ao.set("MaxGain", wMaxGain);
                    tb.set("AddonOption", ao);
                }
            }
        }
    }

    tb.set("RebuildAvailable", bRebuildAvailable);
    return tb;
}
void RebuildCard::ReqSelectCache(void)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return;

	pClient->GetCharacter()->ReqRebuild_SelectCache();
}

void RebuildCard::ReqChangeRebuildType(bool bKeepOrigin)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return;

	pClient->GetCharacter()->ReqChangeRebuildType(EMTARGET_NULL, bKeepOrigin);
}

void RebuildCard::ReqRebuildItem ( void )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return;

	pClient->GetCharacter()->ReqRebuildTry( SNATIVEID(false), EMTARGET_NULL );
}

void RebuildCard::ReqRebuildItem_Fix ( void )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return;

	pClient->GetCharacter()->ReqRebuildResult( SNATIVEID(false), EMTARGET_NULL );
}

void RebuildCard::ReqRebuildItem_Cancel ( void )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return;

	pClient->GetCharacter()->ReqRebuildCancel( SNATIVEID(false), EMTARGET_NULL );
}

void RebuildCard::ReqRebuildItem_DirectFix ( void )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return;

	pClient->GetCharacter()->ReqRebuildDirectResult( SNATIVEID(false), EMTARGET_NULL );
}

void RebuildCard::ReqCloseWindow(void)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	pClient->GetCharacter()->ReqRebuildClose();
}

// 슬롯에 개조 대상 아이템이 등록시 메시지 발생 (Scaleform)(Clinet -> Server)
void RebuildCard::ReqRebuildMoveItem(const bool bMsg, const WORD wPreInvenItemPosX, const WORD wPreInvenItemPosY )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	m_sPreIventoryItem.wPosX = wPreInvenItemPosX;
	m_sPreIventoryItem.wPosY = wPreInvenItemPosY;
	pClient->GetCharacter()->ReqRebuildMoveItem(bMsg);
}

// 슬롯에 스템프 등록시 메시지 발생 (Scaleform)(Clinet -> Server)
void RebuildCard::ReqRebuildMoveStamp(void)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	pClient->GetCharacter()->ReqRebuildMoveStamp();
}

// 슬롯에서 아이템 제거시 발생되는 메시지(Scaleform)
void RebuildCard::RemoveRebuildItem(void)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if(pClient)
	{
		pClient->GetCharacter()->ReqRebuildMoveItem(false);
	}
	GLWidgetScript::GetInstance().LuaCallFunc< void >( 
		NSWIDGET_SCRIPT::g_strFunc_RebuildCard_RemoveItem );
}

// 슬롯에서 스템프 제거시 발생되는 메시지(Scaleform)
void RebuildCard::RemoveRebuildStemp(void)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	pClient->GetCharacter()->ReqRebuildMoveStamp();

	m_pItemStamp = NULL;

	GLWidgetScript::GetInstance().LuaCallFunc< void >( 
		NSWIDGET_SCRIPT::g_strFunc_RebuildCard_RemoveStemp );
}

// 아이템 등록시 발생되는 메시지	(Server -> Clinet)
void RebuildCard::ReceiveRebuildMoveItem( WORD wPosX, WORD wPosY )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	const SITEMCUSTOM& sRebuildItem = pClient->GetCharacter()->GET_REBUILD_ITEM();
	if( sRebuildItem.GetNativeID() != NATIVEID_NULL() )
	{
		const SITEM* pItem = GLogicData::GetInstance().GetItem( sRebuildItem.GetNativeID() );
		if( NULL == pItem )
			return;

		LuaTable tbItemInfo( GLWidgetScript::GetInstance().GetLuaState() );
		GLItemTooltip::GetInstance().GetItemDataInfo( sRebuildItem, tbItemInfo, EMGFX_SLOT_INVENTORY, true );

		GLWidgetCallFuncValue args[ 3 ];
		args[ 0 ].SetInt( wPosX );
		args[ 1 ].SetInt( wPosY );
		args[ 2 ].SetTable( &tbItemInfo );

		GLWidgetScript::GetInstance().LuaCallFunc< void >(
			NSWIDGET_SCRIPT::g_strFunc_RebuildCard_RegistItem, args, 3 );
	}
	else
	{
		GLWidgetScript::GetInstance().LuaCallFunc< void >(
			NSWIDGET_SCRIPT::g_strFunc_RebuildCard_RemoveItem );
		GLWidgetScript::GetInstance().LuaCallFunc< void >(
			NSWIDGET_SCRIPT::g_strFunc_RebuildCard_RemoveStemp );
	}
}

// 스템프 등록시 발생되는 메시지	(Server -> Clinet)
void RebuildCard::ReceiveRebuildMoveStemp(void)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();

	WORD wReModelNum = 0;

	const SITEMCUSTOM& sStampItem = pClient->GetCharacter()->GET_STAMP_ITEM();
	if( true == sStampItem.GetNativeID().IsValidNativeID() )
	{
		m_pItemStamp = GLogicData::GetInstance().GetItem( sStampItem.GetNativeID() );
		if( NULL == m_pItemStamp )
			return;

		wReModelNum = m_pItemStamp->sSuitOp.wReModelNum;

		GLWidgetScript::GetInstance().LuaCallFunc< void >(
			NSWIDGET_SCRIPT::g_strFunc_RebuildCard_RegistStemp,
			"-n, -n, -s, -n",
			sStampItem.Mid(), sStampItem.Sid(), 
			sStampItem.GETNAME().c_str(), wReModelNum );
	}
}

bool RebuildCard::SetFixedOption( const unsigned int nIndex )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return false;

	GLCharacter* pChar = pClient->GetCharacter();
	if ( NULL == pChar )
		return false;

	// 현재 개조 아이템 정보가 존재하지 않을경우 실패한다;
	const SITEMCUSTOM& sRebuildItem = pClient->GetCharacter()->GET_REBUILD_ITEM();
	if ( sRebuildItem.GetNativeID() == NATIVEID_NULL() )
		return false;

	SITEM* pRebuildItem = GLogicData::GetInstance().GetItem( sRebuildItem.GetNativeID() );
	if ( NULL == pRebuildItem )
		return false;

	// 인장카드가 없으면 실패한다;
	if ( NULL == m_pItemStamp )
		return false;

	// 현재 개조 타입별로 다르게 처리한다;
	switch ( pChar->GetTypeItemRemodel() )
	{
	case EMTYPE_ITEM_REMODEL_NONE:
		{
			return false;
		}
		break;

	case EMTYPE_ITEM_REMODEL_RANDOMOPTION:
		{
			if( nIndex >= RandomOpt::NSIZE )
				return false;

			pClient->GetCharacter()->PUSH_FIX_OPTION(
				sRebuildItem.getOptType( nIndex ),
				m_pItemStamp->sSuitOp.wReModelNum );
		}
		break;

	case EMTYPE_ITEM_REMODEL_ADDSTATS:
		{
			if( nIndex >= SITEMCUSTOM_ADDON::ADDON_SIZE )
				return false;

			const INT nType(GetAddonOpFixType(nIndex));
			if ( nType == -1 )
			{
				pClient->PrintMsgTextDlg ( NS_UITEXTCOLOR::DISABLE, ID2GAMEINTEXT("EMREQ_REMODELOPEN_FB_FAIL") );
				return false;
			}

			pClient->GetCharacter()->PUSH_FIX_OPTION(
				nType,
				m_pItemStamp->sSuitOp.wReModelNum );
		}
		break;

	case EMTYPE_ITEM_REMODEL_BASICSTATS:
		{
			if ( false == pRebuildItem->IsEditableBasicAttackDamage() || 
				false == pRebuildItem->IsEditableBasicAttackDamage() )
				return false;

			switch ( nIndex )
			{
			case 0:
				m_wFixedBasicStatIndex |= EMREBUILD_FIXED_BASICSTATS_ATTACKDAMAGE;
				break;

			case 1:
				m_wFixedBasicStatIndex |= EMREBUILD_FIXED_BASICSTATS_DEFENCE;
				break;
			}
		}
		break;

	case EMTYPE_ITEM_REMODEL_ITEMSKILL:
		{
			return false;
		}
		break;
	}

	return true;
}

void RebuildCard::ResetFixedOption( void )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return;

	GLCharacter* pChar = pClient->GetCharacter();
	if ( NULL == pChar )
		return;

	// 현재 개조 타입별로 다르게 처리한다;
	switch ( pChar->GetTypeItemRemodel() )
	{
	case EMTYPE_ITEM_REMODEL_NONE:
		break;

	case EMTYPE_ITEM_REMODEL_RANDOMOPTION:
	case EMTYPE_ITEM_REMODEL_ADDSTATS:
		{
			pChar->RESET_FIX_OPTION();
		}
		break;

	case EMTYPE_ITEM_REMODEL_BASICSTATS:
		{
			m_wFixedBasicStatIndex = 0;
		}
		break;

	case EMTYPE_ITEM_REMODEL_ITEMSKILL:
		break;
	}
}

const int RebuildCard::GetFixedOption ( const unsigned int _nIndex )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return -1;

	GLCharacter* pChar = pClient->GetCharacter();
	if ( NULL == pChar )
		return -1;

	// 현재 개조 아이템 정보가 존재하지 않을경우 실패한다;
	const SITEMCUSTOM& sRebuildItem = pClient->GetCharacter()->GET_REBUILD_ITEM();
	if ( sRebuildItem.GetNativeID() == NATIVEID_NULL() )
		return -1;

	SITEM* pRebuildItem = GLogicData::GetInstance().GetItem( sRebuildItem.GetNativeID() );
	if ( NULL == pRebuildItem )
		return -1;

	// 인장카드가 없으면 실패한다;
	if ( NULL == m_pItemStamp )
		return -1;

	// 현재 개조 타입별로 다르게 처리한다;
	switch ( pChar->GetTypeItemRemodel() )
	{
	case EMTYPE_ITEM_REMODEL_NONE:
		break;

	case EMTYPE_ITEM_REMODEL_ADDSTATS:
		{
			const BYTE nOptionType = pChar->GET_FIX_OPTION_TYPE( _nIndex );
			if ( 0 == nOptionType )
				return -1;

			const int nIndex = GetAddonFixTypeRealIndex( nOptionType );
			if ( -1 != nIndex )
				return nIndex;
		}
		break;

	case EMTYPE_ITEM_REMODEL_RANDOMOPTION:
		{
			const BYTE nOptionType = pChar->GET_FIX_OPTION_TYPE( _nIndex );
			if ( 0 == nOptionType )
				return -1;

			const int nIndex = sRebuildItem.GetOptIndex( static_cast< const RandomOption::RANDOM_OPTION >( nOptionType ) );
			if ( -1 != nIndex )
				return nIndex;
		}
		break;

	case EMTYPE_ITEM_REMODEL_BASICSTATS:
		{
			if ( ( true == pRebuildItem->IsEditableBasicAttackDamage() ) &&
				( true == pRebuildItem->IsEditableBasicAttackDamage() ) )
			{
				if ( ( 0 == _nIndex ) && ( m_wFixedBasicStatIndex & EMREBUILD_FIXED_BASICSTATS_ATTACKDAMAGE ) )
				{
					return 0;
				}
				else if ( ( 1 == _nIndex ) && ( m_wFixedBasicStatIndex & EMREBUILD_FIXED_BASICSTATS_ATTACKDAMAGE ) )
				{
					return 1;
				}
			}
		}
		break;

	case EMTYPE_ITEM_REMODEL_ITEMSKILL:
		break;
	}

	return -1;
}

const int RebuildCard::GetNFixOption(void) const
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();

	return pClient->GetCharacter()->GetNFixOption();
}

void RebuildCard::OpenRebuildUI ( EMTYPE_ITEM_REMODEL _emTypeItemRemodel )
{
	const bool bUsingStampCard( GLUseFeatures::GetInstance().IsUsingStampCard() );
	
	if( false == GLWidgetScript::GetInstance().LuaCallFunc< bool >( 
		NSWIDGET_SCRIPT::g_strFunc_RebuildCard_Open,
		"-b, -n",
		bUsingStampCard,
		static_cast< int >( _emTypeItemRemodel ) ) )
	{
		GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
		InitRebuild();

		pClient->GetCharacter()->ReqRebuildOpen( SNATIVEID(false), EMTARGET_NULL );
	}
}

void RebuildCard::SetItemRebuildSetCheckBox(const SITEMCUSTOM& sItemCustom, const ITEM_RANDOMOP_UTILL::FixOption& fixOption)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();

	const bool bUsingStampCard(GLUseFeatures::GetInstance().IsUsingStampCard());
	if ( bUsingStampCard == true )
	{
		GLCharacter* const pCharacter(pClient->GetCharacter());
		const unsigned int nNumStampItem(pCharacter->GetCountItemInInven(ITEM_STAMP_CARD, ITEM_VAlUE_SUIT_REMODELNUM, fixOption.getNSize()));
		if ( nNumStampItem != 0 )
		{
			WORD wStampPosX = USHRT_MAX;
			WORD wStampPosY = USHRT_MAX;

			pClient->GetCharacter()->GetItemPosInInven(ITEM_STAMP_CARD,
				ITEM_VAlUE_SUIT_REMODELNUM, fixOption.getNSize(), wStampPosX, wStampPosY);

			if ( wStampPosX != USHRT_MAX && wStampPosY != USHRT_MAX )
			{
				pCharacter->ReqInvenTo( wStampPosX, wStampPosY);
				pCharacter->ReqRebuildMoveStamp();
				pCharacter->m_sStampItem.SET( wStampPosX, wStampPosY );
			}
		}
	}
}

bool RebuildCard::CheckItemRebuildWindowClose(const bool bUseStamp, const ITEM_RANDOMOP_UTILL::FixOption& fixOption, const EMTYPE_ITEM_REMODEL emTypeItemRemodel)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();

	unsigned int nNumRemodelItem = 0;

	switch ( emTypeItemRemodel )
	{
	case EMTYPE_ITEM_REMODEL_NONE:
		break;

	case EMTYPE_ITEM_REMODEL_RANDOMOPTION:
		{
			nNumRemodelItem = pClient->GetCharacter()->GetCountItemInInven( ITEM_REMODEL );
		}
		break;

	case EMTYPE_ITEM_REMODEL_BASICSTATS:
		{
			nNumRemodelItem = pClient->GetCharacter()->GetCountItemInInven( ITEM_CHANGE_BASICSTATS_CARD );
		}
		break;

	case EMTYPE_ITEM_REMODEL_ADDSTATS:
		{
			nNumRemodelItem = pClient->GetCharacter()->GetCountItemInInven( ITEM_CHANGE_ADDSTATS_CARD );
		}
		break;

	case EMTYPE_ITEM_REMODEL_ITEMSKILL:
		{
			nNumRemodelItem = pClient->GetCharacter()->GetCountItemInInven( ITEM_CHANGE_ITEMSKILL_CARD );
		}
		break;
	}

	const unsigned int nNumStampItem = pClient->GetCharacter()->GetCountItemInInven(
		ITEM_STAMP_CARD,
		ITEM_VAlUE_SUIT_REMODELNUM,
		fixOption.getNSize() );

	if ( ( nNumRemodelItem == 0 ) || ( bUseStamp == true && nNumStampItem == 0 ) )
	{
		GLWidgetScript::GetInstance().LuaCallFunc< void >(
			NSWIDGET_SCRIPT::g_strFunc_RebuildCard_Close );

		return false;
	}
	else
	{
		//다시 개조 할 수 있는 상태로 설정한다;
		WORD wRemodelPosX = USHRT_MAX;
		WORD wRemodelPosY = USHRT_MAX;

		switch ( emTypeItemRemodel )
		{
		case EMTYPE_ITEM_REMODEL_NONE:
			break;

		case EMTYPE_ITEM_REMODEL_RANDOMOPTION:
			{
				pClient->GetCharacter()->GetItemPosInInven( ITEM_REMODEL, wRemodelPosX, wRemodelPosY );
			}
			break;

		case EMTYPE_ITEM_REMODEL_BASICSTATS:
			{
				pClient->GetCharacter()->GetItemPosInInven( ITEM_CHANGE_BASICSTATS_CARD, wRemodelPosX, wRemodelPosY );
			}
			break;

		case EMTYPE_ITEM_REMODEL_ADDSTATS:
			{
				pClient->GetCharacter()->GetItemPosInInven( ITEM_CHANGE_ADDSTATS_CARD, wRemodelPosX, wRemodelPosY );
			}
			break;

		case EMTYPE_ITEM_REMODEL_ITEMSKILL:
			{
				pClient->GetCharacter()->GetItemPosInInven( ITEM_CHANGE_ITEMSKILL_CARD, wRemodelPosX, wRemodelPosY );
			}
			break;
		}

		if ( wRemodelPosX != USHRT_MAX && wRemodelPosY != USHRT_MAX )
		{
			WORD wPreInvenItemPosX = pClient->GetCharacter()->m_sRebuildItem.wPosX;
			WORD wPreInvenItemPosY = pClient->GetCharacter()->m_sRebuildItem.wPosY;;
		
			switch ( emTypeItemRemodel )
			{
			case EMTYPE_ITEM_REMODEL_NONE:
				break;

			case EMTYPE_ITEM_REMODEL_RANDOMOPTION:
				{
					pClient->GetCharacter()->ReqRemodelOpenCard( wRemodelPosX, wRemodelPosY );
				}
				break;

			case EMTYPE_ITEM_REMODEL_BASICSTATS:
				{
					pClient->GetCharacter()->ReqInvenChangeBasicStats( wRemodelPosX, wRemodelPosY );
				}
				break;

			case EMTYPE_ITEM_REMODEL_ADDSTATS:
				{
					pClient->GetCharacter()->ReqInvenChangeAddStats( wRemodelPosX, wRemodelPosY );
				}
				break;

			case EMTYPE_ITEM_REMODEL_ITEMSKILL:
				{
					pClient->GetCharacter()->ReqInvenChangeItemSkill( wRemodelPosX, wRemodelPosY );
				}
				break;
			}

			pClient->GetCharacter()->ReqInvenTo( wPreInvenItemPosX, wPreInvenItemPosY );
			pClient->GetCharacter()->m_sPreInventoryItem.RESET();
			pClient->GetCharacter()->ReqRebuildMoveItem();

			return true;
		}
		else
		{
			GLWidgetScript::GetInstance().LuaCallFunc< void >( 
				NSWIDGET_SCRIPT::g_strFunc_RebuildCard_Close );

			return false;
		}
	}

	return false;
}

void RebuildCard::UpdateFixedOption ( void )
{
	bool bDontHave_FixdOption = true;
	for ( UINT i = 0; i < ITEM_RANDOMOP_UTILL::FixOption::FIX_MAXSIZE; ++i )
	{
		const int nIndex = GetFixedOption( i );
		if ( -1 != nIndex )
		{
			// 고정된 옵션 하나당 한번 호출한다;
			GLWidgetScript::GetInstance().LuaCallFunc< void >( 
				NSWIDGET_SCRIPT::g_strFunc_Update_FixdOption,
				"-n",
				nIndex );

			bDontHave_FixdOption = false;
		}
	}

	if ( true == bDontHave_FixdOption )
	{
		GLWidgetScript::GetInstance().LuaCallFunc< void >( 
			NSWIDGET_SCRIPT::g_strFunc_Update_FixdOption,
			"-n",
			-1 );
	}
}

INT RebuildCard::GetAddonOpFixType(INT nIndex)
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	const SITEMCUSTOM& sRebuildItem = pClient->GetCharacter()->GET_REBUILD_ITEM();
	INT nAlignType[SITEMCUSTOM_ADDON::ADDON_SIZE] = {0};
	INT nCount(0);
	for ( ; nCount < SITEMCUSTOM_ADDON::ADDON_SIZE && sRebuildItem.sAddonInfo.m_sADDON[nCount].emTYPE != EMITEM_ADDON::EMADD_NONE; ++nCount )
		nAlignType[nCount] = sRebuildItem.sAddonInfo.m_sADDON[nCount].emTYPE;

	for ( INT i(0); i < nCount-1; ++ i )
	{
		for ( INT j(i+1); j < nCount; ++j )
		{
			if ( nAlignType[j] < nAlignType[i] )
				std::swap(nAlignType[i], nAlignType[j]);
		}
	}

	if ( SITEMCUSTOM_ADDON::ADDON_SIZE <= nIndex || nAlignType[nIndex] == EMITEM_ADDON::EMADD_NONE )
		return -1;

	return nAlignType[nIndex];
}

const int RebuildCard::GetAddonFixTypeRealIndex ( const BYTE _nType )
{
	GLGaeaClient* pClient = GfxInterface::GetInstance()->GetGaeaClient();
	if ( NULL == pClient )
		return -1;

	GLCharacter* pCharacter = pClient->GetCharacter();
	if ( NULL == pCharacter )
		return -1;

	const SITEMCUSTOM& sRebuildItem = pCharacter->GET_REBUILD_ITEM();

	BYTE nAlignType[SITEMCUSTOM_ADDON::ADDON_SIZE] = { 0, };
	int nCount = 0;
	for ( ; nCount < SITEMCUSTOM_ADDON::ADDON_SIZE && sRebuildItem.sAddonInfo.m_sADDON[nCount].emTYPE != EMITEM_ADDON::EMADD_NONE; ++nCount )
		nAlignType[nCount] = static_cast< BYTE >( sRebuildItem.sAddonInfo.m_sADDON[nCount].emTYPE );

	for ( int i = 0; i < nCount-1; ++i )
	{
		for ( int j = i+1; j < nCount; ++j )
		{
			if ( nAlignType[j] < nAlignType[i] )
				std::swap(nAlignType[i], nAlignType[j]);
		}
	}

	for ( int i = 0; i < SITEMCUSTOM_ADDON::ADDON_SIZE; ++i )
	{
		if ( _nType == nAlignType[ i ] )
			return i;
	}
	
	return -1;
}