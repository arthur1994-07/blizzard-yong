// DlgFTP.cpp : 구현 파일입니다.
//

#include "stdafx.h"
#include <process.h>
#include "MainFrm.h"
#include "VersionManager.h"
#include "DlgFTP.h"
#include "CConsoleMessage.h"
#include "CCfg.h"
#include "CMinFtp.h"
#include <vector>
#include "DatabaseTable.h"
#include "c_COdbcManager.h"
#include ".\dlgftp.h"

// CDlgFTP 대화 상자입니다.

static unsigned int WINAPI UploadThread(void* p)
{
	CDlgFTP* pThread = (CDlgFTP*) p;
	pThread->UploadThreadProc();
	return 0;
}

IMPLEMENT_DYNAMIC(CDlgFTP, CDialog)
CDlgFTP::CDlgFTP(CMainFrame* pFrame, CWnd* pParent /*=NULL*/)
	: CDialog(CDlgFTP::IDD, pParent)
    , m_pFrame(pFrame)
{
    m_bStop = FALSE;
}

CDlgFTP::~CDlgFTP()
{
}

void CDlgFTP::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
    DDX_Control(pDX, IDC_PROGRESS_FTP, m_ProgressFTP);
    DDX_Control(pDX, IDC_STATIC_FTP, m_StaticFTP);
}


BEGIN_MESSAGE_MAP(CDlgFTP, CDialog)
    ON_WM_TIMER()
    ON_BN_CLICKED(IDC_STOP, OnBnClickedStop)
    ON_BN_CLICKED(IDC_START, OnBnClickedStart)
    ON_EN_MAXTEXT(IDC_EDIT_FTP, OnEnMaxtextEditFtp)
END_MESSAGE_MAP()


// CDlgFTP 메시지 처리기입니다.

BOOL CDlgFTP::OnInitDialog()
{
    CDialog::OnInitDialog();

    // TODO:  여기에 추가 초기화 작업을 추가합니다.
    CConsoleMessage::GetInstance()->SetControl(GetDlgItem(IDC_EDIT_FTP)->m_hWnd);	
	m_ProgressFTP.SetRange(0, 100);	
	m_ProgressFTP.SetPos(0);

    return TRUE;  // return TRUE unless you set the focus to a control
    // 예외: OCX 속성 페이지는 FALSE를 반환해야 합니다.
}

void CDlgFTP::OnTimer(UINT nIDEvent)
{
    // TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.
    CDialog::OnTimer(nIDEvent);
}

