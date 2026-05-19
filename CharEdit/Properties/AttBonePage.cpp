// AttBonePage.cpp : 구현 파일입니다.
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

#include "../SigmaCore/Util/Util.h"

#include "../../EngineLib/DxTools/DebugSet.h"
#include "../../EngineLib/DxTools/DxMethods.h"
#include "../../EngineLib/DxMeshs/SkinMesh/DxSkinObject.h"
#include "../../EngineLib/DxMeshs/SkinMesh/DxAttBone.h"
#include "../../EngineLib/DxMeshs/SkinMesh/DxAttBoneData.h"

#include "../MfcExLib/ExLibs/EtcFunction.h"

#include "../State/CharStateMachine.h"

#include "AttBonePage.h"



extern BOOL	g_bClickSpinRadius;
extern BOOL	g_bClickSpinHeight;


// CAttBonePage 대화 상자입니다.

IMPLEMENT_DYNAMIC(CAttBonePage, CPropertyPage)
CAttBonePage::CAttBonePage() : 
    CPieceContainerPage(CCharPage::IDD)
{
    
}

CAttBonePage::~CAttBonePage()
{
}

void CAttBonePage::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CAttBonePage, CPropertyPage)
	ON_BN_CLICKED(IDC_BUTTON_NEW, OnBnClickedButtonNew)
	ON_BN_CLICKED(IDC_BUTTON_OPEN, OnBnClickedButtonOpen)
	ON_BN_CLICKED(IDC_BUTTON_SAVE, OnBnClickedButtonSave)
	ON_BN_CLICKED(IDC_CHECK_NOCHARACTER, OnBnClickedCheckNocharacter)
	ON_EN_CHANGE(IDC_EDIT_RADIUS, OnEnChangeEditRadius)
	ON_EN_CHANGE(IDC_EDIT_HEIGHT, OnEnChangeEditHeight)
END_MESSAGE_MAP()


// CAttBonePage 메시지 처리기입니다.

BOOL CAttBonePage::OnInitDialog()
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
	m_psheetWithTabFrame->m_FramePage.SetFrameEditType( EMFRAMEEDIT_ATTBONE );

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
//     m_psheetWithTabPiece = new CsheetWithTabPiece ( SheetRect, SheetRectAll, this );
//     m_psheetWithTabPiece->Create ( this, WS_CHILD|WS_VISIBLE|WS_TABSTOP, 0 );
//     m_psheetWithTabPiece->ShowWindow(SW_HIDE);

	pWnd = GetDlgItem ( IDC_EDIT_CHARFILE );
	pWnd->SetWindowText ( "untitle00.abf" );

	// Note : 버튼 재 설정
	ReSetCheckButton();

	// Note : 버튼 재 설정
	ReSetEditBox();

	return TRUE;  // return TRUE unless you set the focus to a control
	// 예외: OCX 속성 페이지는 FALSE를 반환해야 합니다.
}

void CAttBonePage::OnBnClickedButtonNew()
{
	if( m_hWnd == NULL ) return;

	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

	DxAttBone *pAttBone = pView->GetAttBone();
	DxAttBoneData* pAttBoneData = pView->GetAttBoneData ();

	CWnd *pWnd;
	pWnd = GetDlgItem ( IDC_EDIT_CHARFILE );
	pWnd->SetWindowText ( "untitle00.abf" );

	pAttBoneData->ClearAll ();
	pAttBone->ClearAll ();

	CharStateMachine::ClearFileNotifier();

	m_psheetWithTabFrame->ReSetPages ();
	m_psheetWithTabAnim->ReSetPages ();
#ifdef DEF_SKIN_SYNC
    m_psheetWithTabPiece->ReSetPages ();
#endif

	// Note : 버튼 재 설정
	ReSetCheckButton();

	// Note : 버튼 재 설정
	ReSetEditBox();
}

VOID	CAttBonePage::InsertSkinPiece( const char *pszFileName )
{
	m_psheetWithTabFrame->m_FramePage.InsertSkinPiece(pszFileName);
}

VOID	CAttBonePage::InsertSkinEff( const char *pszFileName )
{
	m_psheetWithTabFrame->m_FramePage.InsertSkinEff(pszFileName);
}

VOID	CAttBonePage::LoadAnimation( const char *pszFileName )
{
	m_psheetWithTabAnim->m_AnimTabPage.GetAnimPage()->LoadAnimation(pszFileName);
}

VOID	CAttBonePage::LoadSkinBone( const char *pszFileName )
{
	m_psheetWithTabFrame->m_FramePage.LoadSkinBone(pszFileName);
}

