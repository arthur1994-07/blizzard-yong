//PK Notification - Kill Feed
#include "StdAfx.h"
#include "PKRankNotification.h"
#include "PKRankNotificationInfo.h"
#include "../OldInterface.h"
#include "../../../RanLogicClient/GLGaeaClient.h"
#include "../../../EngineLib/DxTools/DxViewPort.h"
#include "../../../RanLogicClient/Char/GLCharacter.h"

// ----------------------------------------------------------------------------
#include "../../../SigmaCore/DebugInclude.h"
// ----------------------------------------------------------------------------

CPKRankNotification::CPKRankNotification ( GLGaeaClient* pGaeaClient, OldInterface* pInterface, EngineDeviceMan* pEngineDevice )
	: CUIGroup( pEngineDevice )
	, m_pGaeaClient ( pGaeaClient )
	, m_pInterface( pInterface )
{
	for( int i = 0; i < PKNOTIF_NUM; ++ i )
	{
		m_pInfo[i] = NULL;
	}
}

CPKRankNotification::~CPKRankNotification()
{
}

CUIControl*	CPKRankNotification::CreateControl ( char* szControl, const UIGUID& cID )
{
	CUIControl* pControl = new CUIControl( m_pEngineDevice );
	pControl->CreateSub ( this, szControl, UI_FLAG_DEFAULT, cID );
	RegisterControl ( pControl );
	return pControl;
}

void CPKRankNotification::CreateSubControl()
{
	std::string strInfo[PKNOTIF_NUM] = 
	{
		"PK_RANK_NOTIFICATION_0",
		"PK_RANK_NOTIFICATION_1",
		"PK_RANK_NOTIFICATION_2",
		"PK_RANK_NOTIFICATION_3",
		"PK_RANK_NOTIFICATION_4",
		"PK_RANK_NOTIFICATION_5",
		"PK_RANK_NOTIFICATION_6",
		"PK_RANK_NOTIFICATION_7",
		"PK_RANK_NOTIFICATION_8",
		"PK_RANK_NOTIFICATION_9",
	};

	for( int i = 0; i < PKNOTIF_NUM; ++ i )
	{
		m_pInfo[i] = new CPKRankNotificationInfo( m_pGaeaClient, m_pEngineDevice );
		m_pInfo[i]->CreateSub ( this, strInfo[i].c_str() );
		m_pInfo[i]->CreateSubControl ();
		RegisterControl ( m_pInfo[i] );
	}
}

void CPKRankNotification::TranslateUIMessage( UIGUID cID, DWORD dwMsg )
{
	CUIGroup::TranslateUIMessage( cID, dwMsg );
}

void CPKRankNotification::Update ( int x, int y, BYTE LB, BYTE MB, BYTE RB, int nScroll, float fElapsedTime, BOOL bFirstControl )
{
	if ( !IsVisible () ) return ;

	// Dynamic right-side positioning
	{
		float fScreenWidth = DxViewPort::GetInstance().GetWidth();
		const UIRECT& rcGlobalPos = GetGlobalPos();
		float fDesiredLeft = fScreenWidth - rcGlobalPos.sizeX - 5.0f; // 5px right margin
		float fGapX = fDesiredLeft - rcGlobalPos.left;

		if ( fGapX > 1.0f || fGapX < -1.0f )
		{
			UIRECT rcNewPos = rcGlobalPos;
			rcNewPos.left  = fDesiredLeft;
			rcNewPos.right = fDesiredLeft + rcNewPos.sizeX;
			SetGlobalPos( rcNewPos ); // CUIGroup::SetGlobalPos cascades to all children

			// Keep local pos in sync for top-level control
			UIRECT rcLocalPos = GetLocalPos();
			rcLocalPos.left  = fDesiredLeft;
			rcLocalPos.right = fDesiredLeft + rcLocalPos.sizeX;
			SetLocalPos( rcLocalPos );
		}
	}

	CUIGroup::Update ( x, y, LB, MB, RB, nScroll, fElapsedTime, bFirstControl );

	for( int i = 0; i < PKNOTIF_NUM; ++ i )
	{
		if ( m_pInfo[i] )
			m_pInfo[i]->SetVisibleSingle( FALSE );
	}

	PK_HISTORY_VEC vecPKHistory = m_pGaeaClient->m_vecPKHistory;
	for( int i = 0; i < (int)vecPKHistory.size(); ++ i )
	{
		if ( i >= PKNOTIF_NUM )	continue;

		if ( m_pInfo[i] )
		{
			m_pInfo[i]->SetVisibleSingle( TRUE );
			m_pInfo[i]->SetData( vecPKHistory[i] );
		}
	}
}

void CPKRankNotification::SetVisibleSingle ( BOOL bVisible )
{
	CUIGroup::SetVisibleSingle ( bVisible );
}
