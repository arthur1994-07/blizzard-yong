// VehiclePage.cpp : 구현 파일입니다.
//

#include "stdafx.h"
#include "../CharEdit.h"

#include "../MainFrm.h"
#include "../CharEditDoc.h"
#include "../CharEditView.h"

#include "SheetWithTabChar.h"
#include "sheetWithTabFrame.h"
#include "SheetWithTabAnim.h"
#include "sheetWithTabPiece.h"
#include "sheetWithTabBoardEdit.h"

#include "../../SigmaCore/Util/Util.h"

#include "../../EngineLib/DxTools/DebugSet.h"
#include "../../EngineLib/DxTools/DxMethods.h"
#include "../../EngineLib/DxMeshs/SkinMesh/DxSkinObject.h"
#include "../../EngineLib/DxMeshs/SkinMesh/DxVehicle.h"
#include "../../EngineLib/DxMeshs/SkinMesh/DxVehicleData.h"

#include "../../MfcExLib/ExLibs/EtcFunction.h"

#include "VehiclePage.h"

#include "../State/CharStateMachine.h"

extern BOOL	g_bClickSpinRadius;
extern BOOL	g_bClickSpinHeight;

// CVehiclePage 대화 상자입니다.

IMPLEMENT_DYNAMIC(CVehiclePage, CPropertyPage)
CVehiclePage::CVehiclePage() :
    CPieceContainerPage(CVehiclePage::IDD)
{
    
}

CVehiclePage::~CVehiclePage()
{
}

void CVehiclePage::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CVehiclePage, CPropertyPage)
	ON_BN_CLICKED(IDC_BUTTON_NEW, OnBnClickedButtonNew)
	ON_BN_CLICKED(IDC_BUTTON_OPEN, OnBnClickedButtonOpen)
	ON_BN_CLICKED(IDC_BUTTON_SAVE, OnBnClickedButtonSave)
	ON_BN_CLICKED(IDC_CHECK_NOCHARACTER, OnBnClickedCheckNocharacter)
	ON_EN_CHANGE(IDC_EDIT_RADIUS, OnEnChangeEditRadius)
	ON_EN_CHANGE(IDC_EDIT_HEIGHT, OnEnChangeEditHeight)
	ON_BN_CLICKED(IDC_BUTTON_FOOT_COLL, &CVehiclePage::OnBnClickedButtonFootColl)
END_MESSAGE_MAP()


// CVehiclePage 메시지 처리기입니다.
BOOL CVehiclePage::OnInitDialog()
{
	CPropertyPage::OnInitDialog();

	// TODO:  여기에 추가 초기화 작업을 추가합니다.
	CRect SheetRect;
	CWnd *pWnd;

	//	Note : CsheetWithTabFrame 를 만든다.
	//
	pWnd = GetDlgItem ( IDC_STATIC_SHEETTAP1 );
	pWnd->GetWindowRect ( SheetRect );
	ScreenToClient ( &SheetRect );

	m_psheetWithTabFrame = new CsheetWithTabFrame ( SheetRect, this );
	m_psheetWithTabFrame->Create ( this, WS_CHILD|WS_VISIBLE|WS_TABSTOP, 0 );
	m_psheetWithTabFrame->m_FramePage.SetFrameEditType( EMFRAMEEDIT_VEHICLE );

	//	Note : CsheetWithTabAnim 를 만든다.
	//
	pWnd = GetDlgItem ( IDC_STATIC_SHEETTAP2 );
	pWnd->GetWindowRect ( SheetRect );
	ScreenToClient ( &SheetRect );

	m_psheetWithTabAnim = new CsheetWithTabAnim ( SheetRect, this );
	m_psheetWithTabAnim->Create ( this, WS_CHILD|WS_VISIBLE|WS_TABSTOP, 0 );

    CRect SheetRectAll;
    GetWindowRect ( SheetRectAll );
    ScreenToClient ( &SheetRectAll );

    //	Note : CsheetWithTabPiece 를 만든다.
    //
#ifdef DEF_SKIN_SYNC
    m_psheetWithTabPiece = new CsheetWithTabPiece ( SheetRect, SheetRectAll, this );
    m_psheetWithTabPiece->Create ( this, WS_CHILD|WS_VISIBLE|WS_TABSTOP, 0 );
    m_psheetWithTabPiece->ShowWindow(SW_HIDE);
#endif

	pWnd = GetDlgItem ( IDC_STATIC_SHEETTAP3 );
	pWnd->GetWindowRect ( SheetRect );
	ScreenToClient ( &SheetRect );

	m_psheetWithTabBoardEdit= new CsheetWithTabBoardEdit ( SheetRect, this );
	m_psheetWithTabBoardEdit->Create ( this, WS_CHILD|WS_VISIBLE|WS_TABSTOP, 0 );

	m_psheetWithTabBoardEdit->ShowWindow(FALSE);	

	SetWin_ShowWindow( this, IDC_STATIC_SHEETTAP3, FALSE );

	pWnd = GetDlgItem ( IDC_EDIT_CHARFILE );
	pWnd->SetWindowText ( "untitle00.vcf" );

	// Note : 버튼 재 설정
	ReSetCheckButton();

	// Note : 버튼 재 설정
	ReSetEditBox();

	return TRUE;  // return TRUE unless you set the focus to a control
	// 예외: OCX 속성 페이지는 FALSE를 반환해야 합니다.
}

