//PK Notification - Kill Feed
#include "../RanLogic/Character/GLCharDefine.h"
#include "GLContrlBaseMsg.h"
#include <vector>

#pragma once

#define PKNOTIF_NUM			10
#define HISTORY_TIMER		7

struct SPK_HISTORY
{
	DWORD dwKiller;
	DWORD dwKilled;
	char szCharKiller[CHAR_SZNAME];
	char szCharKilled[CHAR_SZNAME];
	BYTE cClassKiller;
	BYTE cClassKilled;
	BYTE cSchoolKiller;
	BYTE cSchoolKilled;
	float fTimer;

	SPK_HISTORY()
		: dwKiller( GAEAID_NULL )
		, dwKilled( GAEAID_NULL )
		, cClassKiller( 0 )
		, cClassKilled( 0 )
		, cSchoolKiller( 0 )
		, cSchoolKilled( 0 )
		, fTimer( 0.0f )
	{
		memset( szCharKiller, 0, sizeof(char) * (CHAR_SZNAME +1) );
		memset( szCharKilled, 0, sizeof(char) * (CHAR_SZNAME +1) );
	};
};

typedef std::vector<SPK_HISTORY>			PK_HISTORY_VEC;
typedef PK_HISTORY_VEC::iterator			PK_HISTORY_VEC_ITER;
