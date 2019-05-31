<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#pagination {text-align: center;
			position: relative;
					top:15px;}
#packgeListPage a {text-decoration: none;
					}
.row{position: relative;
	top: 70px;}
</style>
</head>
<body>
<div id="packgeListPage">
<div class="row">
<c:forEach items="${map.list}" var="list">
	<div class="col-lg-4">
    <div class="thumbnail">
      <a href="/blueballoon/package/detail?pkgNum=${list.pkgNum}&accomNum=${list.accommodation.accomNum}&shipNum=${list.ship.shipNum}">
        <img src="http://localhost:8081/sajin/${list.image.imageName}" alt="Lights" style="width:100%">
        <div class="caption">
          <p style="font-size:30px; padding-bottom: 0;">${list.pkgName}</p>
        </div>
      </a>
    </div>
  </div>
</c:forEach>
</div>
<br>
<div id="pagination">
	<ul class="pagination pagination-sm">
		<c:if test="${map.pagination.prev ne 0}">
		<li><a href="/blueballoon/package/list?pageNo=${map.pagination.startPage-1}">&lt;</a></li>
		</c:if>
		<c:forEach var="i" begin="${map.pagination.startPage}" end="${map.pagination.endPage }">
			<c:choose>
				<c:when test="${i eq map.pagination.page}">
				<li class="active"><a href="/blueballoon/package/list?pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
				<li><a href="/blueballoon/package/list?pageNo=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>	
		</c:forEach>
		<c:if test="${map.pagination.next ne 0}">
		<li><a href="/blueballoon/package/list?pageNo=${map.pagination.endPage+1}">&gt;</a></li>
		</c:if>
	</ul>
</div>	
</div>	
</body>
</html>