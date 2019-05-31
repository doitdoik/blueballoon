<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	table{
		position: relative;
		top: 100px;
	}
	table, th, table tr
	   {width:850px;
		text-align: center;
		border: 1px solid black;}
	table td{
		border: 1px solid black;
	}	
	#payInfoTop{
		margin: 0 auto;
		text-align: center;
		color: black;
	}
	#star{
		border: 1px solid white;
	}
</style>
<script>

$(function(){
	$(".insert").on("click",function(){
		var aNum = $(this).data("anum")
		var url = '/blueballoon/star/form?accomNum='+aNum;
		window.open(url,'별점주기','width=500,height=500,left=400,top=300');
	});
});
</script>
</head>
<body>
<div id="payInfoTop">
<h1>결제 정보</h1>
</div>
<table>
	<tr>
		<th>패키지</th>
		<th>출발일</th>
		<th>선박 이름</th>
		<th>출항 시간</th>
		<th>숙소 이름</th>
		<th>숙소 주소</th>
		<th>예약 인원</th>
		<th>결제 시간</th>
		<th>결제 금액</th>
	</tr>
	
	
<c:forEach items="${info}" var="info">
		<tr>
			<td>${info.package1.pkgName}</td>
			<td>${info.transport.transDate}</td>
			<td>${info.ship.shipName}</td>
			<td>${info.ship.shipDeparture}</td>
			<td>${info.accommodation.memBrand}</td>
			<td>${info.accommodation.accomAddr}</td>
			<td>${info.payPeopleCnt}명</td>
			<td>${info.payDateStr}</td>
			<td><fmt:formatNumber value="${info.payTotal}"/>원</td>
			<td id="star"><input type="button"  value="별점주기" class="insert" data-anum="${info.accommodation.accomNum}"></td>
		</tr>
</c:forEach>	 
</table>
</body>
</html>