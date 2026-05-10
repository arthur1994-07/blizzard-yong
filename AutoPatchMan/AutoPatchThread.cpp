#include "StdAfx.h"
#include "../SigmaCore/String/StringUtils.h"
#include "../SigmaCore/Compress/Unzipper.h"
#include "../SigmaCore/Compress/Zipper.h"

#include "../EngineLib/Common/SUBPATH.h"
#include "../EngineLib/DxTools/DebugSet.h"

#include "../RanLogic/GLogicDataMan.h"
#include "../RanLogic/RANPARAM.h"
#include "../MfcExLib/ExLibs/CompactFdi.h"

#include "./AutoPatchThread.h"
#include "./Resource.h"
#include "./LogControl.h"
//#include "../netclientlib/s_CHttpPatch.h"
#include "./LauncherText.h"
#include "./AutoPatchMan.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

IMPLEMENT_DYNCREATE(CAutoPatchThread, CHttpThread)

CAutoPatchThread::CAutoPatchThread(LPVOID pParam, DWORD nThreadID)
{
	VERIFY( pParam != NULL);
	m_pPatchThreadParam = (S_PATCH_THREAD_PARAM *)pParam;

	m_nDlgThreadID = nThreadID;
	m_sFailGameVer = 0;
}

void CAutoPatchThread::ThreadMain()
{
	CHttpPatch* pHttpPatch	= m_pPatchThreadParam->pHttpPatch;
	const bool	bUseHttp	= m_pPatchThreadParam->bUseHttp;
	const int	cPatchVer	= m_pPatchThreadParam->cPatchVer;
	const int	sPatchVer	= m_pPatchThreadParam->sPatchVer;
	const int	cGameVer	= m_pPatchThreadParam->cGameVer;
	const int	sGameVer	= m_pPatchThreadParam->sGameVer;	

	//CDebugSet::ToLogFile( std::string("1. ��ó ����"));

	CString cFileList, sFileList, str, strTemp;
	BOOL bInstalling(FALSE);

	NS_LOG_CONTROL::SetProcessAllPosition ( 0, 100 );

	if ( IsForceTerminate() ) return ;

	// ���� PreDownloader �� ���������� ���μ��� Ȯ��. ���ۿ��θ� preFileList.bin �����ÿ� Ȱ��
	if( IsRunPreDownloader() == FALSE )
	{
		CHAR * szTempMessage = new CHAR[256];
		wsprintf( szTempMessage, "%s", "[ERROR] ��ó ���μ��� �˻� ����" );
		//CDebugSet::ToLogFile( std::string(szTempMessage));
		::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szTempMessage );	
		return;
	}

	// ����Ʈ ������
	::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 49 ), 0 );
	// ���� ����Ʈ �ٿ�ε�
	if ( !GETFILE_USEHTTP ( pHttpPatch, "\\", NS_GLOBAL_VAR::strServerCabFileList.GetString(), "" ) )
	{	
		if ( !IsForceTerminate() )
		{
			// ����Ʈ ������ ����
			::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 50 ), 0 );
		}
		//CDebugSet::ToLogFile( std::string("[ERROR] ���� ����Ʈ �ٿ�ε� ����"));

		goto LFail;
	}
	//CDebugSet::ToLogFile( std::string("2. ���� ����Ʈ �ٿ�ε� �Ϸ�"));

	if (IsForceTerminate())
        goto LFail;

    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	//	���� Ǯ������ ��ü ��� ���� �� ���� Ǯ��&��ġ
	//str = NS_GLOBAL_VAR::strProFile + SUBPATH::SAVE_ROOT + NS_GLOBAL_VAR::strServerCabFileList;
    str = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strServerCabFileList;

	::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 51 ), 0 );
    if (!mincab::Extract(NS_GLOBAL_VAR::strAppPath.GetString (), str.GetString()))
	{
        AfxMessageBox(mincab::GetErrorMsg(), MB_OK);
		// ����Ʈ ����Ǯ�� ����
		::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 52 ), 0 );

		//CDebugSet::ToLogFile( std::string("[ERROR] ����Ʈ ���� Ǯ�� ����"));

		goto LFail;
	}
	NS_LOG_CONTROL::SetProcessAllPosition ( 4, 100 );

	//CDebugSet::ToLogFile( std::string("3. ����Ʈ ���� Ǯ�� ����"));
	//Initialize(); // MEMO : �Լ� ���� �ȵ�.

	if ( IsForceTerminate() ) goto LFail;

	// ���� ����Ʈ �� �� �� ��� �ۼ�
	// ��ġ ���� ����Ʈ �ε�
	// ���� ��ġ ��� �ۼ� ( preFileList.bin )
	::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 53 ), 0 );
	if ( !LoadList() )
	{
		// ����Ʈ �ε忡 ����
		::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 54 ), 0 );

		//CHAR * szErrListMessage11 = new CHAR[256]; 
		//wsprintf( szErrListMessage11, "[ERROR] LoadList ����");
		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage11 );

		//CDebugSet::ToLogFile( std::string(szErrListMessage11));

		goto LFail;
	}

	//CDebugSet::ToLogFile( std::string("4. ��ġ ��� ����Ʈ �Ϸ�"));

	if ( IsForceTerminate() ) goto LFail;

	// ���� �ٿ�ε�� �����߿��� �����ؾ��� ������ �ִٸ� ����
	// ���� ���� �ٿ�ε� �ؾ������� �ٿ�ε� ���� ���� ������ ��ó���� ������Ʈ �޷η� ��
	if ( !ApplyPreDownFile() )
	{
		// ���� �ٿ�ε����� ���� ���� �޼��� ���
		//CHAR * szErrListMessage12 = new CHAR[256]; 
		//wsprintf( szErrListMessage12, "[ERROR] ApplyPreDownFile ����");
		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage12 );

		//CDebugSet::ToLogFile( std::string(szErrListMessage12));

		goto LFail;
	}    

	//CDebugSet::ToLogFile( std::string("5. ���� �ٿ�ε��� ������ ���� ó�� �Ϸ�"));

	NS_LOG_CONTROL::SetProcessAllPosition ( 30, 100 );

	if ( IsForceTerminate() ) goto LFail;
	///////////////////////////////////////////////////////////////////////////////////////////////////////////

	// ��ġ ���� ����Ʈ �� ����
	::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 57 ), 0 );
	if ( !MakeNewList ( cPatchVer, sPatchVer, cGameVer, sGameVer ) )
	{
		// ����Ʈ �񱳿� ����
		::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 58 ), 0 );

		//CDebugSet::ToLogFile( std::string("[ERROR] ��ġ ���� ����Ʈ ����� ����"));

		goto LFail;
	}    

	//CDebugSet::ToLogFile( std::string("6. ��ġ ���� ����Ʈ ����� �Ϸ�"));

	NS_LOG_CONTROL::SetProcessAllPosition ( 10, 100 );

	if ( IsForceTerminate() ) goto LFail;

	//	�� ��Ͽ� ���� ���� �ٿ� �ε�
	//str = NS_GLOBAL_VAR::strProFile + SUBPATH::SAVE_ROOT + NS_GLOBAL_VAR::strDownloadTemp;
    str = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp;
	CreateDirectory ( str.GetString(), NULL );
	if ( !DownloadFilesByHttp ( pHttpPatch ) )
	{
		if ( !IsForceTerminate() )
		{
			// ��ġ ���� ������ ����
			::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 55 ), 0 );
		}

		//CHAR * szErrListMessage14 = new CHAR[256]; 
		//wsprintf( szErrListMessage14, "[ERROR] DownloadFilesByHttp ����");
		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage14 );

		//CDebugSet::ToLogFile( std::string(szErrListMessage14));

		goto LFail;
	}
	NS_LOG_CONTROL::SetProcessAllPosition ( 70, 100 );

	//CDebugSet::ToLogFile( std::string("7. ��ġ ���� FTP �ٿ�ε� �Ϸ�"));

	if ( IsForceTerminate() ) goto LFail;

	//	���� ����
	if ( !Installing() )
	{	
		//	���� ���ᰡ �ƴ� ��¥ ����
		//
		if ( IsExtractError() )
		{
			// ��ġ ������ �Ϻ� �ջ�
			::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 59 ), 0 );

			//	Note : DS list ����            
			//CString strDownList = NS_GLOBAL_VAR::strProFile + SUBPATH::SAVE_ROOT + NS_GLOBAL_VAR::strDownList;
            CString strDownList = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownList;
			DeleteFile ( strDownList.GetString() );

			// MEMO : ī�� ����Ʈ�� ���Ŀ� ��ġ�� ������ �ٿ�ε� ���� �ʾƵ� �ȴ�.
			//
			//CString strCopyList = NS_GLOBAL_VAR::strProFile + SUBPATH::SAVE_ROOT  + NS_GLOBAL_VAR::strCopyList;
            CString strCopyList = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strCopyList;
			CopyFile( strCopyList.GetString(), strDownList.GetString(), FALSE );

			//CDebugSet::ToLogFile( sc::string::format("[ERROR] ��ġ ���� �ջ�. strDownList : %s / strCopyList : %s", strDownList.GetString(), strCopyList.GetString()));
		}

		bInstalling = TRUE; // ��ġ���̴�.

		//CHAR * szErrListMessage15 = new CHAR[256]; 
		//wsprintf( szErrListMessage15, "[ERROR] Installing ����");
		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage15 );

		//CDebugSet::ToLogFile( std::string(szErrListMessage15));

		goto LFail;
	}
	NS_LOG_CONTROL::SetProcessAllPosition ( 80, 100 );


	//CDebugSet::ToLogFile( std::string("8. ���� ���� �Ϸ�"));

	if ( !UnPackageFile() )
	{
		if ( !IsForceTerminate() )
			::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 59 ), 0 );

		//CHAR * szErrListMessage16 = new CHAR[256]; 
		//wsprintf( szErrListMessage16, "[ERROR] UnPackageFile ����");
		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage16 );

		//CDebugSet::ToLogFile( std::string(szErrListMessage16));

		goto LFail;
	}

	//CDebugSet::ToLogFile( std::string("9. ���� �������� �Ϸ�"));

	if ( !DeleteNotFoundFile() )
	{
		//CHAR * szErrListMessage17 = new CHAR[256]; 
		//wsprintf( szErrListMessage17, "[ERROR] DeleteNotFoundFile ����");
		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage17 );

		//CDebugSet::ToLogFile( std::string(szErrListMessage17));

		goto LFail;
	}

	//CDebugSet::ToLogFile( std::string("10. ���ʿ��� ���� ���� �Ϸ�"));

	if ( !PackageFile() )
	{
		if ( !IsForceTerminate() )
			::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 71 ), 0 );

		//CHAR * szErrListMessage18 = new CHAR[256]; 
		//wsprintf( szErrListMessage18, "[ERROR] DeleteNotFoundFile ����");
		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage18 );

		//CDebugSet::ToLogFile( std::string(szErrListMessage18));

		goto LFail;
	}


	//CDebugSet::ToLogFile( std::string("11. ���� ��Ű�� �Ϸ�"));

