<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
<script>
$(function(){
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
});
</script>
</head>
<body>
<h2>후기게시판</h2>
<form action="/blueballoon/review/update" method="post">
<div id="revDetail" class="form-group">
	<div id="revDetailTop">
		<div id="revDetailTopLeft">
			<input id="revTitle" name="revTitle" value="${detail.revTitle}">
		</div>
		<div id="revDetailTopRight">
			등록일:${detail.revWriteDateStr}
		</div>
	</div>
<br>
<br>
<textarea name="revContent" id="revContent" class="form-control">${detail.revContent}</textarea>
<br>
<div id="revDetailBottom">

<button class="btn btn-info">수정완료</button>
<button id="deleteBtn" type="button" data-revnum="${detail.revNum}" class="btn btn-info">삭제</button>
<a href="/blueballoon/review/list"><button id="listBtn" class="btn btn-info" type="button">목록</button></a>
</div>
<input type="hidden" name="revNum" value="${detail.revNum}">
<input type="hidden" value="${_csrf.token}" name="_csrf">
</div>
</form>
</body>
</html>