<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<script>
	function callback(re) {
		var obj = JSON.parse(re);
		if(obj.result == 'no') {
			document.getElementById("resultDiv").innerHTML = obj.msg;	
		}else {
			location.reload();
		}
		
	}
	function login() {
		//var params = '{"id":"test","pwd":"test"}';
		//params = JSON.parse(params);
		
		var url = "list.user";
		var id = document.getElementById("id");
		var pwd = document.getElementById("pwd");
		var param = '?cmd=login&id=' + id.value + '&pwd=' + pwd.value;
		var au = new AjaxUtil(url,param);
		au.changeCallBack(callback);
		au.send();
	}
	
	function logOut() {
		alert("logOut 기능구현중.");
	}
</script>
<body>
	
	<jsp:include page="/common/header.jsp"></jsp:include>
<%
	HashMap<String,String> user = (HashMap<String,String>)session.getAttribute("user");
	if(user != null) {	
		out.println(user.get("username") + "님 환영합니다.");
%>
	<p>
	<input type="button" value="logOut" onClick="logOut()" />
<%
	} else {
%>
	<div id="resultDiv" style="color:red; padding-bottom: 10px;"></div>
	
	<form method="post" action="/test.user">
		아이디 : <input type="text" name="id" id="id" />
		<br>
		비밀번호 : <input type="password" name="pwd" id="pwd" />
		<p>
		<input type="button" value="login" onClick="login()" />
	</form>
<%
	}
%>

</body>
</html>