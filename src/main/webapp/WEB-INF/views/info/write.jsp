<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){

	$("#writeBtn").on("click",function(e){
		var title= $("#infoTitle").val()
		var content= $("#infoContent").val()
		if(title==""){
			e.preventDefault();
			alert("제목을 입력해주세요");
			$("#infoTitle").focus();
			return;
		}
		if(content==""){
			e.preventDefault();
			alert("내용을 입력해주세요");
			$("#infoContent").focus();
			return;
		}
	});
});
</script>
<style>
textarea {
	resize: none;
	
	min-height: 700px;
}

#infoWrite {
	width: 95%;
	text-align: center;
	position: relative;
	top: 70px;
}

#listBtn a {color: white;
			text-decoration: none;}
body h2{
text-align: center;
}			
</style>
</head>
<body>
<h2>공지사항</h2>
	<form action="/blueballoon/info/write" method="post">
		<div id="infoWrite">
			<input type="text" name="infoTitle" id="infoTitle" class="form-control" placeholder="제목을 입력하세요.">
			<br> 
			<br>
			<textarea name="infoContent" id="infoContent" class="form-control" placeholder="내용을 입력하세요."></textarea>
			<br>
			<button id="writeBtn" class="btn btn-info">작성</button>
			<a href="/blueballoon/info/list"><button id="listBtn" class="btn btn-info" type="button">목록</button></a>
			<input type="hidden" value="${_csrf.token}" name="_csrf">
		</div>
	</form>
	
</body>
</html>