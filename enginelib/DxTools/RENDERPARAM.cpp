#include "pch.h"
#include "../../SigmaCore/Encrypt/CompByte.h"
#include "../../SigmaCore/String/StringUtils.h"
#include "../../SigmaCore/File/StringFile.h"

#include "DebugSet.h"
#include "../Common/SUBPATH.h"
#include "DxFontMan.h"
#include "./DxSurfaceTex.h"
#include "./DxShadowMap.h"
#include "DxPostProcess.h"

#include <map>
#include <string>
#include <algorithm>
#include "../DxEffect/Frame/DxEffectMan.h"
#include "../Common/StlFunctions.h"
#include "../Common/gltexfile.h"

#include "RENDERPARAM.h"

// ----------------------------------------------------------------------------
#include "../../SigmaCore/DebugInclude.h"
// ----------------------------------------------------------------------------

namespace RENDERPARAM
{
	std::string			strRootPath			= "";
	std::string			strParamFile		= "";

	LPDIRECT3DDEVICEQ	g_pd3dDevice(NULL);

	EMCHARRENDER_TYPE	emCharRenderTYPE	= EMCRT_NORMAL;

	// Note: Brightness
	float	fGamma			= 1.f;
	DWORD	dwOverBright	= 1;
	float	fContrast		= 1.f;

	// Note: Device information
	BOOL		m_bUseMIXED = FALSE;
	BOOL		g_bPixelShader_1_1 = FALSE;
	BOOL		g_bPixelShader_1_4 = FALSE;
	BOOL		g_bPixelShader_2 = FALSE;
	BOOL		g_bPixelShader_3 = FALSE;
	BOOL		g_bDefferedRendering = FALSE;		// If set to TRUE, basic Deferred rendering can be enabled.
												// D3DFMT_A16B16G16R16F must be met.
												// e.g. if ( d3dCaps.PrimitiveMiscCaps & D3DPMISCCAPS_MRTINDEPENDENTBITDEPTHS &&
													//			d3dCaps.PrimitiveMiscCaps & D3DPMISCCAPS_MRTPOSTPIXELSHADERBLENDING )

	BOOL		g_bDefferedRendering_HIGH = FALSE;	// If set to TRUE, HIGH and VeryHigh can be enabled.
												// D3DFMT_A16B16G16R16 must be met.

	BOOL		g_bDefferedRendering_INTZ = FALSE;	// Direct DepthBuffer Access, Deferred mode
	BOOL		g_bDefferedRendering_DF16 = FALSE;	// Direct DepthBuffer Access, Deferred mode
	//BOOL		g_bDefferedRendering_RAWZ = FALSE;	// Do not use this.

	BOOL		g_bSurfaceG32R32F = FALSE;			// Does this Surface exist?
												// If true, VeryHigh can be enabled.

	BOOL		g_bEnableHW_HDR = FALSE;			// HDR	// Is hardware supported?
	BOOL		g_bEnable_HDR = FALSE;				// HDR 
	BOOL		g_bSeparateAlphaBlend = FALSE;
	TnL_MODE	g_emTnLMode = TnL_FIXED;

	BOOL		g_bForceLowHardwareMode = FALSE;	// Low hardware mode activation ON / OFF
	BOOL		g_bHideDeadBodies = FALSE;			// Hide dead player character bodies ON / OFF

	TEXTURE_FILTERING	g_emTextureFiltering = TEXTURE_FILTER_ANISOTROPIC_16X;

	// Option is changed but not applied immediately; will be applied during the next map move.
	BOOL				g_bChangeTexQuality = FALSE;							// Code to check whether the option was changed
	TEXTURE_QUALITY		g_emTextureQuality_NEW = TEXTURE_QUALITY_HIGH;		// Stores the newly selected option. (Applied to g_emTextureQuality after loading is complete.)
	TEXTURE_QUALITY		g_emTextureQuality = TEXTURE_QUALITY_HIGH;			// Currently applied option.

	PHYSX_CLOTH_LEVEL	g_emPhysXCloth = PHYSX_CLOTH_LEVEL_ALL;

