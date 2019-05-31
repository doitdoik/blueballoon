<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<style>
#packageWrite{margin: 0 auto;
			position: relative;
			top:70px;
			left: 250px;}
#show_picture{
	margin-left:50px;
	height : 362px; 
	width : 368px;
}

</style>
<script>
function init(){
	$("#pkgName").val("");
	$("#shipNum").find("option:eq(0)").prop("selected", true);
	$("#accomNum").find("option:eq(0)").prop("selected", true);
}
$(function(){
	$("#writeBtn").on("click",function(){
		var pkgName = $("#pkgName").val();
		var shipNum = $("#shipNum option:selected").val();
		var accomNum = $("#accomNum option:selected").val();
		if(pkgName=="" || shipNum=="선박을 선택해주세요." || accomNum=="숙박업소를 선택해주세요."){
			alert("모든 항목을 채워 주세요")
			init();
			$("#writeBtn").attr("type","button");
			return;
		}
	});
});

//사진 출력하기 : 1MB가 넘으면 업로드 거부
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


<body>
<form action="/blueballoon/package/write" id="writeForm" method="post" enctype="multipart/form-data">
<div class="col-lg-6" id="packageWrite">
<div id="packageWriteTitle" style="text-align: center;">
<h1>패키지 등록</h1>
</div>
<div id="pic" class="test" >
			<img id="show_picture" >
			<input id="picture" type="file" name="picture" class="form-control"  accept=".jpg,.jpeg,.png,.gif,.bmp">
			</div>
패키지 이름: <input name="pkgName" id="pkgName" class="form-control"><br>
선박 선택: <select name="shipNum" id="shipNum" class="form-control">
				<option disabled="disabled" selected="selected" >선박을 선택해주세요.</option>
				<c:forEach items="${ship}" var="ship">
					<option value="${ship.shipNum}">${ship.shipName}</option>
				</c:forEach>
			</select>
			<br>
숙박업소 선택:<select name="accomNum" id="accomNum" class="form-control">
				<option disabled="disabled" selected="selected">숙박업소를 선택해주세요.</option>
				<c:forEach items="${accom}" var="accom">
					<option value="${accom.accomNum}">${accom.memBrand}</option>
				</c:forEach>
			</select><br>				
<input type="hidden" name="_csrf" value="${_csrf.token}">
<button id="writeBtn" style="float:right;">등록</button>
</div>
</form>
</body>
</html>