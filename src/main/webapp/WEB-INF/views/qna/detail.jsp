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
#qnaContent {resize: none;
		min-height: 700px;
		margin-top: 30px;
		margin:0 auto;}
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
#qnaContent{
background-color: white;
}
#qnaTitle{
border: none;
}
#qnaTitle:focus {
outline: none;
}
#qnaDetailTopRight {
   width: 400px;
   float: right;
   text-align: right;
}
body h2{
text-align: center;
}
#qnaDetailBottom{
text-align: center;
}	
#qnaContent{
background-color: white;
}
#qnaTitle{
border: none;
}
#qnaTitle:focus {
outline: none;
}
#reply{
text-align: center;
}
#reply_textarea{
resize: none;
width: 98%;
}
#rpDetail{
	border-bottom : 1px solid gray;
	margin-top: 15px;
	text-align: left;
}
#rpWriter{
	margin-right: 200px;
	font-weight: bold;
}
#rpWriteDate{
	margin-left: 200px;
	float: right;  
}
#rpContent{
	margin-bottom: 10px;
	margin-top: 10px;
	min-height: 20px;
	max-height: 20px;
}
#replyInput{
text-align: center;
margin-left: 25px;
}
</style>
<script>
$(function(){
	
	$("#reply_write").on("click", function() {
		var param = {
			qnaNum: ${detail.qnaNum},
			replyContent: $("#reply_textarea").val(),
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/blueballoon/review/reply",
			method: "post",
			data : param,
			success : function(result) {
				location.reload();
				console.log(result);
				$("#reply_textarea").val("");
				printReply(result);
			}
		});
	});
	
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
	   
	  $("input[id^='delete_reply']").on("click", function() {
			//if(board.isLogin==false || board.loginId!=$(this).data("writer"))
			//return;
			var qnaNum= '${detail.qnaNum}'
			var param = {
				_method:"delete",
				replyNum : $(this).data("qnum"),
				_csrf:"${_csrf.token}"
		
			}
			$.ajax({
				url: "/blueballoon/review/reply2",
				method: "post",
				data: param,
				success: function(result) {
					location.reload();
				}, error: function(xhr) {
					console.log(xhr);
				}
			});
		
		});  
});
</script>
</head>
<body>
<h2>Q&A</h2>
      <div id="qnaDetail" class="form-group">
      <div id="qnaDetailTop">
         <div id="qnaDetailTopLeft">
            <input id="qnaTitle" name="qnaTitle" value="${detail.qnaTitle}" readonly="readonly">
         </div>
         <div id="qnaDetailTopRight">
            등록일 : ${detail.qnaWriteDateStr}
            작성자:<span style="font-weight: bold;">${detail.memId }</span>
         </div>
      </div>
         <br>
         <br>
         <textarea name="qnaContent" id="qnaContent" class="form-control" readonly="readonly">${detail.qnaContent}</textarea>
         <br>
         <sec:authorize access="isAuthenticated()">
            <a href="/blueballoon/qna/update?qnaNum=${detail.qnaNum}"><button class="btn btn-info">수정</button></a>
            <button id="deleteBtn" type="button" data-qnanum="${detail.qnaNum}" class="btn btn-info">삭제</button>
         </sec:authorize>
         <a href="/blueballoon/qna/list"><button id="listBtn" class="btn btn-info" type="button">목록</button></a>
         <input type="hidden" name="qnaNum" value="${detail.qnaNum}">
         <input type="hidden" value="${_csrf.token}" name="_csrf">
      </div>
	<div id="replyInput">
		<div class="form-group">
      		<label for="reply_teaxarea">댓글을 입력하세요</label>
      		<textarea class="form-control" id="reply_textarea" rows="5"
      			placeholder="욕설이나 모욕적인 댓글은 삭제될 수 있습니다"></textarea>
    	</div>
    	<button type="button" class="btn btn-info" id="reply_write">
     		<span class="glyphicon glyphicon-ok"></span>댓글 작성
    	</button>
	<hr>
	<div id="reply">
 		<c:forEach items="${detail.reply}" var="r" varStatus="status">
 		<c:choose>
 			<%-- 댓글이 없으면 안보여줌--%>
 			<c:when test="${r.memId eq null }">
 			</c:when>
 			<c:otherwise>
         	<div id="rpDetail"> 
          	작성자: <span id="rpWriter">${r.memId}</span>
          	<span id="rpWriteDate">작성일: ${r.replyDate}</span><br>
			<div id="rpContent">${r.replyContent}
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<input type="button" id="delete_reply${status.index}" 
				class="btn btn-info" value="삭제" 
				data-qnum="${r.replyNum}"  style="float: right;">
			</sec:authorize>
			<c:if test="${r.memId == principal.username}">
			<input type="button" id="delete_reply${status.index}"
				 class="btn btn-info" value="삭제" 
				 data-qnum="${r.replyNum}"  style="float: right;">
			</c:if>
			</div>
           </div>
 			</c:otherwise>
 		</c:choose>
     	</c:forEach>
	</div>
	</div>
</body>
</html>