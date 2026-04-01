#include "StdAfx.h"
#include "../../../RanLogicClient/GLGaeaClient.h"
#include "../../../RanLogic/Skill/GLSkill.h"
#include "../RanLogic/RANPARAM.h"
#include "PlayerKillDisplay.h"
#include "PlayerKillSlot.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

CPlayerKillDisplay::CPlayerKillDisplay (GLGaeaClient* pGaeaClient, OldInterface* pInterface, EngineDeviceMan* pEngineDevice) 
	: CUIGroup(pEngineDevice)
	, m_pGaeaClient( pGaeaClient )
	, m_pInterface(pInterface)
{
	memset ( m_pKillSlot, 0, sizeof ( CPlayerKillSlot* ) * PLAYERKILL_FEED_SIZE );
}

CPlayerKillDisplay::~CPlayerKillDisplay ()
{
}

void CPlayerKillDisplay::CreateSubControl ()
{	
	CString strTemp;
	for( int i=0;i<PLAYERKILL_FEED_SIZE;i++)
	{
		strTemp.Format ( "PLAYERKILL_SLOT_%d",i); 
		m_pKillSlot[i] = CreateKillSlot ( strTemp );
	}
	
}

CPlayerKillSlot* CPlayerKillDisplay::CreateKillSlot ( CString strKeyword )
{
	CPlayerKillSlot* pKillSlot = new CPlayerKillSlot(m_pGaeaClient, m_pEngineDevice);
	pKillSlot->CreateSub ( this, strKeyword.GetString () );
	pKillSlot->CreateSubControl ();
	RegisterControl ( pKillSlot );
	return pKillSlot;
}

void CPlayerKillDisplay::Update ( int x, int y, BYTE LB, BYTE MB, BYTE RB, int nScroll, float fElapsedTime, BOOL bFirstControl )
{
	if ( !IsVisible () ) return ;

	GLCharacter* pCharacter = m_pGaeaClient->GetCharacter();
	if ( !pCharacter ) return;

	for ( int i = 0; i < PLAYERKILL_FEED_SIZE; i++ )
	{
		m_pKillSlot[i]->SetVisibleSingle( FALSE );

		const SPLAYER_KILL_FEED& sKILLFEED = pCharacter->m_sPLAYER_KILL[i];
		if( sKILLFEED.m_dwID == -1 )		
		{
			continue;
		}

		if( m_pKillSlot[i] )	
		{
			m_pKillSlot[i]->Init( sKILLFEED );
			m_pKillSlot[i]->SetVisibleSingle( TRUE );
		}
	}

	CUIGroup::Update ( x, y, LB, MB, RB, nScroll, fElapsedTime, bFirstControl );	
}