package com.test.jsp.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.jsp.common.DBCon;

public class UserServiceImpl implements UserService {
	
	public HashMap<String,String> getUser(String id, String pwd) throws ClassNotFoundException, SQLException { 
		
		HashMap<String,String> hm = new HashMap<String,String>();
		DBCon dbCon = new DBCon();
		
		Connection con = dbCon.getConnection();
		
		String sql = "select * from user_info ui, " + 
				" depart_info di" + 
				" where ui.dino=di.dino" +
				" and ui.userid=? and ui.userpwd=?";
				/*" and ui.userid='" + id + "'";*/ //절대로 사용하면 안됌. 
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id); // 바인딩
		ps.setString(2, pwd); // 바인딩
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			hm = new HashMap<String, String>();
			hm.put("userno", rs.getString("userno"));
			hm.put("username", rs.getString("username"));
			hm.put("userid", rs.getString("userid"));
			hm.put("userpwd", rs.getString("userpwd"));
			hm.put("userage", rs.getString("userage"));
			hm.put("useraddress", rs.getString("useraddress"));
			hm.put("dino", rs.getString("dino"));
			hm.put("diname", rs.getString("diname"));
			hm.put("dietc", rs.getString("dietc"));
		}
		return hm;
		
	}
	
	public ArrayList<HashMap<String,String>> getUserList() { 
		
		ArrayList<HashMap<String, String>> al = new ArrayList<HashMap<String, String>>();
		DBCon dbCon = new DBCon();
		
		try {
			
			Connection con = dbCon.getConnection();
			
			String sql = "select * from user_info ui, " + 
					" depart_info di" + 
					" where ui.dino=di.dino;";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			HashMap<String, String> hm;
			while (rs.next()) {
				hm = new HashMap<String, String>();
				hm.put("userno", rs.getString("userno"));
				hm.put("username", rs.getString("username"));
				hm.put("userid", rs.getString("userid"));
				hm.put("userpwd", rs.getString("userpwd"));
				hm.put("userage", rs.getString("userage"));
				hm.put("useraddress", rs.getString("useraddress"));
				hm.put("dino", rs.getString("dino"));
				hm.put("diname", rs.getString("diname"));
				hm.put("dietc", rs.getString("dietc"));
				al.add(hm);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				dbCon.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return al;
		
	}
	
}
