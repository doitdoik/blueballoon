<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
	<script>
$(function(){
	$("#deleteBtn").on("click",function(){
		var isNum = $("#deleteBtn").data("isnum");
console.log(isNum);
		var params = {
				_csrf:'${_csrf.token}',
				_method:'delete',
				isNum:isNum
				
		}
		console.log(params);
		$.ajax({
			url:'/blueballoon/island/delete',
			method:'post',
			data:params,
			success:function(){
				self.location.replace('/blueballoon')
			}
		});
	});
});


</script>
<style type="text/css">
.title {
	
}

hr.one {
	width: 500px;
	border: solid 1px;
	text-align: left;
	margin-left: 0px;
	text-align: left;
}

#left {
	border: 1px solid black;
	width: 430px;
	height: 400px;
	float: left;
}

#right {
	border: 1px solid black;
	width: 567px;
	height: 400px;
	text-align: left;
	float: left;
	padding: 10px;
}

#btns {
	margin: 30px;
	text-align: center;
}
		.btn {
			background-color: #87CEEB;
			padding: 15px 30px;
			margin: 2px;
			border: none;
			color: black;
			text-align: center;
			text-decoration: none;
			font-size: 20px;
			display: inline-block;
			cursor: pointer;
			-webkit-transition-duration: 0.4s;
			transition-duration: 0.4s;
			float: right;
			
		}
		.btn2 {
			background-color: #87CEEB;
			padding: 15px 30px;
			margin: 2px;
			border: none;
			color: black;
			text-align: center;
			text-decoration: none;
			font-size: 20px;
			display: inline-block;
			cursor: pointer;
			-webkit-transition-duration: 0.4s;
			transition-duration: 0.4s;
			float: right;
			
		}
		.btn1:hover, .btn2:hover, .btn3:hover .btn4:hover .btn5:hover{
			background-color: #4169E1;
			color: white;
		}
		textarea {resize: none;
		width:100px;
		min-height: 500px;}

</style>
</head>
<body>

	<div>
		<h1 class="title">
		
			<c:out value="${detail.isName}"/>
		</h1>
	</div>
	<hr class="one">
	<div id="sam">
		<div id="left">
			<div>
				<img src="http://localhost:8081/sajin/${detail.image.imageName}" height="395px" width="425px" />
			</div>
		</div>
		<div id="right">
			<a href="/blueballoon/attr/list?isNum=${detail.isNum}&pageNo=1"><button class="btn btn2">명소</button></a>
			<sec:authorize access="hasRole('ROLE_USER')">
			<a href="/blueballoon/package/list?pageNo=1"><button class="btn2 btn3">풍선 타는 패키지</button></a>
			<a href="/blueballoon/accom/list?isNum=${detail.isNum}&pageNo=1"><button class="btn2 btn3">풍선 부는 패키지</button></a>
			</sec:authorize>
			<!--  sec authorize  -->
			<sec:authorize access="hasRole('ROLE_SHIP')">
				<a href="/blueballoon/ship/write"><button class="btn btn1">선박작성</button></a>
				<a href="/blueballoon/ship/list?isNum=${detail.isNum}&pageNo=1"><button class="btn2 btn3">선박 리스트</button></a>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ACCOM')">
				<a href="/blueballoon/accom/write"><button class="btn btn2">숙박작성</button></a>
				<a href="/blueballoon/accom/list?isNum=${detail.isNum}&pageNo=1"><button class="btn2 btn3">숙박 리스트</button></a>
			</sec:authorize>

		</div>
		<div>
		<textarea name="isInfo" id="isInfo" class="form-control" disabled="disabled">${detail.isInfo}</textarea>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		
		
		<button id="deleteBtn" type="button" data-isnum="${detail.isNum}" class="btn btn-island">삭제</button>
		
		</sec:authorize>
		</div>
	</div>
	


</body>
</html>