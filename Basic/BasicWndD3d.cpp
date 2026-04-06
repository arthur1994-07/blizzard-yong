#include "stdafx.h"

#include "../SigmaCore/String/StringFormat.h"
#include "../SigmaCore/Log/LogMan.h"
#include "../SigmaCore/Loading/NSLoadingDirect.h"

#include "../EngineLib/DxTools/NsLoadingLagTester.h"
#include "../EngineLib/DxTools/DxViewPort.h"
#include "../EngineLib/DxTools/DxInputDevice.h"
#include "../EngineLib/DxTools/DxShadowMap.h"
#include "../EngineLib/DxTools/DxSurfaceTex.h"
#include "../EngineLib/DxTools/DxGlowMan.h"
#include "../EngineLib/DxTools/DxPostProcess.h"
#include "../EngineLib/DxTools/DxFontMan.h"
#include "../EngineLib/DxTools/d3dfont.h"
#include "../EngineLib/DxTools/RENDERPARAM.h"
#include "../EngineLib/DxEffect/Frame/DxEffectMan.h"
#include "../EngineLib/DxEffect/NSEffectThread.h"
#include "../EngineLib/DxMeshs/SkinMesh/_new/NsSMeshSceneGraph.h"
#include "../EngineLib/DxMeshs/SkinMesh/NSSkinAniThread.h"
#include "../EngineLib/G-Logic/GLPeriod.h"
#include "../EngineLib/DxResponseMan.h"
#include "../EngineLib/DxSound/DxSoundMan.h"
#include "../EngineLib/DxSound/BgmSound.h"
#include "../EngineLib/GUInterface/Cursor.h"
#include "../EngineLib/GUInterface/GameTextControl.h"
#include "../EngineLib/DxLand/DxPiece/NsOCTree.h"
#include "../EngineLib/Common/SUBPATH.h"
#include "../EngineLib/Common/CommonWeb.h"
#include "../EngineLib/TextTexture/TextUtil.h"
#include "../EngineLib/LoadingTimeCheck.h"
#include "../EngineLib/TextureMemory.h"
#include "../EngineLib/GlobalParam.h"
#include "../EngineLib/Common/profile.h"
#include "../EngineLib/DxTools/DebugSet.h"
#include "../EngineLib/PhysX/NSPhysX.h"

#include "../MfcExLib/BlockProg.h"

#include "../RanLogic/RANPARAM.h"
#include "../RanLogic/GLogicDataMan.h"

#include "../RanLogicClient/GfxInterfaceBase.h"
#include "../RanLogicClient/Char/NSGradeScriptMan.h"
#include "../RanLogicClient/Stage/DxGlobalStage.h"
#include "../RanLogicClient/NetWork/s_NetClient.h"
#include "../RanLogicClient/Stage/DxGlobalStage.h"
#include "../RanLogicClient/GLGaeaClient.h"
#include "../RanLogicClient/Command/dxincommand.h"
#include "../RanLogicClient/Tool/DxParamSet.h"
#include "../RanLogicClient/LoadingThread/LoadingThread.h"
#include "../RanLogicClient/LoadingThread/LoadingDirectClient.h"
#include "../RanLogicClient/Stage/DxGlobalStage.h"
#include "../RanLogicClient/Init/NSInitClientLua.h"

#include "../RanLogic/GLUseFeatures.h"

#include "../RanUI/InnerInterface.h"
#include "../RanUI/OldUI/Message/WaitServerDialogue.h"

#include "Basic.h"
#include "BasicWnd.h"

// ----------------------------------------------------------------------------
#include "../SigmaCore/DebugInclude.h"
// ----------------------------------------------------------------------------

#define NPGAMEMON_CHECK_ERROR	2000
#define NPGAMEMON_TIMER			1
#define NPGAMEMON_AUTH_TIMER	2
#define NPGAMEMON_AUTH12_TIMER	3

//extern CBLOCK_PROG	g_BLOCK_PROG;
extern HWND g_hWnd;

// �ܺο��� ������ ������ �����ϰ� �Ѵ�.
extern TSTRING g_strGameForceExit;

typedef std::queue<UINT> UINT_QUEUE;
UINT_QUEUE g_AuthMsgBuffer;

