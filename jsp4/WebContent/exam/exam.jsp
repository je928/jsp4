<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	ArrayList<HashMap<String,String>> al = new ArrayList<HashMap<String,String>>();
	HashMap<String,String> hm = new HashMap<String,String>();
	hm.put("name","홍길동");
	hm.put("age","33");
	al.add(hm);
	HashMap<String,String> hm1 = new HashMap<String,String>();
	hm1.put("name","길동이");
	hm1.put("age","55");
	al.add(hm1);
%>
	<jsp:include page="/common/header.jsp"></jsp:include>
	
	<table border="1" style="text-align:center;">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
<%
	for(HashMap<String,String> map : al) {
		out.println("<tr>");
		out.println("<td>"+map.get("name")+"</td>");
		out.println("<td>"+map.get("age")+"</td>");
		out.println("</tr>");
	}
	
%>
	</table>
</body>
</html>