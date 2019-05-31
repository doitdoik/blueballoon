<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script>
	function printUser(member) {
		console.log(member);
		$("#memName").text(member.memName);
		$("#memTel").text(member.memTel);
	}
	$(function() {
		var member = JSON.parse('${member}')
		printUser(member);

	});
</script>
<style>
#consumerList, th, td{
	width:800px;
	text-align: center;
	border: 1px solid black;
	position: relative;
	top: 50px;
}
</style>
</head>
<body>
<h1 style="text-align: center">구매자 목록</h1>
<sec:authorize access="hasRole('ROLE_ACCOM')">
<table id="consumerList">
<tr>
	<th>예약자아이디</th>
	<th>예약자명</th>
	<th>예약인원</th>
	<th>전화번호</th>
</tr>
<c:forEach var="accom" items="${info}">
<tr>
	<td>${accom.payment.memId}</td>
	<td>${accom.member.memName}</td>
	<td>${accom.payment.payPeopleCnt}명</td>
	<td>${accom.member.memTel}</td>
</tr>
</c:forEach>	
</table>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_SHIP')">
<table id="consumerList">
<tr>
	<th>예약자아이디</th>
	<th>예약자명</th>
	<th>예약인원</th>
	<th>전화번호</th>
</tr>
<c:forEach var="ship" items="${ship}">
<tr>
	<td>${ship.payment.memId}</td>
	<td>${ship.member.memName}</td>
	<td>${ship.payment.payPeopleCnt}명</td>
	<td>${ship.member.memTel}</td>
</tr>
</c:forEach>	
</table>
</sec:authorize>
			<input type="hidden" value="${_csrf.token}" name="_csrf">

</body>
</html>