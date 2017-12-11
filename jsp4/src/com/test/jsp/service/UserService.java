package com.test.jsp.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public interface UserService {

	public ArrayList<HashMap<String,String>> getUserList();
	public HashMap<String,String> getUser(String id, String pwd) throws ClassNotFoundException, SQLException; // throws도 오버라이딩(접근제어자,메소드이름,매개변수,리턴타입)
	
}
