// EffectToolDoc.cpp : implementation of the CEffectToolDoc class
//

#include "stdafx.h"
#include "EffectTool.h"
#include "MainFrm.h"

#include "../MfcExLib/ExLibs/FECFileDialog.h"

#include "../EngineLib/DxEffect/Single/DxEffSinglePropGMan.h"
#include "../EngineLib/DxTools/DebugSet.h"

#include "EffectToolDoc.h"
#include "EffectToolView.h"

#include "./Properties/EffGroupPage.h"

// ----------------------------------------------------------------------------
#include "../SigmaCore/DebugInclude.h"
// ----------------------------------------------------------------------------

/////////////////////////////////////////////////////////////////////////////
// CEffectToolDoc

IMPLEMENT_DYNCREATE(CEffectToolDoc, CDocument)

BEGIN_MESSAGE_MAP(CEffectToolDoc, CDocument)
	//{{AFX_MSG_MAP(CEffectToolDoc)
	//}}AFX_MSG_MAP
	ON_COMMAND(ID_FILE_SAVE, OnFileSave)
	ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
	ON_COMMAND(ID_FILE_NEW, OnFileNew)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CEffectToolDoc construction/destruction

CEffectToolDoc::CEffectToolDoc()
{
}

CEffectToolDoc::~CEffectToolDoc()
{
}

BOOL CEffectToolDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	TSTRING strName(_T(""));
	SetTitleAddVersion( strName.c_str() );

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CEffectToolDoc serialization

void CEffectToolDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
	}
	else
	{
	}
}

/////////////////////////////////////////////////////////////////////////////
// CEffectToolDoc diagnostics

#ifdef _DEBUG
void CEffectToolDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CEffectToolDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CEffectToolDoc commands

void CEffectToolDoc::OnFileSave()
{
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	CEffectToolView *pView = (CEffectToolView*) pFrame->GetActiveView ();
	pView->SetCurClick( FALSE );	// 커서 클릭을 죽인다.
			

	////	Note : 범위 설정한 값을 넣어 준다.
	//CEffGroupPage::m_EffPropGroup.m_vMax = pView->m_EditBox.m_vMax;
	//CEffGroupPage::m_EffPropGroup.m_vMin = pView->m_EditBox.m_vMin;

	//	Note : 파일 필터를 정의한다.
	CString szFilter = "Effect Group ( *.egp ) |*.egp";

	//	Note : 파일 오픈 다이알로그를 만듬.
	CFileDialog dlg( FALSE,".egp", CEffGroupPage::m_EffPropGroup.m_strFileName.c_str(), OFN_HIDEREADONLY|OFN_OVERWRITEPROMPT, szFilter, pView );
	
	dlg.m_ofn.lpstrInitialDir = DxEffSinglePropGMan::GetInstance().GetPath().c_str();
	if ( dlg.DoModal() == IDOK )
	{
		CEffGroupPage::m_EffPropGroup.SaveFile ( dlg.GetPathName().GetString() );
	}

	pView->SetCurClick( TRUE );	// 커서 클릭을 살린다.
}

void CEffectToolDoc::OnFileOpen()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	POSITION pos = GetFirstViewPosition();
	CEffectToolView* pView = (CEffectToolView*) GetNextView( pos );
	CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	pView->SetCurClick( FALSE );	// 커서 클릭을 죽인다.

	//	Note : 파일 오픈 다이알로그를 만듬.
	CString szFilter = "Effect Group ( *.egp ) |*.egp";
	CFileDialog dlg ( TRUE, ".egp", "untitled",
		OFN_HIDEREADONLY|OFN_READONLY, szFilter, pView );

	dlg.m_ofn.lpstrInitialDir = DxEffSinglePropGMan::GetInstance().GetPath().c_str();
	if ( dlg.DoModal() == IDOK )
	{
		CString WriteName = dlg.GetFileName ();
		SetTitleAddVersion ( WriteName );

		//	Note : Sound Log
#ifdef	_DEBUG
		CDebugSet::ToFile ( "UseSoundList.txt", "" );
		CDebugSet::ToFile ( "UseSoundList.txt", "[-------------------------------------------------------------]" );
		CDebugSet::ToFile ( "UseSoundList.txt", "[!.%s]", WriteName.GetString() );
	
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

		CEffGroupPage* pEffGroupPage = pFrame->GetEffGroupPage ();
		pEffGroupPage->LoadEffPropGroup ( WriteName );
	}

	pView->SetCurClick( TRUE );	// 커서 클릭을 살린다.














	//CMainFrame *pFrame = (CMainFrame *) AfxGetApp()->m_pMainWnd;
	//CEffectToolView* pView = (CEffectToolView *) pFrame->GetActiveView ();

	//CString szFilter = "Effect Group ( *.egp ) |*.egp";
	//CFECFileDialog dlg ( TRUE, _T(".egp"), NULL, OFN_HIDEREADONLY | OFN_ALLOWMULTISELECT | OFN_ENABLESIZING, szFilter, pView );

	//dlg.m_ofn.lpstrInitialDir = DxEffSinglePropGMan::GetInstance().GetPath().c_str();

	//if ( dlg.DoModal() == IDOK )
	//{
	//	CString strPathName;
	//	POSITION pos = dlg.GetStartPosition();
	//	while (pos != NULL)
	//	{
	//		strPathName = dlg.GetNextPathName(pos);
	//		CString strFileName = strPathName;
	//		int nPosition = strFileName.ReverseFind('\\');
	//		strFileName = strFileName.Mid(nPosition+1);

	//		CEffGroupPage* pEffGroupPage = pFrame->GetEffGroupPage ();
	//		pEffGroupPage->LoadEffPropGroup ( strFileName.GetString() );
	//	}
	//}
}

void CEffectToolDoc::OnFileNew()
{
	// TODO: 여기에 명령 처리기 코드를 추가합니다.
	CEffGroupPage::m_EffPropGroup.CleanUp();
	SetTitleAddVersion ( "Untitled" );
}

// Version 을 추가한다.
void CEffectToolDoc::SetTitleAddVersion( LPCTSTR lpszTitle )
{
	//////////////////////////////////////////////////////////////////////////
	// WorldEdit 에서 작업되었던 것.
	// 원본 이름을 저장해 놓는다.
	// Reload 에서 필요함.
	// m_strTitleOrig = lpszTitle;

	TSTRING strTitle;
	strTitle = lpszTitle;
	strTitle += _T(" - [ver.");
	strTitle += sc::getFileVersion();
	strTitle += _T("]");
	SetTitle( strTitle.c_str() );
}