	// Ground Quality
	// Determined by hardware capability at startup; ground rendering quality option is set accordingly.
	TnL_MODE		g_emGroundQulity = TnL_NONE;
	TnL_MODE		g_emGroundQulityTHREAD = TnL_FIXED;

	// Character Quality
	// Determined by hardware capability at startup; character rendering quality option is set accordingly.
	TnL_CHAR_MODE	g_emCharacterQulity = TnL_CHAR_FIXED;
	//TnL_CHAR_MODE	g_emCharacterQulityHW = TnL_CHAR_FIXED;

	BOOL		g_bFORCE_TnL_PS_3_0_DF = FALSE;

	BOOL	bEnableEEX = FALSE;
	BOOL	bEnableSSE = FALSE;

	// Note: Test
	BOOL	bCALCULATE_BONE = TRUE;
	BOOL	bCALCULATE_SSE = TRUE;
	BOOL	bRENDER_CHAR = TRUE;
	BOOL	bRENDER_WORLD = TRUE;
	BOOL	bRENDER_PIECE = TRUE;


	BOOL	bUseNormalMap = FALSE;
	BOOL	bMineEffect = FALSE;
	BOOL	bTargetEffect = FALSE;
	BOOL	bClickEffect = FALSE;
    BOOL    bVolumeLight = TRUE;

	DWORD	m_dwResolutionX = 800;
	DWORD	m_dwResolutionY = 600;
	DWORD	m_dwGpuVendor = 0;		// 0 - Etc, 1 - Intel, 2 - Nvidia, 3 - AMD
	DWORD	m_dwGpuModel = 0;
	DWORD	m_dwShaderModel = 0L;

	EMSERVICE_TYPE emSERVICE_TYPE = EMSERVICE_DEFAULT;
//	BOOL		   bXML_USE = TRUE;
	language::LANGFLAG emLangSet = language::DEFAULT;




	// Check if MMX is supported
	bool isMMXSupported() 
	{ 
		int fSupported; 

		__asm 
		{ 
		mov eax,1 // CPUID level 1 
		cpuid  // EDX = feature flag 
		and edx,0x800000 // test bit 23 of feature flag 
		mov fSupported,edx // != 0 if MMX is supported 
		} 

		if(fSupported != 0)
		{
			return true; 
		}
		else 
		{
			return false; 
		}
	} 

	// Check if SSE is supported
	bool isISSESupported() 
	{ 
		int processor; 
		int features; 
		int ext_features = 0; 

		__asm 
		{ 
			pusha 
			mov eax,1 
			cpuid 
			mov processor,eax     // Store processor family/model/step 
			mov features,edx      // Store features bits 

			mov eax,080000000h 
			cpuid 
			// Check which extended functions can be called 
			cmp eax,080000001h      // Extended Feature Bits 
			jb  no_features         // jump if not supported 

			mov eax,080000001h      // Select function 0x80000001 
			cpuid 
			mov ext_features,edx  // Store extended features bits 

		no_features: 
			popa 
		} 

		if (((features >> 25) & 1) != 0) 
		{
			return true; 
		}
		else 
		{
			if (((ext_features >> 22) & 1) != 0) 
			{
				return true; 
			}
			else 
			{
				return false; 
			}
		}
	}

	BOOL IsCheckDeviceFormat_A16B16G16R16F( LPDIRECT3DQ pD3D, const D3DCAPSQ* pd3dCaps, D3DFORMAT sFormat )
	{
		// In this function, Geforce 6000/7000 series returns FALSE.
		if( SUCCEEDED( pD3D->CheckDeviceFormat(
			pd3dCaps->AdapterOrdinal,
			pd3dCaps->DeviceType,
			sFormat,
			D3DUSAGE_RENDERTARGET,
			D3DRTYPE_TEXTURE,
			D3DFMT_A16B16G16R16 ) ) )
		{
			if( SUCCEEDED( pD3D->CheckDeviceFormat(
				pd3dCaps->AdapterOrdinal,
				pd3dCaps->DeviceType,
				sFormat,
				D3DUSAGE_QUERY_POSTPIXELSHADER_BLENDING,
				D3DRTYPE_TEXTURE,
				D3DFMT_A16B16G16R16F ) ) )
			{
				return TRUE;
			}
		}

		return FALSE;
	}

