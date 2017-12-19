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
			<h1>jstlExam</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<c:set var="test" value="테스트" scope="page" />
				<c:set var="s_test" value="세션테스트" scope="session" />
				<c:set var="a_test" value="어플리케이션테스트" scope="application" />
				jstl's test : ${test}
				<br>
				session test : ${s_test}
				<br>
				application test : ${a_test}
			</div>
		</div>
	</div>
	
</body>
</html>