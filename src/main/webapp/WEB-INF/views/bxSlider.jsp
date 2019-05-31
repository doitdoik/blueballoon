<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
 <script> 
    $(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true,
        speed: 500,  
        pause: 3000, 
        mode: 'horizontal',
        autoControls: true, 
        pager: true, 
        captions: true, 
    });
});
    </script> 
<style>
.bxslider img {
	text-align: center;
	margin: 0px;
	margin-top: -20px;
	margin-left: -3px;
	height: 440px;
	width: 1005px;
}
</style>
</head> 
<body>
 <ul class="bxslider">
      <li><a href="#"><img src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&id=d8eb1e89-93fe-4a3c-b8b8-1e730c9c1da1" alt="" title="백령도"></a></li>
      <li><a href="#"><img src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&id=848be087-edd5-437a-9eaf-967d76c34342" alt="" title="덕적도"></a></li>
      <li><a href="#"><img src="https://support.visitkorea.or.kr/img/call?cmd=VIEW&id=eee8ac8c-9731-4820-8819-c273f4d6ad44" alt="" title="장봉도"></a></li>
  </ul>
</body>
</html>