//	Package
//	if(!CompressFile()){
//		::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 71 ), 0 );
//		goto LFail;
//	}

	NS_LOG_CONTROL::SetProcessAllPosition ( 90, 100 );

	//	Note : DS list ����    
	//strTemp = NS_GLOBAL_VAR::strProFile + SUBPATH::SAVE_ROOT  + NS_GLOBAL_VAR::strDownList;
    strTemp = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownList;
	DeleteFile( strTemp.GetString() );

	//CDebugSet::ToLogFile( sc::string::format("12. �ٿ�ε� ����Ʈ ����.  %s", strTemp.GetString()));

	// Note : ī�� ����Ʈ ����
	//strTemp = NS_GLOBAL_VAR::strProFile + SUBPATH::SAVE_ROOT  + NS_GLOBAL_VAR::strCopyList;
    strTemp = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strCopyList;
	DeleteFile ( strTemp.GetString() );

	//CDebugSet::ToLogFile( sc::string::format("13. ���� ����Ʈ ����.  %s", strTemp.GetString()));

	//	<--	Ŭ���̾�Ʈ ��ϸ� ����������� ��ü	-->	//
	cFileList = NS_GLOBAL_VAR::strAppPath + NS_GLOBAL_VAR::g_szClientFileList;
	//sFileList = NS_GLOBAL_VAR::strAppPath + NS_GLOBAL_VAR::g_szServerFileList; // ���� �ٿ�ε尡 �߰��Ǹ鼭 cFileList�� ���� ( �������� FileList.bin�� cFileList.bin���� ���� )

	DeleteFile( cFileList.GetString () );
	//CDebugSet::ToLogFile( sc::string::format("14. Ŭ���̾�Ʈ ����Ʈ ����.  %s", cFileList.GetString ()));

	//MoveFile( sFileList.GetString(), cFileList.GetString() ); // ���� �ٿ�ε尡 �߰��Ǹ鼭 cFileList�� ���� ( �������� FileList.bin�� cFileList.bin���� ���� )
	CreateClientFileList(); 

	//CDebugSet::ToLogFile( std::string("15. Ŭ���̾�Ʈ ����Ʈ ���� �Ϸ�"));

	//sFileList = NS_GLOBAL_VAR::strProFile + SUBPATH::SAVE_ROOT + NS_GLOBAL_VAR::strServerCabFileList;
    sFileList = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strServerCabFileList;
	DeleteFile ( sFileList.GetString() );

	//CDebugSet::ToLogFile( sc::string::format("16. ���� ���� ����Ʈ ����.  %s", sFileList.GetString()));

	DeleteDownFiles();

	//CDebugSet::ToLogFile( std::string("17. �ٿ�ε� ����Ʈ ���� �Ϸ�"));
//	DeleteCompressFile();
//	if(!OptimizeCompressFile()){
//		::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 72 ), 0 );
//		goto LFail;
//	}

#ifdef PREDOWNLOAD
    // TBB ������ �ϴ� �ּ� ó��
	//Destroy ();
#else
	Destroy ();
#endif

	// Ŭ���̾�Ʈ ���� ����
	::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 60 ), 0 );
	if ( !VersionUp ( sGameVer ) )
	{
		// Ŭ���̾�Ʈ ���� ���� ����
		::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 61 ), 0 );

		//CDebugSet::ToLogFile( sc::string::format("[ERROR] ���� ���� ����.  %d", sGameVer));

		goto LFail;
	}

	//CDebugSet::ToLogFile( std::string("18. ���� ���� �Ϸ�"));

	// ���� ��ġ ������ ���� �������� ������Ʈ���� ����
	// ����� GS �� ����Ѵ�.
	SaveVersionInRegistry( sGameVer );

	// ��� ��ġ ����
	::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 62 ), 0 );
	NS_LOG_CONTROL::SetProcessAllPosition ( 100, 100 );

	//CDebugSet::ToLogFile( std::string("19. ��ġ �Ϸ�"));

	return ;

LFail:
	//	�ٿ�ε��� ���ϵ��� �ջ�Ǿ� ������ ��쿡��
	//	����Ʈ�� ó������ �ٽ� �ۼ��ؾ��ϱ⶧���� ����Ʈ�� �������� �ʴ´�.
	if ( IsExtractError () )
	{
		if ( IsForceTerminate () )
		{
			//CHAR * szErrListMessage19 = new CHAR[256]; 
			//wsprintf( szErrListMessage19, "[ERROR] LFail - SaveDownList (Extract) ����");
			//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage19 );

			//CDebugSet::ToLogFile( std::string(szErrListMessage19));

			SaveDownList ( sGameVer );
		}

		//CHAR * szErrListMessage20 = new CHAR[256]; 
		//wsprintf( szErrListMessage20, "[ERROR] LFail - SaveCopyList (Extract) ����");
		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage20 );

		//CDebugSet::ToLogFile( std::string(szErrListMessage20));

		SaveCopyList ( sGameVer ); // MEMO :��ġ�� ����Ʈ�� ��ġ�߿� ��ҵǾ������� ������ �����Ѵ�.
	}
	else
	{
		//CHAR * szErrListMessage21 = new CHAR[256]; 
		//wsprintf( szErrListMessage21, "[ERROR] LFail - SaveDownList ����");
		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage21 );

		//CDebugSet::ToLogFile( std::string(szErrListMessage21));

		SaveDownList ( sGameVer );

		if( bInstalling ) SaveCopyList ( sGameVer ); // MEMO :��ġ�߿� �ߴܵǸ� ī�� ����Ʈ �ۼ�.
	}

	sFileList = NS_GLOBAL_VAR::strAppPath + NS_GLOBAL_VAR::g_szServerFileList;
	DeleteFile ( sFileList.GetString() );
	sFileList = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strServerCabFileList;
	DeleteFile ( sFileList.GetString() );	

	DeleteUnPackFile();

#ifdef PREDOWNLOAD
    // TBB ������ �ϴ� �ּ� ó��
	//Destroy ();
#else
	Destroy ();
#endif

	SetFail();

	return ;
}

BOOL CAutoPatchThread::SaveDownList( int sGameVer )
{
    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	CString strTemp;
	strTemp = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownList;

	FILE* fp = _fsopen ( strTemp, "wb", _SH_DENYNO );
	if ( !fp )
	{
		return FALSE;
	}

	SFILENODE FileInfo;

	FileInfo.Ver = sGameVer;
	if ( 1 != fwrite ( &FileInfo, sizeof ( SFILENODE ), 1, fp ) )
	{
		fclose ( fp );

		//CDebugSet::ToLogFile(std::string("		[ERROR]SaveDownList File Game Version Write Failed!"));
		return FALSE;
	}

	FileInfo.Ver = (int) m_vectorDownFile.size ();
	if ( 1 != fwrite ( &FileInfo, sizeof ( SFILENODE ), 1, fp ) )
	{
		fclose ( fp );

		//CDebugSet::ToLogFile(std::string("		[ERROR]SaveDownList File Size Write Failed!"));
		return FALSE;
	}

	for ( int i = 0; i < (int)m_vectorDownFile.size (); i++ )
	{
		SFILENODE* pNewFile = m_vectorDownFile[i];

		//if( pNewFile->IsPreDown == 2 )
		//	CDebugSet::ToLogFile( sc::string::format("		SaveDownList ���� �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));
		//else if( pNewFile->IsPreDown == 1 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		SaveDownList ����� �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));
		//else if( pNewFile->IsPreDown == 3 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		SaveDownList ������ �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));

		if ( 1 != fwrite ( pNewFile, sizeof ( SFILENODE ), 1, fp ) )
		{
			fclose ( fp );

			//CDebugSet::ToLogFile(std::string("		[ERROR]SaveDownList File Write Failed!"));
			return FALSE;
		}
	}

	fclose ( fp );
	
	return TRUE;
}

