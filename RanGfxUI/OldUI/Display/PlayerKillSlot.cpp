#include "StdAfx.h"
#include "PlayerKillSlot.h"
#include "../../../SigmaCore/String/StringFormat.h"
#include "../../EngineLib/GUInterface/GameTextControl.h"
#include "../../EngineLib/GUInterface/UITextControl.h"
#include "../../../RanLogicClient/GLGaeaClient.h"
#include "../../../RanLogicClient/Stage//DxGlobalStage.h"

#include "../EngineLib/DxTools/DxFontMan.h"
#include "../../../EngineLib/GUInterface/BasicTextBoxEx.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

CPlayerKillSlot::CPlayerKillSlot (GLGaeaClient* pGaeaClient, EngineDeviceMan* pEngineDevice)
	: CUIGroup(pEngineDevice)
	, m_pGaeaClient( pGaeaClient )
	, m_pPlayerKiller ( NULL )
	, m_pPlayerVictim ( NULL )
	, m_pKillIco ( NULL )
{
	memset( m_pSchoolKiller, 0, sizeof ( CUIControl* ) * nSCHOOLMARK );
	memset( m_pSchoolVictim, 0, sizeof ( CUIControl* ) * nSCHOOLMARK );
	memset ( m_pClassImgKiller, 0, sizeof( CUIControl* ) * GLCI_NUM_ACTOR );
	memset ( m_pClassImgVictim, 0, sizeof( CUIControl* ) * GLCI_NUM_ACTOR );
}

CPlayerKillSlot::~CPlayerKillSlot ()
{
}

void CPlayerKillSlot::CreateSubControl ()
{
	CD3DFontPar* pFont = DxFontMan::GetInstance().LoadDxFont ( _DEFAULT_FONT, 9, _DEFAULT_FONT_SHADOW_FLAG );
	int	nTextAlign = TEXT_ALIGN_CENTER_X;

	CUIControl* pProgressBack = new CUIControl(m_pEngineDevice);
	pProgressBack->CreateSub ( this, "PLAYERKILL_SLOT_BG" );
	RegisterControl ( pProgressBack );

	CString strTemp;
	{
		m_pPlayerKiller		= CreateStaticControl ( "PLAYERKILLER_TEXT_BASE_NAME", pFont, NS_UITEXTCOLOR::PALEGREEN, nTextAlign );
		m_pPlayerVictim		= CreateStaticControl ( "PLAYERVICTIM_TEXT_BASE_NAME", pFont, NS_UITEXTCOLOR::RED, nTextAlign );
	}

	for ( int i = 0; i < nSCHOOLMARK; ++i )
	{
		strTemp.Format ( "PLAYERKILLER_SCHOOL_IMAGE%d",i); 
		m_pSchoolKiller[i] = CreateControl ( strTemp );

		strTemp.Format ( "PLAYERVICTIM_SCHOOL_IMAGE%d",i); 
		m_pSchoolVictim[i] = CreateControl ( strTemp );
	}

	m_pKillIco = CreateControl ( "PLAYERKILL_ICON" );
	
	for ( int i = 0 ; i < GLCI_NUM_ACTOR; ++i ) 
	{
		strTemp.Format ( "PLAYERKILLER_CLASS_IMAGE%d",i); 	
		m_pClassImgKiller[i] = new CUIControl(m_pEngineDevice);
		m_pClassImgKiller[i]->CreateSub ( this, strTemp );	
		m_pClassImgKiller[i]->SetTransparentOption( TRUE );
		RegisterControl ( m_pClassImgKiller[i] );

		strTemp.Format ( "PLAYERVICTIM_CLASS_IMAGE%d",i);
		m_pClassImgVictim[i] = new CUIControl(m_pEngineDevice);
		m_pClassImgVictim[i]->CreateSub ( this, strTemp );	
		m_pClassImgVictim[i]->SetTransparentOption( TRUE );
		RegisterControl ( m_pClassImgVictim[i] );
	}
}

CUIControl*	CPlayerKillSlot::CreateControl ( const char* szControl )
{
	CUIControl* pControl = new CUIControl(m_pEngineDevice);
	pControl->CreateSub ( this, szControl );
	RegisterControl ( pControl );
	return pControl;
}

