<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="bxSlider.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="script/script.js"></script>


<style>

#wrap {
	width: 1000px;
	height: 600px;
	margin: 0px;
}

.box {
	text-align: center;
	margin: 10px;
	margin-top: 80px;
	margin-left: 25px;
	margin-right: 25px;
	float: left;
	height: 215px;
	width: 200px;
	border: 1px solid black;
	font-size: 160%;
	font-style: oblique;
}

.box img {
	text-align: center;
	margin: 10px;
	margin-top: 80px;
	margin-left: 25px;
	margin-right: 25px;
	float: left;
	height: 180px;
	width: 198px;
	padding: 0px;
	margin: 0px;
}
</style>
</head>
<body>


	<div id="wrap">

	<c:forEach items="${map.list}" var="island">
		<div id="island1" class="box" style="cursor: pointer;"
			onclick="location.href='/blueballoon/island/detail?isNum=${island.isNum}';">
			<img src="http://localhost:8081/sajin/${island.image.imageName}" id="show_picture"  />		
			
				
					<span>${island.isName}</span>

		</div>
		</c:forEach>
		<div id="review" class="box" style="cursor: pointer;"
			onclick="location.href='review/list';">
			<img
				src="https://www.reviewtrackers.com/wp-content/uploads/shutterstock_194807483.jpg">후기게시판
		</div>
		
<!-- 	<div class="text-center">
		<ul class="pagination">
			<c:if test="${map.pagination.prev!=0}">
				<li class="previous"><a
					href="/blueballoon?pageNo=${map.pagination.prev}">Previous</a></li>
			</c:if>
			<c:forEach begin="${map.pagination.startPage}"
				end="${map.pagination.endPage}" var="i">
				<c:choose>
					<c:when test="${map.pagination.page eq i }">
						<li class="active"><a
							href="/blueballoon?pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="waves-effect"><a
							href="/blueballoon?pageNo=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pagination.next!=0}">
				<li class="next"><a
					href="/blueballoon?pageNo=${map.pagination.next}">Next</a></li>
			</c:if>
		</ul>
	</div>
 -->
	</div>
<%-- 	<security:authentication property="principal" /> --%>



</body>
</html>