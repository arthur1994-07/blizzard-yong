#include "stdafx.h"
#include "../RanLogic/GLogicDataMan.h"
#include "GlobalVariable.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

namespace	NS_GLOBAL_VAR
{	
	UINT	nLOGIN_CONNECT_TIMELEFT = 10;
	int		nLOGIN_TRY = 5;
	UINT	nFTP_CONNECT_TIMELEFT = 6;
	int		nFTP_TRY = 5;
	UINT	nFORCE_EXIT_DELAYTIME = 3;	
	CString	strAppPath;
	CString strProFile;

	EMSERVICE_PROVIDER sp = GLogicData::GetInstance().GetServiceProvider();

	/*
//#ifdef CH_PARAM
	if (sp == SP_CHINA)
		CString	strTitle = "���ǻ�԰ Launcher";
//#elif TW_PARAM
	else if (sp == SP_TAIWAN)
		CString	strTitle = "�i online Launcher";
//#elif HK_PARAM 
	else if (sp == SP_HONGKONG)
		CString	strTitle = "�i online Launcher";
//#else 
	else
		CString	strTitle = "Ran Launcher";
//#endif
	*/
	CString strTitle = (sp == SP_CHINA) ? "���ǻ�԰ Launcher" : (sp == SP_TAIWAN) ? "�i online Launcher" : (sp == SP_HONGKONG) ? "�i online Launcher" : "Ran Launcher";

	CString	strDownloadTemp = "Temp\\";
	CString	strServerCabFileList = "filelist.bin.cab";
	CString	strDownList = "cDownList.bin";
	CString strCopyList = "cCopyList.bin";
	
//	CString strCompDir = "package\\"; // ������ ���ϵ��� ���

	TCHAR	g_szPatchMessage[128] = {0};

	/*
	#ifdef KR_PARAM
		TCHAR*	g_szRanFileName	= "RanOnline.exe";
//	#elif defined(CH_PARAM)
//		TCHAR*	g_szRanFileName	= "2046.exe";
	#elif GS_PARAM
		TCHAR*	g_szRanFileName	= "RanOnlineGS.exe";
	#elif _RELEASED
        TCHAR*	g_szRanFileName	= "GameR.exe";
    #else
		TCHAR*	g_szRanFileName	= "Game.exe";
	#endif
	*/
	TCHAR *g_szRanFileName = (sp == SP_KOREA) ? "RanOnline.exe" : (sp == SP_KOREA_TEST) ? "RanOnline.exe" : (sp == SP_CHINA) ? "2046.exe" : (sp == SP_GS) ? "Game.exe" : (sp == SP_OFFICE_TEST) ? "GameR.exe" : "Game.exe";

	TCHAR *g_szPreDownloaderName = "PreDownloader.exe"; 
	BOOL	g_bRunningPreDownloader = FALSE; 
	BOOL	g_bNeedPreDownloader = FALSE; 
	CString	strPreDownloadFolder = "PreDownload\\"; 

	//TCHAR*	g_szAlphaFtpServerIP = "mincontrol.mincoms.co.kr";
	//TCHAR*	g_szAlphaFtpID = "ranalpha";
	//TCHAR*	g_szAlphaFtpPW = "ranalpha";

	//TCHAR*	g_szBetaFtpID = "ranbeta";
	//TCHAR*	g_szBetaFtpPW = "tjdrlduq";	
	
	TCHAR*	g_szServerFileList = "FileList.bin";
	TCHAR*	g_szClientFileList = "cFileList.bin";	
	TCHAR*	g_szPreDownFileList = "preFileList.bin";

	TCHAR*	g_szServerPreDownFileList = "PreDownFileList.bin"; 	// ���� �ٿ�ε� �׽�Ʈ�� ���ؼ� �ӽ÷� �����ϴ� ����. �۾� �Ϸ��� �ڵ� ���� �ʿ�
	
	DWORD	g_DxVersion = 0x801;	

	TCHAR*	g_szLauncherPatchCabFile = "launcherpatch.exe.cab";
	TCHAR*	g_szLauncherPatchWndName = "Launcher Patch";

	BOOL	g_bApplyPreDown = FALSE;
};