BOOL CAutoPatchThread::LoadDownList()
{
    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	CString strTemp;
	strTemp = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownList;

	FILE* fp = _fsopen ( strTemp, "rb", _SH_DENYNO );
	if ( !fp )
	{
		return FALSE;
	}

	SFILENODE FileInfo;

	if ( 1 != fread ( &FileInfo, sizeof ( SFILENODE ), 1, fp ) )
	{
		fclose ( fp );

		//CDebugSet::ToLogFile(std::string("		[ERROR]LoadDownList File Game Version Read Failed!"));
		return FALSE;
	}
	m_sFailGameVer = FileInfo.Ver;

	if ( 1 != fread ( &FileInfo, sizeof ( SFILENODE ), 1, fp ) )
	{
		fclose ( fp );

		//CDebugSet::ToLogFile(std::string("		[ERROR]LoadDownList File Size Read Failed!"));
		return FALSE;
	}	

	for ( int i = 0; i < FileInfo.Ver; i++ )
	{
		SFILENODE* pNewFile = new SFILENODE;


		//if( pNewFile->IsPreDown == 2 )
		//	CDebugSet::ToLogFile( sc::string::format("		LoadDownList ���� �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));
		//else if( pNewFile->IsPreDown == 1 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		LoadDownList ����� �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));
		//else if( pNewFile->IsPreDown == 3 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		LoadDownList ������ �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));


		if ( 1 != fread ( pNewFile, sizeof ( SFILENODE ), 1, fp ) )
		{
			fclose ( fp );

			//CDebugSet::ToLogFile(std::string("		[ERROR]LoadDownList File Read Failed!"));
			return FALSE;
		}

		m_mapDownedFile.insert ( std::make_pair(std::string(pNewFile->FileName), pNewFile) );
	}

	fclose ( fp );

	return TRUE;
}

BOOL CAutoPatchThread::SaveCopyList( int sGameVer )
{
    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	CString strTemp;
	strTemp = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strCopyList;

	FILE* fp = _fsopen ( strTemp, "wb", _SH_DENYNO );
	if ( !fp )
	{
		return FALSE;
	}

	SFILENODE FileInfo;

	FileInfo.Ver = sGameVer;
	if ( 1 != fwrite ( &FileInfo, sizeof ( SFILENODE ), 1, fp ) )
	{
		fclose ( fp );

		//CDebugSet::ToLogFile(
            //std::string("		[ERROR]SaveCopyList File Game Version Write Failed!"));
		return FALSE;
	}

	FileInfo.Ver = (int) m_vectorCopyFile.size ();
	if ( 1 != fwrite ( &FileInfo, sizeof ( SFILENODE ), 1, fp ) )
	{
		fclose ( fp );

		//CDebugSet::ToLogFile(
          //  std::string("		[ERROR]SaveCopyList File Size Write Failed!"));
		return FALSE;
	}

	for ( int i = 0; i < (int)m_vectorCopyFile.size (); i++ )
	{
		SFILENODE* pNewFile = m_vectorCopyFile[i];

		//if( pNewFile->IsPreDown == 2 )
		//	CDebugSet::ToLogFile( sc::string::format("		SaveCopyList ���� �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));
		//else if( pNewFile->IsPreDown == 1 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		SaveCopyList ����� �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));
		//else if( pNewFile->IsPreDown == 3 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		SaveCopyList ������ �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));


		if ( 1 != fwrite ( pNewFile, sizeof ( SFILENODE ), 1, fp ) )
		{
			fclose ( fp );

			//CDebugSet::ToLogFile(
                //std::string("		[ERROR]SaveCopyList File Write Failed!"));
			return FALSE;
		}
	}

	fclose ( fp );

	return TRUE;
}

BOOL CAutoPatchThread::LoadCopyList()
{
    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	CString strTemp;
	strTemp = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strCopyList;

	FILE* fp = _fsopen ( strTemp, "rb", _SH_DENYNO );
	if ( !fp )
	{
		return FALSE;
	}

	SFILENODE FileInfo;

	if ( 1 != fread ( &FileInfo, sizeof ( SFILENODE ), 1, fp ) )
	{
		fclose ( fp );

		//CDebugSet::ToLogFile(
            //std::string("		[ERROR]LoadCopyList File Game Version Read Failed!"));
		return FALSE;
	}
	m_sFailGameVer = FileInfo.Ver;

	if ( 1 != fread ( &FileInfo, sizeof ( SFILENODE ), 1, fp ) )
	{
		fclose ( fp );

		//CDebugSet::ToLogFile(
          //  std::string("		[ERROR]LoadCopyList File Size Read Failed!"));
		return FALSE;
	}	

	for ( int i = 0; i < FileInfo.Ver; i++ )
	{
		SFILENODE* pNewFile = new SFILENODE;
		if ( 1 != fread ( pNewFile, sizeof ( SFILENODE ), 1, fp ) )
		{
			fclose ( fp );

			//CDebugSet::ToLogFile(
              //  std::string("		[ERROR]LoadCopyList File Read Failed!"));
			return FALSE;
		}

		m_mapCopiedFile.insert ( std::make_pair(std::string(pNewFile->FileName), pNewFile) );

		//if( pNewFile->IsPreDown == 2 )
		//	CDebugSet::ToLogFile( sc::string::format("		LoadCopyList ���� �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));
		//else if( pNewFile->IsPreDown == 1 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		LoadCopyList ����� �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));
		//else if( pNewFile->IsPreDown == 3 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		LoadCopyList ������ �ٿ�ε� ����Ʈ ����.  %s", pNewFile->FileName));



/*
		if(strstr(pNewFile->SubPath,NS_GLOBAL_VAR::strCompDir)){ // ������ �������� �н��� �˻��ؼ� �˾ƺ���.
			m_vecCompFile.push_back(pNewFile);
		}
*/
	}

	fclose ( fp );

	return TRUE;
}

BOOL CAutoPatchThread::MakeNewList( const int cPatchVer, const int sPatchVer, const int cGameVer, const int sGameVer )
{
	NS_LOG_CONTROL::SetProcessCurPosition ( 0, 1 );
	{
		FILEVECTOR::size_type nServerFileSize = m_vectorServerFile.size ();
		for ( FILEVECTOR::size_type i = 0; i < nServerFileSize; i++ )
		{	
			SFILENODE* pServerGetFile = m_vectorServerFile[i];

			CPatchSetNode* pNode = m_ClientFileTree.Find ( pServerGetFile );
			if ( pNode )	//	���� ����
			{
				SFILENODE* pClientFile = pNode->GetFile ();
				pNode->SetUseFlag ();

				if ( pClientFile->Ver < pServerGetFile->Ver )
				{
					SFILENODE* pNewFile = new SFILENODE;
					*pNewFile = *pServerGetFile;
					m_vectorNewFile.push_back ( pNewFile );

					//CDebugSet::ToLogFile( sc::string::format("		������ �����ʾƼ� ���� �ٿ�޴� ����.  %s", pNewFile->FileName));
				}
			}
			else	//	�߰��Ǵ� ����
			{			
				SFILENODE* pNewFile = new SFILENODE;
				*pNewFile = *pServerGetFile;
				m_vectorNewFile.push_back ( pNewFile );

				//CDebugSet::ToLogFile( sc::string::format("		���� �߰��Ǵ� ����.  %s", pNewFile->FileName));
			}

			NS_LOG_CONTROL::SetProcessCurPosition ( i, nServerFileSize );

			if ( IsForceTerminate() )	return FALSE;
		}
	}
	NS_LOG_CONTROL::SetProcessCurPosition ( 1, 1 );

	//	<--	������ ���� ������ Ŭ���̾�Ʈ�� ������ ��� ���� -->	//
	//m_ClientFileTree.GetNotUseItem ( &m_vectorDeleteFile );

#ifdef PREDOWNLOAD
	int nCnt = static_cast<int>( m_vectorDeleteFile.size() );

	CHAR * szDeletedFileName = new CHAR[256]; 
	for ( int i = 0; i < nCnt; i++ )
	{
		SFILENODE* pNewFile = m_vectorDeleteFile[i];

		memset(szDeletedFileName, 0, sizeof(szDeletedFileName));
		wsprintf( szDeletedFileName, "		[ERROR] ������ ���� (����x, Ŭ��o). %s", pNewFile->FileName );
		::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szDeletedFileName );

		CDebugSet::ToLogFile( std::string(szDeletedFileName));
	}
