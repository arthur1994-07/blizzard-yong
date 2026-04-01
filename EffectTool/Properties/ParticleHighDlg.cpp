// ParticleHighDlg.cpp : 구현 파일입니다.
//

#include "stdafx.h"
#include "../EffectTool.h"
#include "ParticleHighDlg.h"
#include ".\particlehighdlg.h"


// CParticleHighDlg 대화 상자입니다.

IMPLEMENT_DYNAMIC(CParticleHighDlg, CDialog)
CParticleHighDlg::CParticleHighDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CParticleHighDlg::IDD, pParent)
{
}

CParticleHighDlg::~CParticleHighDlg()
{
}

void CParticleHighDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COMBO_BLEND, m_pComboBlend);
}


BEGIN_MESSAGE_MAP(CParticleHighDlg, CDialog)
	ON_BN_CLICKED(IDC_CHECK_GCOLLISION, OnBnClickedCheckGcollision)
	ON_BN_CLICKED(IDC_CHECK_GOTOCENTER, OnBnClickedCheckGotocenter)
	ON_BN_CLICKED(IDC_CHECK_COLLISION, OnBnClickedCheckCollision)
	ON_BN_CLICKED(IDC_CHECK_ATTRACTION, OnBnClickedCheckAttraction)
	ON_BN_CLICKED(IDC_CHECK_PARENT, OnBnClickedCheckParent)
	ON_BN_CLICKED(IDC_CHECK_DIRECTION, OnBnClickedCheckDirection)
	ON_CBN_SELCHANGE(IDC_COMBO_BLEND, OnCbnSelchangeComboBlend)
	ON_BN_CLICKED(IDC_CHECK_CENTER, OnBnClickedCheckCenter)
	ON_BN_CLICKED(IDC_CHECK_PARENT_MOVE, OnBnClickedCheckParentMove)
	ON_BN_CLICKED(IDC_CHECK_PARENT_ROTATE_WORLD, OnBnClickedCheckParentRotateWorld)
	ON_BN_CLICKED(IDC_CHECK_BILLALL, OnBnClickedCheckBillall)
	ON_BN_CLICKED(IDC_CHECK_BILLUP, OnBnClickedCheckBillup)
	ON_BN_CLICKED(IDC_CHECK_THROW, OnBnClickedCheckThrow)
	ON_BN_CLICKED(IDC_CHECK_GROUND, OnBnClickedCheckGround)
	ON_BN_CLICKED(IDC_CHECK_FROMTO, OnBnClickedCheckFromto)
	ON_BN_CLICKED(IDC_CHECK_HEIGHT_NO, OnBnClickedCheckHeightNo)
END_MESSAGE_MAP()

const char szMatrixMoveName[2][256] = 
{
    "Relative position: If the center moves, the whole object follows. This is used mainly in test environments.",
    "Absolute position: The center can move, but the object itself does not follow or react."
};

const char szMatrixRotateName[2][256] = 
{
    "Rotation Enabled: The object's matrix changes based on the parent matrix.",
    "Rotation Disabled: Even if the parent matrix rotates, the object does not change at all."
};

const char szMatrixExName[2][256] = 
{
    "World Rotation Enabled: When rotating objects of the same type in the world editor, they rotate smoothly together.",
    "World Rotation Disabled: Treated as a default (fixed) value."
};

// CParticleHighDlg 메시지 처리기입니다.