	void CheckSystemInfo( LPDIRECT3DQ pD3D, LPDIRECT3DDEVICEQ pd3dDevice )
	{
			// Resolution Update
		{
			D3DSURFACE_DESC		d3dsdBackBuffer;
			LPDIRECT3DSURFACEQ pBackBuffer;
			pd3dDevice->GetBackBuffer ( 0, 0, D3DBACKBUFFER_TYPE_MONO, &pBackBuffer );
			pBackBuffer->GetDesc( &d3dsdBackBuffer );
			pBackBuffer->Release();

			RENDERPARAM::m_dwResolutionX = d3dsdBackBuffer.Width;
			RENDERPARAM::m_dwResolutionY = d3dsdBackBuffer.Height;
		}

			// GPU information Update
		{
			D3DADAPTER_IDENTIFIER9 sAdapter;
			pD3D->GetAdapterIdentifier( D3DADAPTER_DEFAULT, 0, &sAdapter );

			std::string	strName = sAdapter.Description;
			std::transform( strName.begin(), strName.end(), strName.begin(), tolower );

			TSTRING::size_type idx;
			idx = strName.find( _T("intel") );
			if( idx!=TSTRING::npos )
			{
				RENDERPARAM::m_dwGpuVendor = 1;
			}

			idx = strName.find( _T("nvidia") );
			if( idx!=TSTRING::npos )
			{
				RENDERPARAM::m_dwGpuVendor = 2;
			}

			idx = strName.find( _T("geforce") );
			if( idx!=TSTRING::npos )
			{
				RENDERPARAM::m_dwGpuVendor = 2;
			}

			idx = strName.find( _T("gf") );
			if( idx!=TSTRING::npos )
			{
				RENDERPARAM::m_dwGpuVendor = 2;
			}

			idx = strName.find( _T("amd") );
			if( idx!=TSTRING::npos )
			{
				RENDERPARAM::m_dwGpuVendor = 3;
			}

			idx = strName.find( _T("ati") );
			if( idx!=TSTRING::npos )
			{
				RENDERPARAM::m_dwGpuVendor = 3;
			}

			idx = strName.find( _T("radeon") );
			if( idx!=TSTRING::npos )
			{
				RENDERPARAM::m_dwGpuVendor = 3;
			}

			idx = strName.find( _T("igp") );
			if( idx!=TSTRING::npos )
			{
				RENDERPARAM::m_dwGpuVendor = 4;
			}

			BOOL bFirst(TRUE);
			BOOL bLink(TRUE);
			TSTRING strGpuModel(_T(""));
			for ( DWORD i=0; i<strName.size(); ++i )
			{
				if ( strName[i] >= '0' && strName[i] <= '9' )
				{
						// If there is a gap between numbers in the model name, add 3 identical digits.
					if ( !bLink )
					{
						strGpuModel += strName[i];
						strGpuModel += strName[i];
						strGpuModel += strName[i];
					}

					strGpuModel += strName[i];

					bFirst = FALSE;
					bLink = TRUE;
				}
				else
				{
					if ( !bFirst )
					{
						bLink = FALSE;
					}
				}
			}

			RENDERPARAM::m_dwGpuModel = atoi(strGpuModel.c_str());
		}
	}

