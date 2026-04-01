// GetWinVer.h  Version 2.0
//
// Public-domain – updated for Windows 10 / 11 / Server 2016 / 2019 / 2022 / 2025
// Compatible with VS2008

#ifndef GETWINVER_H
#define GETWINVER_H

#include <tchar.h>

/* ------------ TEXT STRINGS ------------- */
#define WUNKNOWNSTR      _T("unknown Windows version")

#define W95STR           _T("Windows 95")
#define W95SP1STR        _T("Windows 95 SP1")
#define W95OSR2STR       _T("Windows 95 OSR2")
#define W98STR           _T("Windows 98")
#define W98SP1STR        _T("Windows 98 SP1")
#define W98SESTR         _T("Windows 98 SE")
#define WMESTR           _T("Windows ME")

#define WNT351STR        _T("Windows NT 3.51")
#define WNT4STR          _T("Windows NT 4")
#define W2KSTR           _T("Windows 2000")
#define WXPSTR           _T("Windows XP")
#define W2003SERVERSTR   _T("Windows Server 2003")
#define WVISTASTR        _T("Windows Vista")
#define W7STR            _T("Windows 7")
#define W8STR            _T("Windows 8")
#define W81STR           _T("Windows 8.1")

#define W10STR           _T("Windows 10")
#define W11STR           _T("Windows 11")

#define WSVR2016STR      _T("Windows Server 2016")
#define WSVR2019STR      _T("Windows Server 2019")
#define WSVR2022STR      _T("Windows Server 2022")
#define WSVR2025STR      _T("Windows Server 2025")

#define WCESTR           _T("Windows CE")

/* ------------ NUMERIC CONSTANTS ------------- */
#define WUNKNOWN   0

/* 9x family */
#define W9XFIRST   1
#define W95        1
#define W95SP1     2
#define W95OSR2    3
#define W98        4
#define W98SP1     5
#define W98SE      6
#define WME        7
#define W9XLAST    99

/* NT family */
#define WNTFIRST     101
#define WNT351       101
#define WNT4         102
#define W2K          103
#define WXP          104
#define W2003SERVER  105
#define WVISTA       106
#define W7           107
#define W8           108
#define W81          109
#define W10          110
#define W11          111
#define WSVR2016     112
#define WSVR2019     113
#define WSVR2022     114
#define WSVR2025     115
#define WNTLAST      199

/* CE family */
#define WCEFIRST  201
#define WCE       201
#define WCELAST   299

/* ------------ FUNCTION PROTOTYPES ------------- */
BOOL GetWinVer(LPTSTR pszVersion, int *pnVersion, LPTSTR pszMajorMinorBuild);
bool  iswin_nt(void);

#endif // GETWINVER_H