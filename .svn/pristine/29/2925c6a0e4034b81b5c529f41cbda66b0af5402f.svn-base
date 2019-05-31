<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년',
    altField: '#input1',
    minDate: 0,
    appendText:"(yyyy-mm-dd)",
    onSelect: function(date){
    	var date = new Date(date);
    	var checkOutDate = date.setDate(date.getDate()+2)
    	checkOutDate= date.getDate()
    	var checkOutMonth = date.getMonth()+1
    	var checkOutYear = date.getFullYear()
    	if(checkOutMonth<10){
    		var checkOut = checkOutYear +'-0'+ checkOutMonth +'-'+ checkOutDate
    	}else if(checkOutDate<10){
    		var checkOut = checkOutYear +'-0'+ checkOutMonth +'-0'+ checkOutDate
    	}else{
    		var checkOut = checkOutYear +'-'+ checkOutMonth +'-'+ checkOutDate
    		}
    	$('#input2').val(checkOut);
    	console.log(checkOutMonth)
    }
});
function input(){
	var input = $('#input1').val()
	setInterval(function(){
		input
	},100)
	return input;
}
$(function(){
	
	$( "#datepicker" ).datepicker();
	
	$("div a").on("click",function(){
		$("#input2").val(input());
	})
	
});
</script>
</head>
<body>
<div id="datepicker"></div>
체크인: <input id="input1" readonly="readonly">
체크아웃: <input id="input2" readonly="readonly">dasdaasdas
</body>
</html>