//#if defined(MY_PARAM) || defined(PH_PARAM) || defined(MYE_PARAM) //|| defined(_RELEASED) || defined ( VN_PARAM ) || defined(TH_PARAM) || defined ( HK_PARAM ) || defined(TW_PARAM) // Nprotect ����
BOOL CALLBACK NPGameMonCallback(DWORD dwMsg, DWORD dwArg)
{
	GLogicData::GetInstance().LoadCountryFile();
	EMSERVICE_PROVIDER sp = GLogicData::GetInstance().GetServiceProvider();

	if (sp == SP_PHILIPPINES || sp == SP_MALAYSIA || sp == SP_MALAYSIA_EN || sp == SP_EU ) // _NP30
	{
		std::string strMsg;
		LPCTSTR lpszMsg( NULL );
		bool bAppExit( false );
		static DWORD dwCharIDBack = 0;

		switch( dwMsg )
		{
        case NPGAMEMON_COMM_ERROR:
        case NPGAMEMON_COMM_CLOSE:
			//sc::writeLogDebug(std::string("_NP30 : NPGAMEMON_COMM_ERROR OR NPGAMEMON_COMM_CLOSE"));
            bAppExit = true;
            return false;
        case NPGAMEMON_INIT_ERROR:
            bAppExit = true; // Closing code
            strMsg = sc::string::format( ID2GAMEEXTEXT( "NPGAMEMON_INIT_ERROR" ), dwArg);
            lpszMsg = strMsg.c_str();
            break;
        case NPGAMEMON_SPEEDHACK:
            bAppExit = true; // termination code
            lpszMsg = ID2GAMEEXTEXT( "NPGAMEMON_SPEEDHACK" );
            break;
        case NPGAMEMON_GAMEHACK_KILLED:
            bAppExit = true; // termination code, close or proceed continuously
            lpszMsg = ID2GAMEEXTEXT( "NPGAMEMON_GAMEHACK_KILLED" );
            break;
        case NPGAMEMON_GAMEHACK_DETECT:
            bAppExit = true; // termination code
            lpszMsg = ID2GAMEEXTEXT( "NPGAMEMON_GAMEHACK_DETECT" );
            break;
        case NPGAMEMON_GAMEHACK_DOUBT:
            bAppExit = true; // termination code
            lpszMsg = ID2GAMEEXTEXT( "NPGAMEMON_GAMEHACK_DOUBT" );
            break;
        case NPGAMEMON_GAMEHACK_REPORT:
			// �������� �߰ߵǾ����� ���� �����մϴ�.
			lpszMsg = ID2GAMEEXTEXT( "NPGAMEMON_GAMEHACK_DETECT" );
            break;
        case NPGAMEMON_CHECK_CSAUTH2:
            {
				//sc::writeLogDebug(std::string("_NP30 : NPGAMEMON_CHECK_CSAUTH2"));

                CBasicWnd* pBaiscWnd = (CBasicWnd*)AfxGetApp()->GetMainWnd();
                DxGlobalStage* pGlobalStage = pBaiscWnd->GetGlobalStage();
				
                if (!pGlobalStage)
                    return false;

				// charid�� ����ɶ����� ID ����
				GLGaeaClient* pGaeaClient = pGlobalStage->GetGaeaClient();
				DWORD dwCHARID = pGaeaClient->GetCharacter()->m_CharDbNum;

				if ( dwCharIDBack != dwCHARID && dwCHARID != 0 )
				{
					CString strUserID;
					strUserID.Format( "CHAR_ID:%u", dwCHARID );
					pNpgl->Send( strUserID.GetString() );
				}	

			    if( g_AuthMsgBuffer.empty() )
                    break;
			    UINT AuthMsg = g_AuthMsgBuffer.front();
			    g_AuthMsgBuffer.pop();

                if( AuthMsg == NET_MSG_GAMEGUARD_AUTH )
                {
                    NET_GAMEGUARD_ANSWER NetMsg;
                    memmove( &NetMsg.ggad, (GG_AUTH_DATA*)dwArg, sizeof(GG_AUTH_DATA) );
                    
				    CNetClient* pNetClient = pGlobalStage->GetNetClient();
				    if (pNetClient && pNetClient->IsOnline())
				    {
					    const TCHAR* szEncrypt;
					    szEncrypt = pNetClient->DoEncryptKey();					
					    memcpy(NetMsg.szEnCrypt, szEncrypt, ENCRYPT_KEY+1);
				    }
				    pGlobalStage->NetSend(&NetMsg);
					//sc::writeLogDebug(std::string("_NP30 : NPGAMEMON_CHECK_CSAUTH2 : NET_MSG_GAMEGUARD_AUTH"));
			    }	
			    else if( AuthMsg == NET_MSG_GAMEGUARD_AUTH_1 )
			    {
				    NET_GAMEGUARD_ANSWER_1 NetMsg;
				    memmove(&NetMsg.ggad, (GG_AUTH_DATA*)dwArg, sizeof(GG_AUTH_DATA));
				    pGlobalStage->NetSend(&NetMsg);
                    //sc::writeLogDebug(std::string("_NP30 : NPGAMEMON_CHECK_CSAUTH2 : NET_MSG_GAMEGUARD_AUTH_1"));
			    }
			    else if( AuthMsg == NET_MSG_GAMEGUARD_AUTH_2 )
			    {
				    NET_GAMEGUARD_ANSWER_2 NetMsg;
				    memmove(&NetMsg.ggad, (GG_AUTH_DATA*)dwArg, sizeof(GG_AUTH_DATA));
				    pGlobalStage->NetSend(&NetMsg);
                    //sc::writeLogDebug(std::string("_NP30 : NPGAMEMON_CHECK_CSAUTH2 : NET_MSG_GAMEGUARD_AUTH_2"));
			    }
            }
            break;
#ifdef _NP30
		case NPGAMEMON_CHECK_CSAUTH3:
			{
				//sc::writeLogDebug(std::string("_NP30 : NPGAMEMON_CHECK_CSAUTH3"));

				PCSAuth3Data pCSAuth3 = (PCSAuth3Data)dwArg;

				if( pCSAuth3 )
				{
					DxGlobalStage* pGlobalStage = CBasicWnd::g_pGlobalStage;

					//sc::writeLogDebug(sc::string::format("_NP30 : NPGAMEMON_CHECK_CSAUTH3  - dwPacketSize : %1%, dwServerNumber : %2%, pCSAuth3->dwServerNumber %3%, m_dwNProtect30ServerNumber %4%", pCSAuth3->dwPacketSize, pCSAuth3->dwServerNumber, pCSAuth3->dwServerNumber, pGlobalStage->m_dwNProtect30ServerNumber));
				
					if (!pGlobalStage)
					{
						//sc::writeLogDebug(std::string("_NP30 : NPGAMEMON_CHECK_CSAUTH3 - !pGlobalStage"));
						return false;
					}
					// charid�� ����ɶ����� ID ����
					GLGaeaClient* pGaeaClient = pGlobalStage->GetGaeaClient();
					DWORD dwCHARID = pGaeaClient->GetCharacter()->m_CharDbNum;

					if ( dwCharIDBack != dwCHARID && dwCHARID != 0 )
					{
						CString strUserID;
						strUserID.Format( "CHAR_ID:%u", dwCHARID );
						pNpgl->Send( strUserID.GetString() );
						//sc::writeLogDebug(sc::string::format("NPGAMEMON_CHECK_CSAUTH3 CHANGE DB NUM - preDBNum : %1%, curDBNum : %2%", dwCharIDBack, dwCHARID));
					}	

					if( pCSAuth3->dwServerNumber == pGlobalStage->m_dwNProtect30ServerNumber )
					{
						for(int i = 0; i < 8; i++)
						{
							NET_GAMEGUARD_ANSWER NetMsg;
							NetMsg.packetSize = pCSAuth3->dwPacketSize;
							NetMsg.packetSeq = i+1;
							memcpy(NetMsg.packet, pCSAuth3->bPacket + (i*512), sizeof(BYTE)*512);

							pGlobalStage->NetSend(&NetMsg);

							//sc::writeLogDebug(sc::string::format("NPGAMEMON_CHECK_CSAUTH3 : NET_GAMEGUARD_ANSWER - dwPacketSize : %1%, Seq : %2%", pCSAuth3->dwPacketSize, i+1));
						}
						//sc::writeLogDebug(std::string("NPGAMEMON_CHECK_CSAUTH3 - SEND SUCCESS"));
					}
					else
					{
						//sc::writeLogDebug(sc::string::format("NPGAMEMON_CHECK_CSAUTH3 - pCSAuth3->dwServerNumber : %1%, m_dwNProtect30ServerNumber : %2%", pCSAuth3->dwServerNumber, pGlobalStage->m_dwNProtect30ServerNumber));
					}
				}
				else
				{
					//sc::writeLogDebug(std::string("_NP30 : NPGAMEMON_CHECK_CSAUTH3 : PCSAuth3Data ERROR (NULL)"));
				}
			}
			break;
#endif
		default:
			sc::writeLogError(sc::string::format("UNDEIFNED NPGameMonCallback MSG : %1%", dwMsg));
			break;
        }


	    if (bAppExit) // ���� ����ÿ��� false�� ����
	    {
            CBasicWnd* pBaiscWnd = (CBasicWnd*)AfxGetApp()->GetMainWnd();
            DxGlobalStage* pGlobalStage = pBaiscWnd->GetGlobalStage();
            if ( !pGlobalStage )
                return false;

			GLGaeaClient* pGaeaClient = pGlobalStage->GetGaeaClient();
			DWORD dwCHARID = pGaeaClient->GetCharacter()->m_CharDbNum;

			{ // Note : �������� �α� ���
				GLMSG::SNET_BLOCK_DETECTED NetMsg(dwMsg, dwCHARID, pNpgl->GetInfo());
				pGlobalStage->NetSend(&NetMsg);
			}

			{ // Note : NP������ �α� ���
				CString strUserID;
				strUserID.Format( "CHAR_ID:%u", dwCHARID );
				pNpgl->Send( strUserID.GetString() );
			}	

			// Note : ���α׷��� �����Ѵ�.
			//CInnerInterface::GetInstance().WAITSERVER_DIALOGUE_OPEN(ID2GAMEINTEXT("WAITSERVER_HACK_MESSAGE"), WAITSERVER_CLOSEGAME);
			pGlobalStage->CloseGame( lpszMsg );
			return false;
		}
	}

	return true;
}
//#endif

