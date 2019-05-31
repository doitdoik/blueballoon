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
.results{
	overflow: hidden;
	resize: none;
	height:25px;
	width:330px; 
	text-align: center;
	border: 1px solid black;
}
</style>
<script>
	
	
	$(function(){
		$("#deleteBtn").on("click",function(){
			var shipnum = $("#deleteBtn").data("shipnum");
			console.log(shipnum);
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
		})
	})
})	
</script>
<script>
//프사 출력하기 : 1MB가 넘으면 업로드 거부
function loadImage() {
	var file = document.getElementById("picture").files[0];
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		toastr.warning("사진은 1MB이하여야 합니다", "경고");
		document.getElementById("picture").value="";
		return false;
	}
	
	// 이하 하드디스크에 있는 이미지 파일을 로딩해 화면에 출력하는 코드
	var url = window.URL || window.webkitURL;
	var img = new Image();
	
	img.src = url.createObjectURL(file);
	
	var reader = new FileReader();
	reader.onload = function(e) {
		$("#show_picture").attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
	return true;
}

function insertImage(){
	var formData = new FormData(document.getElementById("updateForm"));
}

$(function() { 
	$("#alert").hide();
	
	// 비동기 병렬 수행(thread) -> 프로그래머가 순서 제어
	// 둘 이상의 ajax를 내가 원하는 순서대로 실행하려면 내가 순서를 통제해야 한다 

	// 1. ajax와 무관한 조건 체크. 작성한 순서대로 실행된다
	$("#picture").on("change", loadImage);
});
</script>
</head>
<body>
<form action="/blueballoon/ship/update" id="updateForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="shipNum" id="shipNum" value="${detail.shipNum}" />
			<input type="hidden" name="shipMaxCap" class="shipMaxCap" value="${detail.shipMaxCap}"/>
			<input type="hidden" name="transCanCap" class="transCanCap" value="${detail.transport.transCanCap }"/>
			<input type="hidden" name="shipName" id="shipName" value="${detail.shipName}" />
			<div id="title">
			<h1>
			<c:out value="${detail.shipName}"/>
			</h1>
			
			</div>
			<div id="pic" class="test" >
			<img src="http://localhost:8081/sajin/${detail.image.imageName}" id="show_picture" height="362px" width="368px" />
			<input id="picture" type="file" name="picture" class="form-control"  accept=".jpg,.jpeg,.png,.gif,.bmp">
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
						<td class="api" colspan="2">
							
						<input type="text" id="shipAddr" name="shipAddr" class="results" placeholder="${detail.shipAddr}">
						<input type="button" onclick="api_execDaumPostcode()" value="주소 검색"><br>
						</td>
					</tr>
				<tr>
					<td class="first">전화번호</td>
					<td class="second"><div id="memTel">
						<c:out value="${detail.member.memTel}"/>
					</div></td>
				</tr>
				<tr>
					<td class="first">주중가격</td>
					<td class="second">
					<textarea id="shipWeekPrice" name="shipWeekPrice" class="results" ><c:out value="${detail.shipWeekPrice}"/></textarea>
					</td>
				</tr>
				<tr>
					<td class="first">주말가격</td>
					<td class="second">
					<textarea id="shipWkndPrice" name="shipWkndPrice" class="results" ><c:out value="${detail.shipWkndPrice}"/></textarea>
					</td>
				</tr>
				<tr>
					<td class="first">최대수용인원</td>
					<td class="second">
						<textarea id="shipMaxCap"  class="results" ><c:out value="${detail.shipMaxCap}" /></textarea>
					</td>
				</tr>
				<tr>
					<td class="first">수용가능인원</td>
					<td class="second">
						<div>
							<c:out value="${detail.shipMaxCap-detail.transport.transCanCap }"></c:out>
						</div>
					</td>
				</tr>
				<tr>
					<td class="first">출발시간</td>
					<td class="second"><textarea id="shipDeparture" name="shipDeparture" class="results"><c:out value="${detail.shipDeparture}" /></textarea></td>
				</tr>
			
			</table>
			<div>

				<button class="btn btn-info" id="updateBtn" name="updateBtn" >수정완료</button>
				
			</div>				
			<div>
			<textarea id="shipContent" name="shipContent" >${detail.shipContent}</textarea>
			</div>		
			<input type="hidden" value="${_csrf.token}" name="_csrf">
			<div id="map"></div>
		
		
	<!-- 입력된 주소값을 지도로 표시하는 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e55fb4c99860108c9564cfb89bc19d5&libraries=services"></script>		
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		//마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });		
 function api_execDaumPostcode() {
		       new daum.Postcode({
		           oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수

		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("shipAddr").value = addr;
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {

		                        var result = results[0]; //첫번째 결과의 값을 활용

		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords)
		                    }
		                });
		            }
		        }).open();
		    }
</script>
	</form>
</body>
</html>