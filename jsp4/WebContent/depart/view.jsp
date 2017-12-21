<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DepartView</title>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>DepartView</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover table-striped" id="table" style="width:400px; margin:0 auto;">
					<thead>
						<tr>
							<th class="text-center">항목</th>
							<th class="text-center">내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center">dino</td>
							<td class='text-center'>${depart.dino}</td>
						</tr>
						<tr>
							<td class="text-center">diname</td>
							<td class='text-center'>${depart.diname}</td>
						</tr>
						<tr>
							<td class="text-center">didesc</td>
							<td class='text-center'>${depart.didesc}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>