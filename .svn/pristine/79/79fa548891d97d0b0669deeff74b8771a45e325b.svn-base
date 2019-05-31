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
	table, th, table tr{width:800px;
		text-align: center;
		border: 1px solid black;}
	table td{
		border: 1px solid black;
	}	
	

	#writeInfo{
		margin: 0 auto;
		text-align: center;
		color:black;
		
	}
</style>
</head>

<body>
<div id=writeInfo>
<h1>내 글 목록</h1>
</div>
<table>

<caption align="top">후기게시판 작성 글</caption>
	<tr>
		<th>글 번호</th>
		<th>글 제목</th>
		<th>작성일</th>
		
	</tr>
	
<c:forEach items="${review}" var="review">
	<div>
	<a href="#">
		<tr>		
			<td>${review.revNum}</td>
			<td><a href="/blueballoon/review/detail?revNum=${review.revNum}">${review.revTitle}</a></td>
			<td>${review.revWriteDate}</td>		
		</tr>
	</a>
	</div>
</c:forEach>	 
</table>


<!-- qna게시판 작성 글-->
<table>
<caption align="top">Q&A게시판 작성 글</caption>
	<tr>
		<th>글 번호</th>
		<th>글 제목</th>
		<th>작성일</th>
		
	</tr>
	
<c:forEach items="${qna}" var="qna">
	<div>
		<tr>		
			<td>${qna.qnaNum}</td>
			<td><a href="/blueballoon/qna/detail?qnaNum=${qna.qnaNum}">${qna.qnaTitle}</a></td>
			<td>${qna.qnaWriteDate}</td>		
		</tr>	
	</div>
</c:forEach>	 
</table>
</body>
</html>