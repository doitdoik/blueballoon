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
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<style>

#rightContent {
	width: 450px;
	height:370px;
	display: inline-block;
	margin:40px;
	margin-bottom: 20px;

}

#pic{
	border:1px solid black;
	width:370px;
	height:370px;
	display: inline-block;
	margin-bottom:20px;
	margin:40px;
	float:left;

}

#map{
	border:1px solid black;
	width:500px;
	height:500px;
	margin-top:10px;
	margin-left:250px;
	display:
}

#shipContent{
 border:1px solid black;
 width:910px;
 height:400px;
 margin-top:0px;
 margin:40px;
 resize: none;
}

.first{
	height:30px;
	width:200px;
}

.second{
	height:30px;
	width:380px;
	text-align: center;
}

#write{
	margin-left: 900px;
}

#title{
	margin-left:40px;
	margin-top:40px;
	font-size: 1.75em;
}
#shipTitle{
	height:50px;
	resize: none;
}
.btn{
	margin:10px;
}
.second input, .second input:focus {
text-align: center;
border: none;
outline: none;
width: 200px;
}

.results{
	overflow: hidden;
	resize: none;
	height:25px;
	width:330px; 
	text-align: center;
	border: 0px;
}
</style>
<script>
$(function(){
		var session = '${cnt}'
		if(session==""){
			$("#cnt").val("<숙박업소를 먼저 선택하세요>").css("font-size","0.75em")
			$("#departure").val("<숙박업소를 먼저 선택하세요>").css("font-size","0.75em")
		}
	$("#next").on("click",function(){
		if(session==""){
			alert("숙박업소를 먼저 선택하세요.")
			self.location.replace('/blueballoon')
			return;
		}
		$("form").submit();
	});
	
	$("#deleteBtn").on("click",function(){
		var shipnum = $("#deleteBtn").data("shipnum");
		var params ={
				shipnum:shipnum,
				_csrf:'${_csrf.token}',
				_method:'delete'
		}
		$.ajax({
			url:'/blueballoon/ship/delete',
			method:'post',
			data:params,
			success:function(){
				self.location.replace('/blueballoon/ship/list')
				}
			});
		});
});
</script>
</head>
<body>
<form action="/blueballoon/ship/detail" method="post" id="insertForm">
			
			<div id="title">
			<h1>
			<c:out value="${detail.shipName}"/>
			</h1>
			
			</div>
			<div id="pic" class="test" >
			<img src="http://localhost:8081/sajin/${detail.image.imageName}" id="show_picture" height="362px" width="368px" />
			</div>
		
			<table  id="rightContent">
				<tr>
					<td class="first" >섬이름 
					</td>
					<td class="second" ><div id="isName">
					<c:out value="${detail.island.isName}"/>
					</div></td>
				</tr>
				<tr>
					<td class="first" >업체명 
					</td>
					<td class="second" ><div id="memBrand">
					<c:out value="${detail.memBrand}"/>
					</div></td>
				</tr>
					<tr class="api">
						<td class="first">주소</td>
						<td class="second"><textarea id="shipAddr" name="shipAddr" class="results" readonly="readonly"><c:out value="${detail.shipAddr}"/></textarea></td>
					</tr>
				<tr>
					<td class="first">전화번호</td>
					<td class="second"><div id="memTel">
						<c:out value="${detail.member.memTel}"/>
					</div></td>
				</tr>
				<tr>
					<td class="first">주중가격</td>
					<td class="second"><textarea id="shipWeekPrice" name="shipWeekPrice" class="results" readonly="readonly" ><c:out value="${detail.shipWeekPrice}"/></textarea></td>
				</tr>
				<tr>
					<td class="first">주말가격</td>
					<td class="second"><textarea id="shipWkndPrice" name="shipWkndPrice" class="results" readonly="readonly"><c:out value="${detail.shipWkndPrice}"/></textarea></td>
				</tr>
				<tr>
					<td class="first">최대수용인원</td>
					<td class="second"><textarea id="shipMaxCap"  class="results" readonly="readonly"><c:out value="${detail.shipMaxCap}"/></textarea></td>
				</tr>
				<tr>
					<td class="first">잔여수용인원</td>
					<td class="second"><div id="transCanCap" name="transCanCap">
					<c:out value="${detail.shipMaxCap-detail.transport.transCanCap}"/>
					</div></td>
				</tr>
				<tr>
					<td class="first">선박인원</td>
					<td class="second">
						<input type="text" value="${cnt}" readonly="readonly" id="cnt" name="transCanCap">
					</td>
				</tr>
				<tr>
					<td class="first">출발일</td>
					<td class="second">
						<input type="text" value="${departure}" readonly="readonly" id="departure" name="transDate">
					</td>
				</tr>
			</table>
					
			<div>
				<sec:authorize access="hasRole('ROLE_SHIP')">
				<button class="btn btn-info" id="deleteBtn" type="button" data-shipnum="${detail.shipNum }">삭제</button>
				<a href="/blueballoon/ship/update?shipNum=${detail.shipNum}"><button class="btn btn-info" id="update" type="button">수정</button></a>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
				<button class="btn btn-info" id="next" type="button" >다음</button>
				</sec:authorize>
			</div>
				
		
			<div id="shipContent">
			<c:out value="${detail.shipContent}"/>
			</div>
				
			<input type="hidden" value="${_csrf.token}" name="_csrf">
			<input type="hidden" value="${detail.shipNum}" name="shipNum">
			<input type="hidden" value="${stayNum}" id="stayNum" name="stayNum">
			<input type="hidden" name="shipMaxCap" class="shipMaxCap" value="${detail.shipMaxCap}"/>
</form>			
			<div id="map"></div>
			
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e55fb4c99860108c9564cfb89bc19d5&libraries=services"></script>		
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		mapOption = {
        	center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
       		level: 5 // 지도의 확대 레벨
   			 };  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(value="${detail.shipAddr}", function(result, status) {

	    // 정상적으로 검색이 완료됐으면 	
    	if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:220px;text-align:center;padding:6px 0;">${detail.memBrand}<br>${detail.shipAddr}</div> '
            
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
   	     
   		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new daum.maps.ZoomControl();
        map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
    } 
});    
</script>
</body>
</html>