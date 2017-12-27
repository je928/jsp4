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
	
	$('tbody tr').hover(function() {
		var tdLen = $(this).find('td').length;
		for(var i=0; i<tdLen-1; i++) {
			$(this).find('td').eq(i).css("cursor", "pointer");
			$(this).find('td').eq(i).css("color", "#424242");
			$(this).find('td').eq(i).css("font-weight", "bold");
		}
	}, function(){
		var tdLen = $(this).find('td').length;
		for(var i=0; i<tdLen-1; i++) {
			$(this).find('td').eq(i).css("cursor", "default");
			$(this).find('td').eq(i).css("color", "black");
			$(this).find('td').eq(i).css("font-weight", "");
		}
	});
	$('tbody tr td').click(function() {
		var idx = $(this).index();
		if(idx != 3) {
			var diNo = $(this).parent('tr').find('td:first-child').attr("data-view");
			location.href = "/depart/view?dino=" + diNo;
		}
	});
	
	$('#reset').click(function() {
		location.href="/depart/list";
	});
	
});

function deleteDepart(dino) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="/depart/delete?dino=" + dino;	
	}
}

</script>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>DepartList</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form action="/depart/list" method="get" id="frm" style="width:400px; margin:0 auto; text-align:center; margin-bottom:20px;">
					<select name="searchOption" style="height:26px;">
						<option value="diName" <c:if test="${search eq 'diName'}">selected</c:if>>diname</option>
						<option value="diEtc" <c:if test="${search eq 'diEtc'}">selected</c:if>>dietc</option>
					</select>
					<input type="text" id="searchStr" name="searchStr" style="margin-right:4px;" value="${searchStr}" /><button>검색</button>
					<input type="button" id="reset" value="초기화" />
				</form>
				<table class="table table-bordered table-hover table-striped" id="table" style="width:400px; margin:0 auto;">
					<thead>
						<tr>
							<th class="text-center">dino</th>
							<th class="text-center">diname</th>
							<th class="text-center">dietc</th>
							<th class="text-center">delete</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty departList}">
						<c:forEach var="list" items="${departList}">
							<tr>
								<td class='text-center' data-view="${list.diNo}">${list.diNo}</td>
								<td class='text-center'>${list.diName}</td>
								<td class='text-center'>${list.diEtc}</td>
								<td class='text-center'><input type="button" onclick="deleteDepart(${list.diNo})" value="삭제" /></td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty departList}">
							<tr>
								<td class='text-center' colspan="4">데이터가 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<input class="btn btn-primary btn-block" type="button" value="부서입력"
						 style="width:100px; margin:0 auto; margin-top: 20px;"
						 onclick="javascript:location.href='/depart/insert'">
			</div>
		</div>
	</div>
	
	<c:if test="${insert == 1}">
		<script>
		alert("부서가 등록되었습니다.");
		location.href="/depart/list";
		</script>
	</c:if>
	
	<c:if test="${msg!=null}">
		<script>
		alert("${msg}");
		location.href="/depart/list";
		</script>
	</c:if>
	
	<c:if test="${update == 1}">
		<script>
		alert("부서가 수정되었습니다.");
		location.href="/depart/view?dino=" + ${diNo};
		</script>
	</c:if>

</body>
</html>