HRESULT CBasicWnd::ConfirmDevice ( D3DCAPSQ* pCaps, DWORD dwBehavior, D3DFORMAT Format )
{
	if ( dwBehavior & D3DCREATE_HARDWARE_VERTEXPROCESSING )
		return E_FAIL;

	return S_OK;
}

HRESULT CBasicWnd::Resize3DEnvironment()
{
	HRESULT hr = CD3DApplication::Resize3DEnvironment();
	if( FAILED( hr ) )
        return hr;

	if( m_pGlobalStage )
		m_pGlobalStage->ReSizeWindow(m_d3dpp.BackBufferWidth, m_d3dpp.BackBufferHeight);

	// [shhan][2015.06.15] ������ �޸𸮸� �����Ѵ�.
	//						ResetDevice �� �Ҹ���  ���� ��뵵 ���� �͵��� ������ �޸𸮿� �ö󰡼� �װ� �����ϵ��� �Ѵ�.
	HANDLE hProcess	= GetCurrentProcess();
	if (hProcess)
	{
		EmptyWorkingSet( hProcess );
	}

	return S_OK;
}

void CBasicWnd::OnSize(UINT nType, int cx, int cy) 
{
	CWnd::OnSize(nType, cx, cy);

	CRect rectWnd;
	GetClientRect ( &rectWnd );

	WORD wWidth = rectWnd.Width();
	WORD wHeight = rectWnd.Height();

	// �����ػ� �޾ƿ���.
	//
	if ( !RANPARAM::bScrWindowed && GetD3dDevice() )
	{
		LPDIRECT3DSURFACEQ pBackBuffer=NULL;
		GetD3dDevice()->GetBackBuffer ( 0, 0, D3DBACKBUFFER_TYPE_MONO, &pBackBuffer );

		if ( pBackBuffer )
		{
			pBackBuffer->GetDesc( &m_d3dsdBackBuffer );
			pBackBuffer->Release();

			wWidth = static_cast<WORD> ( m_d3dsdBackBuffer.Width );
			wHeight = static_cast<WORD> ( m_d3dsdBackBuffer.Height );
		}
	}

	// TODO: Add your message handler code here
	if ( m_bCreated )
		ReSizeWindow ( wWidth, wHeight );
}

HRESULT CBasicWnd::OneTimeSceneInit()
{
	HRESULT hr(S_OK);

	// [shhan][2015.06.19] �ִ� �絵 ���ΰ� ���� Page Fault �� �Ͼ�� ������ ����.
	//
	//// [shhan][2015.06.19] �� �̿��� �ٸ� ���μ������� ������ �޸𸮸� �ּ�ȭ �Ѵ�.
	////
	//HANDLE hProcess, hSnap;
	//hSnap = CreateToolhelp32Snapshot( TH32CS_SNAPPROCESS, 0 );
	//if ( hSnap != INVALID_HANDLE_VALUE )
	//{
	//	PROCESSENTRY32 pe32;
	//	pe32.dwSize = sizeof(PROCESSENTRY32);
	//	if ( Process32First( hSnap, &pe32 ) )
	//	{
	//		do 
	//		{
	//			hProcess = OpenProcess( PROCESS_ALL_ACCESS, FALSE, pe32.th32ProcessID );
	//			if ( hProcess )
	//			{
	//				EmptyWorkingSet( hProcess );
	//				CloseHandle( hProcess );
	//			}
	//		} while ( Process32Next( hSnap, &pe32 ) );
	//	}
	//	else
	//	{
	//		CloseHandle( hSnap );
	//	}
	//}

	CBasicApp *pFrame = (CBasicApp *) AfxGetApp();

    COMMON_WEB::Create( (CWnd*)this, TSTRING( pFrame->m_szAppPath ) );

	if ( !GLUseFeatures::GetInstance().LoadFile(GLogicData::GetInstance().GetUseFeaturesFileName(), m_pGlobalStage->GetSubPath(), FALSE))
	{
		//::MessageBox(NULL, "Usefeatures load error", "err", MB_OK|MB_ICONEXCLAMATION);
		sc::writeLogError("OneTimeSceneInit-Usefeatures load error");
	}

	// ���� ��ġ��.
	//
	hr = m_pEngineDevice->OneTimeSceneInit(
        pFrame->m_szAppPath,
        this,
		RANPARAM::strFontType,
        true,
        RENDERPARAM::emLangSet,
        RANPARAM::strGDIFont);

    if (FAILED(hr))
		return  E_FAIL;

	dxincommand::bDISP_CONSOLE = RANPARAM::bDISP_CONSOLE;
	dxincommand::bDISP_FPS = RANPARAM::bDISP_FPS;

	return S_OK;
}

#ifdef LOADING_TIME_CHECK
#include <boost/timer.hpp>
/*
                                              2011-08-16
    ---------------------------------------------------------------------------
    CBasicWnd Font                            0.024 0.024 sec
    CBasicWnd LoadingThread::Start           0     0.068 sec
    CBasicWnd InitDeviceObjects              67.402 68.216 sec
    CBasicWnd LoadingThread::End             0.011 68.227 sec
    CBasicWnd RestoreDeviceObjects            0.185 68.412 sec
*/
#endif

