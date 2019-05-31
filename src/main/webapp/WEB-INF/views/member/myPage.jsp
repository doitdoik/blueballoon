<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

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
	margin-left: 55px;
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div id="myPage">
		<h1>마이페이지</h1>
	</div>
	<div id="btn_my">

		<button type="button" class="btn btn-info"
			onclick="location.href='/blueballoon/member/info'">내정보관리</button>
		<button type="button" class="btn btn-info"
			onclick="location.href='/blueballoon/member/myWriteList';">내글목록</button>
		<button type="button" class="btn btn-info"
			onclick="location.href='/blueballoon/member/myReplyList';">내댓글목록</button>
		<button type="button" class="btn btn-info"
			onclick="location.href='/blueballoon/member/favoriteList';">즐겨찾기목록</button>
		<button type="button" class="btn btn-info"
			onclick="location.href='/blueballoon/member/payList';">결제정보확인</button>


	</div>

</body>
</html>