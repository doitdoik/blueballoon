<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	table{
		position: relative;
		top: 100px;
	}
	table, th, table tr
	   {width:800px;
		text-align: center;
		border: 1px solid black;}
	table td{
		border: 1px solid black;
	}	
	#writeInfoTop{
		margin: 0 auto;
		text-align: center;
		color:black;
		
	}
</style>
</head>
<body>
<div id="writeInfoTop">
<h1>내 댓글 목록</h1>
</div>
<table>
	<tr>
	    <th>본문 글 번호</th>
		<th>본문 제목</th>
		<th>댓글 내용</th>
		<th>댓글 작성일</th>
		
	</tr>
	
	<!-- 댓글 모음에서는 제목을 클릭시 그 본문으로 이동 -->
<c:forEach items="${reply}" var="reply">
	<div>
	<a href="#">
		<tr>
		    <td>${reply.revNum}</td>
			<td>${reply.review.revTitle}</td>
			<td><a href="/blueballoon/review/detail?revNum=${reply.revNum}">${reply.replyContent}</a></td>
			<td>${reply.replyDate}</td>
			
		</tr>
	</a>
	</div>
</c:forEach>	 
</table>
</body>
</html>