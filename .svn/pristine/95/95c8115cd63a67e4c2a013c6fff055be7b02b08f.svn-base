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
*{
margin: 0 auto;
}
p{
text-align: center;
}
.starRev{
text-align: center;
}
#starTop{
	height: 100px;
	background-color: #69CDEB;
}
#starBottom{
	text-align: center;
}
.starRev > input{
border: none;
}
.starRev > input:focus{
outline: none;
}
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

#starForm p {
	position: relative;
	top: 30px;
}
</style>
<script>
$(function(){
	$('.starRev input').click(function(){
		  $(this).parent().children('input').removeClass('on');
		  $(this).addClass('on').prevAll('input').addClass('on');
		  return false;
		});
	
	$(".starRev .starR").on("click",function(){
		 var starScore = $(this).val();
		console.log(starScore)
		 $("#starScore").val(starScore);
	})
		
	$("#insertBtn").on("click",function(){
		var memBrand = '${star.accommodation.memBrand}'
		var accomNum = '${star.accommodation.accomNum}'
		var starScore = $("#starScore").val();
		var params={
			accomNum: accomNum,
			memBrand: memBrand,
			starScore: starScore,
			_csrf:'${_csrf.token}'
		}
		$.ajax({
			url:'/blueballoon/star/star',
			method: 'get',
			data: params,
			success:function(){
				alert("별점이 반영되었습니다.")
				// 임시로 넣어두었던 번호를 삭제
				var csrf = '${_csrf.token}'
				$.ajax({
						url:"/blueballoon/star/delete",
						data:"_csrf="+csrf+"&_method=delete",
						method:'post',
						success:function(){
							
						}
					});	
				close();
			},error:function(xhr){
				console.log(xhr.status);
			}
		});
	});
	
});
</script>
</head>
<body>
<div id="starForm">
	<div id="starTop">
	</div>
<p><span style="font-size: 40px;">${star.accommodation.memBrand}</span> <span style="font-size: 20px;">어떠셨나요?</span></p>
<br>
<br>
<div class="starRev">
  <input type="text" class="starR on" value="1">
  <input type="text" class="starR on" value="2"> 
  <input type="text" class="starR on" value="3">
  <input type="text" class="starR on" value="4">
  <input type="text" class="starR on" value="5">
</div>
<br>
<br>
<br>
<%--별점 선택 안했으면 기본 5점 --%>
<input type="hidden" name="starScore" id="starScore" value="5">
<div id="starBottom">
	<button class="btn btn-info" id="insertBtn">확인</button>
</div>
</div>
</body>
</html>