package com.test.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.service.DepartService;
import com.test.jsp.service.DepartServiceImpl;

public class DepartServlet extends HttpServlet {
	
	DepartService ds = new DepartServiceImpl();
	/*di(의존성 주입), ioc : anotation, useBean */
	
	public void doGet(HttpServletRequest req, 
			HttpServletResponse res) throws IOException, ServletException {
		doProcess(req,res);
	}

	public void doPost(HttpServletRequest req, 
			HttpServletResponse res) throws IOException, ServletException {
		doProcess(req,res);
	}
	
	public String getCommandFormUri(String uri) {
		int idx = uri.lastIndexOf("/");
		if(idx != -1) {
			return uri.substring(idx+1);
		}
		return uri;
	}
	
	private void doProcess(HttpServletRequest req, 
			HttpServletResponse res) throws IOException, ServletException {

		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = res.getWriter();
		String uri = req.getRequestURI();
		String cmd = getCommandFormUri(uri);
		uri = uri.replace("/dept", "/depart"); // uri 변환
		
		if(cmd.equals("list")) {
			ds.selectDepartList(req);
		}else if(cmd.equals("view")) {
			
		}else if(cmd.equals("update")) {
			
		}else if(cmd.equals("insert")) {
			
		}else {
			uri = "/error/error";
		}
		
		RequestDispatcher reqD = req.getRequestDispatcher(uri+".jsp");
		reqD.forward(req, res);
	}

}

