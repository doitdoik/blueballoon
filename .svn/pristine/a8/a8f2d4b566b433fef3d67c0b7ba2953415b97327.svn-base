<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	position: relative;
	top: 100px;
	margin-left: 200px;
}

table, th, table tr {
	width: 400px;
	text-align: center;
	border: 1px solid black;
}

table td {
	border: 1px solid black;
}

#favoritedList {
	margin: 0 auto;
	text-align: center;
	color: black;
}
</style>
</head>
<body>
	<div id="favoritedList">
		<h1>즐겨찾기 목록</h1>
	</div>
	<table>


		<tr>
			<th>명소 번호</th>
			<th>명소 제목</th>
			<th></th>

		</tr>

		<c:forEach items="${favorite}" var="favo">
			<div>
				<a href="#">
					<tr>
						<td>${favo.attrNum}</td>
						<td>${favo.attraction.attrTitle}</td>
						<td><a
							href="/blueballoon/attr/detail?attrNum=${favo.attrNum}">바로가기</td>

					</tr>
			</a>
			</div>
		</c:forEach>
		<div></div>
	</table>
</body>
</html>