void CVehiclePage::OnBnClickedButtonNew()
{
	if( m_hWnd == NULL ) return;

	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

	DxVehicle *pVehicle = pView->GetVehicle();
	DxVehicleData* pVehicleData = pView->GetVehicleData ();

	CWnd *pWnd;
	pWnd = GetDlgItem ( IDC_EDIT_CHARFILE );
	pWnd->SetWindowText ( "untitle00.vcf" );

	pVehicleData->ClearAll ();
	pVehicle->ClearAll ();

    CharStateMachine::ClearFileNotifier();

	m_psheetWithTabFrame->ReSetPages ();
	m_psheetWithTabAnim->ReSetPages ();
	m_psheetWithTabBoardEdit->ReSetPages();
#ifdef DEF_SKIN_SYNC
    m_psheetWithTabPiece->ReSetPages ();	
#endif

	// Note : 버튼 재 설정
	ReSetCheckButton();

	// Note : 버튼 재 설정
	ReSetEditBox();
}

VOID	CVehiclePage::InsertSkinPiece( const char *pszFileName )
{
	m_psheetWithTabFrame->m_FramePage.InsertSkinPiece(pszFileName);
}

VOID	CVehiclePage::InsertSkinEff( const char *pszFileName )
{
	m_psheetWithTabFrame->m_FramePage.InsertSkinEff(pszFileName);
}

VOID	CVehiclePage::LoadAnimation( const char *pszFileName )
{
	m_psheetWithTabAnim->m_AnimTabPage.GetAnimPage()->LoadAnimation(pszFileName);
}

VOID	CVehiclePage::LoadSkinBone( const char *pszFileName )
{
	m_psheetWithTabFrame->m_FramePage.LoadSkinBone(pszFileName);
}

