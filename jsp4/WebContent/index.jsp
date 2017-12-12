<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	var test = function() { // 변수함수선언
		this.a = 1;
		this.b = 2;
		var c = 3;
		this.getC = function() {
			return c;
		}
		this.getB = function() {
			return this.b;
		}
	}
	
	/* javascript는 실행 시 function ~() { } 함수선언을 모두 메모리에 적재. 변수함수선언 제외. */
	
	function func() { // 함수선언
		try {
		var t = new test();
		exam(); // javascript는 오버로딩이 되지 않는다. 오버라이딩만 됨.
		//alert(t.a);
		//alert(t.getC());
		//alert(t.getB());
		//alert(getB());
		}catch(e) {
			alert(e); // ReferenceError: getB is not defined
		}
	}
	/* null : 변수에 값이 존재하지 않을 떄, undifined : 변수를 선언하지 않을 때 */
	/* javascript: public, privated */
	function exam(a) {
		alert("111");
	}
	function exam(a,b) {
		alert("222");
	}
	
</script>
<body>
<%
	String str = request.getParameter("str");
	// .을 기준으로 오른쪽 : 함수 아니면 변수
	// 가로있으면 함수(void, return 타입), 없으면 변수
	out.println("str : "+str + "<p>");
	
	String a = "hello";
	String b = "java";
	int num = 2;
	
	if(num == 2) {
%>
	<input type="text" name="a" id="a" value="<%=a %>" />
	<br>
	<input type="text" name="b" id="b" value="<%=b %>" />
	<input type="button" value="확인" onClick="func()" />
<%
	}else {
%>
	존재안함.
<%
	}

%>	
</body>
</html>