package com.test.jsp.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class DepartServiceImpl implements DepartService {

	@Override
	//public void selectDepartList(HttpServletRequest req) {
	public ArrayList<HashMap<String,Object>> selectDepartList() {
		ArrayList<HashMap<String,Object>> departList = null;
		departList = new ArrayList<HashMap<String,Object>>();
		for(int i=1; i<=10; i++) {
			HashMap<String,Object> hm = new HashMap<String,Object>();
			hm.put("dino", i);
			hm.put("diname", i+"번째 부서");
			hm.put("didesc", i+"번째 부서설명");
			departList.add(hm);
		}
		//req.setAttribute("departList", departList);
		return departList;
	}

	@Override
	//public void selectDepartView(HttpServletRequest req) {
	public HashMap<String, Object> selectDepartView() {
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("dino", "1");
		hm.put("diname", "1번째부서");
		hm.put("didesc", "1번째부서설명");
		return hm;
	}

	@Override
	public void updateDepart(HttpServletRequest req) {
		
	}

	@Override
	public void insertDepart(HttpServletRequest req) {
		
	}
	
	
	
}
