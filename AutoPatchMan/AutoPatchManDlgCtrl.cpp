#include "stdafx.h"
#include <algorithm>
#include "../SigmaCore/gassert.h"

#include "../EngineLib/Common/SUBPATH.h"

#include "../RanLogic/GLogicDataMan.h"
#include "../RanLogic/RANPARAM.h"
#include "../RanLogic/GLUseFeatures.h"
#include "../MfcExLib/ExLibs/EtcFunction.h"

#include "AutoPatchMan.h"
#include "AutoPatchManDlg.h"
#include "GlobalVariable.h"
#include "LogControl.h"
#include "LauncherText.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

void	CAutoPatchManDlg::UpdateControls()
{
	static const ULONGLONG UL100 = 100UL;
	static const ULONGLONG UL1 = 1UL;

	ULONGLONG Pos = 0;
	ULONGLONG End = 0;
	
	int	CurPercent	= 0;
	int	AllPercent= 0;	
	
	NS_LOG_CONTROL::GetProcessCurPosition ( &Pos, &End );
	End = ( !End ) ? UL1 : End;
	CurPercent = int( (Pos*UL100) / End );	

	NS_LOG_CONTROL::GetProcessAllPosition ( &Pos, &End );	
	End = ( !End )? UL1 : End;
	AllPercent = int( (Pos*UL100) / End);

	m_ctrlProgressCur->SetPos ( CurPercent );
	m_ctrlProgressAll->SetPos ( AllPercent );
}

void CAutoPatchManDlg::ListAddString( const CString & strLog )
{
	CString strLog_COPY( strLog );
	if ( strLog_COPY[strLog_COPY.GetLength()-1] == '\n' )
	{
		strLog_COPY = strLog_COPY.Left ( strLog_COPY.GetLength()-1 );
		if ( strLog_COPY[strLog_COPY.GetLength()-1] == '\r' )
		{
			strLog_COPY = strLog_COPY.Left ( strLog_COPY.GetLength()-1 );
		}
	}

	int nIndex = m_ctrlListBox.AddString( strLog_COPY );
	m_ctrlListBox.SetCurSel( nIndex );
   m_ctrlListBox.Invalidate();
   m_ctrlListBox.UpdateWindow();
}

void CAutoPatchManDlg::ListAddString( UINT nIDS )
{
	CString strLog_COPY;
	strLog_COPY.LoadString( nIDS );

	int nIndex = m_ctrlListBox.AddString ( strLog_COPY );
	m_ctrlListBox.SetCurSel ( nIndex );
}

void CAutoPatchManDlg::ListAddString( const PCHAR szMessage )
{
	GASSERT( szMessage );

	CString strLog_COPY( szMessage );
	if ( strLog_COPY[strLog_COPY.GetLength()-1] == '\n' )
	{
		strLog_COPY = strLog_COPY.Left ( strLog_COPY.GetLength()-1 );
		if ( strLog_COPY[strLog_COPY.GetLength()-1] == '\r' )
		{
			strLog_COPY = strLog_COPY.Left ( strLog_COPY.GetLength()-1 );
		}
	}

	int nIndex = m_ctrlListBox.AddString( strLog_COPY );
	m_ctrlListBox.SetCurSel( nIndex );
   m_ctrlListBox.Invalidate();
   m_ctrlListBox.UpdateWindow();
}

void CAutoPatchManDlg::FILEOUT( const CString& strLogFile )
{
	FILE* fp = _fsopen( strLogFile, "wt", _SH_DENYNO );
	if ( fp )
	{
		CString strTemp;

		int nCnt = m_ctrlListBox.GetCount();
		for(int i = 0; i < nCnt; ++i )
		{
			m_ctrlListBox.GetText( i, strTemp );
			fprintf ( fp, "%s\r\n", strTemp.GetString() );
		}

		fclose ( fp );
	}
}