	void DeviceCheck( LPDIRECT3DQ pD3D, LPDIRECT3DDEVICEQ pd3dDevice )
	{
		D3DCAPSQ d3dCaps;
		pd3dDevice->GetDeviceCaps ( &d3dCaps );

		D3DSURFACE_DESC		d3dsdBackBuffer;
		LPDIRECT3DSURFACEQ pBackBuffer;
		pd3dDevice->GetBackBuffer ( 0, 0, D3DBACKBUFFER_TYPE_MONO, &pBackBuffer );
		pBackBuffer->GetDesc( &d3dsdBackBuffer );
		pBackBuffer->Release();

		//	Note : MIXED
		D3DDEVICE_CREATION_PARAMETERS d3dCreateParam;
		pd3dDevice->GetCreationParameters ( &d3dCreateParam );
		if( d3dCreateParam.BehaviorFlags & D3DCREATE_MIXED_VERTEXPROCESSING )
		{
			m_bUseMIXED = TRUE;
		}

		//	Note : Vertex Shader
		if ( m_bUseMIXED &&	d3dCaps.VertexShaderVersion >= D3DVS_VERSION(1, 1) )
		{
			if ( d3dCaps.PixelShaderVersion >= D3DPS_VERSION(1, 1) )
			{
				m_dwShaderModel = 1;
				g_bPixelShader_1_1 = TRUE;
			}
			if ( d3dCaps.PixelShaderVersion >= D3DPS_VERSION(1, 4) )
			{
				g_bPixelShader_1_4 = TRUE;
			}

				//// This location is mapped to -1 and causes problems.
				//// Intel(R) Q45/Q43 Express Chipset reports shadermodel as 3.0 but it is registered incorrectly.
				//// As a result, it does not render with sm.2.0 even though it should.
				//// If there is time to investigate; for now make it run with sm.1.4.
			//if ( d3dCaps.MaxVShaderInstructionsExecuted == -1 && 
			//	d3dCaps.MaxPShaderInstructionsExecuted == -1 && 
			//	DxSurfaceTex::GetInstance().IsLowLowGPU() )
			//{
					//	// Problematic graphics card
					//	// Probably Intel..
					//	// But recent ATI graphics cards also have d3dCaps.MaxVShaderInstructionsExecuted = -1
			//}
			//else
			{
				if ( d3dCaps.PixelShaderVersion >= D3DPS_VERSION(2, 0) )
				{
					m_dwShaderModel = 2;
					g_bPixelShader_2 = TRUE;
				}
				if ( d3dCaps.PixelShaderVersion >= D3DPS_VERSION(3, 0) )
				{
					m_dwShaderModel = 3;
					g_bPixelShader_3 = TRUE;
				}
			}
		}

		if( SUCCEEDED( pD3D->CheckDeviceFormat( d3dCaps.AdapterOrdinal,
											d3dCaps.DeviceType,
											d3dsdBackBuffer.Format,
											D3DUSAGE_RENDERTARGET,
											D3DRTYPE_TEXTURE,
											D3DFMT_A16B16G16R16F ) ) )
		{
			if ( g_bPixelShader_2 )
			{
				g_bEnableHW_HDR = TRUE;
			}
		}

		if ( d3dCaps.NumSimultaneousRTs >= 3 )
		{
			

			// Geforce 7600GS - D3DPMISCCAPS_MRTINDEPENDENTBITDEPTHS : FALSE
			//					D3DPMISCCAPS_MRTPOSTPIXELSHADERBLENDING : TRUE
			//
			if ( d3dCaps.PrimitiveMiscCaps & D3DPMISCCAPS_MRTINDEPENDENTBITDEPTHS &&
				d3dCaps.PrimitiveMiscCaps & D3DPMISCCAPS_MRTPOSTPIXELSHADERBLENDING )
			{
				if( SUCCEEDED( pD3D->CheckDeviceFormat(
					d3dCaps.AdapterOrdinal,
					d3dCaps.DeviceType,
					d3dsdBackBuffer.Format,
					D3DUSAGE_QUERY_POSTPIXELSHADER_BLENDING,
					D3DRTYPE_TEXTURE,
					D3DFMT_A8R8G8B8 ) ) )
				{
					g_bDefferedRendering = TRUE;
				}

				if( FAILED( pD3D->CheckDeviceFormat(
					d3dCaps.AdapterOrdinal,
					d3dCaps.DeviceType,
					d3dsdBackBuffer.Format,
					D3DUSAGE_RENDERTARGET,
					D3DRTYPE_TEXTURE,
					D3DFMT_A16B16G16R16F ) ) )
				{
					g_bDefferedRendering = FALSE;
				}
			}
		}

		if ( d3dCaps.NumSimultaneousRTs >= 4 && g_bDefferedRendering )
		{
			D3DSURFACE_DESC		d3dsdBackBuffer;
			LPDIRECT3DSURFACEQ pBackBuffer;
			pd3dDevice->GetBackBuffer ( 0, 0, D3DBACKBUFFER_TYPE_MONO, &pBackBuffer );
			pBackBuffer->GetDesc( &d3dsdBackBuffer );
			pBackBuffer->Release();

			D3DFORMAT m_FormatINTZ = (D3DFORMAT)MAKEFOURCC('I','N','T','Z');
			if( SUCCEEDED( pD3D->CheckDeviceFormat(
				d3dCaps.AdapterOrdinal,
				d3dCaps.DeviceType,
				d3dsdBackBuffer.Format,
				D3DUSAGE_DEPTHSTENCIL,
				D3DRTYPE_TEXTURE,
				m_FormatINTZ ) ) )
			{
				if ( IsCheckDeviceFormat_A16B16G16R16F( pD3D, &d3dCaps, d3dsdBackBuffer.Format ) )
				{
					g_bDefferedRendering_HIGH = TRUE;
					g_bDefferedRendering_INTZ = TRUE;
				}
			}
			else
			{
						// Do not use R.A.W.Z.
						// Nvidia 6000, 7000 series can use it, but it causes special problems here too.
						// Therefore HIGH and VeryHigh are both unavailable here.
				//D3DFORMAT sFormatRAWZ = (D3DFORMAT)MAKEFOURCC('R','A','W','Z');
				//if( SUCCEEDED( pD3D->CheckDeviceFormat(
				//	d3dCaps.AdapterOrdinal,
				//	d3dCaps.DeviceType,
				//	d3dsdBackBuffer.Format,
				//	D3DUSAGE_DEPTHSTENCIL,
				//	D3DRTYPE_TEXTURE,
				//	sFormatRAWZ ) ) )
				//{
				//	if ( IsCheckDeviceFormat_A16B16G16R16F( pD3D, &d3dCaps, d3dsdBackBuffer.Format ) )
				//	{
				//		g_bDefferedRendering_HIGH = TRUE;
				//		g_bDefferedRendering_RAWZ = TRUE;
				//	}
				//}
				//else
				{
					D3DFORMAT sFormatDF16 = (D3DFORMAT)MAKEFOURCC('D','F','1','6');
					if( SUCCEEDED( pD3D->CheckDeviceFormat(
						d3dCaps.AdapterOrdinal,
						d3dCaps.DeviceType,
						d3dsdBackBuffer.Format,
						D3DUSAGE_DEPTHSTENCIL,
						D3DRTYPE_TEXTURE,
						sFormatDF16 ) ) )
					{
						if ( IsCheckDeviceFormat_A16B16G16R16F( pD3D, &d3dCaps, d3dsdBackBuffer.Format ) )
						{
							g_bDefferedRendering_HIGH = TRUE;
							g_bDefferedRendering_DF16 = TRUE;
						}
					}
				}
			}

				// Even without this, basic Deferred is available and D3DFMT_G32R32F can be used.
				// Issue where D3DFMT_G32R32F is available without Deferred.
			if ( g_bDefferedRendering_HIGH )
			{
				if( SUCCEEDED( pD3D->CheckDeviceFormat(
					d3dCaps.AdapterOrdinal,
					d3dCaps.DeviceType,
					d3dsdBackBuffer.Format,
					D3DUSAGE_RENDERTARGET,
					D3DRTYPE_TEXTURE,
					D3DFMT_G32R32F ) ) )
				{
					g_bSurfaceG32R32F = TRUE;
				}
			}
		}

		if ( d3dCaps.PrimitiveMiscCaps & D3DPMISCCAPS_SEPARATEALPHABLEND )
		{
			g_bSeparateAlphaBlend = TRUE;
		}
		
		// Note: Availability check for MMX and SSE.
		if( isMMXSupported() )
		{
			bEnableEEX = TRUE;
		}
		if( isISSESupported() )
		{
			bEnableSSE = TRUE;
		}
	}

