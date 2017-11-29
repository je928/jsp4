<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>

<script>
/* 
dom: document object mode
bom: browser object mode
*/
function checkValue() {
	var id = document.getElementById('id');
	var pwd = document.getElementById('pwd');
	if(id.value.trim()==''){
		alert('아이디를 입력해주세요.');
		id.focus();
		return false;
	}
	if(pwd.value.trim()==''){
		alert('비밀번호를 입력해주세요.');
		pwd.focus();
		return false;
	}
	return true;
}

function formSubmit() {
	var param = {};
	param["id"] = document.getElementById("id").value;
	param["pwd"] = document.getElementById("pwd").value;
	//alert(param.id);
	//alert(param.pwd);
	//alert(JSON.stringify(param));
	
	
}
</script>

<form method="post" action="/test.login" onsubmit="return checkValue()">
	아이디 : <input type="text" name="id" id="id" />
	<br>
	비밀번호 : <input type="password" name="pwd" id="pwd" />
	<p>
	<input type="button" value="로그인" onClick="formSubmit()" />
</form>

</body>
</html>