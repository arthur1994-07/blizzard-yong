#pragma	once

#include "../../../EngineLib/GUInterface/UIGroup.h"
#include "../../../RanLogic/Msg/PKRankData.h"

class GLGaeaClient;
class OldInterface;

class CPKRankNotificationInfo;

class CPKRankNotification : public CUIGroup
{
public:
	enum
	{
	};

public:
	CPKRankNotification ( GLGaeaClient* pGaeaClient, OldInterface* pInterface, EngineDeviceMan* pEngineDevice );
	virtual ~CPKRankNotification();

public:
	void CreateSubControl();

public:
	virtual	void TranslateUIMessage( UIGUID cID, DWORD dwMsg );
	virtual	void SetVisibleSingle ( BOOL bVisible );
	virtual	void Update ( int x, int y, BYTE LB, BYTE MB, BYTE RB, int nScroll, float fElapsedTime, BOOL bFirstControl );

public:
	CPKRankNotificationInfo*		m_pInfo[PKNOTIF_NUM];
	
protected:
	CUIControl * CreateControl( char* szControl, const UIGUID& cID = NO_ID );

protected:
	GLGaeaClient*	m_pGaeaClient;
    OldInterface*	m_pInterface;
};