	BOOL LOAD( LPDIRECT3DQ pD3D, LPDIRECT3DDEVICEQ pd3dDevice, const char *szRootPath )
	{
        // Note: Checks the Device.
		DeviceCheck( pD3D, pd3dDevice );

		// Determines the TnL Mode to be used.
		CheckTnLMode();

		//strRootPath = szRootPath;
		//strParamFile = strRootPath + "\\RenderParam.ini";

		//gltexfile cFILE;
		//cFILE.reg_sep("\t ");

		//if (!cFILE.open(strParamFile, false))
  //          return FALSE;

		//int nTEMP(0);

			////	Character render settings.
		//cFILE.getflag ( "emCharRenderTYPE", 1, 1, emCharRenderTYPE );

			//// Note: Brightness
		//cFILE.getflag ( "fGamma", 1, 1, fGamma );
		//cFILE.getflag ( "dwOverBright", 1, 1, dwOverBright );
		//cFILE.getflag ( "fContrast", 1, 1, fContrast );


			//// Note: Test
		//cFILE.getflag ( "bCALCULATE_BONE", 1, 1, bCALCULATE_BONE );
		//cFILE.getflag ( "bCALCULATE_SSE", 1, 1, bCALCULATE_SSE );
		//cFILE.getflag ( "bRENDER_CHAR", 1, 1, bRENDER_CHAR );
		//cFILE.getflag ( "bRENDER_WORLD", 1, 1, bRENDER_WORLD );
		//cFILE.getflag ( "bRENDER_PIECE", 1, 1, bRENDER_PIECE );
	

		//      // Note: If SSE is supported, use EMCRT_SOFTWARE; otherwise use EMCRT_NORMAL;
		////		Or if EMCRT_SOFTWARE vs EMCRT_NORMAL must be decided here,
		////		the EMCRT_NON_SOFT task needs to be handled here.
		////		
		//switch( emCharRenderTYPE )
		//{
		//case EMCRT_NON_SOFT:
		//	if( bEnableSSE )
		//	{
		//		emCharRenderTYPE = EMCRT_SOFTWARE;
		//	}
		//	else
		//	{
		//		emCharRenderTYPE = EMCRT_NORMAL;
		//	}
		//	break;
		//case EMCRT_VERTEX:
		//	if( !m_bUseMIXED )	emCharRenderTYPE = EMCRT_NORMAL;
		//	break;
		//case EMCRT_PIXEL:
		//	if( !g_bPixelShader_2 )	emCharRenderTYPE = EMCRT_VERTEX;
		//	if( !m_bUseMIXED )		emCharRenderTYPE = EMCRT_NORMAL;
		//	break;
		//};

		return TRUE;
	}

