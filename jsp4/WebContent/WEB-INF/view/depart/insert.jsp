<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DepartInsert</title>
<script type="text/javascript">
	function chkValue() {

		var diName = $('#diName').val().trim();		
		var diEtc = $('#diEtc').val().trim();
		if(diName=="") {
			alert("부서명을 입력해주세요.");
			return false;
		}
		if(diEtc=="") {
			alert("부서설명을 입력해주세요.");
			return false;
		}
		
		$('#frm').submit();
		
	}
	
</script>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>DepartInsert</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form action="/depart/insertOk" method="post" id="frm">
					<table class="table table-bordered table-hover table-striped" id="table" style="width:400px; margin:0 auto;">
						<thead>
							<tr>
								<th class="text-center">항목</th>
								<th class="text-center">내용</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center">diname</td>
								<td class='text-center'><input type="text" id="diName" name="diName" value=""></td>
							</tr>
							<tr>
								<td class="text-center">dietc</td>
								<td class='text-center'><input type="text" id="diEtc" name="diEtc" value=""></td>
							</tr>
						</tbody>
					</table>
				</form>
				<div style="width:400px; margin:0 auto; text-align:center;">
					<input class="btn btn-default" type="submit" value="저장"
							 style="width:60px; margin-top: 20px; margin-right:3px;" onclick="chkValue()">
					<input class="btn btn-default" type="button" value="취소"
							 style="width:60px; margin-top: 20px;" onclick="javascript:location.href='/depart/list'">
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>