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
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		System.out.println("get 방식 : 로그인 서블릿 호출!!");
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print("입력하신 id = " + id + "<br>");
		pw.print("입력하신 pwd = " + pwd);
	}
	
	public void doPost(HttpServletRequest req, 
			HttpServletResponse res) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println("post 방식 : 로그인 서블릿 호출!!");
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.print("입력하신 id = " + id + "<br>");
		pw.print("입력하신 pwd = " + pwd);
	}
}