HRESULT CBasicWnd::CreateObjects()
{
#ifdef LOADING_TIME_CHECK
    boost::timer LoadingTotalTimer;
    LoadingTotalTimer.restart();

    boost::timer LoadingSectionTimer;
    LoadingSectionTimer.restart();
#endif

	{ // Note : �ε��� �ؽ�Ʈ�� ����ϱ� ���ؼ� ��Ʈ �κ��� �ʱ�ȭ.
		
		// ��Ʈ �޴��� �ʱ�ȭ.
		DxFontMan::GetInstance().InitDeviceObjects ( m_pd3dDevice );
		CD3DFontPar* pD3dFont9 = DxFontMan::GetInstance().LoadDxFont ( _DEFAULT_FONT, 9, _DEFAULT_FONT_FLAG );
		CD3DFontPar* pD3dFont8 = DxFontMan::GetInstance().LoadDxFont ( _DEFAULT_FONT, 8, D3DFONT_SHADOW|D3DFONT_ASCII );

		//	Note	:	����׼� ��� ���� �� �ʱ�ȭ
		CDebugSet::InitDeviceObjects( pD3dFont9 );
	}

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd Font %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

    CBasicApp* pApp = (CBasicApp *) AfxGetApp();

	m_pGlobalStage->SetD3DApp(this);

	HRESULT hr = m_pGlobalStage->OneTimeSceneInitPrev( pApp->m_szAppPath, m_hWndApp, FALSE, m_pd3dDevice );
    if( FAILED(hr) )
        return hr;

	// Ŭ���̾�Ʈ������ ������ �ȴ�.
	// ��� ������ ���� m_pGlobalStage->OneTimeSceneInitPrev �������� �ؾ� �Ѵ�.
	NSInitClientLua::LuaLoad();

    // ���� ��ġ��.
	//
	m_pEngineDevice->InitDeviceObjects(m_pd3dDevice, TRUE);

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd::InitDeviceObjects m_pEngineDevice->InitDeviceObjects %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

    LoadingDirectClient::s_pd3dDevice = m_pd3dDevice;
    LoadingDirectClient::s_hWnd = m_hWnd;
    LoadingDirectClient::s_pGaeaClient = m_pGlobalStage->GetGaeaClient();

	//	������ ��� ǥ��
    bool bOverGrade = false; 
//#if defined(_RELEASED) || defined ( KR_PARAM ) || defined ( KRT_PARAM ) 
    if (m_ServiceProvider == SP_OFFICE_TEST || m_ServiceProvider == SP_KOREA || m_ServiceProvider == SP_KOREA_TEST)
	    bOverGrade = true;
//#endif 

	if( true == NSWIDGET_SCRIPT::g_bWidgetDebug )
	{
		AllocConsole();
		SetConsoleTitle( "Ran Online Debugging Console" );
	}

	GfxInterfaceBase::GetInstance()->SetGaeaClient( m_pGlobalStage->GetGaeaClient() );
	GfxInterfaceBase::GetInstance()->StorePresentParameters( GetPresentParams() );
	GfxInterfaceBase::GetInstance()->SetFontLanguage( m_pGlobalStage->GetTextLanguage() );
	GfxInterfaceBase::GetInstance()->OnCreateDevice( m_hWnd, m_pd3dDevice );
	GfxInterfaceBase::GetInstance()->OnInitLoading();

	//GfxInterfaceBase::GetInstance()->SetLoadingData( NATIVEID_NULL(), NSInitClientLua::GetRandomLobbyLoadingImage(), bOverGrade );
	//GfxInterfaceBase::GetInstance()->OnBeginLoading( ELoadingSceneType::Intro );

	LoadingThread::SetData(
		CString( NSInitClientLua::GetRandomLobbyLoadingImage() ),
		NATIVEID_NULL(),
		true,
		bOverGrade,
		NSInitClientLua::GetLobbyLoadingImageFullSize() );

	//LoadingThread::SetData(
	//	CString("loading_000.dds"),
	//	NATIVEID_NULL(),
	//	true,
	//	bOverGrade );


    LoadingDirectClient sLodingDirect( FALSE );
    NSLoadingDirect::Set( &sLodingDirect, EM_LT_NORMAL );

	// [shhan][2015.02.03] Lobby Loading Image Refresh �� �ȵǴ� ������ �־ �߰��ߴ�.
	//						�� ������� ã���� ��������.
	//
	// [shhan][2015.04.15] LoadingDirectClient::FrameMoveRender ���� PeekMessage( &msg, s_hWnd, 0, 0, PM_REMOVE ); �� ��� �Ͽ�����
	//						���̵��� crash �� �߻��Ͽ���. 
	//						PM_QS_PAINT �� �����ϴ� ���������µ� ������ �� �𸣰ڴ�.
	//						�̰��� ������ ���� �� �־ PM_QS_PAINT �� �����Ͽ� ��.
	// 
	MSG msg;
	PeekMessage( &msg, NULL, 0, 0, PM_QS_PAINT );

    //---------------------------------------------------//
    NSLoadingDirect::FrameMoveRender( TRUE );
    //---------------------------------------------------//

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd LoadingThread::Start %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

	hr = InitDeviceObjects();

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd InitDeviceObjects %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

    //---------------------------------------------------//
    NSLoadingDirect::FrameMoveRender( FALSE );
    //---------------------------------------------------//

	if( FAILED(hr) )
		return hr;

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd LoadingThread::End %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

	hr = RestoreDeviceObjects();	
	if (FAILED(hr))
        return hr;

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd RestoreDeviceObjects %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

//#if defined(MY_PARAM) || defined(MYE_PARAM) || defined(PH_PARAM) //|| defined(_RELEASED) || defined ( VN_PARAM ) || defined(TH_PARAM) || defined ( HK_PARAM ) || defined(TW_PARAM) // Nprotect ����

	if (m_ServiceProvider == SP_MALAYSIA || m_ServiceProvider == SP_MALAYSIA_EN || m_ServiceProvider == SP_PHILIPPINES || m_ServiceProvider == SP_EU ) // _NP30
	{
		pNpgl->SetHwnd( m_hWnd );
		m_nGGTimer = SetTimer(NPGAMEMON_TIMER, 10000, 0);
#ifndef _NP30
		m_nGGATimer = SetTimer(NPGAMEMON_AUTH_TIMER, 60000, 0); 
		m_nGGA12Timer = SetTimer(NPGAMEMON_AUTH12_TIMER, 33, 0);
#else
		m_nGGATimer = SetTimer(NPGAMEMON_AUTH_TIMER, 333, 0);
#endif
        sc::writeLogInfo(std::string("nProtect Timer ON"));
	}
//#endif

	NSLoadingDirect::Reset();

	return hr;
}

#ifdef LOADING_TIME_CHECK
#include <boost/timer.hpp>
/*
                                 2011-08-16
    -------------------------------------------------------------------  
    CBasicWnd::InitDeviceObjects 0.001 0.001 sec
    CBasicWnd::InitDeviceObjects m_pEngineDevice->InitDeviceObjects 1.822 1.823 sec
    CBasicWnd::InitDeviceObjects DxLightMan::SetDefDirect 0 1.823 sec 
    CBasicWnd::InitDeviceObjects m_pGlobalStage->OneTimeSceneInit 16.361 18.184 sec
    CBasicWnd::InitDeviceObjects m_pGlobalStage->InitDeviceObjects 47.625 65.809 sec
    CBasicWnd::InitDeviceObjects CCursor 0.01 65.819 sec    
*/
#endif

HRESULT CBasicWnd::InitDeviceObjects()
{

#ifdef LOADING_TIME_CHECK
    boost::timer LoadingTotalTimer;
    LoadingTotalTimer.restart();

    boost::timer LoadingSectionTimer;
    LoadingSectionTimer.restart();
#endif

	CBasicApp* pApp = (CBasicApp *) AfxGetApp();

    //---------------------------------------------------//
    NSLoadingDirect::FrameMoveRender( FALSE );
    //---------------------------------------------------//

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd::InitDeviceObjects %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

	DXLIGHT sDirectional;
	sDirectional.SetDefault();
	sDirectional.m_Light.Diffuse = D3DXCOLOR(0,0,0,1);
	sDirectional.m_Light.Ambient = D3DXCOLOR(0,0,0,1);
	DxLightMan::SetDefDirect ( sDirectional );

    //---------------------------------------------------//
    NSLoadingDirect::FrameMoveRender( FALSE );
    //---------------------------------------------------//

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd::InitDeviceObjects DxLightMan::SetDefDirect %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

	// ���� ��������.
	//
	HRESULT hr = m_pGlobalStage->OneTimeSceneInitNext(m_wndSizeX, m_wndSizeY, NULL, false);
	if (FAILED(hr))
        return hr;

    //---------------------------------------------------//
    NSLoadingDirect::FrameMoveRender( FALSE );
    //---------------------------------------------------//

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd::InitDeviceObjects m_pGlobalStage->OneTimeSceneInit %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

	// ���� ��������.
	//
	hr = m_pGlobalStage->InitDeviceObjects(m_pd3dDevice);
	if (FAILED(hr))
        return hr;

    //---------------------------------------------------//
    NSLoadingDirect::FrameMoveRender( FALSE );
    //---------------------------------------------------//

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd::InitDeviceObjects m_pGlobalStage->InitDeviceObjects %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

	// [shhan][2015.01.12] Texture Thread Loading �� �ϱ� ������, ���� VB, IB ���� �� �ʿ�� ����.
	//						���� Thread �󿡼� VB, IB, ���� Lock �ϴ� �͵� ���輺�� �ִ�.
	// Note : DynamicLoad�� ����� ���� ���Ѵ�.
	//NSOCTREE::EnableDynamicLoad();

	// Ŀ�� �ʱ�ȭ.
	const SUBPATH* pPath = pApp->GetSubPath();
	char szFullPath[MAX_PATH] = {0};
	StringCchCopy ( szFullPath, MAX_PATH, pApp->m_szAppPath );
	StringCchCat ( szFullPath, MAX_PATH, pPath->ObjFileEdit().c_str()); //SUBPATH::OBJ_FILE_EDIT );

	CCursor::GetInstance().SetGameCursor ( RANPARAM::bGameCursor );
	CCursor::GetInstance().OneTimeSceneInit(szFullPath,m_hWnd);
	CCursor::GetInstance().InitDeviceObjects ();

    // Loading Script
    NSGradeScriptMan::LoadScript( pApp->GetSubPath() );

    //---------------------------------------------------//
    NSLoadingDirect::FrameMoveRender( FALSE );
    //---------------------------------------------------//

#ifdef LOADING_TIME_CHECK
    sc::writeLogInfo(sc::string::format("Loading CBasicWnd::InitDeviceObjects CCursor %1% %2% sec", LoadingSectionTimer.elapsed(), LoadingTotalTimer.elapsed()));
    LoadingSectionTimer.restart();
#endif

    return S_OK;
}

