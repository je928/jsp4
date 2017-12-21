<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.test.jsp.common.ListExam" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	<!-- page import형식은 java파일을 만들지 않는다. jsp:include액션태그는 java파일 생성. -->
	
	<div class="container">
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
		Iterator<String> it = map.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			out.println("<td>"+map.get(key)+"</td>");
		}
		out.println("</tr>");
	}
%>
		</table>
	</div>
</body>
</html>