#endif
	LoadDownList ();	

	return TRUE;
}

BOOL CAutoPatchThread::DownloadFilesByHttp( CHttpPatch* pHttpPatch )
{
	int DownCount = 0;
#ifdef PREDOWNLOAD
	BOOL bForceDown = FALSE;
#endif
	// Temp �����н��� �����Ѵ�
    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	CString	DownloadDir( NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp );

	int nVectorNewFileSize = (int)m_vectorNewFile.size();
	for ( int i = 0; i < nVectorNewFileSize; ++i )
	{
		SFILENODE* pNewFile = m_vectorNewFile[i];		

#ifdef PREDOWNLOAD
		// �������� �����ٿ�ε� �ƴ� ���ϸ� �ٿ�޾Ҵµ� � ������������ �����ٿ�ε��� ������ �����Ҷ� ���ٸ� �ٿ�ε� �޴´�
		// Temp ������ ������ �������� �ʴ´ٸ� �ٽ� �ٿ�ε� �޴´�
		if( pNewFile->IsPreDown == 1 )
		{
			CFileStatus status;
			CString strTempDownFile;
			CString	DownloadDir( NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp );
			strTempDownFile.Format("%s%s", DownloadDir, pNewFile->FileName);
			CString AppDir( NS_GLOBAL_VAR::strAppPath);
			CString strAppFile;
			strAppFile.Format("%s%s%s", AppDir.Left ( AppDir.ReverseFind ( '\\' ) ), pNewFile->SubPath, pNewFile->FileName);

			if( CFile::GetStatus(strAppFile.Left ( strAppFile.ReverseFind ( '.' ) ), status) == FALSE )
			{
				CHAR * szErrListMessage22 = new CHAR[256]; 
				wsprintf( szErrListMessage22, "		Ŭ���̾�Ʈ ������ ���� ���� %s", pNewFile->FileName );
				::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage22 );

				CDebugSet::ToLogFile( std::string(szErrListMessage22));

				// ������ �ٿ�޵��� ����
				 bForceDown = TRUE;

				 // ������ �ٿ� �ޱ⶧���� Temp ������ ���� ������ �ִٸ� ������ ����
				if( CFile::GetStatus(strTempDownFile, status) == TRUE )
				{
					CHAR * szErrListMessage23 = new CHAR[256]; 
					wsprintf( szErrListMessage23, "		[ERROR] Temp ������ ���� ���� %s", pNewFile->FileName );
					::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage23 );

					CDebugSet::ToLogFile( std::string(szErrListMessage23));

					DeleteFile( strTempDownFile.GetString() );
				}
			}
			else
			{
				CHAR * szErrListMessage24 = new CHAR[256]; 
				wsprintf( szErrListMessage24, "		[ERROR] Ŭ���̾�Ʈ ������ ������ �����ϱ⶧���� �ϴ� PASS %s", pNewFile->FileName );
				::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage24 );

				CDebugSet::ToLogFile( std::string(szErrListMessage24));

				m_vectorDownFile.push_back( pNewFile );
			}
		}

		if( pNewFile->IsPreDown == 0 || bForceDown == TRUE )
#else
		if( pNewFile->IsPreDown == 0 )
#endif
		{
			FILEMAP_ITER found = m_mapDownedFile.find( std::string ( pNewFile->FileName ) );
			FILEMAP_ITER iter_end = m_mapDownedFile.end();

			BOOL bAlreadyDown( FALSE );
			if ( found != iter_end ) bAlreadyDown = TRUE; // Note : �̹� ���������� �ٿ�ε� �Ϸ�� ��.

			if ( IsForceTerminate() ) return FALSE;


			//	<--	ī��Ʈ�� ���� �����ϰ� �ִ°��� �����Ѵ�.	-->	//
			//	���� ù��°���� �ް� ������, ī��Ʈ�� 1�� �Ǵ� ���̴�.
			//	�Ϸ� ������ �ƴ϶�, ���� �����̴�.	
#ifdef PREDOWNLOAD
			if ( !bAlreadyDown || bForceDown == TRUE ) // MEMO : �̹� �ٿ���� ������ ����Ʈ�� ǥ������ �ʴ´�.
#else
			if ( !bAlreadyDown ) // MEMO : �̹� �ٿ���� ������ ����Ʈ�� ǥ������ �ʴ´�.
#endif
			{
				CString	strMsg;
				strMsg = ID2LAUNCHERTEXT("IDS_MESSAGE", 47 ); 
				// ����ȭ ���� ������ �޼����� ������ �׻� �޸𸮸� ���� �����Ѵ�.
				CHAR * szListMessage = new CHAR[256]; 
				wsprintf( szListMessage, "%s %s", strMsg.GetString(), pNewFile->FileName );
				::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szListMessage );

				//CDebugSet::ToLogFile( std::string(szListMessage));
			}

			ULONGLONG TotalPos = 10 + (++DownCount * 60) / nVectorNewFileSize;			
			NS_LOG_CONTROL::SetProcessAllPosition( TotalPos, 100 );

			CString FullSubPath = pNewFile->SubPath;

#ifdef PREDOWNLOAD
			if ( !bAlreadyDown || bForceDown == TRUE ) //	Note : ���� �ٿ�ε� �ȵ� �͸� GetFile�Ѵ�.
#else
			if ( !bAlreadyDown ) //	Note : ���� �ٿ�ε� �ȵ� �͸� GetFile�Ѵ�.
#endif
			{
				if ( !GETFILE_USEHTTP ( pHttpPatch, FullSubPath.GetString(), pNewFile->FileName ) )
				{
					return FALSE;
				}
			}

			//	<--	���������� �ٿ�ε� ������ ����Ʈ �ۼ��Ѵ�.	--> //
			m_vectorDownFile.push_back( pNewFile );
		}

		if( IsForceTerminate() ) return FALSE;

		Sleep( 0 ); // ���Ϲ޴ٰ� ���ߴ°� ������
	}

	if ( m_vectorNewFile.size() != m_vectorDownFile.size () )
	{
		//CHAR * szErrListMessage = new CHAR[256]; 
		//wsprintf( szErrListMessage, "		m_vectorNewFile Size %d, m_vectorDownFile Size %d", m_vectorNewFile.size(), m_vectorDownFile.size () );

		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage );

		//CDebugSet::ToLogFile( std::string(szErrListMessage));

		return FALSE; // �ٿ���� ���ϰ� ��Ͽ� �ִ� ������ ������ �ٸ��ٸ� ����
	}

	LoadCopyList (); // ��ġ�ߴ� ����Ʈ�� �ε��Ѵ�.

	return TRUE;
}

BOOL CAutoPatchThread::Installing()
{
	CString strTemp;
	int InstallCount = 0;
	int nMaxPos = 0;

	int nVectorDownFileSize = (int)m_vectorDownFile.size();

	for ( int i = 0; i < nVectorDownFileSize; ++i )
	{

		//	<--	���� Ǯ������ ��ü ��� ���� �� ���� Ǯ��&��ġ	-->	//
		NS_LOG_CONTROL::SetProcessCurPosition ( 0, 1 );

		SFILENODE* pNewFile = m_vectorDownFile[i];	

		//	Note : �̹� ���������� ��ġ �Ϸ�� ��.
		FILEMAP_ITER found = m_mapCopiedFile.find ( std::string ( pNewFile->FileName ) );
		FILEMAP_ITER iter_end = m_mapCopiedFile.end ();

		BOOL bAlreadyCopy(FALSE);
		if ( found != iter_end ) bAlreadyCopy = TRUE;

		if ( IsForceTerminate() ) return FALSE;

		CString	Seperator = "\\";
		CString FullSubPath = pNewFile->SubPath;
		CStringArray SubPathArray;

		STRUTIL::ClearSeparator ();
		STRUTIL::RegisterSeparator ( Seperator );
		STRUTIL::StringSeparate ( FullSubPath, SubPathArray );		


		//	���� �����ؾ� �ϴ� �������� Ȯ��
		bool bPack = false;
		if( strstr(pNewFile->SubPath,".rcc\\") )	bPack = true;
		
		ULONGLONG TotalPos = 70 + (++InstallCount * 10) / nVectorDownFileSize;
		NS_LOG_CONTROL::SetProcessAllPosition ( TotalPos, 100 );

		if ( !bAlreadyCopy )
		{
			if ( !bPack ) 
			{
				//	����â�� ���ϸ� ���
				{
					CString	strMsg;
					strMsg = ID2LAUNCHERTEXT("IDS_MESSAGE", 48 );
					CHAR * szListMessage = new CHAR[256];
					wsprintf( szListMessage, "%s %s", strMsg.GetString(), pNewFile->FileName );
					::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szListMessage );

					//CDebugSet::ToLogFile( sc::string::format("		���� ��ġ��. %s", szListMessage));

				}

				//	<--	���� ���丮 �����	-->	//
				CString FullPath;
				FullPath.Format( "%s", NS_GLOBAL_VAR::strAppPath.GetString() );
				for ( int i = 0; i < SubPathArray.GetCount (); i++ )
				{
					FullPath += SubPathArray[i];			
					CreateDirectory ( FullPath.GetString(), NULL );
					FullPath += "\\";
				}

                CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
                const SUBPATH* pPath = pApp->GetSubPath();

				CString	DownloadDir;
				DownloadDir = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp + pNewFile->FileName;		

				CString	DestFile;
				DestFile.Format( "%s%s", FullPath.GetString(), pNewFile->FileName );
				DestFile = DestFile.Left ( DestFile.ReverseFind ( '.' ) );

				SetFileAttributes( DestFile.GetString(), FILE_ATTRIBUTE_NORMAL );
				DeleteFile( DestFile.GetString() );

                if (!mincab::Extract(FullPath.GetString(), DownloadDir.GetString()))
				{
					DownloadDir.MakeLower();
					DownloadDir = DownloadDir.Left( DownloadDir.ReverseFind( '.' ) );

					if( ( DownloadDir.Find( _T(".dll") ) == -1 ) && ( !IsForceTerminate() ) )
					{
						CHAR * szListMessage = new CHAR[MAX_PATH];
                        StringCchCopy(szListMessage, MAX_PATH, mincab::GetErrorMsg());
						::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szListMessage );

						//CDebugSet::ToLogFile( sc::string::format("		[ERROR] �������� ���� ã�� ����. %s", szListMessage));

						SetExtractError (); // �����޽��� : �����϶� ��� �õ��Ѵ�. ���ѷ��� ���� ��.��;;

						return FALSE;
					}
				}

				SetFileAttributes ( DestFile.GetString(), FILE_ATTRIBUTE_NORMAL );

				//	<--	���������� ��ġ������ ����Ʈ �ۼ��Ѵ�. --> //
				m_vectorCopyFile.push_back ( pNewFile );
			}
			else
			{
				//	Package ���ϵ��� ����س��� ���߿� ��ġ�Ѵ�.
				m_vectorPackFile.push_back(pNewFile);

			}
		}
		else
		{
			//	�̹� ��ġ�Ȱ� ����Ʈ�� ����
			m_vectorCopyFile.push_back ( pNewFile );
		}

		NS_LOG_CONTROL::SetProcessCurPosition ( 1, 1 );
	

