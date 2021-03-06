<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join</title>
<link rel="stylesheet" href="<%=rootPath%>/css/join.css"/>
</head>
<script>
	
	function afterLogin(obj) {
		//var obj = JSON.parse(re);
		if(obj.result == 'ok') {
			alert(obj.msg);
			location.href = obj.url;
		}else {
			alert(obj.msg);
		}
	}
	
	function callback(obj) {
		var str = "";
		/* 자바스크립트 foreach문 */
		/* for(var di of obj) {
			str += "<option value='" + di.diNo + "'>" + di.diName + "</option>";
		} */
		/* 자바스크립트 Iterator문?? */
		/* for(var di in obj) {
			var aa = obj[di];
			str += "<option value='" + aa.diNo + "'>" + aa.diName + "</option>";
		} */
		for(var i=0; i<obj.length; i++) {
			str += "<option value='" + obj[i].diNo + "'>" + obj[i].diName + "</option>";
		}
		$('#dino').html(str);
	}
	
	$(document).ready(function() {
		
		var url = "dino.user";
		var param = {};
		param["cmd"] = "dino";
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
		
		$("#joinBtn").click(function () {
			var url = "join.user";
			var params = {};
			/* params["id"] = $("#id").val();
			params["pwd"] = $("#pwd").val();
			params["name"] = $("#name").val();
			params["age"] = $("#age").val();
			params["address"] = $("#address").val(); */
			params["userId"] = $("#id").val();
			params["userPwd"] = $("#pwd").val();
			params["userName"] = $("#name").val();
			params["userAge"] = $("#age").val();
			params["userAddress"] = $("#address").val();
			params["diNo"] = $("#dino").val();
			var param = {};
			param["cmd"] = "join";
			param["params"] = JSON.stringify(params);
			$.ajax({
				type: "post",
				url: url,
				dataType: "json",
				data: param,
				success: afterLogin,
				error: function(xhr,status) {
					alert("에러 : "+xhr.responseText);
				}
			});
		});
		
	});
</script>
<body>

	<div class="container">
		<form class="form-signin">
			<h2 class="form-signin-heading">Join</h2>
			
			<label for="id" class="sr-only">ID</label>
			<input type="text" id="id" name="id" class="form-control" placeholder="ID" required autofocus>
			
			<label for="pwd" class="sr-only">Password</label>
			<input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password" required>
			
			<label for="name" class="sr-only">Name</label>
			<input type="text" name="name" id="name" class="form-control" placeholder="Name" required>
			
			<label for="age" class="sr-only">Age</label>
			<input type="number" name="age" id="age" class="form-control" placeholder="Age" required>
			
			<label for="address" class="sr-only">Address</label>
			<input type="text" name="address" id="address" class="form-control" placeholder="Address" required>
			
			<label for="dino" class="sr-only">Dino</label>
			<select name="dino" id="dino" class="form-control" style="height:44px; padding-left:5px;">
				<!-- <option value=""></option> -->
			</select>
			
			<input class="btn btn-lg btn-info btn-block" type="button" value="Join" id="joinBtn">
		</form>
	</div>

</body>
</html>