BOOL CVehiclePage::LoadVcfFile( const char *pszFileName )
{
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	LPDIRECT3DDEVICEQ pd3dDevice = pView->GetD3dDevice ();
	DxVehicle *pVehicle = pView->GetVehicle();
	DxVehicleData *pVehicleData = pView->GetVehicleData();

	//	Note : Sound Log
#ifdef	_DEBUG
	CDebugSet::ToFile ( "UseSoundList.txt", "" );
	CDebugSet::ToFile ( "UseSoundList.txt", "[-------------------------------------------------------------]" );
	CDebugSet::ToFile ( "UseSoundList.txt", "[!.%s]", pszFileName );

	//////////////////////////////////////////////
	//	<--	현재 시간 확인
	char	szTime[128];
	SYSTEMTIME	UniversalTime;
	SYSTEMTIME	LocalTime;

	//	<--0	Universal Time 가져오기
	GetSystemTime( &UniversalTime );
	//	-->0	Universal Time 가져오기

	//	<--0	TimeZone 가져오기
	TIME_ZONE_INFORMATION TimeZone;
	GetTimeZoneInformation ( &TimeZone );
	//	-->0	TimeZone 가져오기

	//	<--0	Universal Time과 TimeZone의 합성
	SystemTimeToTzSpecificLocalTime ( &TimeZone, &UniversalTime, &LocalTime );
	//	-->0	Universal Time과 TimeZone의 합성

	sprintf ( szTime, "%d-%02d-%02dT%02d:%02d", LocalTime.wYear, LocalTime.wMonth,
		LocalTime.wDay, LocalTime.wHour, LocalTime.wMinute );	
	//	-->	현재 시간 확인
	////////////////////////////////////////////////

	CDebugSet::ToFile ( "UseSoundList.txt", "[$.%s]", szTime );	
#endif	//	_DEBUG

	//	Note : 앳 대이터를 초기화.
	OnBnClickedButtonNew();

	// 바이크용 탑승자를 초기화
	pView->ClearSkinPassenger();

	//	Note : 케릭터 파일 읽기.
	//
	BOOL bOk = pVehicleData->LoadFile ( pszFileName, pd3dDevice, EMSCD_ZERO );
	if ( !bOk )
	{
		MessageBox ( "Failed to read file." );
		return FALSE;
	}

	//	Note : 케릭터 Data 설정.
	//
	pVehicle->SetVehiclePartData ( pVehicleData, pd3dDevice );

#ifdef DEF_SKIN_SYNC
    for (int i = 0; i < PART_V_SIZE; ++i)
    {
        TSTRING strFile = pVehicleData->GetVehicleName(EMPIECECHAR(i));

        if (m_psheetWithTabPiece && strFile.empty() == false)
        {
            m_psheetWithTabPiece->GetSkinPiecePage()->LoadSkinPiece(strFile.c_str());
        }
    }
#endif

	CWnd *pWnd;
	pWnd = GetDlgItem ( IDC_EDIT_CHARFILE );
	pWnd->SetWindowText ( pszFileName );

	m_psheetWithTabFrame->ReSetPages ();
	m_psheetWithTabAnim->SetPages( NULL, pVehicle->m_spSkinAniControlThread.get() );
	m_psheetWithTabBoardEdit->SetPages( pVehicle->m_spSkinAniControlThread.get() );

	// Note : 버튼 재 설정
	ReSetCheckButton();

	// Note : 버튼 재 설정
	ReSetEditBox();

	pView->ResetSkinPos();

	pFrame->m_cDlgTimeLine.SetStop();

	CharStateMachine::InsertFileNotifier();

	return TRUE;
}

void CVehiclePage::OnBnClickedButtonOpen()
{
	CString szFilter = "Vehicle File (*.vcf)|*.vcf|";

	//	Note : 파일 오픈 다이알로그를 만듬.
	CFileDialog dlg(TRUE,".vcf",NULL,OFN_HIDEREADONLY|OFN_OVERWRITEPROMPT, szFilter,
		(CVehiclePage*)this);

	dlg.m_ofn.lpstrInitialDir = DxVehicleDataContainer::GetInstance().GetPath ();
	if ( dlg.DoModal() == IDOK )
	{
		CString sFileName = dlg.GetFileName();

		LoadVcfFile( sFileName.GetString() );
	}
}

