#pragma	once

#include "../../../EngineLib/GUInterface/UIGroup.h"
#include "../../GfxInterface.h"
#include "../../Display/GfxDisplay.h"
#include "../OldInterface.h"

class GLGaeaClient;
class OldInterface;

class CPKComboType;
class CPKComboDisplay : public CUIGroup
{
public:
	enum
	{
		FIRST_BLOOD = NO_ID + 1,
		DOUBLE_KILL,
		TRIPLE_KILL,
		QUARD_KILL,
		MASTER_KILL,
		KILLING_SPREE,
		DOMINATING,
		MEGA_KILL,
		UNSTOPPABLE,
		WICKED_SICK,
		MONSTER_KILL,
		GODLIKE,
		HOLY_SHIT,
		OWNAGE,

		MAX_KILL = 14
	};

public:
	CPKComboDisplay (GLGaeaClient* pGaeaClient, OldInterface* pInterface, EngineDeviceMan* pEngineDevice);
	virtual ~CPKComboDisplay();

protected:
	OldInterface* m_pInterface;

public:
	void	CreateSubControl ();

public:
	virtual void Update ( int x, int y, BYTE LB, BYTE MB, BYTE RB, int nScroll, float fElapsedTime, BOOL bFirstControl );

public:
	bool	START ( UIGUID cID );
	bool	RESET ( UIGUID cID );
	bool	STOP ();

	void	ALLSTOP ();

public:
	bool	KEEP_START ( UIGUID cID );
	void	KEEP_STOP ();

private:
	CPKComboType*	m_pKILL_COUNT[MAX_KILL];
	CUIControl*		m_pPositionControl;	

	GLGaeaClient*	m_pGaeaClient;
};