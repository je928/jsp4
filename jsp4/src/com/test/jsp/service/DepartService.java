package com.test.jsp.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.test.jsp.dto.DepartInfo;

public interface DepartService {

	//public void selectDepartList(HttpServletRequest req);
	//public ArrayList<HashMap<String,Object>> selectDepartList();
	public ArrayList<DepartInfo> selectDepartList(String search, String searchStr);
	//public void selectDepartView(HttpServletRequest req);
	//public HashMap<String,Object> selectDepartView();
	public DepartInfo selectDepartView(int dino);
	public int updateDepart(DepartInfo di);
	public int insertDepart(DepartInfo di);
	public int deleteDepart(DepartInfo di);
	
}
