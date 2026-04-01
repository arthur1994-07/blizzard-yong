#ifndef NEOEASYCRYPTION_TEST_
#define NEOEASYCRYPTION_TEST_

#pragma once

namespace CCrypt
{
	enum
	{
		EN = 0xA7F38D21,
		EN2 = 0x5C11B03E,
		END = 8,

	};
	enum
	{
		ENTYPE_ALL,
	};
	enum
	{
		ENCRY_VER = 0x100,
		ENCRY_HEADER_SIZE = 12,
	};

	extern BOOL	bCryptRCC;
	extern BOOL	bEngineDebug;

	void Encryption(BYTE* B,int dwSize);
	void Decryption(BYTE* B,int dwSize);
	void LoadSetting( const TCHAR *szRootPath );

};

#endif
