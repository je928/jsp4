<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<script>
	function login() {
		var url = "list.user";
		var param = '?cmd=list';
		var au = new AjaxUtil(url,param);
		au.send();
	}
</script>
<body>
	
	<jsp:include page="/common/header.jsp"></jsp:include>
	
	<form method="post" action="/test.user">
		아이디 : <input type="text" name="id" id="id" />
		<br>
		비밀번호 : <input type="password" name="pwd" id="pwd" />
		<p>
		<input type="button" value="login" onClick="login()" />
	</form>

</body>
</html>