//		if(strstr(pNewFile->SubPath,NS_GLOBAL_VAR::strCompDir)){ // ������ �������� �н��� �˻��ؼ� �˾ƺ���.
//			m_vecCompFile.push_back(pNewFile);
//		}
		
		if( IsForceTerminate() ) return FALSE;

		Sleep( 0 );
	}

	if ( m_vectorNewFile.size() != m_vectorCopyFile.size () + m_vectorPackFile.size() )
	{
		//CHAR * szErrListMessage = new CHAR[256]; 
		//wsprintf( szErrListMessage, "		m_vectorNewFile Size %d, m_vectorCopyFile +  m_vectorPackFile Size %d", m_vectorNewFile.size(), m_vectorCopyFile.size () + m_vectorPackFile.size() );

		//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szErrListMessage );

		//CDebugSet::ToLogFile( std::string(szErrListMessage));

		return FALSE; // MEMO : ������Ʈ�� ���� ������ ��ġ�� ���� ������ ��ġ���� ������...
	}

	return TRUE;
}

BOOL CAutoPatchThread::UnPackageFile()
{
	int nVectorPackFileSize = (int)m_vectorPackFile.size();
	int InstallCount = 0;	

	for ( int i = 0; i < nVectorPackFileSize; ++i )
	{
		//	<--	���� Ǯ������ ��ü ��� ���� �� ���� Ǯ��&��ġ	-->	//
		NS_LOG_CONTROL::SetProcessCurPosition ( 0, 1 );

		SFILENODE* pNewFile = m_vectorPackFile[i];	

		//	Note : �̹� ���������� ��ġ �Ϸ�� ��.
		FILEMAP_ITER found = m_mapCopiedFile.find ( std::string ( pNewFile->FileName ) );
		FILEMAP_ITER iter_end = m_mapCopiedFile.end ();

		BOOL bAlreadyCopy(FALSE);
		if ( found != iter_end ) bAlreadyCopy = TRUE;

		if ( IsForceTerminate() ) return FALSE;

		CString	Seperator = "\\";
		CString FullSubPath = pNewFile->SubPath;
		CStringArray SubPathArray;

		STRUTIL::ClearSeparator ();
		STRUTIL::RegisterSeparator ( Seperator );
		STRUTIL::StringSeparate ( FullSubPath, SubPathArray );		


		//	���� �����ؾ� �ϴ� �������� Ȯ��
		if( !strstr(pNewFile->SubPath,".rcc\\") )
		{
			CDebugSet::ToLogFile(
                std::string("Pack File Error %s", pNewFile->SubPath));
			continue;
		}
		
		ULONGLONG TotalPos = 80 + (++InstallCount * 5) / nVectorPackFileSize;
		NS_LOG_CONTROL::SetProcessAllPosition ( TotalPos, 100 );

		if ( !bAlreadyCopy )
		{
			//	����â�� ���ϸ� ���
			{
				CString	strMsg;
				strMsg = ID2LAUNCHERTEXT("IDS_MESSAGE", 48 );
				CHAR * szListMessage = new CHAR[256];
				wsprintf( szListMessage, "%s %s", strMsg.GetString(), pNewFile->FileName );
				::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szListMessage );

				//CDebugSet::ToLogFile( sc::string::format("		��Ű�� ����. %s", szListMessage));

			}


			CString strExtPath, strZipFile;				
			strZipFile.Format( "%s", NS_GLOBAL_VAR::strAppPath.GetString() );

			//	������������ .rcc�̹Ƿ� ������ �ʴ´�.
			for ( int i = 0; i < SubPathArray.GetCount(); i++ )
			{
				strZipFile += SubPathArray[i];			
				if ( i < SubPathArray.GetCount()-1 )
					CreateDirectory ( strZipFile.GetString(), NULL );					
				strZipFile += "\\";
			}

            CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
            const SUBPATH* pPath = pApp->GetSubPath();

			CString	DownloadDir;
			DownloadDir = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp + pNewFile->FileName;		

			
			strZipFile = strZipFile.Left ( strZipFile.ReverseFind ( '\\' ) );	//	Zip ���� ���
            
			strExtPath = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp; 
			strExtPath += strZipFile.Right( strZipFile.GetLength() - strZipFile.ReverseFind ( '\\' ) );
			strExtPath = strExtPath.Left ( strExtPath.ReverseFind ( '.' )  );	//	Zip ���� ���� ���
			
			//	������ ���ٸ�
			if ( GetFileAttributes( strExtPath ) == UINT_MAX )
			{
				//	�ű� Rcc����
				if ( GetFileAttributes( strZipFile ) == UINT_MAX )
				{
					
					if ( !CreateDirectory(strExtPath, NULL) ) 					
					{
						CString	strMsg;
						strMsg = ID2LAUNCHERTEXT("IDS_MESSAGE", 75 );
						CHAR * szListMessage = new CHAR[256];
						wsprintf( szListMessage, "%s %s", strMsg.GetString(), pNewFile->FileName );
						::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szListMessage );

						//CDebugSet::ToLogFile( sc::string::format("		[ERROR] ��Ű�� ���� �� �������� ���� ����. %s", szListMessage));

						return FALSE;
					}

					m_vecZipFile.push_back( strZipFile.GetString() );

				}
				else
				{
					//	������ �����Ѵ�.
					if ( GetFileAttributes( strExtPath ) == UINT_MAX )
					{
						CUnzipper cUnZip;
						m_vecZipFile.push_back( strZipFile.GetString() );

						if ( !cUnZip.Unzip( strZipFile, strExtPath ) )
						{
							CString	strMsg;
							strMsg = ID2LAUNCHERTEXT("IDS_MESSAGE", 74 );
							CHAR * szListMessage = new CHAR[256];
							wsprintf( szListMessage, "%s %s", strMsg.GetString(), pNewFile->FileName );
							::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szListMessage );	

							//CDebugSet::ToLogFile( sc::string::format("		[ERROR] ��Ű�� ���� �� ���� ���� ����. %s", szListMessage));

							return FALSE;
						}						
					}

				}
			}

			CString strExtFile;
			strExtFile = pNewFile->FileName;
			strExtFile = strExtFile.Left ( strExtFile.ReverseFind ( '.' ) );
			strExtPath += '\\';

            if (!mincab::Extract(strExtPath.GetString(), DownloadDir.GetString()))
			{
                AfxMessageBox(mincab::GetErrorMsg(), MB_OK);

				DownloadDir.MakeLower();
				DownloadDir = DownloadDir.Left( DownloadDir.ReverseFind( '.' ) );

				if( ( DownloadDir.Find( _T(".dll") ) == -1 ) && ( !IsForceTerminate() ) )
				{
					CHAR * szListMessage = new CHAR[MAX_PATH];
                    StringCchCopy(szListMessage, MAX_PATH, mincab::GetErrorMsg());
					::PostThreadMessage(m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szListMessage);

					//CDebugSet::ToLogFile( sc::string::format("		[ERROR] ��Ű�� ���� �� �ٿ�ε� ���� ã���� ����. %s", szListMessage));

					SetExtractError (); // �����޽��� : �����϶� ��� �õ��Ѵ�. ���ѷ��� ���� ��.��;;

					return FALSE;
				}
			}

			NS_LOG_CONTROL::SetProcessCurPosition ( 1, 1 );
		}

		if( IsForceTerminate() ) return FALSE;

		Sleep( 0 );
	}

	return TRUE;
}

