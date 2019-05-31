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
	margin-top: 100px;
	margin-bottom: 35px;
	width: 250px;
}
.btn{margin-top:15px;}


</style>

</head>
<body>
	<div id="login">
		<form id="loginFrm" action="/blueballoon/member/login" method="post">
			<div class="form-group">
				<label for="login_memId">아이디</label> <input id="memId" type="text"
					name="memId" class="form-control"> <span
					class="helper-text" id="login_memId_helper"></span>
			</div>
			<div class="form-group">
				<label for="login_memPwd">비밀번호</label> <input id="memPwd"
					type="password" name="memPwd" class="form-control"> <span
					class="helper-text" id="login_memPwd_helper"></span>
			</div>
			<input type="hidden" name="_csrf" value="${_csrf.token}">
			<button class="btn btn-success" id="login">로그인</button>
			<br>
			<button type="button" class="btn btn-info"  onclick="location.href='/blueballoon/member/findId';" >
			아이디찾기
			</button>
			<button type="button" class="btn btn-info" onclick="location.href='/blueballoon/member/findPwd';">
			비밀번호찾기
			</button>
			
		</form>
		
		</div>
		
		 
</body>
</html>