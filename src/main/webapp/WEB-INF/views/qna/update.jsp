<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
textarea {resize: none;
	 	width:800px;
	 	min-height: 700px;}
#qnaDetail{text-align: center;
   width: 95%; }
#listBtn a{ color: white;
   text-decoration: none;}
#qnaDetailTop {
   margin-top: 20px;
}
#qnaDetailTopLeft {
   float: left;
   font-weight: bold;
   font-size: 20px;   
}
#qnaDetailTopRight {
   width: 400px;
   float: right;
   text-align: right;
}
body h2{
text-align: center;
}
</style>
<script>
$(function(){
	   $("#deleteBtn").on("click", function() {
		      var qnaNum = $("#deleteBtn").data("qnanum");
		      var params = {
		    		   _csrf:'${_csrf.token}',
		    		   _method:'delete',
		    		   qnaNum:qnaNum
		      }
		  $.ajax({
			    url:'/blueballoon/qna/delete',
			    method:'post',
			    data:params,
			    success:function() {
			    	self.location.replace('/blueballoon/qna/list')
			      }
		    });
	  });
});
</script>
</head>
<body>
<h2>Q&A</h2>
   <form action="/blueballoon/qna/update" method="post">
      <div id="qnaDetail" class="form-group">
      <div id="qnaDetailTop">
         <div id="qnaDetailTopLeft">
          <input id="qnaTitle" name="qnaTitle" value="${detail.qnaTitle}">
         </div>
         <div id="qnaDetailTopRight">
            등록일 : ${detail.qnaWriteDateStr}
         </div>
      </div>
         <br>
         <br>
         <textarea name="qnaContent" id="qnaContent" class="form-control">${detail.qnaContent}</textarea>
         <br>
         <sec:authorize access="isAuthenticated()">
            <a href="/blueballoon/qna/update?qnaNum=${detail.qnaNum}"><button class="btn btn-info">수정</button>
            <button id="deleteBtn" type="button" data-qnanum="${detail.qnaNum}" class="btn btn-info">삭제</button>
         </sec:authorize>
         <a href="/blueballoon/qna/list"><button id="listBtn" class="btn btn-info" type="button">목록</button></a>
         <input type="hidden" name="qnaNum" value="${detail.qnaNum}">
         <input type="hidden" value="${_csrf.token}" name="_csrf">
      </div>
   </form>
</body>
</html>