BOOL CAttBonePage::LoadAbfFile( const char *pszFileName )
{
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	LPDIRECT3DDEVICEQ pd3dDevice = pView->GetD3dDevice ();
	DxAttBone *pAttBone = pView->GetAttBone();
	DxAttBoneData *pAttBoneData = pView->GetAttBoneData();

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

	//	Note : 케릭터 파일 읽기.
	//
    BOOL bOk = pAttBoneData->LoadFile(std::string(pszFileName), pd3dDevice, EMSCD_ZERO, FG_BONEFILE_CHECK|FG_MUSTNEWLOAD );
	if ( !bOk )
	{
		MessageBox ( "Failed to read file." );
		return FALSE;
	}

	//	Note : 케릭터 Data 설정.
	//
	pAttBone->SetAttBoneData ( pAttBoneData, pd3dDevice );

#ifdef DEF_SKIN_SYNC
    for (int i = 0; i < ATTBONE_SIZE; ++i)
    {
        TSTRING strFile = pAttBoneData->GetAttBoneName(EMPIECECHAR(i));

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
	m_psheetWithTabAnim->SetPages ( NULL, pAttBone->m_spSkinAniControlThread.get() );

	// Note : 버튼 재 설정
	ReSetCheckButton();

	// Note : 버튼 재 설정
	ReSetEditBox();

	pView->ResetSkinPos();

	pFrame->m_cDlgTimeLine.SetStop();

	CharStateMachine::InsertFileNotifier();

	return TRUE;
}

void CAttBonePage::OnBnClickedButtonOpen()
{
	CString szFilter = "Attach Bone File (*.abf)|*.abf|";
	
	//	Note : 파일 오픈 다이알로그를 만듬.
	CFileDialog dlg(TRUE,".abf",NULL,OFN_HIDEREADONLY|OFN_OVERWRITEPROMPT, szFilter,
		(CAttBonePage*)this);

	dlg.m_ofn.lpstrInitialDir = DxAttBoneDataContainer::GetInstance().GetPath ();
	if ( dlg.DoModal() == IDOK )
	{
		CString sFileName = dlg.GetFileName();

		LoadAbfFile( sFileName.GetString() );
	}
}

void CAttBonePage::OnBnClickedButtonSave()
{
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	LPDIRECT3DDEVICEQ pd3dDevice = pView->GetD3dDevice ();

	DxAttBone *pAttBone = pView->GetAttBone();
	if( !pAttBone )		return;
	DxAttBoneData *pAttBoneData = pView->GetAttBoneData();
	if( !pAttBoneData )	return;

	std::string strName = sc::util::ChangeExtName( pAttBoneData->GetFileName(), "" );

	//	Note : 파일 오픈 다이알로그를 만듬.
	CString szFilter = "Attach Bone File (*.abf)|*.abf|";
	CFileDialog dlg(FALSE,".abf", strName.c_str() ,OFN_HIDEREADONLY|OFN_OVERWRITEPROMPT, szFilter, (CAttBonePage*)this);

	dlg.m_ofn.lpstrInitialDir = DxAttBoneDataContainer::GetInstance().GetPath ();
	if ( dlg.DoModal() == IDOK )
	{
		CString sFileName = dlg.GetFileName();

		//	Note : 케릭터 파일 쓰기.
		//
		BOOL bOk = pAttBoneData->SaveFile ( sFileName.GetString(), pd3dDevice );

		if ( !bOk )
		{
			MessageBox ( "파일 쓰기에 실패하였습니다." );
		}

		CWnd *pWnd;
		pWnd = GetDlgItem ( IDC_EDIT_CHARFILE );
		pWnd->SetWindowText ( sFileName.GetString() );
	}
}

void CAttBonePage::OnBnClickedCheckNocharacter()
{
	// TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

	CButton* pButton = (CButton*)GetDlgItem( IDC_CHECK_NOCHARACTER );

	DxAttBone *pAttBone = pView->GetAttBone();
	if( pAttBone )
	{
		if( pButton->GetCheck() )	pAttBone->SetWorldObj( TRUE );
		else						pAttBone->SetWorldObj( FALSE );
	}

	DxAttBoneData *pAttBoneData = pView->GetAttBoneData();
	if( pAttBoneData )
	{
		if( pButton->GetCheck() )	pAttBoneData->m_bWorldObj = TRUE;
		else						pAttBoneData->m_bWorldObj = FALSE;
	}
}

void CAttBonePage::ReSetCheckButton()
{
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	if( !pFrame )	return;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	if( !pView )	return;

	CButton* pButton = (CButton*)GetDlgItem( IDC_CHECK_NOCHARACTER );
	DxAttBone *pAttBone = pView->GetAttBone();
	if( pAttBone )
	{
		if( pAttBone->GetWorldObj() )	pButton->SetCheck( TRUE );
		else							pButton->SetCheck( FALSE );
	}
	else
	{
		pButton->SetCheck( FALSE );
	}
}

void CAttBonePage::ReSetEditBox()
{
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	if( !pFrame )	return;
	CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();
	if( !pView )	return;

	CWnd*	pWnd;
	CString Str;
	DxAttBoneData *pAttBoneData = pView->GetAttBoneData();
	if( pAttBoneData )
	{
		pWnd = GetDlgItem( IDC_EDIT_RADIUS );
		Str.Format ( "%3.2f", pAttBoneData->m_fRadius );
		pWnd->SetWindowText( Str.GetString() );

		pWnd = GetDlgItem( IDC_EDIT_HEIGHT );
		Str.Format ( "%3.2f", pAttBoneData->m_fHeight );
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

void CAttBonePage::OnEnChangeEditRadius()
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

	DxAttBoneData *pAttBoneData = pView->GetAttBoneData();
	if( !pAttBoneData )	return;

	DxAttBone *pAttBone = pView->GetAttBone();
	if( !pAttBone )	return;

	CWnd*	pWnd;
	CString Str;
	pWnd = GetDlgItem( IDC_EDIT_RADIUS );
	pWnd->GetWindowText( Str );
	pAttBoneData->m_fRadius = (float)atof( Str.GetString() );

	pAttBoneData->SetRadiusHeight();
	pAttBone->SetRadiusHeight( pAttBoneData );
}

void CAttBonePage::OnEnChangeEditHeight()
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

	DxAttBoneData *pAttBoneData = pView->GetAttBoneData();
	if( !pAttBoneData )	return;

	DxAttBone *pAttBone = pView->GetAttBone();
	if( !pAttBone )	return;

	CWnd*	pWnd;
	CString Str;
	pWnd = GetDlgItem( IDC_EDIT_HEIGHT );
	pWnd->GetWindowText( Str );
	pAttBoneData->m_fHeight = (float)atof( Str.GetString() );

	pAttBoneData->SetRadiusHeight();
	pAttBone->SetRadiusHeight( pAttBoneData );
}

DxSkinPiece* CAttBonePage::CreateSkinPiece(int nParts)
{
    MIN_ASSERT(nParts >= 0 && nParts <= ATTBONE_SIZE && _T("파츠 인덱스 오류!!!"));

    if (m_aSkinPieces[nParts].get() == 0)
    {
        m_aSkinPieces[nParts].reset(new DxSkinPiece);
    }

    return m_aSkinPieces[nParts].get();
}

void CAttBonePage::SkinPieceClear(int nParts)
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return;
    }

    DxSkinPiece *pSkinPiece = pView->GetSkinPiece(nParts);
    DxAttBone *pAttBone = pView->GetAttBone();
    DxAttBoneData *pAttBoneData = pView->GetAttBoneData();

    if (pAttBone)
    {
        pAttBone->ResetAttBonePiece(pSkinPiece->m_emAttBoneType);
    }

    if (pAttBoneData)
    {
        pAttBoneData->SetAttBonePiece(pSkinPiece->m_emAttBoneType, _T(""));
    }

    if (pSkinPiece)
    {
        pSkinPiece->ClearAll();
        pSkinPiece->m_bCompletedLOAD = FALSE;
        DxSkinPieceContainer::GetInstance().DeletePiece(pSkinPiece);
    }

    if (pAttBone && pAttBoneData && GetSkinPieceSize() == 0)
    {
        pAttBoneData->ClearAll();
        pAttBone->ClearAll();
    }

    CPieceContainerPage::SkinPieceClear();
}

