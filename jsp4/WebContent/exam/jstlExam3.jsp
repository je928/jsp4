<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<div class="page-header">
			<h1>jstlExam3</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<%
				RequestDispatcher reqD = this.getServletContext().getRequestDispatcher("/exam/jstlExam4.jsp");
				request.setAttribute("jsp4", "jsp4Example");
				session.setAttribute("session", "sessionExample");
				reqD.forward(request, response);
				/* jstlExam4로 바로 이동함. request페이지간이동*/
				%>
			</div>
		</div>
	</div>
	
</body>
</html>