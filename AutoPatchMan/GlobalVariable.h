#pragma once

class	CPatch;
class	CHttpPatch;

struct S_PATCH_THREAD_PARAM
{
	bool		bUseHttp;

	CPatch*		pFtpPatch;
	CHttpPatch*	pHttpPatch;

	int		cPatchVer;
	int		sPatchVer;
	int		cGameVer;
	int		sGameVer;	

	S_PATCH_THREAD_PARAM () :
	bUseHttp ( false ),
		pFtpPatch ( NULL ),
		pHttpPatch ( NULL ),
		cPatchVer ( 0 ),
		sPatchVer ( 0 ),
		cGameVer ( 0 ),
		sGameVer ( 0 )
	{
	}
};

namespace	NS_GLOBAL_VAR
{
	extern	UINT	nLOGIN_CONNECT_TIMELEFT;	//	�α��� ���� ���� Ÿ��
	extern	int		nLOGIN_TRY;					//	�α��� �õ� �ִ� ȸ��
	extern	UINT	nFTP_CONNECT_TIMELEFT;		//	FTP ���� ���� Ÿ��
	extern	int		nFTP_TRY;					//	FTP �õ� �ִ� ȸ��
	extern	UINT	nFORCE_EXIT_DELAYTIME;		//	�������� ��� �ð�	

	extern	CString	strAppPath;					//	���α׷��� ����Ǵ� ���
	extern  CString strProFile;					//  ����� Document ���丮
	extern	CString	strTitle;					//	������ Ÿ��Ʋ
	extern	CString	strDownloadTemp;			//	�ӽ� �ٿ�ε� ���
	extern	CString	strServerCabFileList;		//	filelist.bin.cab (���� ����Ʈ)
	extern	CString	strDownList;				//	cFileList.bin (Ŭ���̾�Ʈ ���� ����Ʈ)
	extern	CString strCopyList;				//	cCopyList.bin (Ŭ���̾�Ʈ ī�� ����Ʈ)
//	extern	CString strCompDir;

	extern	TCHAR	g_szPatchMessage[128];
	extern	TCHAR*	g_szRanFileName;	
	extern	TCHAR*	g_szPreDownloaderName; 
	extern	BOOL	g_bRunningPreDownloader; 
	extern	BOOL	g_bNeedPreDownloader; 
	extern	CString	strPreDownloadFolder; //	���� �ٿ�ε� ���

	
	//extern	TCHAR*	g_szAlphaFtpServerIP;
	//extern	TCHAR*	g_szAlphaFtpID;
	//extern	TCHAR*	g_szAlphaFtpPW;

	//extern	TCHAR*	g_szBetaFtpID;
	//extern	TCHAR*	g_szBetaFtpPW;

	extern	TCHAR*	g_szLauncherPatchCabFile;
	extern	TCHAR*	g_szLauncherPatchWndName;
	
	extern	TCHAR*	g_szServerFileList;
	extern	TCHAR*	g_szClientFileList;
	extern	TCHAR*	g_szPreDownFileList; 

	extern	TCHAR*	g_szServerPreDownFileList; 

	extern	DWORD	g_DxVersion;
	extern	DWORD	g_NotInitDxVer;

	extern	BOOL	g_bApplyPreDown;
};