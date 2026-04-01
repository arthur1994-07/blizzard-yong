#include "pch.h"

#include "../../../SigmaCore/Math/Random.h"
#include "../../../SigmaCore/Lua/MinLua.h"
#include "../../../SigmaCore/Util/SystemInfo.h"

#include "../../../EngineLib/Common/SUBPATH.h"
#include "../../../EngineLib/G-Logic/GLogic.h"

#include "../../../RanLogic/GLogicDataMan.h"
#include "../../../RanLogic/GLogicData.h"

#include "./GLItemBasicSet.h"


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


const bool CBasicItemRandomAttackSet::LoadData_MakeItem ( LuaPlus::LuaObject& _sMember )
{
	// 각 확률 별 범위를 설정한다;
	WORD wProbabilityNum = 0;
	for ( LuaPlus::LuaTableIterator iter( _sMember );
		iter; iter.Next() )
	{
		// 확률은 모두 합해 BASIC_RANDOM_STAT_PROBABILITY_MAXNUM 까지만 가능하다;
		// 나머지는 나오지 않는다;
		if ( wProbabilityNum >= BASIC_RANDOM_STAT_PROBABILITY_MAXNUM-1 )
			break;

		LuaPlus::LuaTableIterator tempMemberIter( iter.GetValue() );

		// 설정된 확률 값이 0 일 경우 확률이 없으므로 포함하지 않는다;
		const int nProbabolityNum_Data = sc::GetIntegerByObject( tempMemberIter.GetValue() );
		if ( nProbabolityNum_Data <= 0 )
			continue;

		SBASIC_ITEM_RANDOM_ATTACK sTempItemRandomAttack;

		// 확률 조정을 위해 최소, 최대 범위를 설정한다;
		sTempItemRandomAttack.SetProbabilityMinNum( wProbabilityNum );
		sTempItemRandomAttack.SetProbabilityMaxNum( wProbabilityNum + nProbabolityNum_Data - 1 );
		wProbabilityNum = sTempItemRandomAttack.GetProbabilityMaxNum() + 1;
		tempMemberIter.Next();

		// 최소대미지의 범위를 설정한다;
		sTempItemRandomAttack.SetMinDamageStart( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();
		sTempItemRandomAttack.SetMinDamageEnd( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();

		// 최대대미지의 범위를 설정한다;
		sTempItemRandomAttack.SetMaxDamageStart( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();
		sTempItemRandomAttack.SetMaxDamageEnd( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();

		m_vecMakeList.push_back( sTempItemRandomAttack );
	}

	return true;
}

const bool CBasicItemRandomAttackSet::LoadData_DropItem ( LuaPlus::LuaObject& _sMember )
{
	// 각 확률 별 범위를 설정한다;
	WORD wProbabilityNum = 0;
	for ( LuaPlus::LuaTableIterator iter( _sMember );
		iter; iter.Next() )
	{
		// 확률은 모두 합해 BASIC_RANDOM_STAT_PROBABILITY_MAXNUM 까지만 가능하다;
		// 나머지는 나오지 않는다;
		if ( wProbabilityNum >= BASIC_RANDOM_STAT_PROBABILITY_MAXNUM-1 )
			break;

		LuaPlus::LuaTableIterator tempMemberIter( iter.GetValue() );

		// 설정된 확률 값이 0 일 경우 확률이 없으므로 포함하지 않는다;
		const int nProbabolityNum_Data = sc::GetIntegerByObject( tempMemberIter.GetValue() );
		if ( nProbabolityNum_Data <= 0 )
			continue;

		SBASIC_ITEM_RANDOM_ATTACK sTempItemRandomAttack;

		// 확률 조정을 위해 최소, 최대 범위를 설정한다;
		sTempItemRandomAttack.SetProbabilityMinNum( wProbabilityNum );
		sTempItemRandomAttack.SetProbabilityMaxNum( wProbabilityNum + nProbabolityNum_Data - 1 );
		wProbabilityNum = sTempItemRandomAttack.GetProbabilityMaxNum() + 1;
		tempMemberIter.Next();

		// 최소대미지의 범위를 설정한다;
		sTempItemRandomAttack.SetMinDamageStart( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();
		sTempItemRandomAttack.SetMinDamageEnd( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();

		// 최대대미지의 범위를 설정한다;
		sTempItemRandomAttack.SetMaxDamageStart( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();
		sTempItemRandomAttack.SetMaxDamageEnd( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();

		m_vecDropList.push_back( sTempItemRandomAttack );
	}

	return true;
}


const GLPADATA CBasicItemRandomAttackSet::GetAttackDamage_MakeItem ( void ) const
{
	static const GLPADATA sDefault;

	// 0~99 까지의 수 중 랜덤으로 하나 선택한다;
	unsigned int wProbabilityNum = sc::Random::getInstance().GetPercent_1000();

	// MakeList 중 저 수가 포함되는 구간을 구한다;
	int nSelectedIndex = -1;
	for ( int i=0; i<m_vecMakeList.size(); ++i )
	{
		const SBASIC_ITEM_RANDOM_ATTACK& sTempRandomAttack = m_vecMakeList.at( i );
		if ( wProbabilityNum < sTempRandomAttack.GetProbabilityMinNum() )
			continue;

		if ( sTempRandomAttack.GetProbabilityMaxNum() < wProbabilityNum )
			continue;

		nSelectedIndex = i;
		break;
	}

	if ( -1 == nSelectedIndex )
		return sDefault;

	// 선택된 RandomAttack 을 이용하여 최소, 최대 대미지를 구한다;
	const SBASIC_ITEM_RANDOM_ATTACK& sTempRandomAttack = m_vecMakeList.at( nSelectedIndex );
	
	WORD wMinDamage = sc::Random::getInstance().RandomNumber(
		sTempRandomAttack.GetMinDamageStart(),
		sTempRandomAttack.GetMinDamageEnd() );
	WORD wMaxDamage = sc::Random::getInstance().RandomNumber(
		sTempRandomAttack.GetMaxDamageStart(),
		sTempRandomAttack.GetMaxDamageEnd() );

	return GLPADATA( wMinDamage, wMaxDamage );
}

const GLPADATA CBasicItemRandomAttackSet::GetAttackDamage_DropItem ( void ) const
{
	static const GLPADATA sDefault;

	// 0~99 까지의 수 중 랜덤으로 하나 선택한다;
	unsigned int wProbabilityNum = sc::Random::getInstance().GetPercent_1000();

	// MakeList 중 저 수가 포함되는 구간을 구한다;
	int nSelectedIndex = -1;
	for ( int i=0; i<m_vecDropList.size(); ++i )
	{
		const SBASIC_ITEM_RANDOM_ATTACK& sTempRandomAttack = m_vecDropList.at( i );
		if ( wProbabilityNum < sTempRandomAttack.GetProbabilityMinNum() )
			continue;

		if ( sTempRandomAttack.GetProbabilityMaxNum() < wProbabilityNum )
			continue;

		nSelectedIndex = i;
		break;
	}

	if ( -1 == nSelectedIndex )
		return sDefault;

	// 선택된 RandomAttack 을 이용하여 최소, 최대 대미지를 구한다;
	const SBASIC_ITEM_RANDOM_ATTACK& sTempRandomAttack = m_vecDropList.at( nSelectedIndex );

	WORD wMinDamage = sc::Random::getInstance().RandomNumber(
		sTempRandomAttack.GetMinDamageStart(),
		sTempRandomAttack.GetMinDamageEnd() );
	WORD wMaxDamage = sc::Random::getInstance().RandomNumber(
		sTempRandomAttack.GetMaxDamageStart(),
		sTempRandomAttack.GetMaxDamageEnd() );

	return GLPADATA( wMinDamage, wMaxDamage );
}

const GLPADATA CBasicItemRandomAttackSet::GetAttackDamageRange_MakeItem ( void ) const
{
	static const GLPADATA sDefault;
	if ( m_vecMakeList.empty() )
		return sDefault;

	WORD wMinPossible = 0xFFFF;
	WORD wMaxPossible = 0;
	for ( int i = 0; i < (int)m_vecMakeList.size(); ++i )
	{
		const SBASIC_ITEM_RANDOM_ATTACK& s = m_vecMakeList.at( i );
		const WORD wMinA = ( s.GetMinDamageStart() < s.GetMinDamageEnd() ) ? s.GetMinDamageStart() : s.GetMinDamageEnd();
		const WORD wMaxB = ( s.GetMaxDamageStart() > s.GetMaxDamageEnd() ) ? s.GetMaxDamageStart() : s.GetMaxDamageEnd();
		if ( wMinA < wMinPossible ) wMinPossible = wMinA;
		if ( wMaxB > wMaxPossible ) wMaxPossible = wMaxB;
	}

	if ( wMinPossible == 0xFFFF )
		return sDefault;

	return GLPADATA( wMinPossible, wMaxPossible );
}

const GLPADATA CBasicItemRandomAttackSet::GetAttackDamageRange_DropItem ( void ) const
{
	static const GLPADATA sDefault;
	if ( m_vecDropList.empty() )
		return sDefault;

	WORD wMinPossible = 0xFFFF;
	WORD wMaxPossible = 0;
	for ( int i = 0; i < (int)m_vecDropList.size(); ++i )
	{
		const SBASIC_ITEM_RANDOM_ATTACK& s = m_vecDropList.at( i );
		const WORD wMinA = ( s.GetMinDamageStart() < s.GetMinDamageEnd() ) ? s.GetMinDamageStart() : s.GetMinDamageEnd();
		const WORD wMaxB = ( s.GetMaxDamageStart() > s.GetMaxDamageEnd() ) ? s.GetMaxDamageStart() : s.GetMaxDamageEnd();
		if ( wMinA < wMinPossible ) wMinPossible = wMinA;
		if ( wMaxB > wMaxPossible ) wMaxPossible = wMaxB;
	}

	if ( wMinPossible == 0xFFFF )
		return sDefault;

	return GLPADATA( wMinPossible, wMaxPossible );
}



const bool CBasicItemRandomDefenceSet::LoadData_MakeItem ( LuaPlus::LuaObject& _sMember )
{
	// 각 확률 별 범위를 설정한다;
	WORD wProbabilityNum = 0;
	for ( LuaPlus::LuaTableIterator iter( _sMember );
		iter; iter.Next() )
	{
		// 확률은 모두 합해 BASIC_RANDOM_STAT_PROBABILITY_MAXNUM 까지만 가능하다;
		// 나머지는 나오지 않는다;
		if ( wProbabilityNum >= BASIC_RANDOM_STAT_PROBABILITY_MAXNUM-1 )
			break;

		LuaPlus::LuaTableIterator tempMemberIter( iter.GetValue() );

		// 설정된 확률 값이 0 일 경우 확률이 없으므로 포함하지 않는다;
		const int nProbabolityNum_Data = sc::GetIntegerByObject( tempMemberIter.GetValue() );
		if ( nProbabolityNum_Data <= 0 )
			continue;

		SBASIC_ITEM_RANDOM_DEFENCE sTempItemRandomDefence;

		// 확률 조정을 위해 최소, 최대 범위를 설정한다;
		sTempItemRandomDefence.SetProbabilityMinNum( wProbabilityNum );
		sTempItemRandomDefence.SetProbabilityMaxNum( wProbabilityNum + nProbabolityNum_Data - 1 );
		wProbabilityNum = sTempItemRandomDefence.GetProbabilityMaxNum() + 1;
		tempMemberIter.Next();

		// 방어력의 범위를 설정한다;
		sTempItemRandomDefence.SetDefenseStart( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();
		sTempItemRandomDefence.SetDefenseEnd( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();

		m_vecMakeList.push_back( sTempItemRandomDefence );
	}

	return true;
}

const bool CBasicItemRandomDefenceSet::LoadData_DropItem ( LuaPlus::LuaObject& _sMember )
{
	// 각 확률 별 범위를 설정한다;
	WORD wProbabilityNum = 0;
	for ( LuaPlus::LuaTableIterator iter( _sMember );
		iter; iter.Next() )
	{
		// 확률은 모두 합해 BASIC_RANDOM_STAT_PROBABILITY_MAXNUM 까지만 가능하다;
		// 나머지는 나오지 않는다;
		if ( wProbabilityNum >= BASIC_RANDOM_STAT_PROBABILITY_MAXNUM-1 )
			break;

		LuaPlus::LuaTableIterator tempMemberIter( iter.GetValue() );

		// 설정된 확률 값이 0 일 경우 확률이 없으므로 포함하지 않는다;
		const int nProbabolityNum_Data = sc::GetIntegerByObject( tempMemberIter.GetValue() );
		if ( nProbabolityNum_Data <= 0 )
			continue;

		SBASIC_ITEM_RANDOM_DEFENCE sTempItemRandomDefence;

		// 확률 조정을 위해 최소, 최대 범위를 설정한다;
		sTempItemRandomDefence.SetProbabilityMinNum( wProbabilityNum );
		sTempItemRandomDefence.SetProbabilityMaxNum( wProbabilityNum + nProbabolityNum_Data - 1 );
		wProbabilityNum = sTempItemRandomDefence.GetProbabilityMaxNum() + 1;
		tempMemberIter.Next();

		// 방어력의 범위를 설정한다;
		sTempItemRandomDefence.SetDefenseStart( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();
		sTempItemRandomDefence.SetDefenseEnd( sc::GetIntegerByObject( tempMemberIter.GetValue() ) );
		tempMemberIter.Next();

		m_vecDropList.push_back( sTempItemRandomDefence );
	}

	return true;
}


const WORD CBasicItemRandomDefenceSet::GetDefence_MakeItem ( void ) const
{
	static const WORD wDefault = 0;

	// 0~99 까지의 수 중 랜덤으로 하나 선택한다;
	unsigned int wProbabilityNum = sc::Random::getInstance().GetPercent_1000();

	// MakeList 중 저 수가 포함되는 구간을 구한다;
	int nSelectedIndex = -1;
	for ( int i=0; i<m_vecMakeList.size(); ++i )
	{
		const SBASIC_ITEM_RANDOM_DEFENCE& sTempRandomDefence = m_vecMakeList.at( i );
		if ( wProbabilityNum < sTempRandomDefence.GetProbabilityMinNum() )
			continue;

		if ( sTempRandomDefence.GetProbabilityMaxNum() < wProbabilityNum )
			continue;

		nSelectedIndex = i;
		break;
	}

	if ( -1 == nSelectedIndex )
		return wDefault;

	// 선택된 RandomDefence 을 이용하여 방어력을 구한다;
	const SBASIC_ITEM_RANDOM_DEFENCE& sTempRandomDefence = m_vecMakeList.at( nSelectedIndex );

	WORD wDefence = sc::Random::getInstance().RandomNumber(
		sTempRandomDefence.GetDefenseStart(),
		sTempRandomDefence.GetDefenseEnd() );

	return wDefence;
}

const WORD CBasicItemRandomDefenceSet::GetDefence_DropItem ( void ) const
{
	static const WORD wDefault = 0;

	// 0~99 까지의 수 중 랜덤으로 하나 선택한다;
	unsigned int wProbabilityNum = sc::Random::getInstance().GetPercent_1000();

	// MakeList 중 저 수가 포함되는 구간을 구한다;
	int nSelectedIndex = -1;
	for ( int i=0; i<m_vecDropList.size(); ++i )
	{
		const SBASIC_ITEM_RANDOM_DEFENCE& sTempRandomDefence = m_vecDropList.at( i );
		if ( wProbabilityNum < sTempRandomDefence.GetProbabilityMinNum() )
			continue;

		if ( sTempRandomDefence.GetProbabilityMaxNum() < wProbabilityNum )
			continue;

		nSelectedIndex = i;
		break;
	}

	if ( -1 == nSelectedIndex )
		return wDefault;

	// 선택된 RandomDefence 을 이용하여 방어력을 구한다;
	const SBASIC_ITEM_RANDOM_DEFENCE& sTempRandomDefence = m_vecDropList.at( nSelectedIndex );

	WORD wDefence = sc::Random::getInstance().RandomNumber(
		sTempRandomDefence.GetDefenseStart(),
		sTempRandomDefence.GetDefenseEnd() );

	return wDefence;
}

const GLPADATA CBasicItemRandomDefenceSet::GetDefenceRange_MakeItem ( void ) const
{
	static const GLPADATA sDefault;
	if ( m_vecMakeList.empty() )
		return sDefault;

	WORD wMinPossible = 0xFFFF;
	WORD wMaxPossible = 0;
	for ( int i = 0; i < (int)m_vecMakeList.size(); ++i )
	{
		const SBASIC_ITEM_RANDOM_DEFENCE& s = m_vecMakeList.at( i );
		const WORD wMinA = ( s.GetDefenseStart() < s.GetDefenseEnd() ) ? s.GetDefenseStart() : s.GetDefenseEnd();
		const WORD wMaxB = ( s.GetDefenseStart() > s.GetDefenseEnd() ) ? s.GetDefenseStart() : s.GetDefenseEnd();
		if ( wMinA < wMinPossible ) wMinPossible = wMinA;
		if ( wMaxB > wMaxPossible ) wMaxPossible = wMaxB;
	}

	if ( wMinPossible == 0xFFFF )
		return sDefault;

	return GLPADATA( wMinPossible, wMaxPossible );
}

const GLPADATA CBasicItemRandomDefenceSet::GetDefenceRange_DropItem ( void ) const
{
	static const GLPADATA sDefault;
	if ( m_vecDropList.empty() )
		return sDefault;

	WORD wMinPossible = 0xFFFF;
	WORD wMaxPossible = 0;
	for ( int i = 0; i < (int)m_vecDropList.size(); ++i )
	{
		const SBASIC_ITEM_RANDOM_DEFENCE& s = m_vecDropList.at( i );
		const WORD wMinA = ( s.GetDefenseStart() < s.GetDefenseEnd() ) ? s.GetDefenseStart() : s.GetDefenseEnd();
		const WORD wMaxB = ( s.GetDefenseStart() > s.GetDefenseEnd() ) ? s.GetDefenseStart() : s.GetDefenseEnd();
		if ( wMinA < wMinPossible ) wMinPossible = wMinA;
		if ( wMaxB > wMaxPossible ) wMaxPossible = wMaxB;
	}

	if ( wMinPossible == 0xFFFF )
		return sDefault;

	return GLPADATA( wMinPossible, wMaxPossible );
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


const bool CBasicItemRandomAttackSetMan::LoadData ( const std::string& _strItemSet )
{
	std::string strFullPath( GLOGIC::GetPath() );
	strFullPath.append( _strItemSet );

	std::auto_ptr< sc::BaseStream > pStream(
		GLOGIC::openfile_basestream(
		GLOGIC::UseLogicZipFile(),
		GLogicData::GetInstance().GetGlogicZipFile(),
		strFullPath.c_str(), 
		_strItemSet.c_str(), 
		false,
		GLOGIC::UseLogicPackFile() ) );

	if ( NULL == pStream.get() )		
	{
		sc::writeLogError(
			sc::string::format(
			"CBasicItemRandomAttackSetMan::LoadFile(), File Open %1%", strFullPath ) );

		return false;
	}

	const size_t nSize = static_cast< size_t >( pStream->GetFileSize() );
	void* pBuffer = ::malloc( nSize );
	pStream->ReadBuffer( pBuffer, 0 );
	CTypeSmartPtr pSmartPtr( pBuffer );

	if ( false == sc::lua_doBuffer( static_cast<char*>( pBuffer ), nSize, NULL ) )
		return false;

	{
		LuaPlus::LuaObject sBasicGroup =
			sc::lua_getGlobalFromName( "ItemBasic" );
		if ( sBasicGroup.IsNil() )
			return false;

		for ( LuaPlus::LuaTableIterator iter( sBasicGroup );
			iter; iter.Next() )
		{
			LuaPlus::LuaObject sTempMember( iter.GetValue() );

			CBasicItemRandomAttackSet sItemSet;

			// Make 랜덤 공격력 등록;
			sItemSet.LoadData_MakeItem( sTempMember.GetByName( "Make" ) );

			// Drop 랜덤 공격력 등록;
			sItemSet.LoadData_DropItem( sTempMember.GetByName( "Drop" ) );

			m_vecAttackSetList.push_back( sItemSet );
		}
	}

	return true;
}


const GLPADATA CBasicItemRandomAttackSetMan::GetAttackDamage_MakeItem ( const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nIndex < 0 || m_vecAttackSetList.size() <= _nIndex )
		return sDefault;

	const CBasicItemRandomAttackSet& sAttackSet = m_vecAttackSetList.at( _nIndex );
	return sAttackSet.GetAttackDamage_MakeItem();
}

const GLPADATA CBasicItemRandomAttackSetMan::GetAttackDamage_DropItem ( const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nIndex < 0 || m_vecAttackSetList.size() <= _nIndex )
		return sDefault;

	const CBasicItemRandomAttackSet& sAttackSet = m_vecAttackSetList.at( _nIndex );
	return sAttackSet.GetAttackDamage_DropItem();
}

const GLPADATA CBasicItemRandomAttackSetMan::GetAttackDamageRange_MakeItem ( const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nIndex < 0 || m_vecAttackSetList.size() <= _nIndex )
		return sDefault;

	const CBasicItemRandomAttackSet& sAttackSet = m_vecAttackSetList.at( _nIndex );
	return sAttackSet.GetAttackDamageRange_MakeItem();
}

const GLPADATA CBasicItemRandomAttackSetMan::GetAttackDamageRange_DropItem ( const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nIndex < 0 || m_vecAttackSetList.size() <= _nIndex )
		return sDefault;

	const CBasicItemRandomAttackSet& sAttackSet = m_vecAttackSetList.at( _nIndex );
	return sAttackSet.GetAttackDamageRange_DropItem();
}



const bool CBasicItemRandomDefenceSetMan::LoadData ( const std::string& _strItemSet )
{
	std::string strFullPath( GLOGIC::GetPath() );
	strFullPath.append( _strItemSet );

	std::auto_ptr< sc::BaseStream > pStream(
		GLOGIC::openfile_basestream(
		GLOGIC::UseLogicZipFile(),
		GLogicData::GetInstance().GetGlogicZipFile(),
		strFullPath.c_str(), 
		_strItemSet.c_str(), 
		false,
		GLOGIC::UseLogicPackFile() ) );

	if ( NULL == pStream.get() )		
	{
		sc::writeLogError(
			sc::string::format(
			"CBasicItemRandomDefenceSetMan::LoadFile(), File Open %1%", strFullPath ) );

		return false;
	}

	const size_t nSize = static_cast< size_t >( pStream->GetFileSize() );
	void* pBuffer = ::malloc( nSize );
	pStream->ReadBuffer( pBuffer, 0 );
	CTypeSmartPtr pSmartPtr( pBuffer );

	if ( false == sc::lua_doBuffer( static_cast<char*>( pBuffer ), nSize, NULL ) )
		return false;

	{
		LuaPlus::LuaObject sBasicGroup =
			sc::lua_getGlobalFromName( "ItemBasic" );
		if ( sBasicGroup.IsNil() )
			return false;

		for ( LuaPlus::LuaTableIterator iter( sBasicGroup );
			iter; iter.Next() )
		{
			LuaPlus::LuaObject sTempMember( iter.GetValue() );

			CBasicItemRandomDefenceSet sItemSet;

			// Make 랜덤 방어력 등록;
			sItemSet.LoadData_MakeItem( sTempMember.GetByName( "Make" ) );

			// Drop 랜덤 방어력 등록;
			sItemSet.LoadData_DropItem( sTempMember.GetByName( "Drop" ) );

			m_vecDefenceSetList.push_back( sItemSet );
		}
	}

	return true;
}


const WORD CBasicItemRandomDefenceSetMan::GetDefence_MakeItem ( const int _nIndex ) const
{
	static const WORD wDefault = 0;

	if ( _nIndex < 0 || m_vecDefenceSetList.size() <= _nIndex )
		return wDefault;

	const CBasicItemRandomDefenceSet& sDefenceSet = m_vecDefenceSetList.at( _nIndex );
	return sDefenceSet.GetDefence_MakeItem();
}

const WORD CBasicItemRandomDefenceSetMan::GetDefence_DropItem ( const int _nIndex ) const
{
	static const WORD wDefault = 0;

	if ( _nIndex < 0 || m_vecDefenceSetList.size() <= _nIndex )
		return wDefault;

	const CBasicItemRandomDefenceSet& sDefenceSet = m_vecDefenceSetList.at( _nIndex );
	return sDefenceSet.GetDefence_DropItem();
}

const GLPADATA CBasicItemRandomDefenceSetMan::GetDefenceRange_MakeItem ( const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nIndex < 0 || m_vecDefenceSetList.size() <= _nIndex )
		return sDefault;

	const CBasicItemRandomDefenceSet& sDefenceSet = m_vecDefenceSetList.at( _nIndex );
	return sDefenceSet.GetDefenceRange_MakeItem();
}

const GLPADATA CBasicItemRandomDefenceSetMan::GetDefenceRange_DropItem ( const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nIndex < 0 || m_vecDefenceSetList.size() <= _nIndex )
		return sDefault;

	const CBasicItemRandomDefenceSet& sDefenceSet = m_vecDefenceSetList.at( _nIndex );
	return sDefenceSet.GetDefenceRange_DropItem();
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


const bool CBasicItemAttackTypeSetMan::LoadData ( const std::string& _strItemType )
{
	std::string strFullPath( GLOGIC::GetPath() );
	strFullPath.append( _strItemType );

	std::auto_ptr< sc::BaseStream > pStream(
		GLOGIC::openfile_basestream(
		GLOGIC::UseLogicZipFile(),
		GLogicData::GetInstance().GetGlogicZipFile(),
		strFullPath.c_str(), 
		_strItemType.c_str(), 
		false,
		GLOGIC::UseLogicPackFile() ) );

	if ( NULL == pStream.get() )		
	{
		sc::writeLogError(
			sc::string::format(
			"CBasicItemAttackTypeSetMan::LoadFile(), File Open %1%", strFullPath ) );

		return false;
	}

	const size_t nSize = static_cast< size_t >( pStream->GetFileSize() );
	void* pBuffer = ::malloc( nSize );
	pStream->ReadBuffer( pBuffer, 0 );
	CTypeSmartPtr pSmartPtr( pBuffer );

	if ( false == sc::lua_doBuffer( static_cast<char*>( pBuffer ), nSize, NULL ) )
		return false;

	{
		LuaPlus::LuaObject sBasicGroup =
			sc::lua_getGlobalFromName( "ItemType" );
		if ( sBasicGroup.IsNil() )
			return false;

		for ( LuaPlus::LuaTableIterator iter( sBasicGroup );
			iter; iter.Next() )
		{
			CBasicItemRandomAttackSetMan sItemType;

			std::string strItemSetMan = sc::GetStringByObject( iter.GetValue() );
			sItemType.LoadData( strItemSetMan );

			m_vecAttackTypeSetList.push_back( sItemType );
		}
	}

	return true;
}

const GLPADATA CBasicItemAttackTypeSetMan::GetAttackDamage_MakeItem ( const int _nType, const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nType < 0 || m_vecAttackTypeSetList.size() <= _nType )
		return sDefault;

	const CBasicItemRandomAttackSetMan& sItemType = m_vecAttackTypeSetList.at( _nType );
	return sItemType.GetAttackDamage_MakeItem( _nIndex );
}

const GLPADATA CBasicItemAttackTypeSetMan::GetAttackDamage_DropItem ( const int _nType, const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nType < 0 || m_vecAttackTypeSetList.size() <= _nType )
		return sDefault;

	const CBasicItemRandomAttackSetMan& sItemType = m_vecAttackTypeSetList.at( _nType );
	return sItemType.GetAttackDamage_DropItem( _nIndex );
}

const GLPADATA CBasicItemAttackTypeSetMan::GetAttackDamageRange_MakeItem ( const int _nType, const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nType < 0 || m_vecAttackTypeSetList.size() <= _nType )
		return sDefault;

	const CBasicItemRandomAttackSetMan& sItemType = m_vecAttackTypeSetList.at( _nType );
	return sItemType.GetAttackDamageRange_MakeItem( _nIndex );
}

const GLPADATA CBasicItemAttackTypeSetMan::GetAttackDamageRange_DropItem ( const int _nType, const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nType < 0 || m_vecAttackTypeSetList.size() <= _nType )
		return sDefault;

	const CBasicItemRandomAttackSetMan& sItemType = m_vecAttackTypeSetList.at( _nType );
	return sItemType.GetAttackDamageRange_DropItem( _nIndex );
}

const int CBasicItemAttackTypeSetMan::GetSize ( const int _nType ) const
{
	if ( _nType < 0 || m_vecAttackTypeSetList.size() <= _nType )
		return 0;

	const CBasicItemRandomAttackSetMan& sItemType = m_vecAttackTypeSetList.at( _nType );
	return sItemType.GetSize();
}

const bool CBasicItemDefenceTypeSetMan::LoadData ( const std::string& _strItemType )
{
	std::string strFullPath( GLOGIC::GetPath() );
	strFullPath.append( _strItemType );

	std::auto_ptr< sc::BaseStream > pStream(
		GLOGIC::openfile_basestream(
		GLOGIC::UseLogicZipFile(),
		GLogicData::GetInstance().GetGlogicZipFile(),
		strFullPath.c_str(), 
		_strItemType.c_str(), 
		false,
		GLOGIC::UseLogicPackFile() ) );

	if ( NULL == pStream.get() )		
	{
		sc::writeLogError(
			sc::string::format(
			"CBasicItemDefenceTypeSetMan::LoadFile(), File Open %1%", strFullPath ) );

		return false;
	}

	const size_t nSize = static_cast< size_t >( pStream->GetFileSize() );
	void* pBuffer = ::malloc( nSize );
	pStream->ReadBuffer( pBuffer, 0 );
	CTypeSmartPtr pSmartPtr( pBuffer );

	if ( false == sc::lua_doBuffer( static_cast<char*>( pBuffer ), nSize, NULL ) )
		return false;

	{
		LuaPlus::LuaObject sBasicGroup =
			sc::lua_getGlobalFromName( "ItemType" );
		if ( sBasicGroup.IsNil() )
			return false;

		for ( LuaPlus::LuaTableIterator iter( sBasicGroup );
			iter; iter.Next() )
		{
			CBasicItemRandomDefenceSetMan sItemType;

			std::string strItemSetMan = sc::GetStringByObject( iter.GetValue() );
			sItemType.LoadData( strItemSetMan );

			m_vecDefenceTypeSetList.push_back( sItemType );
		}
	}

	return true;
}

const WORD CBasicItemDefenceTypeSetMan::GetDefence_MakeItem ( const int _nType, const int _nIndex ) const
{
	static const WORD wDefault = 0;

	if ( _nType < 0 || m_vecDefenceTypeSetList.size() <= _nType )
		return wDefault;

	const CBasicItemRandomDefenceSetMan& sItemType = m_vecDefenceTypeSetList.at( _nType );
	return sItemType.GetDefence_MakeItem( _nIndex );
}

const WORD CBasicItemDefenceTypeSetMan::GetDefence_DropItem ( const int _nType, const int _nIndex ) const
{
	static const WORD wDefault = 0;

	if ( _nType < 0 || m_vecDefenceTypeSetList.size() <= _nType )
		return wDefault;

	const CBasicItemRandomDefenceSetMan& sItemType = m_vecDefenceTypeSetList.at( _nType );
	return sItemType.GetDefence_DropItem( _nIndex );
}

const GLPADATA CBasicItemDefenceTypeSetMan::GetDefenceRange_MakeItem ( const int _nType, const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nType < 0 || m_vecDefenceTypeSetList.size() <= _nType )
		return sDefault;

	const CBasicItemRandomDefenceSetMan& sItemType = m_vecDefenceTypeSetList.at( _nType );
	return sItemType.GetDefenceRange_MakeItem( _nIndex );
}

const GLPADATA CBasicItemDefenceTypeSetMan::GetDefenceRange_DropItem ( const int _nType, const int _nIndex ) const
{
	static const GLPADATA sDefault;

	if ( _nType < 0 || m_vecDefenceTypeSetList.size() <= _nType )
		return sDefault;

	const CBasicItemRandomDefenceSetMan& sItemType = m_vecDefenceTypeSetList.at( _nType );
	return sItemType.GetDefenceRange_DropItem( _nIndex );
}

const int CBasicItemDefenceTypeSetMan::GetSize ( const int _nType ) const
{
	if ( _nType < 0 || m_vecDefenceTypeSetList.size() <= _nType )
		return 0;

	const CBasicItemRandomDefenceSetMan& sItemType = m_vecDefenceTypeSetList.at( _nType );
	return sItemType.GetSize();
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////