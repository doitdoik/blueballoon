<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	   $("#writeBtn").click(function() {
		      var title = $("#qnaTitle").val();
		      var content = $("#qnaContent").val();
		      if(title =="") {
		    	   alert("제목을 입력하세요");
		    	   return;
		      }
		      if(content ==""){
		    	   alert("내용을 입력하세요");
		    	   return;
		      }
		      document.form1.submit();
	   });
});
</script>
<style>
textarea {
   resize: none;
	 	width:800px;
	 	min-height: 700px;
		}
#qnaWrite{
   width: 95%;
   text-align: center;
   position: relative;
   top:70px;
}
#listBtn a {
   color: white;
   text-decoration: none;
   }
body h2{
text-align: center;
}
</style>
</head>
<body>
<h2>Q&A</h2>
<form action="/blueballoon/qna/write" method="post" name="form1">
    <div id="qnaWrite">
      <input type="text" name="qnaTitle" id="qnaTitle" class="form-control" placeholder="제목을 입력하세요">
      <br>
      <br>
      <textarea name="qnaContent" id="qnaContent" class="form-control" placeholder="내용을 입력하세요"></textarea>
      <br>
      <button id="writeBtn" class="btn btn-info">작성</button>
      <button id="listBtn" class="btn btn-info"><a href="/blueballoon/qna/list">목록</a></button>
      <input type="hidden" value="${_csrf.token}" name="_csrf">
   </div>
</form>
</body>
</html>