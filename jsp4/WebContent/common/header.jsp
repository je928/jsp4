<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.test.jsp.dto.UserInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String rootPath = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP4</title>
<script src="<%=rootPath%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=rootPath%>/js/ajax_util.js"></script>
<script src="<%=rootPath%>/js/header.js"></script>
<script src="<%=rootPath%>/ui/btsp3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.3.2/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=rootPath%>/ui/btsp3.3.2/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="<%=rootPath%>/css/common.css"/>
<script type="text/javascript">
	function logoutFunc() {
		if(confirm("로그아웃하시겠습니까?")) {
			location.href="/user/logout.user?cmd=logout";	
		}
	}
</script>
</head>
<%
	//HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("user");
	// (HashMap<String,String>)session.getAttribute("user") : 경고, Object-HashMap
	UserInfo user = (UserInfo)session.getAttribute("user");
	String log = "Login";
	String url = rootPath + "/user/login.jsp";
	if(user != null) {
		log = "Logout";
		url = "javascript:logoutFunc();";
	}
%>
<body>
	
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
	  			<a class="navbar-brand" href="<%=rootPath%>/">Project</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li id="homejsp"><a href="<%=rootPath%>/">Home</a></li>
					<li id="loginjsp"><a href="<%=url%>"><%=log%></a></li>
					<li id="joinjsp"><a href="<%=rootPath%>/user/join.jsp">Join</a></li>
					<li id="listjsp"><a href="<%=rootPath%>/user/board.jsp">Board</a></li>
					<li id="userlistjsp"><a href="<%=rootPath%>/user/list.jsp">UserList</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>
	
</body>
</html>