void CAttBonePage::SetSkinPiece(DxSkinPiece* pSkinPiece)
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return;
    }

    LPDIRECT3DDEVICEQ pd3dDevice = pView->GetD3dDevice();
    DxAttBone *pAttBone = pView->GetAttBone();
    DxAttBoneData *pAttBoneData = pView->GetAttBoneData();

    if (pAttBone == 0)
    {
        return;
    }    

    DxCharPart* pCharPart = pAttBone->GetAttBonePiece(pSkinPiece->m_emAttBoneType);

    if (pCharPart && pSkinPiece->m_szMeshName)
    {
        pCharPart->SetPart( pAttBone, pSkinPiece, pd3dDevice, false, NULL );
    }

    if (pAttBone && pSkinPiece->m_szSkeleton)
    {
        pAttBone->m_spSkinAniControlThread->LoadSkeletonForEdit(pSkinPiece->m_szSkeleton, pd3dDevice);
        pAttBone->m_spSkinAniControlThread->ReAttachBoneForEdit();
    }
    else
    {
        pAttBone->ResetAttBonePiece(pSkinPiece->m_emAttBoneType);
    }

    if (pAttBoneData && pSkinPiece->m_szFileName)
    {
        pAttBoneData->GetSkinAniControlData()->LoadSkeleton(pSkinPiece->m_szSkeleton, pd3dDevice);
        pAttBoneData->SetAttBonePiece(pSkinPiece->m_emAttBoneType, pSkinPiece->m_szFileName);
    }
    else
    {
        pAttBoneData->SetAttBonePiece(pSkinPiece->m_emAttBoneType, _T(""));
    }

    if (m_aSkinPieces[pSkinPiece->m_emAttBoneType].get() != pSkinPiece)
    {
        m_aSkinPieces[pSkinPiece->m_emAttBoneType].reset(pSkinPiece);
    }

    CPieceContainerPage::SetSkinPiece(pSkinPiece);
}