BOOL CParticleHighDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// TODO:  여기에 추가 초기화 작업을 추가합니다.

	int	nIndex;
	CString	strText;
	m_pComboBlend.ResetContent();

	strText.Format("1. Translucent");
	nIndex = m_pComboBlend.AddString(strText);
	m_pComboBlend.SetItemData(nIndex, 1);

	strText.Format("2. Translucent - Level 2");
	nIndex = m_pComboBlend.AddString(strText);
	m_pComboBlend.SetItemData(nIndex, 2);

	strText.Format("3. Translucent - Level 4");
	nIndex = m_pComboBlend.AddString(strText);
	m_pComboBlend.SetItemData(nIndex, 3);

	strText.Format("4. Darken - Alpha On");
	nIndex = m_pComboBlend.AddString(strText);
	m_pComboBlend.SetItemData(nIndex, 4);

	strText.Format("5. Default Value");
	nIndex = m_pComboBlend.AddString(strText);
	m_pComboBlend.SetItemData(nIndex, 5);

	strText.Format("6. Alpha Memory - Reuse if Overlapped");
	nIndex = m_pComboBlend.AddString(strText);
	m_pComboBlend.SetItemData(nIndex, 6);

	m_pComboBlend.SetCurSel ( m_nBlend - 1 );

	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_GCOLLISION );
	pButton->SetCheck ( m_bGCollision );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_GOTOCENTER );
	pButton->SetCheck ( m_bGotoCenter );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_COLLISION );
	pButton->SetCheck ( m_bCollision );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_ATTRACTION );
	pButton->SetCheck ( m_bAttraction );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_CENTER );
	pButton->SetCheck ( m_bCenter );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_DIRECTION );
	pButton->SetCheck ( m_bDirection );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_BILLALL );
	pButton->SetCheck ( m_bBillBoardAll );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_BILLUP );
	pButton->SetCheck ( m_bBillBoardUp );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_GROUND );
	pButton->SetCheck ( m_bBillBoardGround );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_PARENT_MOVE );
	pButton->SetCheck ( m_bParentMove );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_PARENT_ROTATE );
	pButton->SetCheck ( m_bParentRotate );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_PARENT_ROTATE_WORLD );
	pButton->SetCheck ( m_bParentRotateWorld );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_THROW );
	pButton->SetCheck ( m_bEffThrow );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_FROMTO );
	pButton->SetCheck ( m_bFromTo );

	pButton = (CButton*) GetDlgItem ( IDC_CHECK_HEIGHT_NO );
	pButton->SetCheck ( m_bHeightNO );

	


	//	설명 업데이트
	SetStatic ();

	return TRUE;  // return TRUE unless you set the focus to a control
	// 예외: OCX 속성 페이지는 FALSE를 반환해야 합니다.
}

void CParticleHighDlg::SetStatic ()
{
	CWnd*	pWnd;
	pWnd = GetDlgItem ( IDC_STATIC_MATRIX_MOVE );
	if ( m_bParentMove )	pWnd->SetWindowText ( szMatrixMoveName[0] );
	else					pWnd->SetWindowText ( szMatrixMoveName[1] );

	pWnd = GetDlgItem ( IDC_STATIC_MATRIX_ROTATE );
	if ( m_bParentRotate )	pWnd->SetWindowText ( szMatrixRotateName[0] );
	else					pWnd->SetWindowText ( szMatrixRotateName[1] );

	pWnd = GetDlgItem ( IDC_STATIC_MATRIX_EX );
	if ( m_bParentRotateWorld )	pWnd->SetWindowText ( szMatrixExName[0] );
	else						pWnd->SetWindowText ( szMatrixExName[1] );
	//if ( m_bParentMove && m_bParentRotate )			pWnd->SetWindowText ( szMatrixExName[0] );
	//else if ( m_bParentMove && !m_bParentRotate )	pWnd->SetWindowText ( szMatrixExName[1] );
	//else if ( !m_bParentMove && m_bParentRotate )	pWnd->SetWindowText ( szMatrixExName[2] );
	//else											pWnd->SetWindowText ( szMatrixExName[3] );
}

void CParticleHighDlg::OnCbnSelchangeComboBlend()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	int nIndex, nData;
	nIndex = m_pComboBlend.GetCurSel();
	nData = m_pComboBlend.GetItemData ( nIndex );

	m_nBlend = nData;
}

void CParticleHighDlg::OnBnClickedCheckGcollision()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_GCOLLISION );

	m_bGCollision =  ( pButton->GetCheck() ) ? TRUE : FALSE;
}

