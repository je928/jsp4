package com.test.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
	// 제어의 역전(Inversion of Control, IoC)
	public void doGet(HttpServletRequest req, 
			HttpServletResponse res) throws IOException, ServletException {
		System.out.println("get 방식 : 로그인 서블릿 호출!!");
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		pw.print("입력하신 id = " + id + "<br>");
		pw.print("입력하신 pwd = " + pwd);
	}
	
	public void doPost(HttpServletRequest req, 
			HttpServletResponse res) throws IOException, ServletException {
		System.out.println("post 방식 : 로그인 서블릿 호출!!");
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String testId = "test";
		String testPwd = "test";
		String msg = "";
		
		if(testId.equals(id)) {
			if(testPwd.equals(pwd)) {
				pw.print("로그인 성공");
			}else {
				msg = "비밀번호를 확인해주세요.";
			}
		}else {
			msg = id+"는 존재하지 않는 아이디입니다.";
		}
		
		if(!msg.equals("")) {
			pw.print("<script>");
			pw.print("alert('"+msg+"')");
			pw.print("</script>");
		}
		
	}
}

