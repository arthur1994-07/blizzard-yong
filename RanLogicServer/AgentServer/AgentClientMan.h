#pragma once

#include <string>
#include <map>
#include <boost/unordered_map.hpp>

class GLCharAG;
class GLAgentServer;
class CharNameCache;
struct CHAR_BASE_CACHE_DATA;
enum EMUSERTYPE;

//#define INVALID_DB_NUM 0

class AgentCharMan 
{
public:
    typedef std::map<std::string, GLCharAG*> CHAR_MAP;
    typedef CHAR_MAP::iterator				 CHAR_MAP_ITER;
    typedef CHAR_MAP::const_iterator		 CHAR_MAP_CITER;
    typedef CHAR_MAP::value_type             CHAR_MAP_VALUE;

    typedef boost::unordered_map<DWORD,DWORD> CLIENTMAP;
    typedef CLIENTMAP::iterator				  CLIENTMAP_ITER;
    typedef CLIENTMAP::const_iterator		  CLIENTMAP_CITER;
    typedef CLIENTMAP::value_type             CLIENTMAP_VALUE;
    
public:
    AgentCharMan(GLAgentServer* pServer);
    ~AgentCharMan();

protected:
    GLAgentServer* m_pServer;

    CHAR_MAP m_UAccountMap; //! User Account/ĳ���� Pointer
    CHAR_MAP m_CharNameMap; //! ĳ�����̸�/ĳ���� Pointer

    CLIENTMAP m_ClientSlotGaeaIdMap; //! Client ��� Slot/Gaea ID    
    CLIENTMAP m_CharDbNumGaeaIdMap;  //! Character DB Num/Gaea ID
    CLIENTMAP m_UserNumberMap;       //! User Db Num/Gaea ID
	CLIENTMAP m_SaveUserNum;       //! User Db Num/time
	CLIENTMAP m_JoinUserNum;       //! User Db Num/time for join-in-progress

    CharNameCache* m_pNameCache; //! ĳ���� �̸�/ĳ���� DB ��ȣ, ĳ���� DB ��ȣ/ĳ���� �̸�

public:
    //! User Account/ĳ���� Pointer
    GLCharAG* GetCharByUserAccount(const std::string& UserId);
    void UserAccountAdd(const std::string& UserId, GLCharAG* pChar);
    void UserAccountDel(const std::string& UserId);

    //! Client ��� Slot/Gaea ID
    DWORD GetGaeaIdByClientSlot(DWORD ClientSlot);
    void NetworkSlotAdd(DWORD ClientSlot, DWORD GaeaId);
    void NetworkSlotDel(DWORD ClientSlot);

    //! ĳ���� �̸�/ĳ���� DB ��ȣ, ĳ���� DB ��ȣ/ĳ���� �̸�
    void ChaNameDbNumAdd(const std::string& ChaName, DWORD ChaDbNum, DWORD UserDbNum, EMUSERTYPE UserType);
	void ChaNameDbNumAdd(const std::string& ChaName, DWORD ChaDbNum, DWORD UserDbNum, EMUSERTYPE UserType, int iClass, int iLv);

    //! ĳ���� �̸�/ĳ���� DB ��ȣ
    DWORD GetChaDbNumByChaName(const std::string& ChaName);

    //! ĳ���� DB ��ȣ/ĳ���� �̸�
    std::string GetChaNameByDbNum(DWORD ChaDbNum);

    std::tr1::shared_ptr<CHAR_BASE_CACHE_DATA> GetCharCacheData(const std::string& ChaName);
    std::tr1::shared_ptr<CHAR_BASE_CACHE_DATA> GetCharCacheData(DWORD ChaDbNum);

    //! Character DB Num/Gaea ID
    void ChaDbNumGaeaIdAdd(DWORD ChaDbNum, DWORD GaeaId);
    void ChaDbNumGaeaIdDel(DWORD ChaDbNum);
    DWORD GetGaeaIdByChaDbNum(DWORD ChaDbNum);

    //! User Db Num/Gaea ID
    void UserDbNumGaeaIdAdd(DWORD UserDbNum, DWORD GaeaId);
    void UserDbNumGaeaIdDel(DWORD UserDbNum);
    DWORD GetGaeaIdByUserDbNum(DWORD UserDbNum);

    //! ĳ�����̸�/ĳ���� Pointer
    void ChaNameAdd(const std::string& ChaName, GLCharAG* pChar);
    void ChaNameDel(const std::string& ChaName);
    GLCharAG* GetCharByChaName(const std::string& ChaName);
    
    void ChaNameSearch(
        GLCharAG* pChar,
        DWORD MapId,
        const std::string& findName,
        std::vector<std::string>& charNameVec,
        bool bSearchGM);

    void ChaNameSearch(
        GLCharAG* pChar,
        DWORD MapId,
        const std::string& findName,
        std::vector<std::pair<int, std::string> >& charNameVec,
        bool bSearchGM);

	void ChaSaveUserNumAdd( DWORD dwUserNum );
	void ChaSaveUserNumDel( DWORD dwUserNum );
	bool ChaSaveUserNumExist( DWORD dwUserNum );

	void ChaJoinUserNumAdd( DWORD dwUserNum );
	void ChaJoinUserNumDel( DWORD dwUserNum );
	bool ChaJoinUserNumExist( DWORD dwUserNum );

};