void CVehiclePage::OnBnClickedButtonSave()
{
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	LPDIRECT3DDEVICEQ pd3dDevice = pView->GetD3dDevice ();

	DxVehicle *pVehicle = pView->GetVehicle();
	if( !pVehicle )		return;
	DxVehicleData *pVehicleData = pView->GetVehicleData();
	if( !pVehicleData )	return;

	std::string strName = sc::util::ChangeExtName( pVehicleData->GetFileName(), "" );

	//	Note : 파일 오픈 다이알로그를 만듬.
	CString szFilter = "Vehicle File (*.vcf)|*.vcf|";
	CFileDialog dlg(FALSE,".vcf", strName.c_str() ,OFN_HIDEREADONLY|OFN_OVERWRITEPROMPT, szFilter, (CVehiclePage*)this);

	dlg.m_ofn.lpstrInitialDir = DxVehicleDataContainer::GetInstance().GetPath ();
	if ( dlg.DoModal() == IDOK )
	{
		CString sFileName = dlg.GetFileName();

		//	Note : 케릭터 파일 쓰기.
		//
		BOOL bOk = pVehicleData->SaveFile ( sFileName.GetString(), pd3dDevice );

		if ( !bOk )
		{
			MessageBox ( "파일 쓰기에 실패하였습니다." );
		}

		CWnd *pWnd;
		pWnd = GetDlgItem ( IDC_EDIT_CHARFILE );
		pWnd->SetWindowText ( sFileName.GetString() );
	}
}

void CVehiclePage::OnBnClickedCheckNocharacter()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

	CButton* pButton = (CButton*)GetDlgItem( IDC_CHECK_NOCHARACTER );

	DxVehicle *pVehicle = pView->GetVehicle();
	if( pVehicle )
	{
		if( pButton->GetCheck() )	pVehicle->SetWorldObj( TRUE );
		else						pVehicle->SetWorldObj( FALSE );
	}

	DxVehicleData *pVehicleData = pView->GetVehicleData();
	if( pVehicleData )
	{
		if( pButton->GetCheck() )	pVehicleData->m_bWorldObj = TRUE;
		else						pVehicleData->m_bWorldObj = FALSE;
	}
}

void CVehiclePage::ReSetCheckButton()
{
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	if( !pFrame )	return;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	if( !pView )	return;

	CButton* pButton = (CButton*)GetDlgItem( IDC_CHECK_NOCHARACTER );
	DxVehicle *pVehicle = pView->GetVehicle();
	if( pVehicle )
	{
		if( pVehicle->GetWorldObj() )	pButton->SetCheck( TRUE );
		else							pButton->SetCheck( FALSE );
	}
	else
	{
		pButton->SetCheck( FALSE );
	}
}

void CVehiclePage::ReSetEditBox()
{
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	if( !pFrame )	return;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	if( !pView )	return;

	CWnd*	pWnd;
	CString Str;
	DxVehicleData *pVehicleData = pView->GetVehicleData();
	if( pVehicleData )
	{
		pWnd = GetDlgItem( IDC_EDIT_RADIUS );
		Str.Format ( "%3.2f", pVehicleData->m_fRadius );
		pWnd->SetWindowText( Str.GetString() );

		pWnd = GetDlgItem( IDC_EDIT_HEIGHT );
		Str.Format ( "%3.2f", pVehicleData->m_fHeight );
		pWnd->SetWindowText( Str.GetString() );
	}
	else
	{
		float fData = 0.f;
		pWnd = GetDlgItem( IDC_EDIT_RADIUS );
		Str.Format ( "%3.2f", fData );
		pWnd->SetWindowText( Str.GetString() );

		pWnd = GetDlgItem( IDC_EDIT_HEIGHT );
		Str.Format ( "%3.2f", fData );
		pWnd->SetWindowText( Str.GetString() );
	}

}

void CVehiclePage::OnEnChangeEditRadius()
{
	// TODO:  RICHEDIT 컨트롤인 경우 이 컨트롤은
	// CPropertyPage::마스크에 OR 연산하여 설정된 ENM_CHANGE 플래그를 지정하여
	// CRichEditCtrl().SetEventMask()를 호출하도록 OnInitDialog() 함수를 재지정하지 않으면
	// 이 알림을 보내지 않습니다.

	// TODO:  여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	if( !pFrame )	return;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	if( !pView )	return;

	DxVehicleData *pVehicleData = pView->GetVehicleData();
	if( !pVehicleData )	return;

	DxVehicle *pVehicle = pView->GetVehicle();
	if( !pVehicle )	return;

	CWnd*	pWnd;
	CString Str;
	pWnd = GetDlgItem( IDC_EDIT_RADIUS );
	pWnd->GetWindowText( Str );
	pVehicleData->m_fRadius = (float)atof( Str.GetString() );

	pVehicleData->SetRadiusHeight();
	pVehicle->SetRadiusHeight( pVehicleData );
}

