#pragma once

#include "../../InternalCommonLib/dxstdafx.h"
#include "DxFontDefine.h"

enum EMCHARRENDER_TYPE
{
	EMCRT_NON_SOFT = 0,	// If the computer does not support SSE, it will not use software rendering.
	EMCRT_SOFTWARE = 1,
	EMCRT_NORMAL = 2,
	EMCRT_VERTEX = 3,
	EMCRT_PIXEL = 4,
	EMCRT_SIZE = 5,
};

enum TEXTURE_FILTERING
{
	//TEXTURE_FILTER_BILINEAR,	// Slow performance on Intel hardware.
	TEXTURE_FILTER_TRILINEAR,
	TEXTURE_FILTER_ANISOTROPIC_2X,
	TEXTURE_FILTER_ANISOTROPIC_4X,
	TEXTURE_FILTER_ANISOTROPIC_8X,
	TEXTURE_FILTER_ANISOTROPIC_16X,
	TEXTURE_FILTER_SIZE,
};

enum TEXTURE_QUALITY
{
	TEXTURE_QUALITY_LOW,
	TEXTURE_QUALITY_MID,
	TEXTURE_QUALITY_HIGH,
	TEXTURE_QUALITY_SIZE,
};

enum PHYSX_CLOTH_LEVEL
{
	PHYSX_CLOTH_LEVEL_NONE,	// PhysX cloth simulation disabled.
	PHYSX_CLOTH_LEVEL_MY,	// Operates PhysX only for own character.
	PHYSX_CLOTH_LEVEL_ALL,	// Applied to all characters.
	PHYSX_CLOTH_LEVEL_SIZE,
};

enum TnL_MODE
{
	TnL_NONE = 0,
	TnL_FIXED = 1,
	TnL_PS_1_1 = 2,
	TnL_PS_3_0_DF = 3,
	TnL_PS_3_0_NM = 4,
	TnL_PS_3_0_CSM = 5,
};

enum TnL_CHAR_MODE
{
	TnL_CHAR_FIXED = 0,
	TnL_CHAR_FIXED_HIGH = 1,
	TnL_CHAR_PS_1_1 = 2,		// Reflections are supported at this level and above.
	TnL_CHAR_PS_2_0 = 3,		// VisualMaterial is supported at the highest quality level.
	TnL_CHAR_PS_3_0 = 4,
};

namespace RENDERPARAM
{
	//	Character render settings.
	extern EMCHARRENDER_TYPE	emCharRenderTYPE;	// Char Shader Type..!!	- Can be changed later. Must be changed before execution.

	// Note: Brightness
	extern float	fGamma;
	extern DWORD	dwOverBright;
	extern float	fContrast;

	// Note: Device information
	extern BOOL		g_bPixelShader_1_1;
	extern BOOL		g_bPixelShader_1_4;
	extern BOOL		g_bPixelShader_2;
	extern BOOL		g_bPixelShader_3;
	extern BOOL		g_bDefferedRendering;
	extern BOOL		g_bDefferedRendering_HIGH;
	extern BOOL		g_bDefferedRendering_INTZ;
	extern BOOL		g_bDefferedRendering_DF16;
	//extern BOOL		g_bDefferedRendering_RAWZ;
	extern BOOL		g_bSurfaceG32R32F;
	extern BOOL		g_bEnableHW_HDR;
	extern BOOL		g_bEnable_HDR;
	extern BOOL		g_bSeparateAlphaBlend;
	extern TnL_MODE	g_emTnLMode;
	extern BOOL		bEnableEEX;
	extern BOOL		bEnableSSE;

	// Ground Quality
	extern TnL_MODE			g_emGroundQulity;
	extern TnL_MODE			g_emGroundQulityTHREAD;

	// Character Quality
	//extern TnL_CHAR_MODE	g_emCharacterQulityHW;	// hardware settings
	extern TnL_CHAR_MODE	g_emCharacterQulity;	// Applied to current rendering quality.

	// Force PS_3_0_DF settings
	extern BOOL		g_bFORCE_TnL_PS_3_0_DF;

	// Note: Test
	extern BOOL		bCALCULATE_BONE;
	extern BOOL		bCALCULATE_SSE;
	extern BOOL		bRENDER_CHAR;
	extern BOOL		bRENDER_WORLD;
	extern BOOL		bRENDER_PIECE;

	extern BOOL		bUseNormalMap;
	extern BOOL		bMineEffect;
	extern BOOL		bTargetEffect;
	extern BOOL		bClickEffect;
    extern BOOL     bVolumeLight;

	extern TEXTURE_FILTERING	g_emTextureFiltering;

	extern BOOL					g_bChangeTexQuality;
	extern TEXTURE_QUALITY		g_emTextureQuality;

	extern PHYSX_CLOTH_LEVEL	g_emPhysXCloth;

	extern DWORD	m_dwResolutionX;
	extern DWORD	m_dwResolutionY; 
	extern DWORD	m_dwGpuVendor; 		// 0 - Etc, 1 - Intel, 2 - Nvidia, 3 - AMD
	extern DWORD	m_dwGpuModel; 
	extern DWORD	m_dwShaderModel; 

	extern BOOL		g_bForceLowHardwareMode;	// Low hardware mode activation ON / OFF
	extern BOOL		g_bHideDeadBodies;			// Hide dead player character bodies ON / OFF

	enum EMSERVICE_TYPE
	{
		EMSERVICE_DEFAULT		= 0,
		EMSERVICE_KOREA			= 1,
		EMSERVICE_FEYA			= 2,
		EMSERVICE_MALAYSIA_CN	= 3,
		EMSERVICE_MALAYSIA_EN	= 4,
		EMSERVICE_JAPAN			= 5,
		EMSERVICE_THAILAND		= 6,
		EMSERVICE_CHINA			= 7,
		EMSERVICE_INDONESIA		= 8,
		EMSERVICE_PHILIPPINES	= 9,
		EMSERVICE_VIETNAM		= 10,
		EMSERVICE_GLOBAL		= 11, //! Global service
        EMSERVICE_WORLD_BATTLE  = 12, //! World battle
		EMSERVICE_EU			= 13, //! Games-Masters
		EMSERVICE_US			= 14, //! GameSamba
	};

	extern EMSERVICE_TYPE	emSERVICE_TYPE;
//	extern BOOL				bXML_USE;
	extern language::LANGFLAG emLangSet;

	void CheckSystemInfo( LPDIRECT3DQ pD3D, LPDIRECT3DDEVICEQ pd3dDevice );

	BOOL LOAD( LPDIRECT3DQ pD3D, LPDIRECT3DDEVICEQ pd3dDevice, const char *szRootPath );

	void CheckTnLMode();

	void OnCreateDevice( LPDIRECT3DDEVICEQ pd3dDevice );

	void SetTextureFiltering( TEXTURE_FILTERING emTexFilter );

	// Temporarily applies texture quality during loading.
	void SetTextureQuality( TEXTURE_QUALITY emTexQuality );

	// Apply the given option immediately.
	// In the Lobby stage, Texture Quality must be at maximum, so this function was created for that purpose.
	void SetTextureQuality_FORCE( TEXTURE_QUALITY emTexQuality );

	// Applied only after loading is complete.
	void ApplyTextureQuality();
}
