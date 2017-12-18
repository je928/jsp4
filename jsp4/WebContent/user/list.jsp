<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserList</title>
</head>
<script>
	
	function callback(result) {
		var ths = $("table[id='table'] thead tr th");
		var str = "";
		for(var i=0; i<result.length; i++) {
			str += "<tr data-view='" + result[i].userNo + "'>";
			for(var j=0; j<ths.length; j++) {
				var th = ths[j].getAttribute("data-field");
				str += "<td class='text-center'>" + result[i][th] + "</td>";
			}
			str += "</tr>";
		}
		$('#result_tbody').html(str);
		$('tr[data-view]').hover(function() {
			$(this).css("cursor", "pointer");
			$(this).css("color", "#424242");
			$(this).css("font-weight", "bold");
		}, function(){
			$(this).css("cursor", "default");
			$(this).css("color", "black");
			$(this).css("font-weight", "");
		});
		$('tr[data-view]').click(function() {
			var userNo = this.getAttribute("data-view");
			location.href = "./view.jsp?userno=" + userNo;
		});
	}
	
	$(document).ready(function() {
		var url = "list.user";
		var param = {};
		param["cmd"] = "list";
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
	});
	
</script>
<body>

	<div class="container">
		<div class="page-header">
			<h1>UserList</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover table-striped" id="table">
					<thead>
						<tr>
							<th class="text-center" data-field="userNo">userNo</th>
							<th class="text-center" data-field="userId">userId</th>
							<th class="text-center" data-field="userPwd">userPwd</th>
							<th class="text-center" data-field="userName">userName</th>
							<th class="text-center" data-field="userAge">userAge</th>
							<th class="text-center" data-field="userAddress">userAddress</th>
							<th class="text-center" data-field="diNo">dino</th>
							<th class="text-center" data-field="diName">diname</th>
							<th class="text-center" data-field="diEtc">dietc</th>
						</tr>
					</thead>
					<tbody id="result_tbody">
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>