void CVehiclePage::OnEnChangeEditHeight()
{
	// TODO:  RICHEDIT 컨트롤인 경우 이 컨트롤은
	// CPropertyPage::마스크에 OR 연산하여 설정된 ENM_CHANGE 플래그를 지정하여
	// CRichEditCtrl().SetEventMask()를 호출하도록 OnInitDialog() 함수를 재지정하지 않으면
	// 이 알림을 보내지 않습니다.

	// TODO:  여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	if( !pFrame )	return;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	if( !pView )	return;

	DxVehicleData *pVehicleData = pView->GetVehicleData();
	if( !pVehicleData )	return;

	DxVehicle *pVehicle = pView->GetVehicle();
	if( !pVehicle )	return;

	CWnd*	pWnd;
	CString Str;
	pWnd = GetDlgItem( IDC_EDIT_HEIGHT );
	pWnd->GetWindowText( Str );
	pVehicleData->m_fHeight = (float)atof( Str.GetString() );

	pVehicleData->SetRadiusHeight();
	pVehicle->SetRadiusHeight( pVehicleData );
}


void CVehiclePage::SetBoardEditTab( bool bEdit )
{

	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

	if( bEdit )
	{
		m_psheetWithTabFrame->ShowWindow(FALSE);
		m_psheetWithTabAnim->ShowWindow(FALSE);

		SetWin_ShowWindow( this, IDC_STATIC_SHEETTAP1, FALSE );
		SetWin_ShowWindow( this, IDC_STATIC_SHEETTAP2, FALSE );

		m_psheetWithTabBoardEdit->SetEditView( TRUE );
		SetWin_ShowWindow( this, IDC_STATIC_SHEETTAP3, TRUE );		

		pView->SetRenderTypeBone();	

	}else{
		m_psheetWithTabFrame->ShowWindow(TRUE);
		m_psheetWithTabAnim->ShowWindow(TRUE);

		SetWin_ShowWindow( this, IDC_STATIC_SHEETTAP1, TRUE );
		SetWin_ShowWindow( this, IDC_STATIC_SHEETTAP2, TRUE );

		m_psheetWithTabBoardEdit->SetEditView( FALSE );
		SetWin_ShowWindow( this, IDC_STATIC_SHEETTAP3, FALSE );

		pView->SetRenderTypeDefault();
	}
}

DxSkinPiece* CVehiclePage::CreateSkinPiece(int nParts)
{
    MIN_ASSERT(nParts >= 0 && nParts <= PART_V_SIZE && _T("파츠 인덱스 오류!!!"));

    if (m_aSkinPieces[nParts].get() == 0)
    {
        m_aSkinPieces[nParts].reset(new DxSkinPiece);
    }

    return m_aSkinPieces[nParts].get();
}

void CVehiclePage::SkinPieceClear(int nParts)
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return;
    }

    DxSkinPiece *pSkinPiece = pView->GetSkinPiece(nParts);
    DxVehicle *pVehicle = pView->GetVehicle();
    DxVehicleData *pVehicleData = pView->GetVehicleData();

    if (pVehicle)
    {
        pVehicle->ResetVehiclePart(pSkinPiece->m_emV_PartType);
    }

    if (pVehicleData)
    {
        pVehicleData->SetVehiclePiece(pSkinPiece->m_emV_PartType, _T(""));
    }

    if (pSkinPiece)
    {
        pSkinPiece->ClearAll();
        pSkinPiece->m_bCompletedLOAD = FALSE;
        DxSkinPieceContainer::GetInstance().DeletePiece(pSkinPiece);
    }

    if (pVehicle && pVehicleData && GetSkinPieceSize() == 0)
    {
        pVehicleData->ClearAll();
        pVehicle->ClearAll();
    }

    CPieceContainerPage::SkinPieceClear();
}

