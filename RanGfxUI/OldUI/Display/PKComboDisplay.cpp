#include "StdAfx.h"
#include "PKComboDisplay.h"
#include "PKComboType.h"

#include "../../../RanLogicClient/GLGaeaClient.h"
#include "../../../EngineLib/DxTools/DxViewPort.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

CPKComboDisplay::CPKComboDisplay (GLGaeaClient* pGaeaClient, OldInterface* pInterface, EngineDeviceMan* pEngineDevice)
	: CUIGroup(pEngineDevice)
	, m_pInterface( pInterface )
	, m_pGaeaClient( pGaeaClient )
{
}

CPKComboDisplay::~CPKComboDisplay ()
{
}

void CPKComboDisplay::CreateSubControl()
{
	CString strKeyword[MAX_KILL] =
	{
		"PK_COMBO_FIRST_BLOOD",
		"PK_COMBO_DOUBLE_KILL",
		"PK_COMBO_TRIPLE_KILL",
		"PK_COMBO_QUARD_KILL",
		"PK_COMBO_MASTER_KILL",
		"PK_COMBO_KILLINGSPREE",
		"PK_COMBO_DOMINATING",
		"PK_COMBO_MEGAKILL",
		"PK_COMBO_UNSTOPPABLE",
		"PK_COMBO_WICKEDSICK",
		"PK_COMBO_MONSTERKILL",
		"PK_COMBO_GODLIKE",
		"PK_COMBO_HOLYSHIT",
		"PK_COMBO_OWNAGE",
	};

	for ( int i = 0; i < MAX_KILL; ++i )
	{
		m_pKILL_COUNT[i] = new CPKComboType(m_pEngineDevice);
		m_pKILL_COUNT[i]->CreateSub ( this, strKeyword[i].GetString(), UI_FLAG_DEFAULT, FIRST_BLOOD + i );
		m_pKILL_COUNT[i]->CreateSubControl ( strKeyword[i] );
		m_pKILL_COUNT[i]->SetVisibleSingle ( FALSE );
		m_pKILL_COUNT[i]->SetUseRender ( FALSE );
		m_pKILL_COUNT[i]->STOP ();
		m_pKILL_COUNT[i]->RESET ();		
		RegisterControl ( m_pKILL_COUNT[i] );
	}

	m_pPositionControl = new CUIControl(m_pEngineDevice);
	m_pPositionControl->CreateSub ( this, "PKCOMBO_DISPLAY_POSITION" );
	m_pPositionControl->SetVisibleSingle ( FALSE );
	RegisterControl ( m_pPositionControl );
}

bool	CPKComboDisplay::START ( UIGUID cID )
{
	if ( cID < FIRST_BLOOD || OWNAGE < cID ) return false;

	int nIndex = cID - FIRST_BLOOD;
	m_pKILL_COUNT[nIndex]->SetVisibleSingle ( TRUE );
	m_pKILL_COUNT[nIndex]->START ();

	return true;
}

bool	CPKComboDisplay::RESET ( UIGUID cID )
{
	if ( cID < FIRST_BLOOD || OWNAGE < cID ) return false;

	int nIndex = cID - FIRST_BLOOD;	
	m_pKILL_COUNT[nIndex]->RESET ();

	return true;
}

bool	CPKComboDisplay::STOP ()
{
	for ( int i = 0; i>MAX_KILL; ++i )
	{
		m_pKILL_COUNT[i]->STOP ();
		m_pKILL_COUNT[i]->SetVisibleSingle ( FALSE );
	}

	return true;
}

void CPKComboDisplay::Update ( int x, int y, BYTE LB, BYTE MB, BYTE RB, int nScroll, float fElapsedTime, BOOL bFirstControl )
{
	if ( !IsVisible () ) return ;

	CUIGroup::Update ( x, y, LB, MB, RB, nScroll, fElapsedTime, bFirstControl );

	D3DXVECTOR3 vPos = m_pGaeaClient->GetCharacter()->GetPosBodyHeight();

	static D3DXVECTOR3 vScreenBack;
	D3DXVECTOR3 vScreen = DxViewPort::GetInstance().ComputeVec3Project ( &vPos, NULL );

	// 마우스 움직임에 흔들림을 보정한다.
	if( abs( vScreenBack.x - vScreen.x ) < 1.0f )
	{
		vScreen.x = vScreenBack.x;
	}

	bool bPLAYING( false );

	for ( int i = 0; i < MAX_KILL; ++i )
	{
		const UIRECT& rcOriginPos = m_pKILL_COUNT[i]->GetGlobalPos ();

		D3DXVECTOR2 vPos;
		vPos.x = floor(vScreen.x - ( rcOriginPos.sizeX * 0.5f ));
		vPos.y = m_pPositionControl->GetGlobalPos().top;

		if ( m_pKILL_COUNT[i]->ISPLAYING () )
		{
			if (m_pKILL_COUNT[2]->IsVisible())	m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
			else if (m_pKILL_COUNT[3]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[4]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[5]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[4]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[6]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[4]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[5]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[7]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[4]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[5]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[6]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[8]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[4]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[5]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[6]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[7]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[9]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[4]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[5]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[6]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[7]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[8]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[10]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[4]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[5]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[6]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[7]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[8]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[9]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[11]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[4]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[5]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[6]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[7]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[8]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[9]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[10]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[12]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[4]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[5]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[6]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[7]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[8]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[9]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[11]->SetVisibleSingle(FALSE);
			}
			else if (m_pKILL_COUNT[13]->IsVisible())
			{
				m_pKILL_COUNT[1]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[2]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[3]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[4]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[5]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[6]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[7]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[8]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[9]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[11]->SetVisibleSingle(FALSE);
				m_pKILL_COUNT[12]->SetVisibleSingle(FALSE);
			}


			m_pKILL_COUNT[i]->SetGlobalPos ( vPos );

			bPLAYING = true;
		}
		else
		{
			STOP ();
		}
	}

	vScreenBack = vScreen;

	if ( !bPLAYING ) m_pInterface->UiHideGroup ( GetWndID () );
}