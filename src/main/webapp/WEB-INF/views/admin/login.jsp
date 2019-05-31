<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<sec:authorize access="hasRole('ROLE_ADMIN')">
</sec:authorize>
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
		<form id="loginFrm" action="/blueballoon/admin/login" method="post">
			<div class="form-group">
				<label for="login_memId">아이디  :</label> 
				<input id="memId" type="text" name="memId" class="form-control"> 
				<span class="helper-text" id="login_memId_helper"></span>
			</div>
			<div class="form-group">
				<label for="login_memPwd">비밀번호:</label> 
				<input id="memPwd" type="password" name="memPwd" class="form-control">
				 <span class="helper-text" id="login_memPwd_helper"></span>
			</div>
			<input type="hidden" name="_csrf" value="${_csrf.token}">
			<button class="btn btn-success" id="login">로그인</button>
		</form>
		
		</div>
		
</body>
</html>