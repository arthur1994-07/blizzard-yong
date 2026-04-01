#include "pch.h"
#include "stdafx.h"
#include "Crypt.h"
#include "../enginelib/Common/SUBPATH.h"
#include "../enginelib/G-Logic/GLOGIC.h"
#include "../enginelib/Common/IniLoader.h"
#include "../enginelib/Common/GLTexFile.h" 




namespace CCrypt
{
	BOOL	bCryptRCC = TRUE;
	BOOL	bEngineDebug = TRUE;

    void LoadSetting(const TCHAR* szRootPath)
    {
        CString strFileName = szRootPath;
        strFileName += _T("\\GameSet.ini");

        CIniLoader ini(",", false);
        if (!ini.open(std::string(CT2A(strFileName)), false, FALSE))
            return;

        UINT dwKey = 0;
        ini.getflag<UINT>("SECURITY", "Key", 0, 1, dwKey);

        if (dwKey == 970710U)
            bCryptRCC = FALSE;
    }

	void Encryption(BYTE *B ,int dwSize)
	{
		for( int i = 0 ; i < dwSize ; i ++ )
		{
			B[i] = B[i] ^ EN;
			B[i] += ( EN ^ EN2 );
		};
		return ;
	}
	void Decryption(BYTE *B,int dwSize)
	{
		for( int i = 0 ; i < dwSize ; i ++ )
		{
			B[i] -= ( EN ^ EN2 );
			B[i] = B[i] ^ EN;
		};
		return ;
	}
};
