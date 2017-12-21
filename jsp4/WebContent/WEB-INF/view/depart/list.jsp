<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DepartList</title>
<script type="text/javascript">
	
$(document).ready(function() {
	
	$('tr').hover(function() {
		$(this).css("cursor", "pointer");
		$(this).css("color", "#424242");
		$(this).css("font-weight", "bold");
	}, function(){
		$(this).css("cursor", "default");
		$(this).css("color", "black");
		$(this).css("font-weight", "");
	});
	$('tr').click(function() {
		var diNo = $(this).find('td').eq(0).attr("data-view");
		location.href = "/depart/view?dino=" + diNo;
	});
	
});

</script>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>DepartList</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover table-striped" id="table"  style="width:400px; margin:0 auto;">
					<thead>
						<tr>
							<th class="text-center">dino</th>
							<th class="text-center">diname</th>
							<th class="text-center">dietc</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${departList}">
							<tr>
								<td class='text-center' data-view="${list.diNo}">${list.diNo}</td>
								<td class='text-center'>${list.diName}</td>
								<td class='text-center'>${list.diEtc}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>