CBasicTextBoxEx* CPlayerKillSlot::CreateStaticControl ( char* szControlKeyword, CD3DFontPar* pFont, D3DCOLOR dwColor, int nAlign )
{
	CBasicTextBoxEx* pStaticText = new CBasicTextBoxEx(m_pEngineDevice);
	pStaticText->CreateSub ( this, szControlKeyword );
	pStaticText->SetFont ( pFont );
	pStaticText->SetTextAlign ( nAlign );
	RegisterControl ( pStaticText );
	return pStaticText;
}

//CBasicTextBox* CCharacterWindow::CreateStaticControl (const char* szControlKeyword, CD3DFontPar* pFont, int nAlign, const UIGUID& cID )
//{
//	CBasicTextBox* pStaticText = new CBasicTextBox(m_pEngineDevice);
//	pStaticText->CreateSub ( this, szControlKeyword, UI_FLAG_DEFAULT, cID );
//	pStaticText->SetFont ( pFont );
//	pStaticText->SetTextAlign ( nAlign );	
//	RegisterControl ( pStaticText );
//
//	return pStaticText;
//}

void CPlayerKillSlot::Init( SPLAYER_KILL_FEED sKILLFEED )
{
	m_pPlayerKiller->ClearText();
	m_pPlayerVictim->ClearText();

	for(int i=0;i<nSCHOOLMARK;i++)
	{
		m_pSchoolKiller[i]->SetVisibleSingle(FALSE);
		m_pSchoolVictim[i]->SetVisibleSingle(FALSE);
	}

	for ( int i = 0 ; i < GLCI_NUM_ACTOR; ++i ) 
	{
		m_pClassImgKiller[i]->SetVisibleSingle(FALSE);
		m_pClassImgVictim[i]->SetVisibleSingle(FALSE);
	}
	m_pKillIco->SetDiffuseAlpha( 255 );

	m_pClassImgKiller[sKILLFEED.dwClassKiller]->SetVisibleSingle ( TRUE );
	m_pClassImgKiller[sKILLFEED.dwClassKiller]->SetDiffuseAlpha( 255 );
	m_pSchoolKiller[sKILLFEED.wSchoolKiller]->SetVisibleSingle ( TRUE );
	m_pSchoolKiller[sKILLFEED.wSchoolKiller]->SetDiffuseAlpha( 255 );
	m_pPlayerKiller->AddText( sKILLFEED.szKiller, NS_UITEXTCOLOR::PALEGREEN );
	
	m_pClassImgVictim[sKILLFEED.dwClassVictim]->SetVisibleSingle ( TRUE );
	m_pClassImgVictim[sKILLFEED.dwClassVictim]->SetDiffuseAlpha( 255 );
	m_pSchoolVictim[sKILLFEED.wSchoolVictim]->SetVisibleSingle ( TRUE );
	m_pSchoolVictim[sKILLFEED.wSchoolVictim]->SetDiffuseAlpha( 255 );
	m_pPlayerVictim->AddText( sKILLFEED.szVictim, NS_UITEXTCOLOR::RED );

	//
	if( sKILLFEED.fAGE < 4.0f )
	{
		float fALPHA = ( sKILLFEED.fAGE/4.0f ) * 255;
		WORD m_wALPA = (WORD)fALPHA;

		m_pKillIco->SetDiffuseAlpha( m_wALPA );

		m_pClassImgKiller[sKILLFEED.dwClassKiller]->SetDiffuseAlpha( m_wALPA );
		m_pSchoolKiller[sKILLFEED.wSchoolKiller]->SetDiffuseAlpha( m_wALPA );
		m_pPlayerKiller->SetUseTextColor( 0, TRUE );
		m_pPlayerKiller->SetTextColor(0, D3DCOLOR_ARGB(m_wALPA,0,255,0) );
				
		m_pClassImgVictim[sKILLFEED.dwClassVictim]->SetDiffuseAlpha( m_wALPA );
		m_pSchoolVictim[sKILLFEED.wSchoolVictim]->SetDiffuseAlpha( m_wALPA );
		m_pPlayerVictim->SetUseTextColor( 0, TRUE );
		m_pPlayerVictim->SetTextColor(0, D3DCOLOR_ARGB(m_wALPA,255,0,0) );
	}
}