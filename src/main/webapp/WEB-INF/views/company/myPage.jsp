<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form {
	margin: 0 auto;
	margin-top: 300px;
	margin-bottom: 35px;
	width: 250px;
}

#btn_my button {
	border: 3px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	font-size: 20px;
	font-style: inherit;
	padding: 10px;
	margin-left: 40px;
	margin-top: 200px;
}

#btn_my button:hover {
	color: white;
	background-color: skyblue;
}

#myPage {
	margin: 0 auto;
	text-align: center;
	color: black;
}
</style>
<link rel="stylesheet"	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>
<body>

<div id="myPage">
		<h1>마이페이지</h1>
	</div>
	<div id="btn_my">
		<button type="button" class="btn btn-info"	onclick="location.href='/blueballoon/company/info'">
		업체정보관리
		</button>
		<sec:authorize access="hasRole('ROLE_ACCOM')">
		<button type="button" class="btn btn-info"	onclick="location.href='/blueballoon/company/consumerList?accomNum=${member.accom.accomNum}';">
		구매자목록
		</button>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_SHIP')">
		<button type="button" class="btn btn-info"	onclick="location.href='/blueballoon/company/consumerList?shipNum=${member.ship.shipNum}';">
		구매자목록
		</button>
		</sec:authorize>
		<button type="button" class="btn btn-info"	onclick="location.href='/blueballoon/member/myReplyList';">
		내댓글목록
		</button>
		<sec:authorize access="hasRole('ROLE_ACCOM')">
		<button type="button" class="btn btn-info"	onclick="location.href='/blueballoon/accom/detail?accomNum=${member.accom.accomNum}';">
		상품관리
		</button>
		<button type="button" class="btn btn-info"	onclick="location.href='/blueballoon/accom/write';">
		상품등록
		</button>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_SHIP')">
		<button type="button" class="btn btn-info"	onclick="location.href='/blueballoon/ship/detail?shipNum=${member.ship.shipNum}';">
		상품관리
		</button>
		<button type="button" class="btn btn-info"	onclick="location.href='/blueballoon/ship/write';">
		상품등록
		</button>
		</sec:authorize>
		<button type="button" class="btn btn-info"	onclick="location.href='/blueballoon/company/stats';">
		통계
		</button>
	</div>
</body>
</html>