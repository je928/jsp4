<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="<%=rootPath%>/css/sign.css"/>
</head>
<script>
	function callback(obj) {
		//var obj = JSON.parse(re);
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
	
	// jquery start
	$(document).ready(function() {
		$("#loginBtn").click(function () {
			var url = "list.user";
			var id = $("#id").val();
			var pwd = $("#pwd").val();
			var params = {};
			params["id"] = id;
			params["pwd"] = pwd;
			params["cmd"] = "login";
			$.ajax({
				type: "post",
				url: url,
				dataType: "json",
				data: params,
				success: callback,
				error: function(xhr,status) {
					alert("에러 : "+xhr.responseText);
				}
			});
		});
	});
	
</script>
<body>
	
<%
	if(user != null) {
%>
	<div class="container">
		<div class="page-header">
			<h1>Welcome</h1>
		</div>
		<div class="well">
        	<p><%=user.getUserName() %>님 환영합니다.</p>
        </div>
	</div>
<%
	} else {
%>
<div class="container">
	<form class="form-signin" action="/login.user" method="post">
		<h2 class="form-signin-heading">Login</h2>
		<label for="inputEmail" class="sr-only">ID</label>
		<input type="text" id="id" name="id" class="form-control" placeholder="ID" required autofocus>
		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password" required>
		<div id="resultDiv" style="color:red; font-size:14px;"></div>
		<p>
		<div class="checkbox">
			<label>
				<input type="checkbox" value="remember-me">Remember me
			</label>
		</div>
		<input class="btn btn-lg btn-primary btn-block" type="button" value="Login" id="loginBtn">
	</form>
</div>
<%
	}
%>

</body>
</html>