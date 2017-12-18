<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserView</title>
<link rel="stylesheet" href="<%=rootPath%>/css/join.css"/>
</head>
<script>
	
	function callback(result) {
		for(var key in result) {
			$("#" + key).val(result[key]);
		}
	}
	
	$(document).ready(function() {
		var url = "view.user";
		var param = {};
		param["cmd"] = "view";
		param["userno"] = "<%=request.getParameter("userno")%>";
		$.ajax({
			type: "post",
			url: url,
			dataType: "json",
			data: param,
			success: callback,
			error: function(xhr,status) {
				alert("에러 : "+xhr.responseText);
			}
		});
		
		$('#userListBtn').click(function () {
			location.href = "/user/list.jsp";	
		});
	});
	
</script>
<body>

	<div class="container">
		<div class="page-header">
			<h1>UserView</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-signin">
					<label for="id" class="sr-only">ID</label>
					<input type="text" id="userId" name="userId" class="form-control" placeholder="ID" disabled required>
					
					<label for="pwd" class="sr-only">Password</label>
					<input type="password" name="userPwd" id="userPwd" class="form-control" placeholder="Password" disabled required>
					
					<label for="name" class="sr-only">Name</label>
					<input type="text" name="userName" id="userName" class="form-control" placeholder="Name" disabled required>
					
					<label for="age" class="sr-only">Age</label>
					<input type="text" name="userAge" id="userAge" class="form-control" placeholder="Age" disabled required>
					
					<label for="address" class="sr-only">Address</label>
					<input type="text" name="userAddress" id="userAddress" class="form-control" placeholder="Address" disabled required>
					
					<label for="dino" class="sr-only">DiNo</label>
					<input type="text" name="diNo" id="diNo" class="form-control" placeholder="Dino" disabled required>
					
					<label for="diname" class="sr-only">DiName</label>
					<input type="text" name="diName" id="diName" class="form-control" placeholder="Diname" disabled required>
					
					<label for="dietc" class="sr-only">DiEtc</label>
					<input type="text" name="diEtc" id="diEtc" class="form-control" placeholder="Dietc" disabled required>
					
					<input class="btn btn-lg btn-default btn-block" type="button" value="유저리스트" id="userListBtn">
					
					<label for="checkpwd" class="sr-only">CheckPwd</label>
					<input type="text" name="checkPwd" id="checkPwd" class="form-control" placeholder="checkPwd" style="margin-top:10px;">
					<%
						if((user != null) && 
							 user.getUserNo().toString().equals(request.getParameter("userno"))) {
					%>
					<input class="btn btn-lg btn-primary btn-block" type="button" value="회원수정" id="userListBtn" style="margin-top:5px;">
					<input class="btn btn-lg btn-primary btn-block" type="button" value="회원탈퇴" onclick="deleteUser()">
					<%
						}
					%>
					<script>
					
						function callbackDelete(result) {
							if(result.result == "ok") {
								location.href = "result.url";
							}
						}	
					
						function deleteUser() {
							var url = "delete.user";
							var param = {};
							param["cmd"] = "delete";
							param["checkPwd"] = $('#checkPwd').val();
							$.ajax({
								type: "post",
								url: url,
								dataType: "json",
								data: param,
								success: callbackDelete,
								error: function(xhr,status) {
									alert("에러 : "+xhr.responseText);
								}
							});
						}
					</script>
				</form>
			</div>
		</div>
	</div>

</body>
</html>