void CVehiclePage::SetSkinPiece(DxSkinPiece* pSkinPiece)
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return;
    }

    LPDIRECT3DDEVICEQ pd3dDevice = pView->GetD3dDevice();    
    DxVehicle *pVehicle = pView->GetVehicle();
    DxVehicleData *pVehicleData = pView->GetVehicleData();

    if (pVehicle == 0)
    {
        return;
    }

    DxCharPart* pCharPart = pVehicle->GetVehiclePart(pSkinPiece->m_emV_PartType);

    if (pCharPart && pSkinPiece->m_szMeshName)
    {
        pCharPart->SetPart( pVehicle, pSkinPiece, pd3dDevice, false, NULL );
    }

    if (pVehicle && pSkinPiece->m_szSkeleton)
    {
        pVehicle->m_spSkinAniControlThread->LoadSkeletonForEdit(pSkinPiece->m_szSkeleton, pd3dDevice);
        pVehicle->m_spSkinAniControlThread->ReAttachBoneForEdit();
    }
    else
    {
        pVehicle->ResetVehiclePart(pSkinPiece->m_emV_PartType);
    }

    if (pVehicleData && pSkinPiece->m_szFileName)
    {
        pVehicleData->GetSkinAniControlData()->LoadSkeleton(pSkinPiece->m_szSkeleton, pd3dDevice);
        pVehicleData->SetVehiclePiece(pSkinPiece->m_emV_PartType, pSkinPiece->m_szFileName);
    }
    else
    {
        pVehicleData->SetVehiclePiece(pSkinPiece->m_emV_PartType, _T(""));
    }

    if (m_aSkinPieces[pSkinPiece->m_emV_PartType].get() != pSkinPiece)
    {
        m_aSkinPieces[pSkinPiece->m_emV_PartType].reset(pSkinPiece);
    }

    CPieceContainerPage::SetSkinPiece(pSkinPiece);
}

void CVehiclePage::SetSkinPieceType(DxSkinPiece* pSkinPiece)
{
    if (pSkinPiece)
    {
        pSkinPiece->m_emPieceType = PIECETYPE_V_PARTS;
        pSkinPiece->m_emV_PartType = static_cast<EMPIECEVEHICLE>(m_nParts);
    }
}

DxCharPart* CVehiclePage::GetCharPart()
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return 0;
    }
    
    DxVehicle *pVehicle = pView->GetVehicle();

    if (pVehicle == 0)
    {
        return 0;
    }

    return pVehicle->GetVehiclePart(m_nParts);
}

int CVehiclePage::GetSkinPieceSize()
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return 0;
    }

    DxVehicle *pVehicle = pView->GetVehicle();

    if (pVehicle == 0)
    {
        return 0;
    }

    int nSize = 0;

    for (int i = 0; i < PART_V_SIZE; ++i)
    {
        DxCharPart* pPart = pVehicle->GetVehiclePart(i);

        if (pPart && pPart->GetPart())
        {
            ++nSize;
        }
    }

    return nSize;
}

bool CVehiclePage::IsSameBoneFile(const TCHAR* pName)
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return 0;
    }

    DxVehicle *pVehicle = pView->GetVehicle();

    if (pVehicle == 0)
    {
        return 0;
    }

    const TCHAR* pChar = pVehicle->m_spSkinAniControlThread->GetSkeletonName();

    if (pChar != 0 && _tcsclen(pChar) != 0 && _tcsicmp(pChar, pName) != 0)
    {        
        TCHAR temp[256], ext[256], temp2[256], ext2[256];
        _tsplitpath(pChar, 0, 0, temp, ext);
        _tsplitpath(pName, 0, 0, temp2, ext2);

        // 암호화된 파일인지 체크 한다.
        if ( (_tcsicmp(ext, _T(".x")) == 0 && _tcsicmp(ext2, _T(".mxf")) == 0) ||
             (_tcsicmp(ext, _T(".mxf")) == 0 && _tcsicmp(ext2, _T(".x")) == 0) )
        {
            if (_tcsicmp(temp, temp2) == 0)
            {
                return true;
            }
        }

        return false;
    }

    return true;
}

