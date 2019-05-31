<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx }/css/sweetalert.css" />
<script type="text/javascript" src="<c:url value='/js/sweetalert.min.js'/>"></script>
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
	$("#findPwdBtn").on("click", function() {
		$("#findPwdFrm").submit();
	});
});
</script>

</head>

<body>
비밀번호 찾기
 <div id="findPwd">
   <form id="findPwdFrm" action="/blueballoon/member/findPwd" method="post">
         <div class="form-group">
            <label for="findPwd_id">아이디</label>
            <input id="findPwd_id" type="text" name="memId" class="form-control">
            <span class="helper-text" id="findPwd_id_helper"></span>
         </div>
         <div class="form-group">
            <label for="findPwd_email">이메일</label>
            <input id="findPwd_email" type="text" name="memEmail" class="form-control">
            <span class="helper-text" id="findPwd_email_helper"></span>
         </div>
         <input type="hidden" name="_csrf" value="${_csrf.token}">
         <button type="button" class="btn btn-success" id="findPwdBtn">비밀번호 찾기</button>
      </form>
 </div>
</body>
</html>