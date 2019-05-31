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
#infoDetail{
text-align: center;
width: 95%;}
#listBtn a{ color: white;
		text-decoration: none;
		}
#infoDetailTop{
margin-top: 20px;
}		
#infoDetailTopLeft{
float: left;
font-weight: bold;
font-size: 20px;
}
#infoDetailTopRight{
width: 400px;
float: right;
text-align: right;
}		
body h2{
text-align: center;
}
#infoDetailBottom{
text-align: center;
}	
#infoContent{
background-color: white;
}
#infoTitle{
border: none;
}
#infoTitle:focus {
outline: none;
}
</style>
<script>
$(function(){
	$("#deleteBtn").on("click",function(){
		var infoNum = $("#deleteBtn").data("infonum");
		var params = {
				_csrf:'${_csrf.token}',
				_method:'delete',
				infoNum:infoNum
		}
		$.ajax({
			url:'/blueballoon/info/delete',
			method:'post',
			data:params,
			success:function(){
				self.location.replace('/blueballoon/info/list')
			}
		});
	});
});
</script>
</head>
<body>
<h2>공지사항</h2>
<div id="infoDetail" class="form-group">
	<div id="infoDetailTop">
		<div id="infoDetailTopLeft">
			<input id="infoTitle" name="infoTitle" value="${detail.infoTitle}" readonly="readonly">
		</div>
		<div id="infoDetailTopRight">
			등록일:${detail.infoWriteDateStr}
		</div>
	</div>
<br>
<br>
<textarea name="infoContent" id="infoContent" class="form-control" readonly="readonly">${detail.infoContent}</textarea>
<br>
<div id="infoDetailBottom">
<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="/blueballoon/info/update?infoNum=${detail.infoNum}"><button class="btn btn-info">수정</button></a>
<button id="deleteBtn" type="button" data-infonum="${detail.infoNum}" class="btn btn-info">삭제</button>
</sec:authorize>

<a href="/blueballoon/info/list"><button id="listBtn" class="btn btn-info" type="button">목록</button></a>
<input type="hidden" name="infoNum" value="${detail.infoNum}">
<input type="hidden" value="${_csrf.token}" name="_csrf">
</div>
</div>
</body>
</html>