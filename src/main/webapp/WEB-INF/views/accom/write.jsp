<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
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
	height:400px;
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

#accomContent{
 border:1px solid black;
 width:910px;
 height:400px;
 margin-top:0px;
 margin:40px;
 resize: none;
}

.first{
	width:150px;
}

.second{
	width:500px;
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
#accomTitle{
	height:50px;
	resize: none;
}
#api_address{
	width:300px;
}
</style>
  <script>
	function printUser(member) {
		console.log(member);
		$(".memBrand").text(member.memBrand);
		$("#memTel").text(member.memTel);
	}
	$(function() {
		var member = JSON.parse('${member}')
		printUser(member);

	});

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
	var formData = new FormData(document.getElementById("writeForm"));
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
		<form action="/blueballoon/accom/write" id="writeForm"  method="post" enctype="multipart/form-data">

			<div id="title">제목<br> <textarea class="memBrand" name="memBrand" id="accomTitle" cols="30" rows="10" readonly="readonly"></textarea>
			</div>
			<div id="pic" class="test" >
			<img id="show_picture" height="362px" width="368px">
			<input id="picture" type="file" name="picture" class="form-control"  accept=".jpg,.jpeg,.png,.gif,.bmp">
			</div>
			<table id="rightContent">
					<tr>
					<td class="first" >섬이름</td>
					<td class="second" >
						<select name="isNum" id="isNum" class="form-control">
						<option disabled="disabled" selected="selected" >섬을 선택해주세요.</option>
						<c:forEach items="${island}" var="island">
							<option value="${island.isNum}">${island.isName}</option>
						</c:forEach>
			</select></td>
				</tr>
				<tr>
					<td class="first" >업체명</td>
					<td class="second" ><div id="memBrand" class="memBrand" name="memBrand"></div></td>
				</tr>
					<tr class="api">
						<td class="api" colspan="2">
							<input type="text" id="accomAddr" name="accomAddr" placeholder="주소" >
							<input type="button" onclick="api_execDaumPostcode()" value="주소 검색"><br>
						</td>
					</tr>
				<tr>
					<td class="first">전화번호</td>
					<td class="second"><div id="memTel" name="memTel"></div></td>
				</tr>
				<tr>
					<td class="first">주중가격</td>
					<td class="second"><input type="text" id="accomWeekPrice" name="accomWeekPrice"/></td>
				</tr>
				<tr>
					<td class="first">주말가격</td>
					<td class="second"><input type="text" id="accomWkndPrice" name="accomWkndPrice"/></td>
				</tr>
				<tr>
					<td class="first">최대수용인원</td>
					<td class="second"><input type="text" id="accomMaxCap" name="accomMaxCap"/></td>
				</tr>
			</table>			
			<div>
			<textarea id="accomContent" name="accomContent" placeholder="숙박 내용 작성"></textarea>
			</div>		
			<input type="hidden" value="${_csrf.token}" name="_csrf">
			<div id="map"></div>
			<button id="write">작성</button>
	</form>	
		
		
<!-- 다음 api 적용하는 script -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e55fb4c99860108c9564cfb89bc19d5&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
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
                document.getElementById("accomAddr").value = addr;
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
</body>
</html>