<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#revContent{resize: none;
		min-height: 700px;
		margin-top: 30px;
		margin:0 auto;}
#revDetail{
text-align: center;
width: 95%;}
#listBtn a{ color: white;
		text-decoration: none;
		}
#revDetailTop{
margin-top: 20px;
}		
#revDetailTopLeft{
float: left;
font-weight: bold;
font-size: 20px;
}
#revDetailTopRight{
width: 400px;
float: right;
text-align: right;
}		
body h2{
text-align: center;
}
#revDetailBottom{
text-align: center;
}	
#revContent{
background-color: white;
}
#revTitle{
border: none;
}
#revTitle:focus {
outline: none;
}
#reply_textarea{
resize: none;
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
</style>
<script>
// console.log("${detail.reply}");
// var board;
// //댓글 출력창
// function printReply(reply) {
// 	// 로그인하지 않은 경우 댓글 작성 버튼을 비활성화
// 	//if(board.loginId=="false")
// 		//$("#comment_write").prop("disabled", true);
	
// 	// 댓글을 출력할 div를 읽어와 초기화(출력중인 모든 댓글을 삭제)
// 	var $replys = $("#reply");
// 	$replys.empty();
// 	$.each(reply, function(i, reply){
// 		var $reply = $("<div>").appendTo($replys)
// 		var $upper_div = $("<div>").appendTo($reply);
// 		var $center_div = $("<div>").appendTo($reply);
// 		var $lower_div = $("<div>").appendTo($reply);
// 		$("<span></span>").text(reply.memId).appendTo($upper_div);
// 		$("<img>").attr("src","/sajin/" + reply.memId + ".jpg").css("width","40px").appendTo($center_div);
// 		$("<span>").text(reply.replyContent).appendTo($center_div);
// // 		$("<span>").text(getDate(comment.replyDate,"date")).appendTo($lower_div);
// 		/*if(comment.writer==board.loginId) {
// 			var btn = $("<button>").attr("class", "delete_comment").attr("data-replyNum", comment.replyNum)
// 				.attr("data-bno", board.bno).attr("data-writer", comment.writer).text("삭제").appendTo($center_div);
// 			btn.css("float","right");
// 		}*/
// 		$("<hr>").appendTo($reply);
// 	});
// }

function printData(){
	printReply(board.reply);
}

$(function(){
  //글 삭제
  	console.log('${detail.reply}');
	$("#deleteBtn").on("click",function(){
		var revNum = $("#deleteBtn").data("revnum");
		var params = {
				_csrf:'${_csrf.token}',
				_method:'delete',
				revNum:revNum
		}
		$.ajax({
			url:'/blueballoon/review/delete',
			method:'post',
			data:params,
			success:function(){
				self.location.replace('/blueballoon/review/list')
			}
		});
	});
	
	
	//글 추천
	$("#goodArea").on("click", "#goodBtn", function(){
		var param ={
				revNum : "${detail.revNum}",
				_csrf:"${_csrf.token}"
		};
		//console.log(${detail.revNum});
		$.ajax({
			url:"/blueballoon/review/revGood",
			method:"post",
			data:param,
			success:function(result){
				}, error: function() {
				
				console.log("안된다");
			}
		});
	});
	
	// 댓글 작성
	$("#reply_write").on("click", function() {
		// 비로그인이면 중단
		//if(board.loginId==undefined)
			//return;
		var param = {
			revNum: ${detail.revNum},
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
	
	// 4-7. 댓글 삭제
	$("input[id^='delete_reply']").on("click", function() {
		//if(board.isLogin==false || board.loginId!=$(this).data("writer"))
			//return;
		var revNum= '${detail.revNum}'
		var param = {
			_method:"delete",
			replyNum : $(this).data("rnum"),
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
<sec:authentication var="principal" property="principal"/>
<h2>후기게시판</h2>
<div id="revDetail" class="form-group">
	<div id="revDetailTop">
		<div id="revDetailTopLeft">
			<input id="revTitle" name="revTitle" value="${detail.revTitle}" readonly="readonly">
		</div>
		<div id="revDetailTopRight">
			등록일:${detail.revWriteDateStr}
			조회수:${detail.revReadCnt }
			작성자:<span style="font-weight: bold;">${detail.memId }</span>
			<div id="goodArea">
		<button type="button" id="goodBtn" class="btn btn-primary">
					추천<span class="badge" id="revGoodCnt">${detail.revGoodCnt}</span></button>
			</div>		
		</div>
	</div>
<br>
<br>
<textarea name="revContent" id="revContent" class="form-control" readonly="readonly">${detail.revContent}</textarea>
<br>
<div id="revDetailBottom">
<c:if test="${detail.memId == principal.username }">
<a href="/blueballoon/review/update?revNum=${detail.revNum}"><button class="btn btn-info">수정</button></a>
<button id="deleteBtn" type="button" data-revnum="${detail.revNum}" class="btn btn-info">삭제</button>
</c:if>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="/blueballoon/review/update?revNum=${detail.revNum}"><button class="btn btn-info">수정</button></a>
<button id="deleteBtn" type="button" data-revnum="${detail.revNum}" class="btn btn-info">삭제</button>
</sec:authorize>
<a href="/blueballoon/review/list"><button id="listBtn" class="btn btn-info" type="button">목록</button></a>
<input type="hidden" name="revNum" value="${detail.revNum}">
<input type="hidden" value="${_csrf.token}" name="_csrf">
</div>
	<div>
		<div class="form-group">
      		<label for="reply_teaxarea">댓글을 입력하세요</label>
      		<textarea class="form-control" row="5" id="reply_textarea" 
      			placeholder="욕설이나 모욕적인 댓글은 삭제될 수 있습니다"></textarea>
    	</div>
    	<button type="button" class="btn btn-info" id="reply_write">
     		<span class="glyphicon glyphicon-ok"></span>댓글 작성
    	</button>
	</div>
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
			<input type="button" id="delete_reply${status.index}" class="btn btn-info" value="삭제" data-rnum="${r.replyNum}"  style="float: right;">
			</sec:authorize>
			<c:if test="${r.memId == principal.username}">
			<input type="button" id="delete_reply${status.index}" class="btn btn-info" value="삭제" data-rnum="${r.replyNum}"  style="float: right;">
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