void CAttBonePage::SetSkinPieceType(DxSkinPiece* pSkinPiece)
{
    if (pSkinPiece)
    {
        pSkinPiece->m_emPieceType = PIECETYPE_ATTACHBONE;
        pSkinPiece->m_emAttBoneType = static_cast<EMPIECEATTBONE>(m_nParts);
    }
}

DxCharPart* CAttBonePage::GetCharPart()
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return 0;
    }

    DxAttBone *pAttBone = pView->GetAttBone();    

    if (pAttBone == 0)
    {
        return 0;
    }

    return pAttBone->GetAttBonePiece(m_nParts);
}

int CAttBonePage::GetSkinPieceSize()
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return 0;
    }

    DxAttBone *pAttBone = pView->GetAttBone();

    if (pAttBone == 0)
    {
        return 0;
    }    

    int nSize = 0;

    for (int i = 0; i < ATTBONE_SIZE; ++i)
    {
        DxCharPart* pPart = pAttBone->GetAttBonePiece(i);

        if (pPart && pPart->GetPart())
        {
            ++nSize;
        }
    }

    return nSize;
}

bool CAttBonePage::IsSameBoneFile(const TCHAR* pName)
{
    CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
    CCharEditView *pView = (CCharEditView*) pFrame->GetActiveView ();

    if (pView == 0)
    {
        return 0;
    }

    DxAttBone *pAttBone = pView->GetAttBone();

    if (pAttBone == 0)
    {
        return 0;
    }

    const TCHAR* pChar = pAttBone->m_spSkinAniControlThread->GetSkeletonName();

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

bool CAttBonePage::HasParts(DxSkinPiece* pTempSkinPiece)
{
    DxSkinPiece* pSkinPiece = GetSkinPiece(pTempSkinPiece->m_emAttBoneType);

    if (pSkinPiece && pSkinPiece->m_szXFileName && pTempSkinPiece && pTempSkinPiece->m_szXFileName)
    {
        if (pSkinPiece->m_emAttBoneType == pTempSkinPiece->m_emAttBoneType)
        {
            return true;
        }
    }

    return false;
}

void CAttBonePage::ReSetPages()
{
    for (int i = 0; i < ATTBONE_SIZE; ++i)
    {
        DxSkinPiece* pPiece = GetSkinPiece(i);

        if (pPiece && pPiece->m_szFileName)
        {
            pPiece->ClearAll();
        }
    }

    CPieceContainerPage::ReSetPages();
}

void CAttBonePage::SwapSkinPiece(int nParts)
{
    if (nParts == m_nParts)
    {
        return;
    }

    DxSkinPiece* pSkinPiece1 = GetSkinPiece();
    DxSkinPiece* pSkinPiece2 = GetSkinPiece(nParts);

    std::swap(pSkinPiece1->m_emAttBoneType, pSkinPiece2->m_emAttBoneType);

    m_aSkinPieces[m_nParts].swap(m_aSkinPieces[nParts]);

    SetSkinPiece(pSkinPiece1);
    SetSkinPiece(pSkinPiece2);

    m_nParts = nParts;

    CPieceContainerPage::SwapSkinPiece(nParts);
}

void CAttBonePage::ReplaceSkinPiece(int nParts)
{
    if (nParts == m_nParts)
    {
        return;
    }

    DxSkinPiece* pSkinPiece1 = GetSkinPiece();
    DxSkinPiece* pSkinPiece2 = GetSkinPiece(nParts);

    std::swap(pSkinPiece1->m_emAttBoneType, pSkinPiece2->m_emAttBoneType);

    m_aSkinPieces[m_nParts].swap(m_aSkinPieces[nParts]);

    SetSkinPiece(pSkinPiece1);
    SkinPieceClear(pSkinPiece2->m_emAttBoneType);

    m_nParts = nParts;

    CPieceContainerPage::SwapSkinPiece(nParts);
}

void CAttBonePage::ShowWindow(bool bShow)
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
