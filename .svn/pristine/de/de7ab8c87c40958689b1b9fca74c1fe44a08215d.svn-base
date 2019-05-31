<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
#btn{
	float:right;
}
#pagination{
text-align: center;
}
</style>
</head>
<body>
	<div>
		<h1 class="title">선박 목록</h1>
	</div>
	<hr class="one">
	<div id="listBox">

		<c:forEach items="${map.list}" var="list">
			<div id="left">
			<img src="http://localhost:8081/sajin/${list.image.imageName}" height="198px" width="198px" />
			</div>
			<div id="right">
				<span id="readCnt">선박번호 : <c:out value="${list.shipNum}"/></span>
				<h2>선명 : ${list.memBrand}</h2>
				<h4>주소 : ${list.shipAddr}</h4>
				<br>
				<br>
				<br>
				<a href="/blueballoon/ship/detail?shipNum=${list.shipNum}"><button id="btn">상세보기</button></a>
				<button id="btn">주변지도</button>
			</div>
		</c:forEach>

	</div>

	<div id="pagination">
	<ul class="pagination pagination-sm">
		<c:if test="${map.pagination.prev ne 0}">
		<li><a href="/blueballoon/ship/list?isNum=${detail.isNum}&pageNo=${map.pagination.startPage-1}">&lt;</a></li>
		</c:if>
		<c:forEach var="i" begin="${map.pagination.startPage}" end="${map.pagination.endPage }">
			<c:choose>
				<c:when test="${i eq map.pagination.page}">
				<li class="active"><a href="/blueballoon/ship/list?isNum=${detail.isNum}&pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="/blueballoon/ship/list?isNum=${detail.isNum}&pageNo=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>	
		</c:forEach>
		<c:if test="${map.pagination.next ne 0}">
		<li><a href="/blueballoon/ship/list?isNum=${detail.isNum}&pageNo=${map.pagination.endPage+1}">&gt;</a></li>
		</c:if>
	</ul>
</div>	
</body>
</html>