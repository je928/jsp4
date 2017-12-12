<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<script>
	function callback(re) {
		var obj = JSON.parse(re);
		if(obj.result == 'ok') {
			location.reload();
		}else {
			document.getElementById("resultDiv").innerHTML = obj.msg;			
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
</script>
<body>
	
<%
	if(user != null) {	
		out.println(user.getUserName() + "님 환영합니다.");
	} else {
%>
	<form method="post" action="/test.user">
		아이디 : <input type="text" name="id" id="id" />
		<br>
		비밀번호 : <input type="password" name="pwd" id="pwd" />
		<div id="resultDiv" style="color:red; padding-top: 10px; font-size:14px;"></div>
		<p>
		<input type="button" value="login" onClick="login()" />
	</form>
<%
	}
%>

</body>
</html>