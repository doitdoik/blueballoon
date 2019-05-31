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
		var attrNum = $("#deleteBtn").data("attrnum");
console.log(attrNum);
		var params = {
				_csrf:'${_csrf.token}',
				_method:'delete',
				attrNum:attrNum
				
		}
		console.log(params);
		$.ajax({
			url:'/blueballoon/attr/delete',
			method:'post',
			data:params,
			success:function(){
				self.location.replace('/blueballoon')
			}
		});
	});
});

$(function() {
	
	$("#favoBtn").on("click", function() {
		var attrNum = $("#favoBtn").data("attrnum");
		var param = {
			_method : "patch",
			attrNum : attrNum ,
	 
			_csrf : "${_csrf.token}"
		};
		console.log(param);

		$.ajax({
			url : "/blueballoon/attr/favoUpdate",
			method : "post",
			data : param,
			success : function(result) {
				alert("즐겨찾기가 추가되었습니다");
				location.href = "/blueballoon";
			}
		})
	})

});
$(function() {

	$("#favoDelBtn").on("click", function() {
		var attrNum = $("#favoDelBtn").data("attrnum");
		var param = {
			_method : "patch",
			attrNum : attrNum ,
			_csrf : "${_csrf.token}"
		};
		console.log(param);

		$.ajax({
			url : "/blueballoon/attr/favoDelete",
			method : "post",
			data : param,
			success : function(result) {
				alert("즐겨찾기가 삭제되었습니다");
				location.href = "/blueballoon";
			}
		})
	})

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
		min-height: 200px;}

</style>
</head>
<body>
	
	<div>
		<h1 class="title">
			
			<c:out value="${detail.attrTitle}"/>
		</h1>
	</div>
	<hr class="one">
	<div id="sam">
		<div id="left">
			<div>
				<img src="http://localhost:8081/sajin/${detail.image.imageName}" height="395px" width="425px"/>
			</div>>
		</div>
		<div id="right">
			<sec:authorize access="hasRole('ROLE_USER')">
			<c:if test="${detail.attrIsFavorite eq 0}">
			 		<button id="favoBtn" data-attrNum="${detail.attrNum}" class="btn btn-attr">☆</button>
			 </c:if>
			 <c:if test="${detail.attrIsFavorite eq 1}">
			 		<button id="favoDelBtn" data-attrNum="${detail.attrNum}" class="btn btn-attr">★</button>
			  </c:if>
			 </sec:authorize>
			 		 

			<!--  sec authorize  -->
		

		</div>
		<div>
		<textarea name="attrContent" id="attrContent" class="form-control" disabled="disabled">${detail.attrContent}</textarea>
		  <!--<button class="btn btn-info">수정</button>
-->
	<sec:authorize access="hasRole('ROLE_ADMIN')">
 		<button id="deleteBtn" type="button" data-attrnum="${detail.attrNum}" class="btn btn-attr">삭제</button>
	</sec:authorize>
		
		</div>
	</div>
	


</body>
</html>