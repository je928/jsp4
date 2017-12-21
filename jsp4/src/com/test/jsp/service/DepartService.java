package com.test.jsp.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.test.jsp.dto.DepartInfo;

public interface DepartService {

	//public void selectDepartList(HttpServletRequest req);
	//public ArrayList<HashMap<String,Object>> selectDepartList();
	public ArrayList<DepartInfo> selectDepartList();
	//public void selectDepartView(HttpServletRequest req);
	//public HashMap<String,Object> selectDepartView();
	public DepartInfo selectDepartView(int dino);
	public void updateDepart(HttpServletRequest req);
	public void insertDepart(HttpServletRequest req);
	
}
