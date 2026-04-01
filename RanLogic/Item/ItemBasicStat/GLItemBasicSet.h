#pragma once

#include "../../../enginelib/G-Logic/GLDefine.h"

#define	BASIC_RANDOM_STAT_PROBABILITY_MAXNUM	1000


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 아이템 기본 랜덤 공격력;
struct SBASIC_ITEM_RANDOM_ATTACK
{
public:
	inline const WORD GetProbabilityMinNum ( void ) const { return m_wProbabilityMinNum; }
	inline const WORD GetProbabilityMaxNum ( void ) const { return m_wProbabilityMaxNum; }
	inline const WORD GetMinDamageStart ( void ) const { return m_wMinDamageStart; }
	inline const WORD GetMinDamageEnd ( void ) const { return m_wMinDamageEnd; }
	inline const WORD GetMaxDamageStart ( void ) const { return m_wMaxDamageStart; }
	inline const WORD GetMaxDamageEnd ( void ) const { return m_wMaxDamageEnd; }

	inline void SetProbabilityMinNum ( const WORD _wProbabilityMinNum )
	{
		if ( _wProbabilityMinNum >= BASIC_RANDOM_STAT_PROBABILITY_MAXNUM )
		{
			m_wProbabilityMinNum = BASIC_RANDOM_STAT_PROBABILITY_MAXNUM-1;
			return;
		}

		m_wProbabilityMinNum = _wProbabilityMinNum;
	}

	inline void SetProbabilityMaxNum ( const WORD _wProbabilityMaxNum )
	{
		if ( _wProbabilityMaxNum >= BASIC_RANDOM_STAT_PROBABILITY_MAXNUM )
		{
			m_wProbabilityMaxNum = BASIC_RANDOM_STAT_PROBABILITY_MAXNUM-1;
			return;
		}

		m_wProbabilityMaxNum = _wProbabilityMaxNum;
	}

	inline void SetMinDamageStart ( const WORD _wMinDamageStart ) { m_wMinDamageStart = _wMinDamageStart; }
	inline void SetMinDamageEnd ( const WORD _wMinDamageEnd ) { m_wMinDamageEnd = _wMinDamageEnd; }
	inline void SetMaxDamageStart ( const WORD _wMaxDamageStart ) { m_wMaxDamageStart = _wMaxDamageStart; }
	inline void SetMaxDamageEnd ( const WORD _wMaxDamageEnd ) { m_wMaxDamageEnd = _wMaxDamageEnd; }

private:
	WORD m_wProbabilityMinNum;
	WORD m_wProbabilityMaxNum;
	WORD m_wMinDamageStart;
	WORD m_wMinDamageEnd;
	WORD m_wMaxDamageStart;
	WORD m_wMaxDamageEnd;


public:
	SBASIC_ITEM_RANDOM_ATTACK ()
		: m_wProbabilityMinNum ( 0 )
		, m_wProbabilityMaxNum ( 0 )
		, m_wMinDamageStart ( 0 )
		, m_wMinDamageEnd ( 0 )
		, m_wMaxDamageStart ( 0 )
		, m_wMaxDamageEnd ( 0 )
	{

	}
};

// 아이템 기본 랜덤 방어력;
struct SBASIC_ITEM_RANDOM_DEFENCE
{
public:
	inline const WORD GetProbabilityMinNum ( void ) const { return m_wProbabilityMinNum; }
	inline const WORD GetProbabilityMaxNum ( void ) const { return m_wProbabilityMaxNum; }
	inline const WORD GetDefenseStart ( void ) const { return m_wDefenseStart; }
	inline const WORD GetDefenseEnd ( void ) const { return m_wDefenseEnd; }

	void SetProbabilityMinNum ( const WORD _wProbabilityMinNum )
	{
		if ( _wProbabilityMinNum >= BASIC_RANDOM_STAT_PROBABILITY_MAXNUM )
		{
			m_wProbabilityMinNum = BASIC_RANDOM_STAT_PROBABILITY_MAXNUM-1;
			return;
		}

		m_wProbabilityMinNum = _wProbabilityMinNum;
	}

	void SetProbabilityMaxNum ( const WORD _wProbabilityMaxNum )
	{
		if ( _wProbabilityMaxNum >= BASIC_RANDOM_STAT_PROBABILITY_MAXNUM )
		{
			m_wProbabilityMaxNum = BASIC_RANDOM_STAT_PROBABILITY_MAXNUM-1;
			return;
		}

		m_wProbabilityMaxNum = _wProbabilityMaxNum;
	}

