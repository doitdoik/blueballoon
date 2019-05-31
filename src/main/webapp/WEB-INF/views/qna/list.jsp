<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
table{
		box-sizing: border-box;
		text-align: center;
}
table th{
	text-align: center;
}
#qnaList{
   width: 700px;
	 	position: relative;
	 	top: 70px; }
#pagination{text-align: center;}
#writeBtn a{
   color: white; 
   text-decoration: none; }
body h2{
   text-align: center;
}
</style>
<script>
$(function(){
	var memId = "<sec:authentication property='principal.username'/>"
	var auth = '<sec:authentication property="principal.authorities"/>'
	$(".qnaLink").on("click",function(e){
		var writer = $(this).data("writer")
		// 관리자라면 모두 접근 가능
		if(auth.length==94){
			var qnaNum = $(this).data("qno"); 
			location.href='/blueballoon/qna/detail?qnaNum='+qnaNum
		}else if(memId!=writer){
		// 사용자가 글쓴이가 아니라면 접근 불가능	
			e.preventDefault();
			alert('해당글의 본인만 접근 가능 합니다.')
			return;
		}
	});
})
</script>
</head>
<body>
<h2>Q&A</h2>
<div id="qnaList">
   <div id="list">
      <table class="table">
         <colgroup>
            <col width="10%">
            <col width="50%">
            <col width="20%">
            <col width="20%">
         </colgroup>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
            <th>작성자</th>
         </tr>
         <c:forEach items="${map.list}" var="qna">
        <tr>
            <td>${qna.qnaNum}</td>
            <td><i class="fa fa-lock" aria-hidden="true"></i><a href="/blueballoon/qna/detail?qnaNum=${qna.qnaNum}" class="qnaLink" data-writer="${qna.memId}" data-qno="${qna.qnaNum}">
            ${qna.qnaTitle}</a><span>&nbsp;&nbsp;[${qna.replyCnt}]</span></td>
            <td>${qna.qnaWriteDateStr}</td>
            <td><input type="hidden" name="_csrf" value="${_csrf.token}">${qna.memId}</td>
         </tr>
         </c:forEach>
      </table>
   </div>
   <div id="pagination">
      <ul class="pagination">
         <c:if test="${map.pagination.prev ne 0}">
            <li><a href="/blueballoon/qna/list?page=${map.pagination.prev}">&lt;</a></li>
         </c:if>
         <c:forEach begin="${map.pagination.startPage}" end="${map.pagination.endPage}" var="i">
            <c:choose>
               <c:when test="${map.pagination.page eq i}">
                  <li class="active"><a href="/blueballoon/qna/list?page=${i}">${i}</a></li>
               </c:when>
               <c:otherwise>
                  <li><a href="/blueballoon/qna/list?page=${i}">${i}</a></li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      <c:if test="${map.pagination.next ne 0}">
         <li><a href="/blueballoon/qna/list?page=${map.pagination.next}">&gt;</a></li>
      </c:if>
      </ul>
   </div>
</div>
<a href="/blueballoon/qna/write">
<button class="btn btn-info" style="float:right;" id="writeBtn">글쓰기</button></a>
</body>
</html>