BOOL CAutoPatchManDlg::GETFILE_USEHTTP( CHttpPatch* pHttpPatch, std::string strRemoteSubPath, std::string strFileName, CString strTempDir )
{
	if ( !pHttpPatch )
	{
		GASSERT ( 0 && "�߸��� ������ ������ �� �ֽ��ϴ�." );
		return FALSE;
	}

	if ( !strFileName.size () )
	{
		GASSERT ( 0 && "������ �������� �ʾҽ��ϴ�." );
		return FALSE;
	}

	std::string strSubPath( strRemoteSubPath );

	//	'\\'���ڸ� '/'�� �����Ѵ�.
	std::replace ( strSubPath.begin(), strSubPath.end(), '\\', '/' );

	EMSERVICE_PROVIDER sp = GLogicData::GetInstance().GetServiceProvider();

	//#if !defined(_DEBUG) && !defined(KR_PARAM) && !defined(GS_PARAM) && !defined(_RELEASED) && !defined(ID_PARAM) 
#ifndef _DEBUG

	// 20131030 khkim
	// �� �������� ��ġ ����� �ٸ���. ���� �ڵ�� �ݴ�� �Ǿ��־��� ������ �����Ѵ�.
	// �ѱ�,GS �� ������ ��� ������ ��ġ��ȣ�ؿ� ��ġ������ �����ϴ� ����̸�,
	// �ѱ�,GS �� �� ����� ������� �ʰ� �����Ŵ������� ���� FTP�� ���ӱ��� �ؼ� 
	// ������ ����ؼ� ���㾲�� ����̴�. 
	switch ( sp )
	{
	case SP_OFFICE_TEST:
	case SP_KOREA:
	case SP_KOREA_TEST:
	case SP_GS:
		break;
	default:
		{
			CString strFolder;
			strFolder.Format( "/%04d", m_sGameVer );
			strFolder += strSubPath.c_str();
			strSubPath = strFolder;
		}
		break;
	}

#endif

	strSubPath += strFileName;

	CHAR * szListMessage = new CHAR[MAX_PATH];
	StringCchCopy( szListMessage, MAX_PATH, strSubPath.c_str() );
	PostMessage( WM_LISTADDSTRING, 0, (LPARAM)szListMessage );

    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	std::string strLocalFullPath;
	strLocalFullPath += NS_GLOBAL_VAR::strProFile.GetString();	
	strLocalFullPath += pPath->SaveRoot(); //SUBPATH::SAVE_ROOT;
	strLocalFullPath += strTempDir.GetString();
	strLocalFullPath += strFileName;

	int nMaxHttp = 0;
	for ( int i = 0; i < RANPARAM::MAX_HTTP; ++i ) 
	{
		CString strRealAddress = RANPARAM::HttpAddressTable[i];
		if ( !strRealAddress.GetLength () )
		{
			nMaxHttp = i;
			break;
		}
	}
	
	srand( (unsigned)time( NULL ) );

	static int nTRY = rand() % nMaxHttp;
	int nTRY_FILESIZE_CHECK = 0;
	int nERROR_RETRY = 0;
	int nADDRESS_NULL_COUNT = 0;

	while ( nTRY_FILESIZE_CHECK < 3 )
	{
		//	NOTE
		//		�ִ� �õ� ȸ�� �ʰ���
		if ( nADDRESS_NULL_COUNT == RANPARAM::MAX_HTTP ) return FALSE;

		if ( RANPARAM::MAX_HTTP == nTRY ) nTRY = 0;
		if ( nERROR_RETRY == 5 ) return FALSE;		

		static const CString strHTTP = "http://";

		CString strRealAddress = RANPARAM::HttpAddressTable[nTRY];
		if ( !strRealAddress.GetLength () )
		{
			nADDRESS_NULL_COUNT++;		//	MAX_HTTP�� ��� ���ΰ�?
			nTRY++;
			continue;
		}

		//	�� üũ�� ����ߴٴ� ���� nADDRESS_NULL_COUNT�� �ʱ�ȭ�ؾ����� �ǹ��Ѵ�.
		nADDRESS_NULL_COUNT = 0;

		CString strHttpAddress = strHTTP + strRealAddress;

		CHAR * szListMessage = new CHAR[MAX_PATH];
		StringCchCopy( szListMessage, MAX_PATH, strHttpAddress );
		PostMessage( WM_LISTADDSTRING, 0, (LPARAM)szListMessage );

		if ( NET_ERROR == pHttpPatch->SetBaseURL ( strHttpAddress ) )
		{			
			//NS_LOG_CONTROL::Write ( pHttpPatch->GetErrMsg() );
			++nTRY;
			++nERROR_RETRY;
			continue;
		}

		if ( NET_ERROR == pHttpPatch->GetFile ( strSubPath.c_str(), strLocalFullPath.c_str() ) )
		{
			CString	strTemp, strMsg;
			strMsg = ID2LAUNCHERTEXT("IDS_MESSAGE", 47 );
			strTemp.Format ( "%s %s", strMsg.GetString(), strFileName.c_str() );
			ListAddString( strTemp );

			++nTRY;
			++nERROR_RETRY;
			continue;
		}

		ULONGLONG ulRECEIVED, ulTOTALSIZE;
		NS_LOG_CONTROL::GetProcessCurPosition ( &ulRECEIVED, &ulTOTALSIZE );

		if ( ulRECEIVED != ulTOTALSIZE )
		{
			++nTRY_FILESIZE_CHECK;
			ListAddString( ID2LAUNCHERTEXT("IDS_MESSAGE", 46 ) ); // ���� �޴� ���� ũ�Ⱑ ���� �ʴ�.
			continue;
		}
		else
		{
			return TRUE; //	NET_OK
		}        

		Sleep( 0 );
	}

	return FALSE;
}

void CAutoPatchManDlg::OnBnClickedButtonItem()
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	ShellExecute(NULL, "open", RANPARAM::ItemShopHPAddress, NULL, NULL, SW_SHOWNORMAL);
}

void CAutoPatchManDlg::OnBnClickedButtonEvent()
{
	// TODO: ���⿡ ��Ʈ�� �˸� ó���� �ڵ带 �߰��մϴ�.
	// ShellExecute(NULL, "open", RANPARAM::EventPageAddress, NULL, NULL, SW_SHOWNORMAL);
	ShellExecute(NULL, "open", RANPARAM::ManualPatchAddress, NULL, NULL, SW_SHOWNORMAL);
}

void CAutoPatchManDlg::OnBnClickedButtonUpdate()
{
	if ( m_bUseHttp )
	{
		BEGIN_PATCH ();
	}
	else
	{
		ListAddString( "[ERROR] Update failed: HTTP patch mode not initialized. Restart the launcher and try again." );
		m_ctrlUpdate.EnableWindow( TRUE );
	}
}

void CAutoPatchManDlg::OnCnbSelChangeNationCombo()
{
	if ( GLUseFeatures::GetInstance().IsUsingDataIntegrate() )
	{
		const DWORD dwSelectSel = GetWin_Combo_Sel(this, IDC_MNATION_COMBO);
		const CString strFlag = CLauncherTextMan::GetInstance().GetText("PROVIDE_FLAG_NAME", 0).GetString();
		const CString strLang = CLauncherTextMan::GetInstance().GetText(strFlag.GetString(), dwSelectSel);
		RANPARAM::emProvideLangFlag = language::StringToProvidelang(strLang);
		
		CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
//		RANPARAM::SAVE(pApp->GetServiceProvider());
		RANPARAM::SAVE_PARAM( pApp->GetServiceProvider(), TRUE );
	}
}