void CParticleHighDlg::OnBnClickedCheckGotocenter()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_GOTOCENTER );

	m_bGotoCenter =  ( pButton->GetCheck() ) ? TRUE : FALSE;
}

void CParticleHighDlg::OnBnClickedCheckCollision()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_COLLISION );

	m_bCollision =  ( pButton->GetCheck() ) ? TRUE : FALSE;
}

void CParticleHighDlg::OnBnClickedCheckAttraction()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_ATTRACTION );

	m_bAttraction =  ( pButton->GetCheck() ) ? TRUE : FALSE;
}

void CParticleHighDlg::OnBnClickedCheckDirection()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_DIRECTION );

	m_bDirection =  ( pButton->GetCheck() ) ? TRUE : FALSE;
}
void CParticleHighDlg::OnBnClickedCheckCenter()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_CENTER );

	m_bCenter =  ( pButton->GetCheck() ) ? TRUE : FALSE;
}

void CParticleHighDlg::OnBnClickedCheckBillall()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_BILLALL );

	m_bBillBoardAll =  ( pButton->GetCheck() ) ? TRUE : FALSE;

	if ( m_bBillBoardAll )
	{
		pButton = (CButton*) GetDlgItem ( IDC_CHECK_GROUND );
		pButton->SetCheck ( FALSE );
		m_bBillBoardGround = FALSE;
	}
}

void CParticleHighDlg::OnBnClickedCheckBillup()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_BILLUP );

	m_bBillBoardUp =  ( pButton->GetCheck() ) ? TRUE : FALSE;

	if ( m_bBillBoardUp )
	{
		pButton = (CButton*) GetDlgItem ( IDC_CHECK_GROUND );
		pButton->SetCheck ( FALSE );
		m_bBillBoardGround = FALSE;
	}
}

void CParticleHighDlg::OnBnClickedCheckGround()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_GROUND );

	m_bBillBoardGround =  ( pButton->GetCheck() ) ? TRUE : FALSE;

	if ( m_bBillBoardGround )
	{
		pButton = (CButton*) GetDlgItem ( IDC_CHECK_BILLALL );
		pButton->SetCheck ( FALSE );
		m_bBillBoardAll = FALSE;

		pButton = (CButton*) GetDlgItem ( IDC_CHECK_BILLUP );
		pButton->SetCheck ( FALSE );
		m_bBillBoardUp = FALSE;
	}
}

void CParticleHighDlg::OnBnClickedCheckParentMove()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_PARENT_MOVE );

	m_bParentMove =  ( pButton->GetCheck() ) ? TRUE : FALSE;

	//	설명 업데이트
	SetStatic ();
}

void CParticleHighDlg::OnBnClickedCheckParent()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_PARENT_ROTATE );

	m_bParentRotate =  ( pButton->GetCheck() ) ? TRUE : FALSE;

	//	설명 업데이트
	SetStatic ();
}

void CParticleHighDlg::OnBnClickedCheckParentRotateWorld()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_PARENT_ROTATE_WORLD );

	m_bParentRotateWorld =  ( pButton->GetCheck() ) ? TRUE : FALSE;

	//	설명 업데이트
	SetStatic ();
}

void CParticleHighDlg::OnBnClickedCheckThrow()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_THROW );

	m_bEffThrow =  ( pButton->GetCheck() ) ? TRUE : FALSE;
}

void CParticleHighDlg::OnBnClickedCheckFromto()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_FROMTO );

	m_bFromTo =  ( pButton->GetCheck() ) ? TRUE : FALSE;
}

void CParticleHighDlg::OnBnClickedCheckHeightNo()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CButton *pButton;
	pButton = (CButton*) GetDlgItem ( IDC_CHECK_HEIGHT_NO );

	m_bHeightNO =  ( pButton->GetCheck() ) ? TRUE : FALSE;
}
