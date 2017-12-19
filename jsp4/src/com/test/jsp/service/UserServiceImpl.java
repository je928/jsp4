package com.test.jsp.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.jsp.common.DBCon;
import com.test.jsp.dto.UserInfo;

public class UserServiceImpl implements UserService {
	
	//public HashMap<String,String> getUser(String id, String pwd) throws ClassNotFoundException, SQLException { 
	public UserInfo getUser(String id, String pwd) throws ClassNotFoundException, SQLException {
		
		DBCon dbCon = new DBCon();
		
		Connection con = dbCon.getConnection();
		
		String sql = "select * from user_info ui left outer join " + 
				" depart_info di" + 
				" on ui.dino=di.dino" +
				" where 1=1 and ui.userid=? and ui.userpwd=?";
				/*" and ui.userid='" + id + "'";*/ //절대로 사용하면 안됌. 
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id); // 바인딩
		ps.setString(2, pwd); // 바인딩
		ResultSet rs = ps.executeQuery();
		UserInfo ui = new UserInfo();
		while (rs.next()) {
			ui.setUserNo(rs.getInt("userno"));
			ui.setUserName(rs.getString("username"));
			ui.setUserId(rs.getString("userid"));
			ui.setUserPwd(rs.getString("userpwd"));
			ui.setUserAge(rs.getInt("userage"));
			ui.setUserAddress(rs.getString("useraddress"));
			ui.setDiNo(rs.getInt("dino"));
			ui.setDiName(rs.getString("diname"));
			ui.setDiEtc(rs.getString("dietc"));
		}
		return ui;
		
	}
	
	//public ArrayList<HashMap<String,String>> getUserList() { 
	public ArrayList<UserInfo> getUserList() {
		
		//ArrayList<HashMap<String, String>> al = new ArrayList<HashMap<String, String>>();
		ArrayList<UserInfo> al = new ArrayList<UserInfo>();
		DBCon dbCon = new DBCon();
		
		try {
			
			Connection con = dbCon.getConnection();
			
			String sql = "select * from user_info ui left outer join " + 
					" depart_info di" + 
					" on ui.dino=di.dino;";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			//HashMap<String, String> hm;
			while (rs.next()) {
				/*hm = new HashMap<String, String>();
				hm.put("userno", rs.getString("userno"));
				hm.put("username", rs.getString("username"));
				hm.put("userid", rs.getString("userid"));
				hm.put("userpwd", rs.getString("userpwd"));
				hm.put("userage", rs.getString("userage"));
				hm.put("useraddress", rs.getString("useraddress"));
				hm.put("dino", rs.getString("dino"));
				hm.put("diname", rs.getString("diname"));
				hm.put("dietc", rs.getString("dietc"));
				al.add(hm);*/
				
				UserInfo ui = new UserInfo();
				ui.setUserNo(rs.getInt("userno"));
				ui.setUserName(rs.getString("username"));
				ui.setUserId(rs.getString("userid"));
				ui.setUserPwd(rs.getString("userpwd"));
				ui.setUserAge(rs.getInt("userage"));
				ui.setUserAddress(rs.getString("useraddress"));
				ui.setDiNo(rs.getInt("dino"));
				ui.setDiName(rs.getString("diname"));
				ui.setDiEtc(rs.getString("dietc"));
				al.add(ui);
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
	
	public int insertUser(HashMap hm) {
		
		int result = 0;
		DBCon dbCon = new DBCon();
		
		try {
			
			Connection con = dbCon.getConnection();
			
			String sql = "insert into user_info(" + 
					" username,userid,userpwd,userage,useraddress" + 
					" ) values (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, (String)hm.get("name"));
			ps.setString(2, (String)hm.get("id"));
			ps.setString(3, (String)hm.get("pwd"));
			ps.setString(4, (String)hm.get("age"));
			ps.setString(5, (String)hm.get("address"));
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				dbCon.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int insertUser(UserInfo ui) {
		
		int result = 0;
		DBCon dbCon = new DBCon();

		try {
			
			Connection con = dbCon.getConnection();
			
			String sql = "insert into user_info(" + 
					" username,userid,userpwd,userage,useraddress" + 
					" ) values (?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ui.getUserName());
			ps.setString(2, ui.getUserId());
			ps.setString(3, ui.getUserPwd());
			ps.setInt(4, ui.getUserAge());
			ps.setString(5, ui.getUserAddress());
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				dbCon.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public UserInfo getUser(int no) {
		
		DBCon dbCon = new DBCon();
		Connection con = null;
		UserInfo ui = null;
		
		try {
			
			con = dbCon.getConnection();
			String sql = "select * from user_info ui left outer join " + 
					" depart_info di" + 
					" on ui.dino=di.dino" +
					" where 1=1 and ui.userno=?";
					/*" and ui.userid='" + id + "'";*/ //절대로 사용하면 안됌. 
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, no); // 바인딩
			ResultSet rs = ps.executeQuery();
			ui = new UserInfo();
			while (rs.next()) {
				ui.setUserNo(rs.getInt("userno"));
				ui.setUserName(rs.getString("username"));
				ui.setUserId(rs.getString("userid"));
				ui.setUserPwd(rs.getString("userpwd"));
				ui.setUserAge(rs.getInt("userage"));
				ui.setUserAddress(rs.getString("useraddress"));
				ui.setDiNo(rs.getInt("dino"));
				ui.setDiName(rs.getString("diname"));
				ui.setDiEtc(rs.getString("dietc"));
			}
		
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			con = null;
		}
		return ui;
	}

	public int deleteUser(UserInfo ui) {
		int result = 0;
		DBCon dbCon = new DBCon();
		
		try {
			
			Connection con = dbCon.getConnection();
			
			String sql = "select count(1) from user_info where userno=? and userpwd=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, ui.getUserNo());
			ps.setString(2, ui.getUserPwd());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt == 1) {
					sql = "delete from user_info where userno=?";
					ps = con.prepareStatement(sql);
					ps.setInt(1, ui.getUserNo());
					result = ps.executeUpdate();
				}
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
		return result;
	}
	
	public int updateUser(UserInfo ui) {
		int result = 0;
		DBCon dbCon = new DBCon();
		
		try {
			
			Connection con = dbCon.getConnection();
			
			String sql = "update user_info set username=?, userpwd=?, userage=?, useraddress=?, dino=? where userno=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ui.getUserName());
			ps.setString(2, ui.getUserPwd());
			ps.setInt(3, ui.getUserAge());
			ps.setString(4, ui.getUserAddress());
			ps.setInt(5, ui.getDiNo());
			ps.setInt(6, ui.getUserNo());
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				dbCon.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
