package com.test.jsp.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface DepartService {

	//public void selectDepartList(HttpServletRequest req);
	public ArrayList<HashMap<String,Object>> selectDepartList();
	//public void selectDepartView(HttpServletRequest req);
	public HashMap<String,Object> selectDepartView();
	public void updateDepart(HttpServletRequest req);
	public void insertDepart(HttpServletRequest req);
	
}
