#pragma once

#include "afxwin.h"
#include "afxcmn.h"
#include <vector>
#include "DatabaseTable.h"
#include "resource.h"
#include "MinEdit.h"

// CFormLeft �� ���Դϴ�.
class CFormLeft : public CFormView
{
	DECLARE_DYNCREATE(CFormLeft)

protected:
	CFormLeft();           // ���� ����⿡ ���Ǵ� protected �������Դϴ�.
	virtual ~CFormLeft();

public:
	enum { IDD = IDD_FORMLEFT };
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

public:
	CMinEdit m_Edit;
	BOOL m_bInit;
	int nSelectedItem;		
	CListCtrl m_Folder;		
	std::vector<FolderList> m_vFolder;

	void InitListHead();
	void InitListData();
	BOOL RecursiveRemoveDirectory(const CString& szPath);

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV �����Դϴ�.

	DECLARE_MESSAGE_MAP()
public:
	virtual void OnInitialUpdate();		
	afx_msg void OnSize(UINT nType, int cx, int cy);	
	afx_msg void OnLvnItemchangedList1(NMHDR *pNMHDR, LRESULT *pResult);
	afx_msg void OnNMRclickList1(NMHDR *pNMHDR, LRESULT *pResult);	
	afx_msg void OnMakeCmd();
	afx_msg void OnDeleteCmd();
    afx_msg void OnTimer(UINT nIDEvent);
};


