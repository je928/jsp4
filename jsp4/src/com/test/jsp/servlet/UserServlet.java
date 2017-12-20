package com.test.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.test.jsp.dto.UserInfo;
import com.test.jsp.service.UserService;
import com.test.jsp.service.UserServiceImpl;

import sun.swing.UIAction;

public class UserServlet extends HttpServlet {
	
	UserService us = new UserServiceImpl();
	/*di(의존성 주입), ioc : anotation, useBean */
	
	public void doGet(HttpServletRequest req, 
			HttpServletResponse res) throws IOException, ServletException {
		doProcess(req,res);
	}

	public void doPost(HttpServletRequest req, 
			HttpServletResponse res) throws IOException, ServletException {
		doProcess(req,res);
	}
	
	private void doProcess(HttpServletRequest req, 
			HttpServletResponse res) throws IOException, ServletException {

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = res.getWriter();
		
		String cmd = req.getParameter("cmd");
		
		if(cmd==null) {
			res.sendRedirect("/error/error.jsp");
		}else if(cmd.equals("list")) {
			//String html = "";
			ArrayList<UserInfo> userList = us.getUserList();
			/*for(HashMap<String,String> map : userList) {
				html += "<tr>";
				Iterator<String> it = map.keySet().iterator();
				while(it.hasNext()) {
					String key = it.next();
					html += "<td>"+map.get(key)+"</td>";
				}
				html += "</tr>";
			}
			HashMap<String,String> hm = new HashMap<String,String>();
			hm.put("html", html);*/
			Gson gs = new Gson();
			out.println(gs.toJson(userList));
		}else if(cmd.equals("login")) {
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			HashMap<String,String> hm = new HashMap<String,String>();
			try {
				UserInfo ui = us.getUser(id, pwd);
				if(ui.getUserId() == null) {
					hm.put("result", "no");
					hm.put("msg","아이디와 비밀번호를 확인하세요.");
				}else {
					HttpSession hs = req.getSession();
					hs.setAttribute("user", ui);
					hm.put("result", "ok");
					hm.put("msg", ui.getUserName() + "님 로그인 성공.");
				}
				Gson gs = new Gson();
				out.println(gs.toJson(hm)); // 구글에서 만든 json 매퍼객체, spring에서는 jackson을 많이 사용.
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(cmd.equals("logout")) {
			HttpSession hs = req.getSession();
			hs.invalidate();
			res.sendRedirect("/user/login.jsp");
		}else if(cmd.equals("join")) {
			String params= req.getParameter("params");
			Gson gs = new Gson();
			/*HashMap hm = gs.fromJson(params, HashMap.class);
			int result = us.insertUser(hm);*/
			UserInfo ui = gs.fromJson(params, UserInfo.class);
			int result = us.insertUser(ui);
			HashMap<String,String> hm = new HashMap<String,String>();
			hm.put("result", "no");
			hm.put("msg", "회원가입 실패.");
			if(result != 0) {
				hm.put("result", "ok");
				hm.put("msg", "회원가입 성공.");
				hm.put("url", "/user/login.jsp");
			}
			out.println(gs.toJson(hm));
		}else if(cmd.equals("view")) {
			int no = Integer.parseInt(req.getParameter("userno"));
			UserInfo ui = us.getUser(no);
			Gson gs = new Gson();
			out.println(gs.toJson(ui));
		}else if(cmd.equals("delete")) {
			String checkPwd = req.getParameter("checkPwd");
			UserInfo ui = (UserInfo)req.getSession().getAttribute("user");
			ui.setUserPwd(checkPwd);
			int result = us.deleteUser(ui);
			HashMap<String,String> hm = new HashMap<String,String>();
			hm.put("result", "no");
			hm.put("msg", "비밀번호를 확인해주세요.");
			if(result != 0) {
				hm.put("result", "ok");
				hm.put("msg", "회원탈퇴 성공.");
				hm.put("url", "/user/logout.user?cmd=logout");
			}
			Gson gs = new Gson();
			out.println(gs.toJson(hm));
		}else if(cmd.equals("update")) {
			String params= req.getParameter("params");
			Gson gs = new Gson();
			UserInfo ui = gs.fromJson(params, UserInfo.class);
			ui.setUserNo(((UserInfo)req.getSession().getAttribute("user")).getUserNo());
			ui.setUserId(((UserInfo)req.getSession().getAttribute("user")).getUserId());
			int result = us.updateUser(ui);
			HashMap<String,String> hm = new HashMap<String,String>();
			hm.put("result", "no");
			hm.put("msg", "회원수정 실패.");
			if(result != 0) {
				hm.put("result", "ok");
				hm.put("msg", "회원수정 성공.");
				hm.put("url", "/user/view.jsp?userno="+ui.getUserNo());
			}
			out.println(gs.toJson(hm));
		}else if(cmd.equals("checkPwd")) {
			String checkPwd = req.getParameter("checkPwd");
			UserInfo ui = us.getUser(Integer.parseInt(req.getParameter("userNo")));
			String userPwd = ui.getUserPwd();
			HashMap<String,String> hm = new HashMap<String,String>();
			hm.put("result", "no");
			hm.put("msg", "비밀번호 다름.");
			if(checkPwd.equals(userPwd)) {
				hm.put("result", "ok");
				hm.put("msg", "");
			}
			Gson gs = new Gson();
			out.println(gs.toJson(hm));
		}else {
			res.sendRedirect("/error/error.jsp");
		}
		
	}

}