BOOL CAutoPatchThread::PackageFile()
{
    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	int nPackFile = 0;
	int nZipPath = (int)m_vecZipFile.size();

	::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 70 ), 0 );

	for ( int i = 0; i < nZipPath; ++i )
	{
		CString strZipFile = m_vecZipFile[i].c_str();
		strZipFile = strZipFile.Left ( strZipFile.ReverseFind ( '.' )  );
		strZipFile += ".zip";

		CString strExtPath = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp; 
		strExtPath += strZipFile.Right( strZipFile.GetLength() - strZipFile.ReverseFind ( '\\' ) );
		strExtPath = strExtPath.Left ( strExtPath.ReverseFind ( '.' )  );	//	Zip ���� ���� ���
		

		CString strFind = strExtPath;
		strFind += "\\*.*";

		ULONGLONG TotalPos = 85 + (++nPackFile * 5) / nZipPath;
		NS_LOG_CONTROL::SetProcessAllPosition ( TotalPos, 100 );

		WIN32_FIND_DATA finfo;
		HANDLE hSearch = FindFirstFile(strFind, &finfo);

		int nFileNum = 0;

		if (hSearch != INVALID_HANDLE_VALUE) 
		{
			CZipper cZipFile;
			cZipFile.OpenZip( strZipFile, strExtPath );

			do 
			{
				if (finfo.cFileName[0] != '.') 
				{
					if ( !(finfo.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) )
					{
						CString strSubFile = strExtPath;
						strSubFile += '\\';
						strSubFile += finfo.cFileName;
						cZipFile.AddFileToZip( strSubFile, false, NULL );

						nFileNum++;

						DeleteFile( strSubFile );

						//CDebugSet::ToLogFile( sc::string::format("		���� �� ���� ����.  %s", strSubFile.GetString()));
					}
						
				}
			} 
			while (FindNextFile(hSearch, &finfo));
			
			FindClose(hSearch);
			
			cZipFile.CloseZip();
		}

//		���������� ���� �����.
		RemoveDirectory( strExtPath );

//		���� ���� �����.
		if ( nFileNum != 0 )
		{
			DeleteFile( m_vecZipFile[i].c_str() );
			rename( strZipFile , m_vecZipFile[i].c_str() );
		}
		else
		{
			DeleteFile( m_vecZipFile[i].c_str() );
			DeleteFile( strZipFile );
		}

		if( IsForceTerminate() ) return FALSE;

		Sleep( 0 );
	}

	//	<--	���������� ��ġ������ ����Ʈ �ۼ��Ѵ�. --> //
//	m_vectorCopyFile.push_back ( pNewFile );

//	return FALSE;

	return TRUE;
}


BOOL CAutoPatchThread::DeleteUnPackFile()
{
    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	int nZipPath = (int)m_vecZipFile.size();

	for ( int i = 0; i < nZipPath; ++i )
	{
		CString strZipFile = m_vecZipFile[i].c_str();

		CString strExtPath = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp; 
		strExtPath += strZipFile.Right( strZipFile.GetLength() - strZipFile.ReverseFind ( '\\' ) );
		strExtPath = strExtPath.Left ( strExtPath.ReverseFind ( '.' )  );	//	Zip ���� ���� ���		

		CString strFind = strExtPath;
		strFind += "\\*.*";

		WIN32_FIND_DATA finfo;
		HANDLE hSearch = FindFirstFile(strFind, &finfo);

		if (hSearch != INVALID_HANDLE_VALUE) 
		{
			do 
			{
				if (finfo.cFileName[0] != '.') 
				{
					if ( !(finfo.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) )
					{
						CString strSubFile = strExtPath;
						strSubFile += '\\';
						strSubFile += finfo.cFileName;

						DeleteFile( strSubFile );

						//CDebugSet::ToLogFile( sc::string::format("		�������� �� ���� ����.  %s", strSubFile.GetString()));
					}
						
				}
			} 
			while (FindNextFile(hSearch, &finfo));
			
			FindClose(hSearch);
		}

//		���������� ���� �����.
		RemoveDirectory( strExtPath );
		//CDebugSet::ToLogFile( sc::string::format("		�������� ���丮 ����.  %s", strExtPath.GetString()));
	}

	return TRUE;

}


BOOL CAutoPatchThread::DeleteNotFoundFile()
{
	return TRUE;

	CString	strDelFile, strCompFile;
	int nCnt = static_cast<int>( m_vectorDeleteFile.size() );

	strCompFile = NS_GLOBAL_VAR::strAppPath + RANPARAM::RPFDataPath;

	m_FileSystem.OpenFileSystem(strCompFile);	


	for ( int i = 0; i < nCnt; i++ )
	{
		SFILENODE* pNewFile = m_vectorDeleteFile[i];
/*
		if(strstr(pNewFile->SubPath,NS_GLOBAL_VAR::strCompDir)){
			CString strSubPath, strSubDir;
			
			strSubPath = pNewFile->SubPath;
			strSubDir = strSubPath.Right( strSubPath.GetLength() - (int)strlen("\\package") ); // \\package ���� ��
			
			m_FileSystem.ChangeDir(strSubDir);
			
			str.Format( "%s",pNewFile->FileName );
			str.MakeLower();
			str = str.Left( str.ReverseFind ( '.' ) );
			
			m_FileSystem.Remove(pNewFile->FileName);			
			
			continue;
		}
*/

		strDelFile.Format( "%s%s%s", NS_GLOBAL_VAR::strAppPath.GetString(), pNewFile->SubPath, pNewFile->FileName );
		strDelFile.MakeLower();
		strDelFile = strDelFile.Left( strDelFile.ReverseFind ( '.' ) );

		//	���೻ �������� Ȯ��
		bool bPack = false;
		if( strstr(pNewFile->SubPath,".rcc\\") )	bPack = true;

		if ( !bPack )
		{
			DeleteFile( strDelFile.GetString() );
			//CDebugSet::ToLogFile( sc::string::format("		�ش� ���� ����.  %s", strDelFile.GetString()));
		}
		else
		{
	

			CString strExtPath, strZipFile;				
			strZipFile = strDelFile;
			
			strZipFile = strZipFile.Left ( strZipFile.ReverseFind ( '\\' ) );	//	Zip ���� ���

            CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
            const SUBPATH* pPath = pApp->GetSubPath();

			strExtPath = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp; 
			strExtPath += strZipFile.Right( strZipFile.GetLength() - strZipFile.ReverseFind ( '\\' ) );
			strExtPath = strExtPath.Left ( strExtPath.ReverseFind ( '.' )  );	//	Zip ���� ���� ���


			//	������ ���ٸ�
			if ( GetFileAttributes( strExtPath ) == UINT_MAX )
			{
				//	�ű� Rcc����
				if ( GetFileAttributes( strZipFile ) == UINT_MAX )
				{
					continue;
				}
				else
				{
					//	������ �����Ѵ�.
					if ( GetFileAttributes( strExtPath ) == UINT_MAX )
					{
						CUnzipper cUnZip;
						m_vecZipFile.push_back( strZipFile.GetString() );
						
						if ( !cUnZip.Unzip( strZipFile, strExtPath ) )
						{
							CString	strMsg;
							strMsg = ID2LAUNCHERTEXT("IDS_MESSAGE", 76 );
							CHAR * szListMessage = new CHAR[256];
							wsprintf( szListMessage, "%s %s", strMsg.GetString(), pNewFile->FileName );
							::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szListMessage );

							//CDebugSet::ToLogFile( sc::string::format("		���� ���� ����.  %s", pNewFile->FileName));

							return FALSE;
						}						
					}

				}
			}

			strDelFile = strExtPath + '\\' + pNewFile->FileName;
			strDelFile = strDelFile.Left ( strDelFile.ReverseFind ( '.' ) );
			DeleteFile( strDelFile.GetString() );
		}

	}

	m_FileSystem.CloseFileSystem();	

	return TRUE;
}

BOOL CAutoPatchThread::DeleteDownFiles()
{
    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	CString	strTemp;
	int nCnt = static_cast<int>( m_vectorDownFile.size() );

	for ( int i = 0; i < nCnt; ++i )
	{
		SFILENODE* pNewFile = m_vectorDownFile[i];
		strTemp.Format(
            "%s%s%s%s",
            NS_GLOBAL_VAR::strProFile.GetString(),
            pPath->SaveRoot().c_str(), //SUBPATH::SAVE_ROOT, 
            NS_GLOBAL_VAR::strDownloadTemp.GetString(),
            pNewFile->FileName);

		DeleteFile( strTemp.GetString() );

		//CDebugSet::ToLogFile( sc::string::format("		�ٿ�ε��� ���� ����.  %s", strTemp.GetString()));
	}

	strTemp = NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp;
	RemoveDirectory ( strTemp.GetString() );

	//CDebugSet::ToLogFile( sc::string::format("		���丮 ���� ���� ����.  %s", strTemp.GetString()));

	return TRUE;
}


