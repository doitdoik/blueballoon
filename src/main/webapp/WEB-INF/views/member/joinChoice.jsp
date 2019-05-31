<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	width: 250px;}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<form>
	<button type="button" class="btn btn-info"  onclick="location.href='/blueballoon/member/join';" >
			일반회원가입
			</button>
	<button type="button" class="btn btn-info" onclick="location.href='/blueballoon/company/join';">
			업체회원가입
			</button>
</form>
   
</body>
</html>