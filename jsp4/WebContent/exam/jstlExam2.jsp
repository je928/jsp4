<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<div class="page-header">
			<h1>jstlExam2</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				jstl's test : ${test}
				<br>
				session test : ${s_test}
				<br>
				application test : ${a_test}
				<br>
				<c:forEach var="num" begin="5" end="100" step="5">
					${num},
				</c:forEach>
			</div>
		</div>
	</div>
	
</body>
</html>