/*
BOOL CAutoPatchThread::DeleteCompressFile()
{
	CString	strTemp;
	int nCnt = static_cast<int>( m_vecCompFile.size() );

	for ( int i = 0; i < nCnt; ++i )
	{
		SFILENODE* pNewFile = m_vecCompFile[i];
		strTemp.Format( "%s%s%s", NS_GLOBAL_VAR::strAppPath.GetString(), pNewFile->SubPath, pNewFile->FileName );
		strTemp.MakeLower();
		strTemp = strTemp.Left( strTemp.ReverseFind ( '.' ) );

		DeleteFile( strTemp.GetString() );
	}

	// directory ���� �ϴ� �κ�
	CString strDir[5];
	strDir[0].Format( "%s%s", NS_GLOBAL_VAR::strAppPath.GetString(),"\\package\\data\\glogic\\level");
	strDir[1].Format( "%s%s", NS_GLOBAL_VAR::strAppPath.GetString(),"\\package\\data\\glogic\\npctalk");
	strDir[2].Format( "%s%s", NS_GLOBAL_VAR::strAppPath.GetString(),"\\package\\data\\glogic\\quest");
	strDir[3].Format( "%s%s", NS_GLOBAL_VAR::strAppPath.GetString(),"\\package\\data\\glogic");
	strDir[4].Format( "%s%s", NS_GLOBAL_VAR::strAppPath.GetString(),"\\package\\data");

	for(int i = 0; i < 5 ; ++i){
		RemoveDirectory(strDir[i].GetString());			
	}

	return TRUE;

}
*/


BOOL CAutoPatchThread::Destroy()
{
	for ( int i = 0; i < (int)m_vectorPreDownFile.size (); i++ )
	{
		delete m_vectorPreDownFile[i];
	}
	m_vectorPreDownFile.clear();

	for ( int i = 0; i < (int)m_vectorApplyPreDownFile.size (); i++ )
	{
		delete m_vectorApplyPreDownFile[i];
	}
	m_vectorApplyPreDownFile.clear();

	for ( int i = 0; i < (int)m_vectorServerFile.size (); i++ )
	{
		delete m_vectorServerFile[i];
	}
	m_vectorServerFile.clear();

	for ( int i = 0; i < (int)m_vectorNewFile.size (); i++ )
	{
		delete m_vectorNewFile[i];
	}
	m_vectorNewFile.clear();
	m_vectorDownFile.clear(); // MEMO : �ߺ��� �����Ͷ� delete �� �ʿ����.

	// m_mapDownedFile ���� ///////////////////////////
	FILEMAP_ITER iter = m_mapDownedFile.begin ();
	FILEMAP_ITER iter_end = m_mapDownedFile.end ();
	for ( ; iter != iter_end; iter++ )
	{
		delete (*iter).second;
	}
	m_mapDownedFile.clear();
	m_vectorCopyFile.clear();

	// m_mapDownedFile ���� ///////////////////////////
	iter = m_mapCopiedFile.begin ();
	iter_end = m_mapCopiedFile.end ();
	for ( ; iter != iter_end; iter++ )
	{
		delete (*iter).second;
	}
	m_mapCopiedFile.clear();
	m_vectorDeleteFile.clear();
	m_vectorPackFile.clear();
	m_vecZipFile.clear();
//	m_vecCompFile.clear();

	return TRUE;
}

BOOL CAutoPatchThread::VersionUp( int sGameVer )
{
	CString strTemp;
	strTemp.Format( "%s%s", NS_GLOBAL_VAR::strAppPath.GetString(), g_szClientVerFile );
	SetFileAttributes( strTemp.GetString(), FILE_ATTRIBUTE_NORMAL );

	FILE* cfp = _fsopen( strTemp.GetString(), "rb+", _SH_DENYNO );	
	if ( cfp )
	{		
		fseek( cfp, sizeof ( int ) * 1, SEEK_SET );
		if ( 1 != fwrite( &sGameVer, sizeof( int ), 1, cfp ) )
		{
			fclose( cfp );
			return FALSE;
		}
		fclose( cfp );
	}

	return TRUE;
}

// ���� �ٿ�ε� ���� ������ ���ٸ� �������� ����
// ���� �ٿ�ε� ���� �߿� ���� �߻��� ��츸 FALSE
BOOL CAutoPatchThread::ApplyPreDownFile()
{
	if( NS_GLOBAL_VAR::g_bApplyPreDown == FALSE )
		return TRUE;

	CHAR * szTempMessage = new CHAR[256];
	wsprintf( szTempMessage, "%s", "���� �ٿ�ε� �Ϸ�� ������ �����մϴ�." );
	::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szTempMessage );	

	//CDebugSet::ToLogFile( std::string(szTempMessage));

	// Temp �����н��� �����Ѵ�
    CAutoPatchManApp* pApp = (CAutoPatchManApp*) AfxGetApp();
    const SUBPATH* pPath = pApp->GetSubPath();

	CString	DownloadDir( NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strDownloadTemp );
	// PreDownloader �����н��� �����Ѵ�
	CString	PreDownloadDir( NS_GLOBAL_VAR::strProFile + pPath->SaveRoot().c_str() + NS_GLOBAL_VAR::strPreDownloadFolder );


	CFileStatus status;
	CString strPreDownFile, strTempDownFile, strAppFile;
	FILEVECTOR::size_type nApplyFileSize = m_vectorApplyPreDownFile.size();

	//CDebugSet::ToLogFile( sc::string::format("		�����ؾ��� �����ٿ�ε� ���� ����.  %d", nApplyFileSize));

	// ���� �ٿ�ε�� ���� �̵���Ű�� m_vectorDownFile �� ���. ���� ���� �ٿ�ε�� ������ ���ٸ� �ٿ�ε��ؾ��� ���� ( m_vectorServerFile )�� �߰�
	for ( FILEVECTOR::size_type i = 0; i < nApplyFileSize; i++ )
	{	
		SFILENODE* pApplyFile = m_vectorApplyPreDownFile[i];

		strPreDownFile.Format("%s%s", PreDownloadDir, pApplyFile->FileName);
		strTempDownFile.Format("%s%s", DownloadDir, pApplyFile->FileName);

		if( CFile::GetStatus(strPreDownFile, status) == TRUE )
		{		
			if( SetFileAttributes( strPreDownFile.Left ( strPreDownFile.ReverseFind ( '.' ) ).GetString(), FILE_ATTRIBUTE_NORMAL ) )
			{
				//CDebugSet::ToLogFile( sc::string::format("		[ERROR] strPreDownFile �Ӽ���ȯ ����.  %s", strPreDownFile.GetString()));
				return FALSE;
			}

			if( SetFileAttributes( strTempDownFile.Left ( strTempDownFile.ReverseFind ( '.' ) ).GetString(), FILE_ATTRIBUTE_NORMAL ) )
			{
				//CDebugSet::ToLogFile( sc::string::format("		[ERROR] strTempDownFile �Ӽ���ȯ ����.  %s", strTempDownFile.GetString()));
				return FALSE;
			}

#ifdef PREDOWNLOAD
			// ���� ���������� ������� ������ ����
			//DeleteFile( strTempDownFile );

			// Temp ������ �������� �����Ƿ� ���� �����Ѵ�.
			CreateDirectory ( DownloadDir.GetString(), NULL );

			if( CopyFile( strPreDownFile, strTempDownFile, FALSE ) == 0 )
			{
				//CHAR * szTempMessage11 = new CHAR[256];
				//wsprintf( szTempMessage11, "		���� ���� %s, %s", strPreDownFile, strTempDownFile );
				//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szTempMessage11 );	

				//CDebugSet::ToLogFile( std::string(szTempMessage11));

				return FALSE;
			}
#else
			// ���� ���������� ������� ������ ����
			DeleteFile( strTempDownFile );

			if( CopyFile( strPreDownFile, strTempDownFile, TRUE ) == 0 )
				return FALSE;
#endif

			if( DeleteFile( strPreDownFile ) == 0 )
			{
				//CHAR * szTempMessage33 = new CHAR[256];
				//wsprintf( szTempMessage33, "		���� ���� %s", strPreDownFile );
				//::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szTempMessage33 );	

				//CDebugSet::ToLogFile( std::string(szTempMessage33));

				return FALSE;
			}
	
			m_vectorDownFile.push_back(m_vectorApplyPreDownFile[i]);
			m_vectorNewFile.push_back(m_vectorApplyPreDownFile[i]);

			//CDebugSet::ToLogFile( sc::string::format("		PREDOWN �������� �ش� ���� ã��.  %s", m_vectorApplyPreDownFile[i]->FileName));
		}
#ifdef PREDOWNLOAD
		else if( CFile::GetStatus(strTempDownFile, status) == TRUE )
		{
			m_vectorDownFile.push_back(m_vectorApplyPreDownFile[i]);
			m_vectorNewFile.push_back(m_vectorApplyPreDownFile[i]);

			CDebugSet::ToLogFile( sc::string::format("		[ERROR] TEMP �������� �ش� ���� ã��.  %s", m_vectorApplyPreDownFile[i]->FileName));
		}
#endif
		else
		{
			// ���� �ٿ�ε�� ������ ���ٸ� �ٿ�ε� ������ �ֵ��� m_vectorServerFile �� �߰�
			m_vectorServerFile.push_back(m_vectorApplyPreDownFile[i]);

			//CDebugSet::ToLogFile( sc::string::format("		[ERROR] ����(TEMP,PREDOWN,CLIENT)���� �ش� ������ ã���� ����.  %s", m_vectorApplyPreDownFile[i]->FileName));
#ifdef PREDOWNLOAD
			CPatchSetNode* pNode = m_ClientFileTree.Find( (SFILENODE*)m_vectorApplyPreDownFile[i] );
			if ( pNode )	
			{
				CHAR * szTempMessage44 = new CHAR[256];
				wsprintf( szTempMessage44, "		[ERROR] cFileList.Bin���� �ٿ�Ϸ������� ������ ����. %s", m_vectorApplyPreDownFile[i]->FileName );
				::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szTempMessage44 );	

				CDebugSet::ToLogFile( std::string(szTempMessage44));
				return FALSE;
			}
#endif
		}
	}

	return TRUE;
}