HRESULT CBasicWnd::RestoreDeviceObjects()
{
	HRESULT hr=S_OK;

	RENDERPARAM::CheckSystemInfo( m_pD3D, m_pd3dDevice );

	// ���� ��ġ��.
	//
	m_pEngineDevice->RestoreDeviceObjects();

	// ���� ��������.
	//
	m_pGlobalStage->RestoreDeviceObjects();

	// �۷ο� ó���� �ϱ����� ��� �Ѵ�.
	DxGlowMan::GetInstance().SetProjectActiveON();
	DxPostProcess::GetInstance().SetProjectActiveON();

	DXPARAMSET::INIT ();
	
	//	DEBUG : �������ϸ� �ʱ�ȭ.
	PROFILE_INIT();
	PROFILE_INIT2();

	return S_OK;
}

HRESULT CBasicWnd::FrameMove3DEnvironment ()
{
	if ( m_bCreated )
	{
		if ( FAILED( CD3DApplication::FrameMove3DEnvironment () ) )
            return E_FAIL;
	}

	PROFILE_BLOCKEND();
	PROFILE_DUMPOUTPUT();

	return S_OK;
}

HRESULT CBasicWnd::Render3DEnvironment ()
{
	if ( m_bCreated )
	{
		if ( FAILED( CD3DApplication::Render3DEnvironment () ) )
            return E_FAIL;

		if ( !g_strGameForceExit.empty() )
		{
			CDebugSet::ToFile( "Ran_ERROR.txt", g_strGameForceExit.c_str() );
			//CDebugSet::ToFile( "version_error.txt", "" );
			//CDebugSet::ToFile( "version_error.txt", _T("Please download the latest patch") );

			CString strPROCESS;
			strPROCESS.Format ( "notepad %s", "Ran_ERROR.txt" );

			STARTUPINFO si;
			memset ( &si, 0, sizeof ( STARTUPINFO ) );
			si.cb = sizeof ( STARTUPINFO );
			si.dwFlags = 0;

			PROCESS_INFORMATION pi;
			pi.hProcess = NULL;
			pi.hThread = NULL;
			CreateProcess ( NULL, strPROCESS.GetBuffer(), NULL, NULL, FALSE, 0, NULL, CDebugSet::GetPath(), &si, &pi );
			CloseHandle( pi.hProcess );
			CloseHandle( pi.hThread );
			strPROCESS.ReleaseBuffer();

			PostNcDestroy();

			return E_FAIL;
		}
	}

	return S_OK;
}

