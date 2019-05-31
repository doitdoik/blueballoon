

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<sec:authorize access="hasRole('ROLE_ADMIN')">
</sec:authorize>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
		.btn {
			background-color: #87CEEB;
			padding: 15px 30px;
			margin: 2px;
			border: none;
			color: black;
			text-align: center;
			text-decoration: none;
			font-size: 30px;
			display: inline-block;
			cursor: pointer;
			-webkit-transition-duration: 0.4s;
			transition-duration: 0.4s;
		}
		.btn1:hover, .btn2:hover, .btn3:hover{
			background-color: #4169E1;
			color: white;
		}
</style>
</head>
<body>

	<div class="button">
	
	<button class="btn btn1" onclick="location.href='/blueballoon/admin/userList' ">일반 유저</button><br>
	<br>
	<button class="btn btn2" onclick="location.href='/blueballoon/admin/companyList' ">업체 유저</button><br>
	<br>
	<button class="btn btn3" onclick="location.href='/blueballoon/admin/permitCompany' ">업체 승인</button><br>
	</div>
</body>
</html>