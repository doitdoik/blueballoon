<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<title>Insert title here</title>
<style>
form {
	margin: 0 auto;
	margin-top: 150px;
	margin-bottom: 30px;
	width: 200px;
}
</style>
<script>
$(function() {
	$("#findIdBtn").on("click", function() {
		$("#findIdFrm").submit();
	});
	});
</script>

</head>

<body>
아이디 찾기
 <div id="findId">
   <form id="findIdFrm" action="/blueballoon/member/findId" method="post">
    <div class="form-group">
     <label for="login_memName">이름</label>
     <input id="login_memName" type="text" name="memName" class="form-control">
     <span class="helper-text" id="login_memName_helper"></span>
     </div>
    <div class="form-group">
     <label for="login_memEmail">이메일</label>
     <input id="login_memEmail" type="text" name="memEmail" class="form-control">
     <span class="helper-text" id="login_memEmail_helper"></span>
    </div>
  <input type="hidden" name="_csrf"  value="${_csrf.token}">
			<button type="button" class="btn btn-success" id="findIdBtn">아이디 찾기</button>
   </form>
 </div>
</body>
</html>