HRESULT CBasicWnd::FrameMove( BOOL bNotRendering )
{
	// [2016.09.23] �ּ�ȭ�� �� ��� �޸𸮰� ��� �����ϴ� ������ �־, Message ó���� �ϰ� �������� ���� �ʴ´�.
	if ( bNotRendering )
	{
		m_pGlobalStage->MsgProcessFrame();
		return S_OK;
	}

	// Hide dead player bodies ON / OFF
	if ( DxInputDevice::GetInstance().GetKeyState(DIK_F9)&DXKEY_UP )
	{
		RENDERPARAM::g_bHideDeadBodies = !RENDERPARAM::g_bHideDeadBodies;
	}

	// ���� ������� ON / OFF
	if ( DxInputDevice::GetInstance().GetKeyState(DIK_F11)&DXKEY_UP )
	{
		RENDERPARAM::g_bForceLowHardwareMode = !RENDERPARAM::g_bForceLowHardwareMode;
		RENDERPARAM::CheckTnLMode();
	}

	// GPU ������
	m_dwDelayGPU = timeGetTime() - m_dwTimeGetTimePrev;

	PROFILE_BLOCKSTART();

	PROFILE_BEGIN("FrameMove");

	//if ( g_BLOCK_PROG.IsDETECT() )
	//{
	//	if ( m_pGlobalStage->GetActiveStage() == m_pGlobalStage->GetGameStage() )
	//	{
	//      GLGaeaClient* pGaeaClient = m_pGlobalStage->GetGaeaClient();
    //		DWORD dwCHARID = pGaeaClient->GetCharacter()->m_dwCharID;

	//		CBLOCK_PROG::SDETECT sDETECT;
	//		do
	//		{
	//			sDETECT = g_BLOCK_PROG.NextDETECT();
	//			if ( sDETECT.dwID==0 )	break;

	//			GLMSG::SNET_BLOCK_DETECTED NetMsg;
	//			NetMsg.dwDETECTED = sDETECT.dwID;
	//			NetMsg.dwCHARID = dwCHARID;
	//			StringCchCopy(NetMsg.szINFO,GLMSG::SNET_BLOCK_DETECTED::MAX_INFO,sDETECT.szINFO);
	//			m_pGlobalStage->NetSend ( (NET_MSG_GENERIC*)&NetMsg );

	//			//CDebugSet::ToListView ( "detect process : %d, %s", sDETECT.dwID, sDETECT.szINFO );

	//			// ���α׷��� �����Ѵ�.
	//			CInnerInterface::GetInstance().WAITSERVER_DIALOGUE_OPEN(ID2GAMEINTEXT("WAITSERVER_HACK_MESSAGE"), WAITSERVER_CLOSEGAME);
	//		}
	//		while ( sDETECT.dwID!=0 );
	//	}
	//}

	DxFogMan::GetInstance().FrameMove();

	// [shhan][2015.06.25]
	//
	// bNotRendering �� TRUE ��� window �ּ�ȭ ���¶� ����. �װ� Sleep(1000) �� �Ǿ� ����.
	//
	// ȭ���� ���� �� ���¸� !bNotRendering ��.
	// EMFR_OFF ��� bNotRendering �� ��������. ���� FrameMove ���� �ʿ���� �۾��� �� �ʿ䰡 ����.
	// EMFR_OFF �� �ɼǿ��� ������ ���� �ְ�, ���λ����� ���� �ӽ÷� ���� �� ���� �ִ�.
	// â�� �ڷΰ��� 5fps ���Ϸ� ����. �׷��� ������ fps �� �ö󰡰� �׷����� cps �������� �������� �ʴ´�.
	if ( !bNotRendering )
	{
		bNotRendering = DxFogMan::GetInstance().GetFogRange() == EMFR_OFF ? TRUE : FALSE;

		// �������� �ȵȴٰ� ���Դ�.
		if ( bNotRendering )
		{
			// �ڿ� �� �ִٸ�...
			if ( !m_bForegroundWindow )
			{
				// 5fps ���Ϸ� ���۵ǵ��� �Ѵ�.
				Sleep( 200 );
			}
		}
	}

	// Rendering �� ���� �ʴ� �����̶�� 30�п� �ѹ��� ������ �޸𸮸� �����ϵ��� �Ѵ�.
	if ( bNotRendering )
	{
		m_fEmptyWorkingSetTime += m_fElapsedTime;

		if ( m_fEmptyWorkingSetTime > 30 * 60 )		// 30��
		{
			// [shhan][2015.06.15] ������ �޸𸮸� �����Ѵ�.
			HANDLE hProcess	= GetCurrentProcess();
			if (hProcess)
			{
				EmptyWorkingSet( hProcess );
			}

			m_fEmptyWorkingSetTime = 0.f;
		}
	}

	// ����Ʈ
	//
	DxViewPort::GetInstance().FrameMove ( m_fTime, m_fElapsedTime );

	// ���� ��ġ��
	m_pEngineDevice->FrameMoveFirst(m_fTime, m_fElapsedTime);

	// ���� ��������.
	//
	m_pGlobalStage->FrameMove(m_fTime, m_fElapsedTime, bNotRendering);

	// ���� ��ġ��
	m_pEngineDevice->FrameMoveSecond(m_fTime, m_fElapsedTime, m_bDefWin, TRUE);

    // Ű���� �������� RenderState �����غ��� ����ϴ� �ڵ�
	GLOBAL_PARAM::ChangeState( &DxInputDevice::GetInstance() );

    // �������� �׽�Ʈ�� �ڵ�
	//COMMON_WEB::TestVisible( &DxInputDevice::GetInstance(), WORD( m_wndSizeX ), WORD( m_wndSizeY ) );

    // 10�ʿ� �ѹ� WPE Pro ���� �������Ͽ� ��û�ϴ��� �˻�
	if (m_ServiceProvider != SP_OFFICE_TEST )
	{ // �系 �׽�Ʈ ����(���� ����)�� ��� ��Ȱ�� �׽�Ʈ�� ���� �н� �Ѵ�;
		CheckPacketSniffer(m_fElapsedTime);
	}

	PROFILE_BLOCKEND();
	PROFILE_DUMPOUTPUT();

	// Ǯ��ũ��/â��� ��ȯ.
	DWORD dwL_ALT = DxInputDevice::GetInstance().GetKeyState ( DIK_LMENU );
	DWORD dwR_ALT = DxInputDevice::GetInstance().GetKeyState ( DIK_RMENU );
	DWORD dwRETURN = DxInputDevice::GetInstance().GetKeyState ( DIK_RETURN );
	if ( (dwL_ALT&DXKEY_PRESSED || dwR_ALT&DXKEY_PRESSED ) && (dwRETURN&DXKEY_UP) )	
	{
		if ( SUCCEEDED( ToggleFullscreen() ) )
		{
			RANPARAM::bScrWindowed = !RANPARAM::bScrWindowed;
			DXPARAMSET::GetInstance().m_bScrWindowed = !DXPARAMSET::GetInstance().m_bScrWindowed;
		}
	}

	//////////////////////////////////////////////////////////////////////////
	// NSSkinAniThread
	// TAG_ProcessAnimationThread_3
	// ��� ������ COMPLETE_DATA �� �� ���� ��ٸ����� �Ѵ�.
	NSSkinAniThread::Wait_CompleteSkinAniControl( m_fElapsedTime, bNotRendering );

	// NSEffectThread ���
	NSEffectThread::Wait_FrameMove( m_pd3dDevice, m_fElapsedTime, bNotRendering );

	PROFILE_END("FrameMove");

	return S_OK;
}

HRESULT CBasicWnd::Render()
{
	if ( !m_pd3dDevice )
        return S_FALSE;

	HRESULT hr(S_OK);

	PROFILE_BLOCKSTART2();

	PROFILE_BEGIN2("Render");

	if (true == NSLoadingDirect::IsEnable())
	{
		//---------------------------------------------------//
		NSLoadingDirect::FrameMoveRender( TRUE );
		//---------------------------------------------------//

		return hr;
	}

	//	Fog ����
	D3DCOLOR colorClear = D3DCOLOR_XRGB(89,135,179);
	DxFogMan::GetInstance().RenderFogSB ( m_pd3dDevice, FALSE );
	colorClear = DxFogMan::GetInstance().GetFogColor();

	// Begin the scene
	if( SUCCEEDED(hr=m_pd3dDevice->BeginScene()) )
	{
//		// Glow 
//		DxGlowMan::GetInstance().RenderTex ( m_pd3dDevice );
		// Light ����.
		//
		DxLightMan::GetInstance()->Render ( m_pd3dDevice, FALSE, m_pGlobalStage->GetUsedMaterialSystem() );

		// ���ؽ� ���̴� �ܽ�źƮ ����.
		//
		DXLIGHT &Light = *DxLightMan::GetInstance()->GetDirectLight ();
		m_pd3dDevice->SetVertexShaderConstantF ( VSC_LIGHTDIRECT, (float*)&Light.m_Light.Direction, 1 );
		m_pd3dDevice->SetVertexShaderConstantF ( VSC_LIGHTDIFFUSE, (float*)&Light.m_Light.Diffuse, 1 );
		m_pd3dDevice->SetVertexShaderConstantF ( VSC_LIGHTAMBIENT, (float*)&Light.m_Light.Ambient, 1 );

		D3DXVECTOR3 &vFromPt = DxViewPort::GetInstance().GetFromPt ();
		m_pd3dDevice->SetVertexShaderConstantF ( VSC_CAMERAPOSITION, (float*)&vFromPt, 1 );

		// ����Ʈ ����Ʈ VertexShaderConstant
		//
		D3DLIGHTQ	pLight;
		D3DXVECTOR4	vPointPos;
		D3DXVECTOR3	vPointDiff;
		for ( int i=0; i<7; i++ )
		{
			if ( DxLightMan::GetInstance()->GetClosedLight(i+1) )
			{
				pLight = DxLightMan::GetInstance()->GetClosedLight(i+1)->m_Light;
				vPointDiff = D3DXVECTOR3 ( pLight.Diffuse.r, pLight.Diffuse.g, pLight.Diffuse.b );
				vPointPos.x = pLight.Position.x;
				vPointPos.y = pLight.Position.y;
				vPointPos.z = pLight.Position.z;
				vPointPos.w = pLight.Range;
			}
			else
			{
				vPointPos = D3DXVECTOR4 ( 0.f, 0.f, 0.f, 0.1f );
				vPointDiff = D3DXVECTOR3 ( 0.f, 0.f, 0.f );
			}
			m_pd3dDevice->SetVertexShaderConstantF (i*2+VSC_PLIGHTPOS01, (float*)&vPointPos, 1);
			m_pd3dDevice->SetVertexShaderConstantF (i*2+VSC_PLIGHTDIFF01, (float*)&vPointDiff, 1);
		}

		D3DXMATRIX matView = DxViewPort::GetInstance().GetMatView();
		D3DXMATRIX matProj = DxViewPort::GetInstance().GetMatProj();

		m_pd3dDevice->SetVertexShaderConstantF ( VSC_SKIN_DEFAULT, (float*)&D3DXVECTOR4 (1.f, 0.5f, 0.f, 765.01f), 1 );

		D3DXVECTOR3	vLightVector = DxLightMan::GetInstance()->GetDirectLight()->m_Light.Direction;
		D3DXVec3TransformNormal ( &vLightVector, &vLightVector, &matView );
		D3DXVec3Normalize ( &vLightVector, &vLightVector);
		vLightVector = -vLightVector;
		m_pd3dDevice->SetVertexShaderConstantF ( VSC_LIGHTDIRECT_VIEW, (float*)&vLightVector, 1 );

		D3DXMatrixTranspose( &matView, &matView );
		D3DXMatrixTranspose( &matProj, &matProj );

		D3DXMATRIX matIdentity;
		D3DXMatrixIdentity( &matIdentity );
		m_pd3dDevice->SetTransform( D3DTS_WORLD,  &matIdentity );

		m_pd3dDevice->SetTextureStageState( 0, D3DTSS_COLOROP,	D3DTOP_MODULATE );		// ���� ����

		// PhysX �������� ����
		NSPhysX::Render( m_fElapsedTime );

		//m_pd3dDevice->SetRenderState( D3DRS_MULTISAMPLEANTIALIAS, TRUE );

		// ���� ��������.
		//
		PROFILE_BEGIN2("Render_DxGlobalStage");
		m_pGlobalStage->Render( colorClear );
		PROFILE_END2("Render_DxGlobalStage");

		//m_pd3dDevice->SetRenderState( D3DRS_MULTISAMPLEANTIALIAS, FALSE );

        // �� ������ ������
		COMMON_WEB::Render();

		//// Cursor
		//DxCursor::GetInstance().Render( m_pd3dDevice );

		//NSCHARSG::Render( m_pd3dDevice );

		// Ŀ�� �׸���.
		//
		CCursor::GetInstance().Render ( m_pd3dDevice, DxInputDevice::GetInstance().GetMouseLocateX(), DxInputDevice::GetInstance().GetMouseLocateY() );

		PROFILE_END2("Render");
		PROFILE_BLOCKEND2();
		PROFILE_DUMPOUTPUT2();

		RenderText();

		m_dwTimeGetTimePrev = timeGetTime();

		// End the scene.
		m_pd3dDevice->EndScene();

		return S_OK;
	}
	else
	{
		m_dwTimeGetTimePrev = timeGetTime();

		//	BeginScene() �� �����ϴ� ���� EndScene() �� ȣ����� �ʾƼ� ����� �����̴�.
		//CDebugSet::ToLogFile ( "BeginScene() fail %d", hr );
		m_pd3dDevice->EndScene();
	}

	PROFILE_END2("Render");
	PROFILE_BLOCKEND2();
	PROFILE_DUMPOUTPUT2();

	return S_OK;
}

