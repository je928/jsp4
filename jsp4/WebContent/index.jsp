<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str = request.getParameter("str");
	// .을 기준으로 오른쪽 : 함수 아니면 변수
	// 가로있으면 함수(void, return 타입), 없으면 변수
	out.println("str : "+str);
	
	String aa = "aaa";
	String bb = "bbb";
	int a = 2;
	
	if(a == 1) {
%>
	<input type="text" name="aa" id="aa" value="<%=aa %>" />
	<br>
	<input type="text" name="bb" id="bb" value="<%=bb %>" />
	<input type="button" value="확인" />
<%
	}else {
%>
	존재안함.
<%
	}

%>

	
</body>
</html>