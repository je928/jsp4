<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.test.jsp.common.ListExam" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table th {
		background: #dddddd;
	}
	table tr:nth-child(odd) {
		background: #cccccc;
	}
	table tr:nth-child(even) {
		background: #dcdcdc;
	}
	table th, td {
		padding: 5px;
	}
</style>
</head>
<body>

<%
	ListExam le = new ListExam();
	
	ArrayList<HashMap<String,String>> userList = le.getUserList();
%>
	<jsp:include page="/common/header.jsp"></jsp:include>
	
	<table border="1" style="text-align:center;">
		<tr>
			<th>userno</th>
			<th>userid</th>
			<th>userpwd</th>
			<th>username</th>
			<th>userage</th>
			<th>useraddress</th>
			<th>dino</th>
			<th>diname</th>
			<th>dietc</th>
		</tr>
<%
	for(HashMap<String,String> map : userList) {
		out.println("<tr>");
		out.println("<td>"+map.get("userno")+"</td>");
		out.println("<td>"+map.get("userid")+"</td>");
		out.println("<td>"+map.get("userpwd")+"</td>");
		out.println("<td>"+map.get("username")+"</td>");
		out.println("<td>"+map.get("userage")+"</td>");
		out.println("<td>"+map.get("useraddress")+"</td>");
		out.println("<td>"+map.get("dino")+"</td>");
		out.println("<td>"+map.get("diname")+"</td>");
		out.println("<td>"+map.get("dietc")+"</td>");
		out.println("</tr>");
	}
%>
	</table>
</body>
</html>