HRESULT CBasicWnd::RenderText()
{
	CD3DFontPar* pD3dFont = DxFontMan::GetInstance().LoadDxFont ( _DEFAULT_FONT, 14, D3DFONT_SHADOW|D3DFONT_ASCII );
	if ( !pD3dFont )
        return S_OK;

    CTextUtil::Get()->Render( TRUE );

	if (dxincommand::bDISP_FPS)
	{
        D3DCOLOR fontColor = D3DCOLOR_ARGB(255,255,255,255);
		FLOAT fNextLine = 0.0f; 
        TCHAR szMsg[MAX_PATH] = TEXT("");

		StringCchCopy( szMsg, MAX_PATH, m_strFrameStats );
		TSTRINGSTREAM ssName;
		ssName << szMsg;
		ssName << ", GPU Delay : ";
		ssName << m_dwDelayGPU;

		//StringCchCopy( szMsg, MAX_PATH, m_strFrameStats );
		//pD3dFont->DrawText( 2, fNextLine, fontColor, szMsg );
		pD3dFont->DrawText( 2, fNextLine, fontColor, ssName.str().c_str() );
		fNextLine += 20.0f;

		StringCchCopy ( szMsg, MAX_PATH, m_strDeviceStats );
		pD3dFont->DrawText( 2, fNextLine, fontColor, szMsg );
		fNextLine += 20.0f;

#ifdef _RELEASED
		NSLoadingLagTester::Display( pD3dFont, fNextLine );
		//TextureMemory::Display( pD3dFont, m_pd3dDevice );
#endif
	}

	if (dxincommand::bDISP_CONSOLE)
		CDebugSet::Render ();

    GLOBAL_PARAM::StateDisplay( pD3dFont );

    CTextUtil::Get()->Render( FALSE );

    return S_OK;
}

HRESULT CBasicWnd::InvalidateDeviceObjects()
{
    if( m_pGlobalStage )
		m_pGlobalStage->InvalidateDeviceObjects();

	if( m_pEngineDevice )
		m_pEngineDevice->InvalidateDeviceObjects ();

	return S_OK;
}

HRESULT CBasicWnd::DeleteDeviceObjects()
{
    if( m_pGlobalStage )
		m_pGlobalStage->DeleteDeviceObjects();

	if( m_pEngineDevice )
		m_pEngineDevice->DeleteDeviceObjects();

	// ���콺 Ŀ��.
	CCursor::GetInstance().DeleteDeviceObjects ();

	return S_OK;
}

HRESULT CBasicWnd::FinalCleanup()
{
	if( m_pGlobalStage )
		m_pGlobalStage->FinalCleanup();

	if( m_pEngineDevice )
		m_pEngineDevice->FinalCleanup();

	return S_OK;
}

void CBasicWnd::OnSysCommand(UINT nID, LPARAM lParam)
{
	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰� ��/�Ǵ� �⺻���� ȣ���մϴ�.
	if(nID==SC_KEYMENU)	return;

	__super::OnSysCommand(nID, lParam);
}

BOOL CBasicWnd::OnWndMsg(UINT message, WPARAM wParam, LPARAM lParam, LRESULT* pResult)
{
	// TODO: ���⿡ Ư��ȭ�� �ڵ带 �߰� ��/�Ǵ� �⺻ Ŭ������ ȣ���մϴ�.
	MSG msg;
	msg.hwnd = m_hWnd;
	msg.message = message;
	msg.wParam = wParam;
	msg.lParam = lParam;

	if( m_pGlobalStage )
	{
		if( false == m_pGlobalStage->MsgProc( &msg ) )
			return TRUE;
	}

	if( message == WM_SYSKEYDOWN && wParam == VK_F4 )
		return TRUE;

	return __super::OnWndMsg(message, wParam, lParam, pResult);
}


void CBasicWnd::OnGetMinMaxInfo(MINMAXINFO* lpMMI)
{
	// ������ ��峪 Ǯ��ũ�� ����϶� �ּ� �ػ�(����������)�� 800*600���� ����
	// ���� ������ ����϶��� ���� Ŭ���̾�Ʈ�� ũ��� 800*600���� ���� �� �ִ�.
	lpMMI->ptMinTrackSize.x = 800;
	lpMMI->ptMinTrackSize.y = 600;
	//if( RANPARAM::dwScrWidth < 1024 || RANPARAM::dwScrHeight < 768 )
	//{
	//	lpMMI->ptMinTrackSize.x = RANPARAM::dwScrWidth;
	//	lpMMI->ptMinTrackSize.y = RANPARAM::dwScrHeight;		
	//}
	//else
	//{
	//	lpMMI->ptMinTrackSize.x = 1032;
	//	lpMMI->ptMinTrackSize.y = 802;
	//}
	__super::OnGetMinMaxInfo(lpMMI);
}

