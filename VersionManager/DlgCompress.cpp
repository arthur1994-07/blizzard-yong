// DlgCompress.cpp : 구현 파일입니다.
//

#include "stdafx.h"
#include <process.h>
#include "VersionManager.h"
#include "DlgCompress.h"
#include "MainFrm.h"

#include "MIN_CAB_UTIL.h"
#include "CConsoleMessage.h"
#include "ListLoader.h"
#include "CCfg.h"
#include ".\dlgcompress.h"

// CDlgCompress 대화 상자입니다.

IMPLEMENT_DYNAMIC(CDlgCompress, CDialog)
// 사용하지 않는 기능이므로 삭제
//CDlgCompress::CDlgCompress(CMainFrame* pFrame, std::vector<CompressFile> &v, CWnd* pParent /*=NULL*/, int nMode)
//	: CDialog(CDlgCompress::IDD, pParent)
//{
//	m_vCompressFile = v;
//	m_pFrame		= pFrame;
//	m_nMode			= nMode;
//}

CDlgCompress::CDlgCompress(CMainFrame* pFrame, CString strFileName, CWnd* pParent, int nMode)   // 표준 생성자입니다.
	: CDialog(CDlgCompress::IDD, pParent)
{
	m_nMode			= nMode;
	m_pFrame		= pFrame;
	m_strFileName	= strFileName;
}

CDlgCompress::~CDlgCompress()
{
	CConsoleMessage::GetInstance()->ReleaseInstance();
}

void CDlgCompress::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);	
	DDX_Control(pDX, IDC_PROGRESS1, m_Pregress);
	DDX_Control(pDX, IDC_STATIC_PG, m_StaticCtl);
}


BEGIN_MESSAGE_MAP(CDlgCompress, CDialog)
	ON_WM_TIMER()
    ON_EN_MAXTEXT(IDC_EDIT_CONSOLE, OnEnMaxtextEditConsole)
END_MESSAGE_MAP()


// CDlgCompress 메시지 처리기입니다.

BOOL CDlgCompress::OnInitDialog()
{
	CDialog::OnInitDialog();

	// TODO:  여기에 추가 초기화 작업을 추가합니다.
	CConsoleMessage::GetInstance()->SetControl(GetDlgItem(IDC_EDIT_CONSOLE)->m_hWnd);	
	m_Pregress.SetRange(0, 100);	
	m_Pregress.SetPos(0);

	if (m_nMode == 1) // General file addition
	{
		// 사용하지 않는 기능이므로 삭제
		//SetTimer(100, 1000, NULL);
	}
	else if(m_nMode == 2)
	{
		SetTimer(200, 1000, NULL);
	}
	else
	{
	}

	return TRUE;  // return TRUE unless you set the focus to a control
	// 예외: OCX 속성 페이지는 FALSE를 반환해야 합니다.
}

void CDlgCompress::OnTimer(UINT nIDEvent)
{
	// TODO: 여기에 메시지 처리기 코드를 추가 및/또는 기본값을 호출합니다.
	if (nIDEvent == 100)
	{
		//KillTimer(100);
		//threadCompressStart();
	}
	
	if (nIDEvent == 200)
	{
		KillTimer(200);
		threadCompressFromFileStart();
	}

	CDialog::OnTimer(nIDEvent);
}
//
//void CDlgCompress::threadCompressStart()
//{
//	DWORD dwThreadId;
//
//	HANDLE hThread = (HANDLE) ::_beginthreadex(
//								NULL, 
//								0, 
//								CompressStart,
//								this,
//								0,
//								(unsigned int*) &dwThreadId);
//}

void CDlgCompress::threadCompressFromFileStart()
{
	DWORD dwThreadId;

	HANDLE hThread = (HANDLE) ::_beginthreadex(
								NULL, 
								0, 
								CompressFromFileStart,
								this,
								0,
								(unsigned int*) &dwThreadId);
}

