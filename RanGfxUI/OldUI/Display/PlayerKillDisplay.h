#pragma	once

#include "../../../EngineLib/GUInterface/UIGroup.h"
#include "../RanLogic/Character/GLCharData.h"

#include "../../GfxInterface.h"
#include "../../Display/GfxDisplay.h"
#include "../OldInterface.h"

class OldInterface;

class	CPlayerKillSlot;
class	GLGaeaClient;

class	CPlayerKillDisplay : public CUIGroup
{
protected:
	CPlayerKillSlot* CreateKillSlot( CString strKeyword );
public:
	CPlayerKillDisplay (GLGaeaClient* pGaeaClient, OldInterface* pInterface, EngineDeviceMan* pEngineDevice);
	virtual	~CPlayerKillDisplay ();


public:
	virtual	void Update ( int x, int y, BYTE LB, BYTE MB, BYTE RB, int nScroll, float fElapsedTime, BOOL bFirstControl );
	void	CreateSubControl ();

	CPlayerKillSlot* m_pKillSlot[PLAYERKILL_FEED_SIZE];

protected:
	GLGaeaClient*	m_pGaeaClient;

protected:
	OldInterface* m_pInterface;
};