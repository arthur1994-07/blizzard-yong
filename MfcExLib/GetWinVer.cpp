// GetWinVer.cpp  Version 2.0  (VS2008 / Win95 to 11 compatible)
//
// Public-domain – drop-in replacement for the 2001–2003 code.
// Uses RtlGetVersion so it reports Windows 10/11 truthfully
// even when the EXE has no manifest.

#include "stdafx.h"
#include "tchar.h"
#include "GetWinVer.h"
#include <windows.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

/* ----------------------------------------------------------
   PRIVATE: query the kernel for the real version
---------------------------------------------------------- */
typedef LONG (WINAPI *PRtlGetVersion)(RTL_OSVERSIONINFOEXW*);

static BOOL GetRealNumbers(DWORD *maj, DWORD *min, DWORD *bld)
{
    HMODULE hNtDll = GetModuleHandleA("ntdll.dll");
    if (!hNtDll) return FALSE;

    PRtlGetVersion pRtl = (PRtlGetVersion)GetProcAddress(hNtDll, "RtlGetVersion");
    if (!pRtl) return FALSE;

    RTL_OSVERSIONINFOEXW os = { sizeof(os) };
    if (pRtl(&os) != 0) return FALSE;

    *maj = os.dwMajorVersion;
    *min = os.dwMinorVersion;
    *bld = os.dwBuildNumber;
    return TRUE;
}

/* ----------------------------------------------------------
   PUBLIC API  (unchanged prototype)
---------------------------------------------------------- */
BOOL GetWinVer(LPTSTR pszVersion,
               int   *pnVersion,
               LPTSTR pszMajorMinorBuild)
{
    if (!pszVersion || !pnVersion || !pszMajorMinorBuild)
        return FALSE;

    lstrcpy(pszVersion,  WUNKNOWNSTR);
    *pnVersion = WUNKNOWN;

    DWORD major, minor, build;
    if (!GetRealNumbers(&major, &minor, &build))
        return FALSE;

    wsprintf(pszMajorMinorBuild, _T("%u.%u.%u"), major, minor, build);

    /* -------- Windows 9x family -------- */
    if (major == 4)
    {
        if      (minor < 10 && build == 950)                     { lstrcpy(pszVersion, W95STR);      *pnVersion = W95;      }
        else if (minor < 10 && build > 950  && build <= 1080)    { lstrcpy(pszVersion, W95SP1STR);   *pnVersion = W95SP1;   }
        else if (minor < 10 && build > 1080)                     { lstrcpy(pszVersion, W95OSR2STR);  *pnVersion = W95OSR2;  }
        else if (minor == 10 && build == 1998)                   { lstrcpy(pszVersion, W98STR);      *pnVersion = W98;      }
        else if (minor == 10 && build > 1998 && build < 2183)    { lstrcpy(pszVersion, W98SP1STR);   *pnVersion = W98SP1;   }
        else if (minor == 10 && build >= 2183)                   { lstrcpy(pszVersion, W98SESTR);    *pnVersion = W98SE;    }
        else if (minor == 90)                                    { lstrcpy(pszVersion, WMESTR);      *pnVersion = WME;      }
        return TRUE;
    }

    /* -------- NT family -------- */
    if (major == 3 && minor == 51) { lstrcpy(pszVersion, WNT351STR);     *pnVersion = WNT351;     return TRUE; }
    if (major == 4 && minor == 0)  { lstrcpy(pszVersion, WNT4STR);       *pnVersion = WNT4;       return TRUE; }
    if (major == 5 && minor == 0)  { lstrcpy(pszVersion, W2KSTR);        *pnVersion = W2K;        return TRUE; }
    if (major == 5 && minor == 1)  { lstrcpy(pszVersion, WXPSTR);        *pnVersion = WXP;        return TRUE; }
    if (major == 5 && minor == 2)  { lstrcpy(pszVersion, W2003SERVERSTR);*pnVersion = W2003SERVER;return TRUE; }
    if (major == 6 && minor == 0)  { lstrcpy(pszVersion, WVISTASTR);     *pnVersion = WVISTA;     return TRUE; }
    if (major == 6 && minor == 1)  { lstrcpy(pszVersion, W7STR);         *pnVersion = W7;         return TRUE; }
    if (major == 6 && minor == 2)  { lstrcpy(pszVersion, W8STR);         *pnVersion = W8;         return TRUE; }
    if (major == 6 && minor == 3)  { lstrcpy(pszVersion, W81STR);        *pnVersion = W81;        return TRUE; }

    /* -------- Windows 10/11/Server 2016/2019/2022/2025 -------- */
    if (major == 10)
    {
        /* Windows 11 build threshold is 22000 */
        if (build >= 22000)
        {
            /* Server detection: build 20348+ is Server 2022, 25398+ is 2025 */
            if (build >= 25398)       { lstrcpy(pszVersion, WSVR2025STR); *pnVersion = WSVR2025; }
            else if (build >= 20348)  { lstrcpy(pszVersion, WSVR2022STR); *pnVersion = WSVR2022; }
            else                      { lstrcpy(pszVersion, W11STR);      *pnVersion = W11;      }
        }
        else
        {
            /* Windows 10 or Server 2016/2019 */
            if      (build >= 17763)  { lstrcpy(pszVersion, WSVR2019STR); *pnVersion = WSVR2019; }
            else if (build >= 14393)  { lstrcpy(pszVersion, WSVR2016STR); *pnVersion = WSVR2016; }
            else                      { lstrcpy(pszVersion, W10STR);      *pnVersion = W10;      }
        }
        return TRUE;
    }

    /* -------- Anything newer or unknown -------- */
    lstrcpy(pszVersion, WUNKNOWNSTR);
    *pnVersion = WUNKNOWN;
    return TRUE;
}