<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write title here</title>
<link rel="stylesheet"	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
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

#islandContent{
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
#islandTitle{
	height:50px;
	resize: none;
}
#api_address{
	width:300px;
}
</style>


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
		<form action="/blueballoon/island/write"   id="writeForm"  method="post" enctype="multipart/form-data">
			<div id="title">제목<br> <textarea name="isName" id="islandTitle" cols="30" rows="10"></textarea>
			
			</div>
			<div id="pic" class="test" >
			<img id="show_picture" height="362px" width="368px">
			<input id="picture" type="file" name="picture" class="form-control"  accept=".jpg,.jpeg,.png,.gif,.bmp">
			</div>
		
			<div>
			<textarea id="islandContent" name="isInfo" placeholder="섬 정보 작성"></textarea>
			</div>		
			<input type="hidden" value="${_csrf.token}" name="_csrf">
			<button id="write">작성</button>
	</form>

</body>
</html>