package com.test.jsp.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import com.test.jsp.common.DBCon;
import com.test.jsp.dao.DepartDAO;
import com.test.jsp.dao.DepartDAOImpl;
import com.test.jsp.dto.DepartInfo;

public class DepartServiceImpl implements DepartService {

	@Override
	//public void selectDepartList(HttpServletRequest req) {
	// public ArrayList<HashMap<String,Object>> selectDepartList() {
	public ArrayList<DepartInfo> selectDepartList() {
		//ArrayList<HashMap<String,Object>> departList = null;
		ArrayList<DepartInfo> departList = null;
		
		DBCon dbCon = new DBCon();
		try {
			DepartDAO dd = new DepartDAOImpl(dbCon.getConnection());
			departList = dd.selectDepartList();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				dbCon.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		/*departList = new ArrayList<HashMap<String,Object>>();
		for(int i=1; i<=10; i++) {
			HashMap<String,Object> hm = new HashMap<String,Object>();
			hm.put("dino", i);
			hm.put("diname", i+"번째 부서");
			hm.put("didesc", i+"번째 부서설명");
			departList.add(hm);
		}*/
		//req.setAttribute("departList", departList);
		return departList;
	}

	@Override
	//public void selectDepartView(HttpServletRequest req) {
	//public HashMap<String, Object> selectDepartView() {
	public DepartInfo selectDepartView(int dino) {
		
		DepartInfo depart = null;
		DBCon dbCon = new DBCon();
		
		try {
			DepartDAO dd = new DepartDAOImpl(dbCon.getConnection());
			depart = dd.selectDepartView(dino);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				dbCon.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/*HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("dino", "1");
		hm.put("diname", "1번째부서");
		hm.put("didesc", "1번째부서설명");
		return hm;*/
		return depart;
	}

	@Override
	public void updateDepart(HttpServletRequest req) {
		
	}

	@Override
	public void insertDepart(HttpServletRequest req) {
		
	}
	
}
