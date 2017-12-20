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
	
	function callbackDelete(result) {
		if(result.result == "ok") {
			alert(result.msg);
			location.href = result.url;
		}else {
			alert(result.msg);
		}
	}
	
	function callbackChkPwd(result) {
		if(result.result == "ok") {
			$("#userPwd").attr("disabled", false);
			$("#userName").attr("disabled", false);
			$("#userAge").attr("disabled", false);
			$("#userAddress").attr("disabled", false);
			$("#diNo").attr("disabled", false);
			$("#diName").remove();
			$("#diEtc").remove();
			$("#checkPwd").remove();
			$("#updateUserBtn").attr("id", "updateUser");
		}else {
			alert(result.msg);
		}
	}
	
	function callbackUpdate(result) {
		if(result.result == "ok") {
			alert(result.msg);
			location.reload();
		}else {
			alert(result.msg);
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
		
		$('#deleteUserBtn').click(function() {
			if(confirm("회원탈퇴하시겠습니까?")) {
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
		});
		
		$(document).on("click","#updateUserBtn", function() {
			var url = "checkpwd.user";
			var param = {};
			param["cmd"] = "checkPwd";
			param["checkPwd"] = $('#checkPwd').val();
			param["userNo"] = "<%=request.getParameter("userno")%>";
			$.ajax({
				type: "post",
				url: url,
				dataType: "json",
				data: param,
				success: callbackChkPwd,
				error: function(xhr,status) {
					alert("에러 : "+xhr.responseText);
				}
			});
		});
		
		$(document).on("click","#updateUser", function() {
			if(confirm("수정하시겠습니까?")) {
				var url = "update.user";
				var params = {};
				params["userName"] = $("#userName").val();
				params["userPwd"] = $("#userPwd").val();
				params["userAge"] = $("#userAge").val();
				params["userAddress"] = $("#userAddress").val();
				params["diNo"] = $("#diNo").val();
				var param = {};
				param["cmd"] = "update";
				param["params"] = JSON.stringify(params);
				$.ajax({
					type: "post",
					url: url,
					dataType: "json",
					data: param,
					success: callbackUpdate,
					error: function(xhr,status) {
						alert("에러 : "+xhr.responseText);
					}
				});
			}
		});
		
		$('#userListBtn').click(function() {
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
					<input type="number" name="userAge" id="userAge" class="form-control" placeholder="Age" disabled required>
					
					<label for="address" class="sr-only">Address</label>
					<input type="text" name="userAddress" id="userAddress" class="form-control" placeholder="Address" disabled required>
					
					<label for="dino" class="sr-only">DiNo</label>
					<input type="number" name="diNo" id="diNo" class="form-control" placeholder="Dino" disabled required>
					
					<label for="diname" class="sr-only">DiName</label>
					<input type="text" name="diName" id="diName" class="form-control" placeholder="Diname" disabled required>
					
					<label for="dietc" class="sr-only">DiEtc</label>
					<input type="text" name="diEtc" id="diEtc" class="form-control" placeholder="Dietc" disabled required>
					
					<input class="btn btn-lg btn-primary btn-block" type="button" value="유저리스트" id="userListBtn">
					
					<label for="checkpwd" class="sr-only">CheckPwd</label>
					
					<%
						if((user != null) && 
							 user.getUserNo().toString().equals(request.getParameter("userno"))) {
					%>
					<input type="text" name="checkPwd" id="checkPwd" class="form-control" placeholder="checkPwd" style="margin-top:10px;">
					<input class="btn btn-lg btn-default btn-block" type="button" value="회원수정" id="updateUserBtn" style="margin-top:5px;">
					<input class="btn btn-lg btn-default btn-block" type="button" value="회원탈퇴" id="deleteUserBtn">
					<%
						}
					%>
				</form>
			</div>
		</div>
	</div>

</body>
</html>