bool CVehiclePage::HasParts(DxSkinPiece* pTempSkinPiece)
{
    DxSkinPiece* pSkinPiece = GetSkinPiece(pTempSkinPiece->m_emV_PartType);

    if (pSkinPiece && pSkinPiece->m_szXFileName && pTempSkinPiece && pTempSkinPiece->m_szXFileName)
    {
        if (pSkinPiece->m_emV_PartType == pTempSkinPiece->m_emV_PartType)
        {
            return true;
        }
    }

    return false;
}

void CVehiclePage::ReSetPages()
{
    for (int i = 0; i < PART_V_SIZE; ++i)
    {
        DxSkinPiece* pPiece = GetSkinPiece(i);

        if (pPiece && pPiece->m_szFileName)
        {
            pPiece->ClearAll();
        }
    }

    CPieceContainerPage::ReSetPages();
}

void CVehiclePage::SwapSkinPiece(int nParts)
{
    if (nParts == m_nParts)
    {
        return;
    }

    DxSkinPiece* pSkinPiece1 = GetSkinPiece();
    DxSkinPiece* pSkinPiece2 = GetSkinPiece(nParts);

    std::swap(pSkinPiece1->m_emV_PartType, pSkinPiece2->m_emV_PartType);

    m_aSkinPieces[m_nParts].swap(m_aSkinPieces[nParts]);

    SetSkinPiece(pSkinPiece1);
    SetSkinPiece(pSkinPiece2);

    m_nParts = nParts;

    CPieceContainerPage::SwapSkinPiece(nParts);
}

void CVehiclePage::ReplaceSkinPiece(int nParts)
{
    if (nParts == m_nParts)
    {
        return;
    }

    DxSkinPiece* pSkinPiece1 = GetSkinPiece();
    DxSkinPiece* pSkinPiece2 = GetSkinPiece(nParts);

    std::swap(pSkinPiece1->m_emV_PartType, pSkinPiece2->m_emV_PartType);

    m_aSkinPieces[m_nParts].swap(m_aSkinPieces[nParts]);

    SetSkinPiece(pSkinPiece1);
    SkinPieceClear(pSkinPiece2->m_emV_PartType);

    m_nParts = nParts;

    CPieceContainerPage::SwapSkinPiece(nParts);
}

void CVehiclePage::ShowWindow(bool bShow)
{
    int wndList[] = 
    {
        IDC_BUTTON_NEW,
        IDC_BUTTON_OPEN,
        IDC_BUTTON_SAVE,
        IDC_BUTTON_ALLSAVE,
        IDC_EDIT_CHARFILE,
        IDC_EDIT_RADIUS,
        IDC_SPIN_RADIUS,
        IDC_EDIT_HEIGHT,
        IDC_SPIN_HEIGHT,
        IDC_CHECK_NOCHARACTER,
		IDC_BUTTON_FOOT_COLL,
    };

    int nSize = sizeof(wndList) / sizeof(int);

    for (int i = 0; i < nSize; ++i)
    {
        CWnd* pWnd = GetDlgItem (wndList[i]);

        if (pWnd)
        {
            pWnd->ShowWindow(bShow ? SW_SHOW : SW_HIDE);
        }
    }

    CPieceContainerPage::ShowWindow(bShow);
}

void CVehiclePage::OnBnClickedButtonFootColl()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	pFrame->m_cDlgEdit.SetAcitveSheetPage( CHARTAB_FOOT_COLL );
}