unsigned int WINAPI CDlgCompress::CompressFromFileStart( void* pDlg )
{
	CDlgCompress* pDLG = (CDlgCompress*) pDlg;
	CListLoader ListLoader(pDLG->m_strFileName, pDLG->m_pFrame);

    CMainFrame* pFrame = pDLG->m_pFrame;
    IVersionManagerDb* pDb = pFrame->GetDbMan();    
    IVersionManConfig* pConfig = pFrame->GetConfig();

	// 디렉토리부터 생성하고 DB 에 입력한다.
	std::vector<FolderList>::iterator pos;
	int nTotalCount = (int) ListLoader.m_vFolderList.size();
    int nRetCode;
	DWORD dwRetCode;
	CString strFolder;

    CConsoleMessage::GetInstance()->Write("----Checking folder----");

	//////////////////////////////////////////////////////////////////////////////
	// The root directory is always created.
	strFolder = pConfig->GetTargetPath();
	CreateDirectory(strFolder, NULL);
	if( pDb->IsFolderExist("\\") == false )
	{
		pDb->CreateFolder("\\");
	}
	//////////////////////////////////////////////////////////////////////////////

	for (pos = ListLoader.m_vFolderList.begin(); pos<ListLoader.m_vFolderList.end(); ++pos)
	{		
		// Check if there is a folder in the DB..        
        nRetCode = pDb->IsFolderExist((*pos).strName);
        strFolder = pConfig->GetTargetPath() + (*pos).strName;
        strFolder.Replace('/', '\\');

        if (nRetCode == TRUE)
        {
			// Skip if it is in the DB and actually exists
            dwRetCode = GetFileAttributes(strFolder);
            if (dwRetCode == INVALID_FILE_ATTRIBUTES) // Cases where it exists in the DB but does not exist
            {
                // 디렉토리를 생성한다.
                if (CreateDirectory(strFolder, NULL) == 0)
		        {
			        // 생성실패
                    CConsoleMessage::GetInstance()->Write("The %s directory was not created.", strFolder.GetString());			        
		        }
		        else
		        {
			        // 생성성공
		        }
            } 
            else // In the case where it is entered into the DB and actually exists
            {                                   
            }
        }
        else // If not in the DB
        {
            // Create a directory.
            if (CreateDirectory(strFolder, NULL) == 0)
		    {
			    // Creation failed
				CConsoleMessage::GetInstance()->Write("Please check the %s directory", strFolder.GetString());
		    }
		    else
		    {
			    // Creation successful
			    // Enter the folder name created in the DB
                CString strXXX = (*pos).strName;
                strXXX.Replace('/', '\\');
			    if (pDb->CreateFolder(strXXX) != DB_OK)
			    {
				    // 생성에는 성공 DB 에는 입력되지 않았음
                    CConsoleMessage::GetInstance()->Write("The %s directory was not entered into the DB.", strFolder.GetString());    			
			    }
                else
                {
                    // 성공
                }
		    }            
        }	
	}
    CConsoleMessage::GetInstance()->Write("----Folder check complete----");
	// Compress the files one by one and move them to the corresponding folder..
	std::vector<CompressFile>::iterator posFile;

    CConsoleMessage::GetInstance()->Write("----Checking the file----");
    
    // Set it up by entering the directory's unique ID.
	for (posFile = ListLoader.m_vFile.begin(); posFile<ListLoader.m_vFile.end(); ++posFile)
	{
		// After obtaining the unique ID of the directory, insert the value.
        int nDidx = pDb->GetFolderNum((*posFile).strPurePath);

        if (nDidx == DB_ERROR)
        {
            CConsoleMessage::GetInstance()->Write("Unable to find the unique value of %s", (*posFile).strTarget.GetString());
        }
        else
        {
            (*posFile).nDir = nDidx;
            CConsoleMessage::GetInstance()->Write("The unique value of %s is %d.", (*posFile).strTarget.GetString(), nDidx);
        }

        //Register the file.
	}

    nTotalCount = (int) ListLoader.m_vFile.size();
    int nCount = 0;

    // Compress the file and put it in..
    for (posFile = ListLoader.m_vFile.begin(); posFile<ListLoader.m_vFile.end(); ++posFile)
	{
		nCount++;
		CString strTemp;
        CompressFile sTemp;
        sTemp = (CompressFile) *posFile;
		strTemp.Format("%s %d/%d", sTemp.strFileName.GetString(), nCount, nTotalCount);
		pDLG->m_StaticCtl.SetWindowText(strTemp);
		sTemp.strSrc.GetString();
		// Compress and save to the corresponding directory.
		if (CAB_UTIL_MIN::MinMakeCab(sTemp.strSrc.GetString(), sTemp.strTarget.GetString()) == TRUE)
		{ 
			//Check if there is a file with the same name.
			BOOL bExist = pDb->IsFileExist(sTemp.strFileName, (*posFile).nDir);
			if (bExist)
			{
                //Check if it is the same file in the same directory..
                int nDirNum = pDb->GetFileFolderNum(sTemp.strFileName);
                
                // Update if it is the same file in the same directory..
                if (nDirNum == sTemp.nDir) 
                {               
					pDb->UpdateFile( sTemp.strFileName, sTemp.strMD5, ListLoader.m_nVerIncreaseCount, (*posFile).nDir );
                    pDb->UpdateFileStateFalse( sTemp.strFileName );
				    // CConsoleMessage::GetInstance()->Write("%s 기존 파일을 교체하였습니다", sTemp.strFileName.GetString());
                }                
                else // If the file has the same name in a different directory, cancel the compression.
                {
                    CConsoleMessage::GetInstance()->Write("The %s file already exists", sTemp.strFileName.GetString());
                }
            }
			else
			{
				// 신규파일
				pDb->InsertFile( (*posFile).nDir, (*posFile).strFileName, (*posFile).strMD5 );
				int nIndex = pDb->GetFileIndex( (*posFile).strFileName, (*posFile).nDir );
				pFrame->InsertNewFileName( nIndex, (*posFile).strFileName );
				// CConsoleMessage::GetInstance()->Write("%s 새로운 파일을 등록했습니다", sTemp.strFileName.GetString());
			}
		}
		else
		{
			CConsoleMessage::GetInstance()->Write("Failed to compress %s file", sTemp.strFileName.GetString());			
		}		
		
		pDLG->m_Pregress.SetPos((int)((nCount*100)/nTotalCount));
	}

    CConsoleMessage::GetInstance()->Write("----File check complete----");

	return 0;
}
// 사용하지 않는 기능이므로 삭제
//
//unsigned int WINAPI CDlgCompress::CompressStart( void* pDlg )
//{
//	CDlgCompress* pDLG = (CDlgCompress*) pDlg;
//    CMainFrame* pFrame = pDLG->m_pFrame;
//    IVersionManagerDb* pDb = pFrame->GetDbMan();
//
//	std::vector<CompressFile>::iterator pos;
//	int nTotalCount = (int) pDLG->m_vCompressFile.size();
//	int nCount = 0;
//
//	for (pos = pDLG->m_vCompressFile.begin(); pos<pDLG->m_vCompressFile.end(); ++pos)
//	{
//		nCount++;
//		CString strTemp;
//        CompressFile sTemp;
//        sTemp = (CompressFile) *pos;
//		strTemp.Format("%s %d/%d", sTemp.strFileName.GetString(), nCount, nTotalCount);
//		pDLG->m_StaticCtl.SetWindowText(strTemp);
//        
//		sTemp.strSrc.GetString();
//		// 압축해서 해당 디렉토리에 저장한다.
//		if (CAB_UTIL_MIN::MinMakeCab(sTemp.strSrc.GetString(), sTemp.strTarget.GetString()) == TRUE)
//		{ 
//			// 같은 이름의 파일이 있는지 조사한다.
//			BOOL bExist = pDb->IsFileExist(sTemp.strFileName);
//			if (bExist)
//			{
//				pDb->UpdateFile( sTemp.strFileName, sTemp.strMD5, 1 );
//                pDb->UpdateFileStateFalse(sTemp.strFileName); 
//				CConsoleMessage::GetInstance()->Write("%s 기존 파일을 교체하였습니다", sTemp.strFileName.GetString());
//			}
//			else
//			{
//				pDb->InsertFile( sTemp.nDir, sTemp.strFileName, sTemp.strMD5 );
//				CConsoleMessage::GetInstance()->Write("%s 새로운 파일을 등록했습니다", sTemp.strFileName.GetString());
//			}
//		}
//		else
//		{
//			CConsoleMessage::GetInstance()->Write("%s 파일 압축에 실패하였습니다", sTemp.strFileName.GetString());			
//		}
//		pDLG->m_Pregress.SetPos((int)((nCount*100)/nTotalCount));
//	}
//
//	return 0;
//}

void CDlgCompress::OnEnMaxtextEditConsole()
{
    // TODO: 여기에 컨트롤 알림 처리기 코드를 추가합니다.
    GetDlgItem(IDC_EDIT_CONSOLE)->SetWindowText("");
}
