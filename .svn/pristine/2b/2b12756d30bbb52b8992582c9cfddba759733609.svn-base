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
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<style>
#packageInfoLeft table, th, td{
	border: 1px solid black;
	text-align: center;
	width: 690px;
}
#packageInfoLeft h2{
	text-align: center;
}
#packageInfoLeft{
	width: 695px;
	float: left;
}
#packageInfoRight{
	float: right;
	height: 400px;
	width: 300px;
	text-align: center;
	font-size: 17px;
	font-weight: bold;
	border: 1px solid gray;
}
#packageInfoRight>div{
text-align: center;
position: relative;
top: 50px;

}
#payBtn{background-color: #69CDEB;
	border: 0;
	outline: 0;
	color: white;
	width: 250px;
	height: 50px;
	font-weight: bold;
	font-size: 20px;
	}
#packageInfoRight>input,#packageInfoRight>input:focus{
	border: none;
	outline: none;
	text-align: center;
}	
</style>
<script>
$(function(){
	var session = '${cnt}'
	console.log('${stayNum}');
	if(session==''){
		alert('숙박업소를 먼저 결정하셔야 합니다.');
		self.location.replace('/blueballoon/accom/list')
	}
	IMP.init('imp02196869');
	// 주중가격
	var shipWeekPrice = $("#shipWeekPrice").text();
	var accomWeekPrice = $("#accomWeekPrice").text();
	// 주말가격
	var shipWkndPrice = $("#shipWkndPrice").text();
	var accomWkndPrice = $("#accomWkndPrice").text();
	var price = 0;
	var departure = '${stay.stay.stayDate}'
	var date = new Date(departure);
	if(date.getDay()==0 || date.getDay()==6){
		// 만약 출발일이 토,일요일이면 주말가격
		// getDay() = 0:일, 1:월, 2:화, 3:수, 4:목, 5:금 6:토
		price = parseInt(shipWkndPrice) + parseInt(accomWkndPrice)
	}else{
		// 아니면 평일가격
		price = parseInt(shipWeekPrice) + parseInt(accomWeekPrice)
	}
	var cnt = '${stay.stay.stayCanCap }'
	var totalPrice = cnt*price;
	$("#amount").val(totalPrice);
	console.log($("#amount").val())
	totalPrice = totalPrice.toLocaleString()+'원' // 통화표시
	$("#price").val(totalPrice);
	
	$("#payBtn").on("click",function(){
		var name= $("#pkgName").val();
		var amount = $("#amount").val();
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : name,
		    amount : amount,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var memId = $("#memId").val();
				var pkgNum = $("#pkgNum").val();
				var payPeopleCnt = $("#cnt").val();
				var accomNum = '${detail.accommodation.accomNum}'
				var params ={
						pkgNum:pkgNum,	
						memId:memId,
						payTotal:amount,
						payPeopleCnt: payPeopleCnt,
						_csrf:'${_csrf.token}'
				}
				$.ajax({
					url:"/blueballoon/pay/payment",
					method:"get",
					data: params,
					success:function(e){
				    $("#packageInfoForm").submit();
					},error:function(xhr){
						console.log(xhr.status);
					}
				});
			    var msg = '결제가 완료되었습니다.';
			    msg += '고유ID : ' + rsp.imp_uid;
			    msg += '상점 거래ID : ' + rsp.merchant_uid;
			    msg += '결제 금액 : ' + rsp.paid_amount;
			    msg += '카드 승인번호 : ' + rsp.apply_num;						
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	})
});
</script>
</head>
<body>
<form action="/blueballoon/package/info" method="post" id="packageInfoForm">
<div  id="packageInfo">
	<div id="packageInfoLeft">
		<br>
		<br>
		<br>
		<h2>숙박</h2>
		<table>
		<tr>
			<th>숙박업소명</th>
			<th>숙박업소주소</th>
			<th>주중가격</th>
			<th>주말가격</th>
		</tr>
		<tr>
			<td>${stay.accommodation.memBrand}</td>
			<td>${stay.accommodation.accomAddr}</td>
			<td id="accomWeekPrice">${stay.accommodation.accomWeekPrice}원</td>
			<td id="accomWkndPrice">${stay.accommodation.accomWkndPrice}원</td>
		</tr>	
		</table>
		<h2>선박</h2>
		<table>
		<tr>
			<th>선박명</th>
			<th>출발시간</th>
			<th>주중가격</th>
			<th>주말가격</th>
		</tr>
		<tr>
			<td>${trans.ship.shipName}</td>
			<td>${trans.ship.shipDeparture}</td>
			<td id="shipWeekPrice">${trans.ship.shipWeekPrice}원</td>
			<td id="shipWkndPrice">${trans.ship.shipWkndPrice}원</td>
		</tr>	
		</table>
	</div>
	<div id="packageInfoRight">
		<br>
		<br>
		<br>
		출발일 <input type="text" value="${stay.stay.stayDate}" readonly="readonly">
		<br>
		<br>
		인원 <input type="text" id="cnt" value="${stay.stay.stayCanCap}" readonly="readonly">
		<br>
		<br>
		결제금액<input type="text" id="price" readonly="readonly">
		<div>
			<button id="payBtn" type="button">결제하기</button>
		</div>
	</div>
</div>
<input type="hidden" value="${info.pkgNum}" id="pkgNum">
<input type="hidden" value="${info.pkgName}" id="pkgName">
<input type="hidden" value="${info.transport.memId}" id="memId">
<input type="hidden" value="${_csrf.token}" name="_csrf">
<input type="hidden" id="amount">
</form>
</body>
</html>