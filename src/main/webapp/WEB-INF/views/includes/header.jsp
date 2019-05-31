<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

#header {
	height: 100px;
}

#top {
	width: 1200px;
	height: 70px;
	position: relative;
}

#logo {
	width: 80px;
	float: left;
	height: 70px;
}
#topRight li{
	float: right;
	margin-left: 20px;
	list-style: none;
}

#topRight {
	width: 400px;
	margin-right:80px;
	margin-top:10px;
	height: 80px;
}

#topRight ul {
	height: 80px;
	position: absolute;
	top: 50px;
	right: 100px;
	float: right;
	list-style: none;
	width: 60px;
	text-align: center;
}

#topRight ul li a {
	text-decoration: none;
	color: grey;
	font-size: 12px;
}

#logo img {
	width: 80px;
	height: 70px;
	margin-left: 70px;
}
</style>
<script>
	$(function(){
		// 로그아웃
		$("#logout").on("click", function(e){
			var $form = $("<form></form>").attr("action","/blueballoon/member/logout").attr("method","post");
			$("<input>").attr("type","hidden").attr("name", "_csrf").val("${_csrf.token}").appendTo($form);
			$form.appendTo("body");
			$.ajax({
				url:"/blueballoon/member/logout",
				method:"post",
				data:$form.serialize(),
				success:function(){
					location.reload();
				}
			})
		});
	});
</script>
</head>
<body>
	<div id="header">
		<div id="top">
			<div id="logo">
				<img src="https://ifh.cc/g/b4GaC.png" style="cursor: pointer;"
					onclick="location.href='/blueballoon';">
			</div>	
			<ul class="head header-head" id="topRight">
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					고객센터 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#" class="menu">공지사항</a></li>
						<li><a href="#" class="menu">Q&A</a></li>
					</ul></li>
				<sec:authorize access="isAnonymous()">	
				<li><a href="/blueballoon/member/login">로그인</a></li>
				<li><a href="/blueballoon/member/joinChoice">회원가입</a></li>	
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
				<li><a href="/blueballoon/member/myPage">마이페이지</a></li>
				<li><a href="/blueballoon/member/payList">결제정보</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
				<li><a href="#" id="logout">로그아웃</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_SHIP') or hasRole('ROLE_ACCOM')">
				<li><a href="/blueballoon/company/myPage">마이페이지</a></li>
				<li><a href="#">상품관리</a></li>
				</sec:authorize>
			</ul>
		</div>

		  <div id="nav">
			<%@include file="../includes/nav.jsp"%>
		</div>
	</div>
</body>
</html>