// �������� FileList.bin�� cFileList.bin���� ��ü�� ����
// ���� �ٿ�ε尡 �߰��Ǹ鼭 cFileList���� isPreDown ���°� 0 �Ǵ� 1�ΰ͸� ����Ǿ�� �ϹǷ� ����
BOOL CAutoPatchThread::CreateClientFileList()
{
	if( m_vectorServerFile.size() <= 0 )
	{
		CHAR * szTempMessage = new CHAR[256];
		wsprintf( szTempMessage, "%s", "cFileList ���뿡 ����" );
		::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, 0, (LPARAM)szTempMessage );	

		//CDebugSet::ToLogFile( std::string(szTempMessage));

		return FALSE;
	}

	//CDebugSet::ToLogFile( sc::string::format("		���� ��ü ����.  %d", m_vectorServerFile.size()));

	CString strClientPreDown;
	strClientPreDown.Format( "%s%s", NS_GLOBAL_VAR::strAppPath.GetString(), NS_GLOBAL_VAR::g_szClientFileList );

	CFile file;

	if (!file.Open(strClientPreDown, CFile::modeCreate | CFile::modeReadWrite))
	{
		return FALSE;
	}
	
	SFILENODE FileInfo;
	SFILENODE* pGetFile = NULL;

	FileInfo.Clear();
	FileInfo.Ver = 3;
	file.Write(&FileInfo, sizeof(SFILENODE));

	FileInfo.Clear();
	FileInfo.Ver = m_vectorServerFile.size();
	file.Write(&FileInfo, sizeof(SFILENODE));

	for( int i = 0; i < m_vectorServerFile.size(); i++ )
	{
		pGetFile = m_vectorServerFile[i];

		//if( pGetFile->IsPreDown == 2 )
		//	CDebugSet::ToLogFile( sc::string::format("		�����ٿ�ε� ����.  %s", pGetFile->FileName));
		//else if( pGetFile->IsPreDown == 1 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		����� �����ٿ�ε� ����.  %s", pGetFile->FileName));
		//else if( pGetFile->IsPreDown == 3 ) 
		//	CDebugSet::ToLogFile( sc::string::format("		������ �����ٿ�ε� ����.  %s", pGetFile->FileName));

		FileInfo.Clear();
		FileInfo.SetData(pGetFile);
		file.Write(&FileInfo, sizeof(SFILENODE));
	}

	file.Close();
	return TRUE;
}

/*
BOOL CAutoPatchThread::CompressFile()
{
	CString strCompPath;
	strCompPath = NS_GLOBAL_VAR::strAppPath + RANPARAM::RPFDataPath;

	::PostThreadMessage( m_nDlgThreadID, WM_LISTADDSTRING, (WPARAM)ID2LAUNCHERTEXT("IDS_MESSAGE", 70 ), 0 );

	if(!m_FileSystem.OpenFileSystem(strCompPath)){ // ���� ��ü�� �������
		m_FileSystem.NewFileSystem(strCompPath);
		m_FileSystem.OpenFileSystem(strCompPath);
	}

    TCHAR strFileName[256]; // ���� �̸�
	CString strFilePath; // ���� ��ü���
	CString strSubDir; // ���Ͻý��� subpath
	CString strSubPath; // ���� subpath
	CString strTemp;
	for ( int i = 0; i < (int)m_vecCompFile.size (); i++ )
	{
		strSubPath = m_vecCompFile[i]->SubPath;
		strSubDir = strSubPath.Right( strSubPath.GetLength() - (int)strlen("\\package") ); // \\package �̺κ� ����
		if(!m_FileSystem.ChangeDir(strSubDir)){ // ������ �������� �ʾ��� ��� ���� ����
			m_FileSystem.ChangeDir(m_FileSystem.GetCurDir());

			int count = 0;

			if(strcmp(m_FileSystem.GetCurDir(),"/") == 0){ // ����� �̻� 
				strTemp = strSubDir;	
			}else{
				count =(int) ( strSubDir.GetLength() - strlen(m_FileSystem.GetCurDir()));
				strTemp = strSubDir.Right(count); 
			}
			
			CString token;
			
			int curPos = 0;
			token = strTemp.Tokenize("\\",curPos);
			while(token != ""){
				if(!m_FileSystem.AddDir(token))	return FALSE;
				if(!m_FileSystem.ChangeDir(token)) return FALSE;
				token= strTemp.Tokenize("\\",curPos);
			}			
			
		}

		strFilePath.Format("%s%s%s",NS_GLOBAL_VAR::strAppPath.GetString(),m_vecCompFile[i]->SubPath,m_vecCompFile[i]->FileName);
		strFilePath = strFilePath.Left(strFilePath.ReverseFind('.'));
		m_FileSystem.GetNameOnly(strFileName,strFilePath);
		if(m_FileSystem.CheckNameExist((LPCTSTR)strFileName)) // ���� ������ �ִ��� Ȯ��
		{
			m_FileSystem.Remove(strFileName);
		}

		if(!m_FileSystem.AddFile(LPCTSTR(strFilePath))) // ���� �߰�
		{
			return FALSE;
		}
		if(!m_FileSystem.ChangeDir("/"))  return FALSE;
	}

	m_FileSystem.CloseFileSystem();
	return TRUE;
}
*/
/*
BOOL CAutoPatchThread::OptimizeCompressFile()
{

	CString strCompPath, strPath;
	strCompPath = NS_GLOBAL_VAR::strAppPath + RANPARAM::RPFDataPath;
	strPath = NS_GLOBAL_VAR::strAppPath + "package\\temp.rpf";

	m_FileSystem.OpenFileSystem(strCompPath);

	if(!m_FileSystem.OptimizeFileSystem(strPath)){
		m_FileSystem.CloseFileSystem();
		return FALSE;
	}

	m_FileSystem.CloseFileSystem();
	remove(strCompPath);
	rename(strPath,strCompPath);

	return TRUE;
}
*/

void CAutoPatchThread::SaveVersionInRegistry( int sGameVer )
{
	HKEY Versionkey = NULL;
	TCHAR data_buffer[256];  
	DWORD data_type;  
	DWORD data_size; 

	EMSERVICE_PROVIDER sp = GLogicData::GetInstance().GetServiceProvider();
	switch ( sp )
	{
	case SP_GS:
		{
			int ret = RegOpenKeyEx( HKEY_LOCAL_MACHINE, "SOFTWARE\\Min Communications\\RanOnlineGS", 0, KEY_ALL_ACCESS, &Versionkey );
			if ( ret == ERROR_SUCCESS )
			{
				::memset( data_buffer, 0, sizeof( data_buffer ) );
				data_size = sizeof( data_buffer );
				int GameVersion = 0;

				// ���ڿ��� ũ�⸦ ���� �о�´�.
				ret = ::RegQueryValueEx( Versionkey, "Version", 0, &data_type, ( BYTE* )data_buffer, &data_size );
				if ( ret == ERROR_SUCCESS )
				{
					GameVersion = atoi( data_buffer );
					if ( sGameVer != GameVersion )
					{
						TCHAR buffer[12] = { 0, };
						itoa( sGameVer, buffer, 10 );
						RegSetValueEx( Versionkey, "Version", 0, REG_SZ, ( const unsigned char* )buffer, strlen( buffer ) + 1 );
					}
				}
			}
		}
		break;
	}

	if ( Versionkey != NULL )
		RegCloseKey( Versionkey );
}

BEGIN_MESSAGE_MAP(CAutoPatchThread, CHttpThread)
END_MESSAGE_MAP()