BOOL CBasicWnd::OnNcActivate(BOOL bActive)
{
	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰� ��/�Ǵ� �⺻���� ȣ���մϴ�.
	DxInputDevice::GetInstance().OnActivate ( bActive );
	// ���� ������ ����
	DxBgmSound::GetInstance().SetActivate ( bActive );

	return __super::OnNcActivate(bActive);
}

void CBasicWnd::OnTimer(UINT nIDEvent)
{
#ifndef NO_GAMEGARD
//#if defined(MY_PARAM) || defined(MYE_PARAM) || defined(PH_PARAM) //|| defined(_RELEASED) || defined ( VN_PARAM ) || defined(TH_PARAM) || defined ( HK_PARAM ) || defined(TW_PARAM) // Nprotect ����
	if (m_ServiceProvider == SP_MALAYSIA || m_ServiceProvider == SP_MALAYSIA_EN || m_ServiceProvider == SP_PHILIPPINES|| m_ServiceProvider == SP_EU ) // _NP30
	{
		switch( nIDEvent )
		{
        case NPGAMEMON_TIMER:
            {
			    DWORD dwResult = pNpgl->Check();

			    if (dwResult != NPGAMEMON_SUCCESS)
			    {
                    sc::writeLogError(
                        sc::string::format(
                            "NPGAMEMON_TIMER %1%", dwResult));

                    GLGaeaClient* pGaeaClient = m_pGlobalStage->GetGaeaClient();
				    DWORD dwCHARID = pGaeaClient->GetCharacter()->m_CharDbNum;

					{ // Note : �������� �α� ���
						GLMSG::SNET_BLOCK_DETECTED NetMsg(
                            NPGAMEMON_CHECK_ERROR,
						    dwCHARID,
                            pNpgl->GetInfo());
						m_pGlobalStage->NetSend(&NetMsg);

						sc::writeLogError(sc::string::format("nProtect Check ERROR. ID : %1%, Info : %2%", dwCHARID, pNpgl->GetInfo()));
					}

					{ // Note : NP������ �α� ���
						CString strUserID;
						strUserID.Format( "CHAR_ID:%u", dwCHARID );
						pNpgl->Send( strUserID.GetString() );
					}

					TCHAR msg[128]={0};
					sprintf_s( msg, 128, "GameGuard check error." );

					// Note : ���α׷��� �����Ѵ�.
					m_pGlobalStage->CloseGame(msg);
				}
			}
			break;

	    case NPGAMEMON_AUTH_TIMER:
		    {            
#ifndef _NP30
			    GG_AUTH_DATA gad;
			    UINT AuthMsg = m_pGlobalStage->GetGGAuthData(&gad);
			    if (AuthMsg)
			    {
				    g_AuthMsgBuffer.push( AuthMsg );
				    pNpgl->Auth2( &gad );
			    }
#else
			    AUTH_DATA gad;
			    UINT AuthMsg = m_pGlobalStage->GetGGAuth30Data(&gad);
			    if (AuthMsg)
			    {                    
				    //g_AuthMsgBuffer.push( AuthMsg );
					DWORD nRet = pNpgl->Auth3(gad.packet, gad.packetSize, m_pGlobalStage->m_dwNProtect30ServerNumber);
					//sc::writeLogDebug(sc::string::format("NPGAMEMON_AUTH_TIMER OK - Auth3 Ret %1%, recvSize %2%, Msg Type %3%, m_dwNProtect30ServerNumber %4%", nRet, gad.packetSize, AuthMsg, m_pGlobalStage->m_dwNProtect30ServerNumber));
			    }
#endif
                // Note : ���� m_bGameGuardAuth = false�� nProtect ���� ������ ���� �ʴ´�.(��Ȯ�� ������ ��.)
                /*else
                {
                    sc::writeLogError(sc::string::format("NPGAMEMON_AUTH_TIMER GetGGAuthData failed %1%", AuthMsg));
                }*/
		    }
		    break;

	    case NPGAMEMON_AUTH12_TIMER:
		    {
#ifndef _NP30
			    GG_AUTH_DATA gad;
			    UINT AuthMsg = m_pGlobalStage->GetGGAuthData(&gad);
			    if (AuthMsg)
			    {
				    g_AuthMsgBuffer.push(AuthMsg);
				    pNpgl->Auth2(&gad);
			    }
#else
			    AUTH_DATA gad;
			    UINT AuthMsg = m_pGlobalStage->GetGGAuth30Data(&gad);
			    if (AuthMsg)
			    {
					sc::writeLogInfo(sc::string::format("NPGAMEMON_AUTH12_TIMER OK - m_dwNProtect30ServerNumber %1%", m_pGlobalStage->m_dwNProtect30ServerNumber));
				    //g_AuthMsgBuffer.push(AuthMsg);
					pNpgl->Auth3(gad.packet, gad.packetSize, m_pGlobalStage->m_dwNProtect30ServerNumber);
			    }
				else
                {
                    sc::writeLogError(sc::string::format("NPGAMEMON_AUTH12_TIMER GetGGAuthData failed %1%", AuthMsg));
                }
#endif
                // Note : ���� m_bGameGuardAuth = false�� nProtect ���� ������ ���� �ʴ´�.(��Ȯ�� ������ ��.)
                /*else
                {
                    sc::writeLogError(sc::string::format("NPGAMEMON_AUTH12_TIMER GetGGAuthData failed %1%", AuthMsg));
                }*/
		    }
            break;
        }
//#endif
	}
#endif
	__super::OnTimer(nIDEvent);
}

HRESULT CBasicWnd::ReSizeWindow ( int cx, int cy )
{
	if ( cx < 10 )	cx = 10;
	if ( cy < 10 )	cy = 10;

	// [shhan][2016.09.08] ���� ȭ�� ���⸦ ���� ���, CBasicWnd::OnActivate �Լ��� ȣ���� �ȵǼ�, SetActive �� FALSE �� �Ǵ� ������ �־ ������.
	if ( cx == 10 && cy == 10 )
	{
		m_pApp->SetActive ( FALSE );
	}

	// [shhan][2016.09.21] Ư����ǻ�Ϳ��� �ټ��� Ŭ���̾�Ʈ�� ����ϸ�, �ε�ȭ�鿡�� ����¡ �ɸ��� ������ �־ ������.
	//						���ٸ� Resize3DEnvironment �� ���� �ʿ䰡 ����.
	//						���� ���Ե� ������ ���� �� Resize3DEnvironment �� �� ���ִ� ����¡�� �Ȱɸ�.
	if ( m_d3dpp.BackBufferWidth == cx && m_d3dpp.BackBufferHeight == cy )
		return S_OK;

	m_d3dpp.BackBufferWidth  = cx;
	m_d3dpp.BackBufferHeight = cy;

	return Resize3DEnvironment();
}

void CBasicWnd::OnActivate(UINT nState, CWnd* pWndOther, BOOL bMinimized)
{
	__super::OnActivate(nState, pWndOther, bMinimized);

	// TODO: ���⿡ �޽��� ó���� �ڵ带 �߰��մϴ�.
	// ������ ����
	m_pApp->SetActive ( !bMinimized );
}