int CDlgFTP::UploadThreadProc()
{
    // Connect to FTP.	
    CConsoleMessage::GetInstance()->Write("----------Start FTP Upload ---------");
    CMinFtp* pFtp = new CMinFtp();

    IVersionManConfig* pConfig = m_pFrame->GetConfig();
	int nFtpCount = static_cast <int> (pConfig->GetFtpSize());

	for (int nFtpCrt=1; nFtpCrt<=nFtpCount; nFtpCrt++)
	{
		CString strIP = pConfig->GetFtpAddress(nFtpCrt-1);
		int nRetCode = pFtp->Connect(
            strIP.GetString(),
            pConfig->GetFtpPort(),
            pConfig->GetFtpUserName(),
            pConfig->GetFtpPassword());
		if (nRetCode == NET_ERROR)
		{
			CConsoleMessage::GetInstance()->Write("-------------------------------------------------------------------");
			CConsoleMessage::GetInstance()->Write("ERROR:%d %s FTP connection failed..", nFtpCrt, strIP.GetString());
			CConsoleMessage::GetInstance()->Write("-------------------------------------------------------------------");
			return -1;
		}

		// Location of the initial FTP connection ROOT directory
		CString strFirstDir;
		
		if (pFtp->m_pConnect->GetCurrentDirectory(strFirstDir) == 0)
		{
			CConsoleMessage::GetInstance()->Write("ERROR:GetCurrentDirectory %d", GetLastError());
			return -1;
		}

		//Get the entire folder list.        
        IVersionManagerDb* pDb = m_pFrame->GetDbMan();        
        IVersionManConfig* pConfig = m_pFrame->GetConfig();

		std::vector<FolderList> vFolder;
		pDb->GetFolderList(vFolder);

		//Create a folder on FTP

		// Caution: If you do not do it in the following way...

		// It does not work on Windows and Unix systems simultaneously.

		CConsoleMessage::GetInstance()->Write("--Check the folder in FTP.--");
		for (int i=0; i<(int) vFolder.size(); i++)
		{	
			CString strTmpFolder= (&vFolder[i])->strName;
	        
			CString resToken;
			int curPos= 0;

			resToken= strTmpFolder.Tokenize("\\",curPos);
			while (resToken != "")
			{            
				pFtp->CreateDirectory(resToken);
				pFtp->SetCurrentDirectory(resToken);
				resToken= strTmpFolder.Tokenize("\\",curPos);
			}
			pFtp->SetCurrentDirectory(strFirstDir);        
		}   

		// Get the entire file list..
		CConsoleMessage::GetInstance()->Write("Get the entire file list");
		std::vector<FullFileList> vFullFileList;    
		pDb->GetNotUploadedFileList(vFullFileList);
	    
		// Upload files one by one while going through.
		CConsoleMessage::GetInstance()->Write("Upload the file");
		CString strSrcPath;
		strSrcPath.Format("%s", pConfig->GetTargetPath());

		int nTotalCount = (int) vFullFileList.size();
		int nCount = 0;


		for (int i=0; i<(int) vFullFileList.size(); i++)
		{	
			nCount++;       

			CString strMakePath;
			CString strFileName = (&vFullFileList[i])->strFileName;
			strMakePath = strSrcPath + (&vFullFileList[i])->strFolder + strFileName;

			CString strTemp;        
			strTemp.Format("%s %d/%d", strFileName.GetString(), nCount, nTotalCount);
			m_StaticFTP.SetWindowText(strTemp);

			CString strChgfolder;
			strChgfolder = strFirstDir + (&vFullFileList[i])->strFolder;
			strChgfolder.Replace('\\', '/');
			pFtp->SetCurrentDirectory(strChgfolder);
			if (pFtp->PutFile(strMakePath, strFileName) == NET_ERROR)
			{
				CConsoleMessage::GetInstance()->Write("ERROR:%s File Upload Error", strFileName.GetString());
				CConsoleMessage::GetInstance()->Write("INFO:%s Retry", strFileName.GetString());
				if (pFtp->PutFile(strMakePath, strFileName) == NET_ERROR)
				{
					CConsoleMessage::GetInstance()->Write("ERROR:%s File upload retry failed", strFileName.GetString());					
				}
				else
				{
					CConsoleMessage::GetInstance()->Write("INFO:%s File upload retry successful", strFileName.GetString());
				}
			}
			else
			{
				// 업로드 성공
				// DB 에 업로드 했다고 기록한다.
				if (nFtpCrt == nFtpCount)
				{
					pDb->UpdateFileStateTrue((&vFullFileList[i])->nIdx);
				}
			}
			m_ProgressFTP.SetPos((int)((nCount*100)/nTotalCount));

			if (m_bStop)
			{
				CConsoleMessage::GetInstance()->Write("Stop uploading");
				pFtp->DisConnect();
				delete pFtp;
				return -1;
			}
			Sleep( 5 );
		}

		// Finally, upload the file list..
		CConsoleMessage::GetInstance()->Write("Upload file list");    
		if (pFtp->SetCurrentDirectory(strFirstDir) == NET_ERROR)
		{
			CConsoleMessage::GetInstance()->Write("ERROR: File List SetCurrentDirectory failed");
		}
		else
		{
			if (pFtp->PutFile(strSrcPath + '\\' + "filelist.bin.cab", "filelist.bin.cab") == NET_ERROR)
			{
                CConsoleMessage::GetInstance()->Write("ERROR: File list upload failed");
			}
			else
			{
				CConsoleMessage::GetInstance()->Write("INFO: File list upload successful");
			}
		}
	   
		// ftp 연결을 해제한다.
		CConsoleMessage::GetInstance()->Write("Disconnect the FTP connection.");
		pFtp->DisConnect();
	}
    delete pFtp;
	CConsoleMessage::GetInstance()->Write("---------- FTP Upload completed. ---------");
    return 0;
}

void CDlgFTP::OnBnClickedStop()
{
    // TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
    m_bStop = TRUE;
}

void CDlgFTP::OnBnClickedStart()
{
    // TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
    m_bStop = FALSE;
    StartUploadThread();
}

int CDlgFTP::StartUploadThread()
{	
	DWORD dwThreadID = 101;	
	
	/*m_hThread = ::CreateThread(
						NULL, 
					    0, 
					    (LPTHREAD_START_ROUTINE) UploadThread, 
					    this, 
					    0, 
					    &dwThreadID );*/
	m_hThread = (HANDLE) ::_beginthreadex(
								NULL,
								0,
								UploadThread,
								this, 
								0, 
								(unsigned int*) &dwThreadID );
	if (m_hThread == NULL)
	{
		// 쓰래드 생성에 실패하였습니다.
        CConsoleMessage::GetInstance()->Write("Failed to create thread");
		return NET_ERROR;
	}
	else
	{
		return NET_OK;
	}
}

void CDlgFTP::OnEnMaxtextEditFtp()
{
    // TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
    GetDlgItem(IDC_EDIT_FTP)->SetWindowText("");
}