	inline void SetDefenseStart ( const WORD _wDefenseStart ) { m_wDefenseStart = _wDefenseStart; }
	inline void SetDefenseEnd ( const WORD _wDefenseEnd ) { m_wDefenseEnd = _wDefenseEnd; }

private:
	WORD m_wProbabilityMinNum;
	WORD m_wProbabilityMaxNum;


public:
	WORD m_wDefenseStart;
	WORD m_wDefenseEnd;


public:
	SBASIC_ITEM_RANDOM_DEFENCE ()
		: m_wProbabilityMinNum ( 0 )
		, m_wProbabilityMaxNum ( 0 )
		, m_wDefenseStart ( 0 )
		, m_wDefenseEnd ( 0 )
	{

	}
};


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 공격력 세트;
class CBasicItemRandomAttackSet
{
public:
	const bool LoadData_MakeItem ( LuaPlus::LuaObject& _sMember );
	const bool LoadData_DropItem ( LuaPlus::LuaObject& _sMember );


public:
	const GLPADATA GetAttackDamage_MakeItem ( void ) const;
	const GLPADATA GetAttackDamage_DropItem ( void ) const;
	// Returns overall possible min(low) ~ max(high) for tooltip display.
	const GLPADATA GetAttackDamageRange_MakeItem ( void ) const;
	const GLPADATA GetAttackDamageRange_DropItem ( void ) const;


private:
	std::vector< SBASIC_ITEM_RANDOM_ATTACK > m_vecMakeList;
	std::vector< SBASIC_ITEM_RANDOM_ATTACK > m_vecDropList;


public:
	CBasicItemRandomAttackSet () { }
	~CBasicItemRandomAttackSet () { }
};

// 방어력 세트;
class CBasicItemRandomDefenceSet
{
public:
	const bool LoadData_MakeItem ( LuaPlus::LuaObject& _sMember );
	const bool LoadData_DropItem ( LuaPlus::LuaObject& _sMember );


public:
	const WORD GetDefence_MakeItem ( void ) const;
	const WORD GetDefence_DropItem ( void ) const;
	// Returns overall possible min(low) ~ max(high) for tooltip display.
	const GLPADATA GetDefenceRange_MakeItem ( void ) const;
	const GLPADATA GetDefenceRange_DropItem ( void ) const;


private:
	std::vector< SBASIC_ITEM_RANDOM_DEFENCE > m_vecMakeList;
	std::vector< SBASIC_ITEM_RANDOM_DEFENCE > m_vecDropList;


public:
	CBasicItemRandomDefenceSet () { }
	~CBasicItemRandomDefenceSet () { }
};


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 기본 아이템 능력치 세트 관리자;
class CBasicItemRandomAttackSetMan
{
public:
	const bool LoadData ( const std::string& _strItemSet );


public:
	const GLPADATA GetAttackDamage_MakeItem ( const int _nIndex ) const;
	const GLPADATA GetAttackDamage_DropItem ( const int _nIndex ) const;
	const GLPADATA GetAttackDamageRange_MakeItem ( const int _nIndex ) const;
	const GLPADATA GetAttackDamageRange_DropItem ( const int _nIndex ) const;


public:
	inline const int GetSize ( void ) const { return m_vecAttackSetList.size(); }


private:
	std::vector< CBasicItemRandomAttackSet > m_vecAttackSetList;


public:
	CBasicItemRandomAttackSetMan () { }
	~CBasicItemRandomAttackSetMan () { }
};

// 기본 아이템 능력치 세트 관리자;
class CBasicItemRandomDefenceSetMan
{
public:
	const bool LoadData ( const std::string& _strItemSet );


public:
	const WORD GetDefence_MakeItem ( const int _nIndex ) const;
	const WORD GetDefence_DropItem ( const int _nIndex ) const;
	const GLPADATA GetDefenceRange_MakeItem ( const int _nIndex ) const;
	const GLPADATA GetDefenceRange_DropItem ( const int _nIndex ) const;


public:
	inline const int GetSize ( void ) const { return m_vecDefenceSetList.size(); }


private:
	std::vector< CBasicItemRandomDefenceSet > m_vecDefenceSetList;


public:
	CBasicItemRandomDefenceSetMan () { }
	~CBasicItemRandomDefenceSetMan () { }
};


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 기본 아이템 능력치 타입 세트 관리자 ( 공격력 );
class CBasicItemAttackTypeSetMan
{
public:
	const bool LoadData ( const std::string& _strItemType );


public:
	const GLPADATA GetAttackDamage_MakeItem ( const int _nType, const int _nIndex ) const;
	const GLPADATA GetAttackDamage_DropItem ( const int _nType, const int _nIndex ) const;
	const GLPADATA GetAttackDamageRange_MakeItem ( const int _nType, const int _nIndex ) const;
	const GLPADATA GetAttackDamageRange_DropItem ( const int _nType, const int _nIndex ) const;

	const int GetSize ( const int _nType ) const;


private:
	std::vector< CBasicItemRandomAttackSetMan > m_vecAttackTypeSetList;


public:
	CBasicItemAttackTypeSetMan () { }
	~CBasicItemAttackTypeSetMan () { }
};

// 기본 아이템 능력치 타입 세트 관리자 ( 방어력 );
class CBasicItemDefenceTypeSetMan
{
public:
	const bool LoadData ( const std::string& _strItemType );


public:
	const WORD GetDefence_MakeItem ( const int _nType, const int _nIndex ) const;
	const WORD GetDefence_DropItem ( const int _nType, const int _nIndex ) const;
	const GLPADATA GetDefenceRange_MakeItem ( const int _nType, const int _nIndex ) const;
	const GLPADATA GetDefenceRange_DropItem ( const int _nType, const int _nIndex ) const;

	const int GetSize ( const int _nType ) const;


private:
	std::vector< CBasicItemRandomDefenceSetMan > m_vecDefenceTypeSetList;


public:
	CBasicItemDefenceTypeSetMan () { }
	~CBasicItemDefenceTypeSetMan () { }
};


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////