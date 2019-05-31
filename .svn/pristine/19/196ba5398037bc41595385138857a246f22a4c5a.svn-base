<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/blueballoon/ckeditor/ckeditor.js"></script>
<script>
$(document).ready(function() {
	var ck = CKEDITOR.replace("content", {
		// c:url은 웹 애플리케이션 컨텍스트 패스를 붙여주는 역할
		filebrowserUploadUrl: '<c:url value="/blueballoon/ckupload" />?${_csrf.parameterName}=${_csrf.token}'
	});
	
	   $("#writeBtn").click(function() {
		      var title = $("#revTitle").val();
		      var content = $("#revContent").val();
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
#revWrite{
   width: 95%
   text-align: center;
   position: relative;
   top:70px;
}
#listBtn a {
   color: white;
   text-decoration: none;
   }
</style>
</head>
<body>
<form action="/blueballoon/review/write" method="post" name="form1">
    <div id="revWrite">
      <input type="text" name="revTitle" id="revTitle" class="form-control" placeholder="제목을 입력하세요">
      <br>
      <br>
      <textarea name="revContent" id="revContent" class="form-control" placeholder="내용을 입력하세요"></textarea>
      <br>
      <button id="writeBtn" class="btn btn-info">작성</button>
      <button id="listBtn" class="btn btn-info"><a href="/blueballoon/review/list">목록</a></button>
      <input type="hidden" value="${_csrf.token}" name="_csrf">
   </div>
</form>
</body>
</html>