	void CheckTnLMode()
	{
		//////////////////////////////////////////////////////////////////////////
		// Low hardware mode settings.
		if ( g_bForceLowHardwareMode )
		{
			if ( g_bPixelShader_1_1 )
			{
				g_emTnLMode = TnL_PS_1_1;
			}
			else
			{
				g_emTnLMode = TnL_FIXED;
			}

			if ( g_bPixelShader_2 )
			{
					// Previously checked g_bPixelShader_1_1 for s_m_cos_airport_body.cps, s_m_cos_airport_leg.cps,
					// but a crash occurred on specific PCs (Hong Kong PCs) so it now runs in 2.0 mode.
					// Could not identify the root cause, so set it to require g_bPixelShader_2 or higher.
				g_emCharacterQulity = TnL_CHAR_PS_1_1;
			}
			else
			{
					// Cannot be changed in options.
				g_emCharacterQulity = TnL_CHAR_FIXED;
			}

			g_bEnable_HDR = FALSE;

			return;
		}

		//////////////////////////////////////////////////////////////////////////
		// Ground
		if ( g_bPixelShader_3 && 
			g_bDefferedRendering_HIGH &&
			g_bSurfaceG32R32F &&
			DxShadowMap::GetInstance().GetShadowDetail() >= LAND_QT_HIGH_HIGH && 
			DxSurfaceTex::GetInstance().m_pColorTex_1st &&
			DxSurfaceTex::GetInstance().m_pColorTex_2nd &&
			DxSurfaceTex::GetInstance().m_pColorTex_3rd &&
			DxSurfaceTex::GetInstance().m_pColorTex_4th &&
			DxSurfaceTex::GetInstance().m_p512Tex_4th &&
			DxSurfaceTex::GetInstance().m_pShadowTexG32R32F_VSM_CSM2 && 
			DxSurfaceTex::GetInstance().m_pShadowTexR32F_1024 && 
			DxSurfaceTex::GetInstance().m_pShadowTexR32F_CSM &&
			DxSurfaceTex::GetInstance().m_pShadowTexR32F_PL1 && 
			DxSurfaceTex::GetInstance().m_pShadowTexR32F_PL2 )
		{
			g_emTnLMode = TnL_PS_3_0_CSM;
		}
		else if ( g_bPixelShader_3 && 
			g_bDefferedRendering_HIGH &&
			DxShadowMap::GetInstance().GetShadowDetail() >= LAND_QT_HIGH && 
			DxSurfaceTex::GetInstance().m_pShadowTexG32R32F_VSM_CSM2 && 
			DxSurfaceTex::GetInstance().m_pColorTex_1st &&
			DxSurfaceTex::GetInstance().m_pColorTex_2nd &&
			DxSurfaceTex::GetInstance().m_pColorTex_3rd &&
			DxSurfaceTex::GetInstance().m_pColorTex_4th &&
			DxSurfaceTex::GetInstance().m_p512Tex_4th &&
			DxSurfaceTex::GetInstance().m_pShadowTexR32F )
		{
			g_emTnLMode = TnL_PS_3_0_NM;
		}
		else if ( g_bPixelShader_3 && 
			DxShadowMap::GetInstance().GetShadowDetail() >= LAND_QT_MIDDLE && 
			DxSurfaceTex::GetInstance().m_pColorTex_1st &&
			DxSurfaceTex::GetInstance().m_pColorTex_2nd &&
			DxSurfaceTex::GetInstance().m_pColorTex_4th &&
			DxSurfaceTex::GetInstance().m_p512Tex_4th &&
			DxSurfaceTex::GetInstance().m_pShadowTexR32F )
		{
			g_emTnLMode = TnL_PS_3_0_DF;
		}
		else if ( g_bPixelShader_1_1 )
		{
			g_emTnLMode = TnL_PS_1_1;
		}
		else
		{
			// [shhan][2014.09.12] Changed policy: things that cannot use g_bPixelShader_1_1 now run in TnL_FIXED mode.
			//					Cannot be changed in options.
			g_emTnLMode = TnL_FIXED;
		}


		////////////////////////////////////////////////////////////////////////
		// Character
		if ( g_bPixelShader_3 && 
			DxEffectMan::GetInstance().GetSkinDetail() >= SKD_BEST &&
			DxSurfaceTex::GetInstance().m_pShadowTexR32F )
		{
			g_emCharacterQulity = TnL_CHAR_PS_3_0;
		}
		else if ( g_bPixelShader_2 && 
			DxEffectMan::GetInstance().GetSkinDetail() >= SKD_SPEC )
		{
			g_emCharacterQulity = TnL_CHAR_PS_2_0;
		}
		else if ( g_bPixelShader_2 )
		{
			// Previously checked g_bPixelShader_1_1 for s_m_cos_airport_body.cps, s_m_cos_airport_leg.cps,
			// but a crash occurred on specific PCs (Hong Kong PCs) so it now runs in 2.0 mode.
			// Could not identify the root cause, so set it to require g_bPixelShader_2 or higher.
			g_emCharacterQulity = TnL_CHAR_PS_1_1;
		}
		else
		{
			// Cannot be changed in options.
			g_emCharacterQulity = TnL_CHAR_FIXED;
		}


		//////////////////////////////////////////////////////////////////////////
		// HDR
		//if ( g_emCharacterQulity >= TnL_CHAR_PS_3_0 && g_bEnableHW_HDR )
		if ( g_bEnableHW_HDR && 
			DxPostProcess::GetInstance().IsOptionEnable() && 
			g_emCharacterQulity >= TnL_CHAR_PS_2_0 &&
			DxSurfaceTex::GetInstance().m_pColorSuf16F_HDR &&
			DxSurfaceTex::GetInstance().m_pBloomBrightSuf &&
			DxSurfaceTex::GetInstance().m_pBloomDownSampleSuf &&
			DxSurfaceTex::GetInstance().m_pBloomDownSampleSufH )
		{
			g_bEnable_HDR = TRUE;
		}
		else
		{
			g_bEnable_HDR = FALSE;
		}


		// Ground rendering settings.
		//g_emCharacterQulity = TnL_CHAR_FIXED;
	}

