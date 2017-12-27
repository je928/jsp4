package com.test.jsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.dto.DepartInfo;
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

		/*req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");*/
		/*톰캣 web.xml 순서 filter -> servlet */
		/*이곳에 오기전에 어떤 url이든 filter 클래스를 거치게 된다. 
		  filter 클래스에서 인코딩을 하고 fc.doFilter가 실행되는 순간 doGet이나, doPost로 온다.*/

		PrintWriter out = res.getWriter();
		String uri = req.getRequestURI();
		String cmd = getCommandFormUri(uri);
		// uri = uri.replace("/dept", "/depart"); // uri 변환, 변환하지 않으면 무한호출.
		
		if(cmd.equals("list")) {
			//ds.selectDepartList(req);
			String search = req.getParameter("searchOption");
			String searchStr = req.getParameter("searchStr");
			req.setAttribute("departList", ds.selectDepartList(search, searchStr));
			req.setAttribute("search", search);
			req.setAttribute("searchStr", searchStr);
		}else if(cmd.equals("view")) {
			int dino = Integer.parseInt(req.getParameter("dino"));
			req.setAttribute("depart", ds.selectDepartView(dino));
		}else if(cmd.equals("update")) {
			int dino = Integer.parseInt(req.getParameter("dino"));
			req.setAttribute("depart", ds.selectDepartView(dino));
		}else if(cmd.equals("updateOk")) {
			int dino = Integer.parseInt(req.getParameter("diNo"));
			String diName = req.getParameter("diName");
			String diEtc = req.getParameter("diEtc");
			DepartInfo di = new DepartInfo();
			di.setDiNo(dino);
			di.setDiName(diName);
			di.setDiEtc(diEtc);
			req.setAttribute("update", ds.updateDepart(di));
			req.setAttribute("diNo", dino);
			uri = "/depart/list";
		}else if(cmd.equals("insert")) {
			
		}else if(cmd.equals("insertOk")) {
			String diName = req.getParameter("diName");
			String diEtc = req.getParameter("diEtc");
			DepartInfo di = new DepartInfo();
			di.setDiName(diName);
			di.setDiEtc(diEtc);
			req.setAttribute("insert", ds.insertDepart(di));
			uri = "/depart/list";
		}else if(cmd.equals("delete")) {
			int diNo = Integer.parseInt(req.getParameter("dino"));
			DepartInfo di = new DepartInfo();
			di.setDiNo(diNo);
			int result = ds.deleteDepart(di);
			String msg = "삭제에 실패.";
			if(result != 0) {
				msg = "부서가 삭제되었습니다.";
			}
			req.setAttribute("msg", msg);
			uri = "/depart/list";
		}else {
			uri = "/error/error";
		}
		
		//RequestDispatcher reqD = req.getRequestDispatcher(uri+".jsp");
		RequestDispatcher reqD = req.getRequestDispatcher("/WEB-INF/view/" + uri+".jsp");
		reqD.forward(req, res);
	}

}

