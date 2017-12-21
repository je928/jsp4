<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DepartList</title>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>DepartList</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover table-striped" id="table" style="width:400px; margin:0 auto;">
					<thead>
						<tr>
							<th class="text-center">dino</th>
							<th class="text-center">diname</th>
							<th class="text-center">didesc</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${departList}">
							<%-- <c:if test="${list.dino % 2 eq 1}"> --%>
							<tr>
								<td class='text-center'>${list.dino}</td>
								<td class='text-center'>${list.diname}</td>
								<td class='text-center'>${list.didesc}</td>
							</tr>
							<%-- </c:if> --%>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>