	void OnCreateDevice( LPDIRECT3DDEVICEQ pd3dDevice )
	{
		g_pd3dDevice = pd3dDevice;
	}

	void SetTextureFiltering( TEXTURE_FILTERING emTexFilter )
	{
		g_emTextureFiltering = emTexFilter;

		DWORD dwMaxAnisotropy(1);
		DWORD dwMinFilter(D3DTEXF_LINEAR);
		DWORD dwMagFilter(D3DTEXF_LINEAR);
		DWORD dwMipFilter(D3DTEXF_LINEAR);
		switch ( RENDERPARAM::g_emTextureFiltering )
		{
		//case TEXTURE_FILTER_BILINEAR:
		//	dwMipFilter = D3DTEXF_POINT;	// Slow performance on Intel hardware.
		//	break;

		case TEXTURE_FILTER_TRILINEAR:
			break;

		case TEXTURE_FILTER_ANISOTROPIC_2X:
			dwMaxAnisotropy = 2;
			break;

		case TEXTURE_FILTER_ANISOTROPIC_4X:
			dwMaxAnisotropy = 4;
			break;

		case TEXTURE_FILTER_ANISOTROPIC_8X:
			dwMaxAnisotropy = 8;
			break;

		case TEXTURE_FILTER_ANISOTROPIC_16X:
			dwMaxAnisotropy = 16;
			break;

		default:
			break;
		};


		D3DCAPSQ d3dCaps;
		g_pd3dDevice->GetDeviceCaps ( &d3dCaps );
		if ( dwMaxAnisotropy >= 2 && d3dCaps.MaxAnisotropy >= 2 )
		{
			dwMinFilter = D3DTEXF_ANISOTROPIC;
			dwMaxAnisotropy = dwMaxAnisotropy > d3dCaps.MaxAnisotropy ? d3dCaps.MaxAnisotropy : dwMaxAnisotropy;

			for ( DWORD i=0; i<8; ++i )
			{
				g_pd3dDevice->SetSamplerState( i, D3DSAMP_MAXANISOTROPY, dwMaxAnisotropy );
			}
		}


		for ( DWORD i=0; i<8; ++i )
		{
			g_pd3dDevice->SetSamplerState( i, D3DSAMP_MINFILTER, dwMinFilter );
			g_pd3dDevice->SetSamplerState( i, D3DSAMP_MAGFILTER, dwMagFilter );
			g_pd3dDevice->SetSamplerState( i, D3DSAMP_MIPFILTER, dwMipFilter );
		}
	}

	void SetTextureQuality( TEXTURE_QUALITY emTexQuality )
	{
		// When loading from Options file for the first time, the NEW value is preserved.
		g_emTextureQuality_NEW = emTexQuality;

		if ( g_emTextureQuality != emTexQuality )
		{
			g_bChangeTexQuality = TRUE;
		}
		else
		{
			g_bChangeTexQuality = FALSE;
		}
	}

	// Apply the given option immediately.
	// In the Lobby stage, Texture Quality must be at maximum, so this function was created for that purpose.
	void SetTextureQuality_FORCE( TEXTURE_QUALITY emTexQuality )
	{
		g_bChangeTexQuality = TRUE;
		g_emTextureQuality = emTexQuality;
	}

	// Applied only after loading is complete.
	void ApplyTextureQuality()
	{
		if ( g_bChangeTexQuality )
		{
			g_emTextureQuality = g_emTextureQuality_NEW;
		}
		g_bChangeTexQuality = FALSE;
	}
}

