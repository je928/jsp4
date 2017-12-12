<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.test.jsp.dto.UserInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP4</title>
<script src="/js/AjaxUtil.js" type="text/javascript"></script>
</head>
<%
	//HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("user");
	// (HashMap<String,String>)session.getAttribute("user") : 경고, Object-HashMap
	UserInfo user = (UserInfo)session.getAttribute("user");
	String log = "로그인";
	String url = "/user/login.jsp";
	if(user != null) {
		log = "로그아웃";
		url = "/user/logout.user?cmd=logout";
	}
%>
<body>

	<a href="/index.jsp">Home</a>
	<a href="<%=url%>"><%=log%></a>
	<a href="/index.jsp">회원가입</a>
	<a href="/exam/exam.jsp">게시판</a>
	<a href="/user/login.jsp">유저리스트</a>
	<p>
	
</body>
</html>