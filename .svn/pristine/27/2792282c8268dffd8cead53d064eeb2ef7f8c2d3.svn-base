<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<link rel="icon" type="image/jpg" href="http://example.com/myicon.png">
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.title {
	border: 1px solid black;
	text-align: center;
}

hr.one {
	border: 1px solid black;
}

#listBox {
	width: 700px;
	height: 860px;
	border: 1px solid black;
}

#left {
	border: 1px solid black;
	color: white;
	width: 200px;
	height: 200px;
	float: left;
}

#right {
	border: 1px solid black;
	width: 490px;
	height: 200px;
	text-align: left;
	float: left;
	padding: 10px;
}

#readCnt {
	float: right;
}

#btn {
	float: right;
	color: black;
}
#btnW{
	float: right;
}
</style>
</head>
<body>

	<div>
		<h1 class="title">명소 목록</h1>
	</div>
	<hr class="one">
	<div id="listBox">
		<c:forEach items="${map.list}" var="attr">
			<div id="left">
				<img src="http://localhost:8081/sajin/${attr.image.imageName}"
					height="198px" width="198px" />
			</div>
			<div id="right">
				<span id="readCnt">조회수 : ${attr.attrReadCnt}</span>
				<h2>${attr.attrTitle}</h2>

				<br> <br> <a
					href="/blueballoon/attr/detail?attrNum=${attr.attrNum}"><button
						id="btn">상세보기</button></a>

			</div>
		</c:forEach>


	</div>

	<div class="text-center">
		<ul class="pagination">


			<c:if test="${map.pagination.prev!=0}">
				<li class="previous"><a
					href="/blueballoon/attr/list?isNum=${detail.isNum}&pageNo=${map.pagination.prev}">Previous</a></li>
			</c:if>
			<c:forEach begin="${map.pagination.startPage}"
				end="${map.pagination.endPage}" var="i">
				<c:choose>
					<c:when test="${map.pagination.page eq i }">
						<li class="active"><a
							href="/blueballoon/attr/list?isNum=${detail.isNum}&pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="waves-effect"><a
							href="/blueballoon/attr/list?isNum=${detail.isNum}&pageNo=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${map.pagination.next!=0}">
				<li class="next"><a
					href="/blueballoon/attr/list?isNum=${detail.isNum}&pageNo=${map.pagination.next}">Next</a></li>
			</c:if>

		</ul>
	</div>

</body>
</html>