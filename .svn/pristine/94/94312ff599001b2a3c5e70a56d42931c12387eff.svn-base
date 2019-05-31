<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#reviewList{width: 700px;
		position: relative;
		top: 70px;}
#pagination{text-align: center;}

body h2{
text-align: center;
}		
</style>
</head>
<body>
<h2>후기게시판</h2>
<div id="reviewList">
   <div id="list">
      <table class="table">
         <colgroup>
            <col width="10%">
            <col width="40%">
            <col width="20%">
            <col width="20%">
              <col width="10%">
         </colgroup>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
            <th>작성자</th>
             <th>조회수</th>
         </tr>
         <c:forEach items="${map.list}" var="review">
        <tr>
            <td>${review.revNum}</td>
            <td><a href="/blueballoon/review/detail?revNum=${review.revNum}">
            ${review.revTitle}</a><span>&nbsp;&nbsp;[${review.replyCnt}]</span></td>
            <td>${review.revWriteDateStr}</td>
            <td><input type="hidden" name="_csrf" value="${_csrf.token}">${review.memId}</td>
                <td>${review.revReadCnt}</td>
         </tr>
         </c:forEach>
      </table>
   </div>
   <div id="pagination">
      <ul class="pagination">
         <c:if test="${map.pagination.prev ne 0}">
            <li><a href="/blueballoon/review/list?page=${map.pagination.prev}">&lt;</a></li>
         </c:if>
         <c:forEach begin="${map.pagination.startPage}" end="${map.pagination.endPage}" var="i">
            <c:choose>
               <c:when test="${map.pagination.page eq i}">
                  <li class="active"><a href="/blueballoon/review/list?page=${i}">${i}</a></li>
               </c:when>
               <c:otherwise>
                  <li><a href="/blueballoon/review/list?page=${i}">${i}</a></li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      <c:if test="${map.pagination.next ne 0}">
         <li><a href="/blueballoon/review/list?page=${map.pagination.next}">&gt;</a></li>
      </c:if>
      </ul>
   </div>
</div>
<a href="/blueballoon/review/write">
<button class="btn btn-info" style="float: right;" id="writeBtn">글쓰기</button></a>

</body>
</html>