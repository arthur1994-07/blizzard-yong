#pragma	once

#include "../../../EngineLib/GUInterface/UIGroup.h"
#include "../EngineLib/G-Logic/GLDefine.h"
#include "../RanLogic/Character/GLCharDefine.h"
#include "../RanLogic/Character/GLCharData.h"

#include "../../../EngineLib/GUInterface/InterfaceBaseDefine.h"

class	GLGaeaClient;

class	CBasicLineBox;
class	CBasicLineBoxEx;
class	CBasicTextBoxEx;

class	CPlayerKillSlot : public CUIGroup
{
protected:
	enum
	{
		nSCHOOLMARK		= 3,
	};

public:
	CPlayerKillSlot (GLGaeaClient* pGaeaClient, EngineDeviceMan* pEngineDevice);
	virtual	~CPlayerKillSlot ();

public:
	void	CreateSubControl();
	void	Init( SPLAYER_KILL_FEED sKILLFEED );

protected:
	CUIControl*		CreateControl ( const char* szControl );
	CBasicTextBoxEx*	CreateStaticControl ( char* szControlKeyword, CD3DFontPar* pFont, D3DCOLOR dwColor, int nAlign );

private:
	CBasicTextBoxEx*			m_pPlayerKiller;
	CBasicTextBoxEx*			m_pPlayerVictim;
	CUIControl*					m_pKillIco;
	CUIControl*					m_pSchoolKiller[nSCHOOLMARK];
	CUIControl*					m_pSchoolVictim[nSCHOOLMARK];
	CUIControl*					m_pClassImgKiller[ GLCI_NUM_ACTOR ];
	CUIControl*					m_pClassImgVictim[ GLCI_NUM_ACTOR ];

private:
	GLGaeaClient*	m_pGaeaClient;
};