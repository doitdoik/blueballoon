<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
function departure(){
	// 출발일 반환
	var departure = $('#departure').val()
	setInterval(function(){
		departure
	},100)
	return departure;
}
function initDate(){
	// 출발일, 도착일 초기화
	$('#departure').val("")
	$('#arrival').val("")
}
function initCnt(){
	// 인원 초기화
	$("#cnt").find("option:eq(0)").prop("selected", true);
}
function initPrice(){
	// 가격 초기화
	$("#price").text("");
}
$(function(){
	IMP.init('imp02196869');
		// 인원 수를 입력하면
	$("#cnt").on("change",function(){
		var cnt = $("#cnt option:selected").val();
		if(departure()==""){
			alert("출발일을 선택하세요");
			initCnt()
			return;
		}
		// 평일가격
		var shipWeekPrice = $("#shipWeekPrice").text();
		var accomWeekPrice = $("#accomWeekPrice").text();
		// 주말가격
		var shipWkndPrice = $("#shipWkndPrice").text();
		var accomWkndPrice = $("#accomWkndPrice").text();
		var price = 0;
		var date = new Date(departure());
		if(date.getDay()==0 || date.getDay()==6){
			// 만약 출발일이 토,일요일이면 주말가격
			// getDay() = 0:일, 1:월, 2:화, 3:수, 4:목, 5:금 6:토
			price = parseInt(shipWkndPrice) + parseInt(accomWkndPrice)
		}else{
			// 아니면 평일가격
			price = parseInt(shipWeekPrice) + parseInt(accomWeekPrice)
		}
		console.log(date.getDay())	
		// 가격을 곱해서 출력
		var totalPrice = cnt*price;
		$("#amount").val(totalPrice);
		totalPrice = totalPrice.toLocaleString()+'원' // 통화표시
		$("#price").text(totalPrice);
	})
	
	$("#departure").on("change",function(){
		initCnt()
		initPrice()
		// 출발일을 가진 Date객체 생성
		var date = new Date(departure());
		// 도착 년,월,일을 넣어줌
		var arrivalDate = date.setDate(date.getDate()+1);// 출발일 +1
		arrivalDate = date.getDate();
		var arrivalYear = date.getFullYear();// 출발 년도
		var arrivalMonth = date.getMonth()+1;// 출발 월 getMonth()는 0부터 시작이라 1 더해줌
		// 출발일에 yyyy/mm/dd 형태로 출력하기 위해 조건 설정
		if(arrivalMonth<10 && arrivalDate<10){
			var arrival = arrivalYear+"-0"+arrivalMonth+"-0"+arrivalDate
		}else if(arrivalMonth<10 && arrivalDate>=10){
			var arrival = arrivalYear+"-0"+arrivalMonth+"-"+arrivalDate
		}else if(arrivalMonth>10 && arrivalDate<10){
			var arrival = arrivalYear+"-"+arrivalMonth+"-0"+arrivalDate
		} else {
			var arrival = arrivalYear+"-"+arrivalMonth+"-"+arrivalDate
		}
		
		var today = new Date(); // Date객체를 생성하면 오늘 날짜로 생성됨
		var dateArrival = new Date(arrival);// 오늘과 날짜 비교하기 위해 도착일 Date생성
		if(dateArrival<today){
			//도착일이 오늘보다 과거라면
			alert("출발일을 다시 설정 해주세요.");
			initDate();// 출발일, 도착일 초기화
			return;
		};
		$("#arrival").val(arrival)
	});
	
	$("#payBtn").on("click",function(){
		var departure = $("#departure").val();
		var cnt = $("#cnt option:selected").val();
		var principal = "<sec:authentication property='principal'/>"
		if(departure=="" || cnt=="인원을 선택하세요"){
			alert("항목을 모두 채워주세요.")		
			return;
		}
		// 로그인을 안했다면 로그인창으로 이동
		if(principal=='anonymousUser'){
			alert("로그인이 필요합니다.")
			location.href='/blueballoon/member/login'
			return;
		}
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
				var shipNum = '${detail.ship.shipNum}'
				var csrf = '${_csrf.token}'
				var departure = $("#departure").val();
				
				var params1 ={
					_csrf:csrf,
					_method :"patch",
					accomNum: accomNum,
					shipNum: shipNum,
					stayCanCap: payPeopleCnt,
					transCanCap: payPeopleCnt,
					transDate: departure,
					stayDate: departure
				}
				
				$.ajax({
					url:"/blueballoon/package/package",
					method:"post",
					data: params1,
					success:function(e){
							
					},error:function(xhr){
						alert("실패")
					}
				});
				
				var params2 ={
						pkgNum:pkgNum,	
						memId:memId,
						payTotal:amount,
						payPeopleCnt: payPeopleCnt,
						_csrf:csrf
				}
				
				$.ajax({
					url:"/blueballoon/pay/payment",
					method:"get",
					data: params2,
					success:function(e){
						
					},error:function(xhr){
						console.log(xhr.status);
					}
				});
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        location.href="/blueballoon/pay/info"// 결제 정보창으로 이동
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }

		    alert(msg);
		});
	})
	$("#deleteBtn").on("click",function(){
		var pkgNum = $("#pkgNum").val();
		var params={
				pkgNum: pkgNum,
				_csrf:'${_csrf.token}',
				_method:'delete'
		}
		$.ajax({
			url:'/blueballoon/package/delete',
			method:'post',
			data: params,
			success: function(){
				self.location.replace('/blueballoon/package/list')
			},error:function(xhr){
				console.log(xhr.status);
			}
		});
	});
});
</script>
<style>
 textarea{width:1000px;
 min-height: 600px;
 resize: none;}
 
 #pkgDetailTop{height: 500px;}
 
 #pkgDetailTopLeft{width:548px; 
 					float: left; 
 					height: 500px;
 					 }
 					 
 #pkgDetailTopRight{width: 449px;  
					 float: right; 
					 height: 350px;
					 }
table{
	width: 448px;
	text-align: center;
	border: 1px solid black;}
	
table th{
		text-align: center;
}	

tr{border: 1px solid black;}	
#pkgDetailTopRightBottom{
	height: 150px;
}

#payBtn{background-color: #69CDEB;
	border: 0;
	outline: 0;
	color: white;
	width: 250px;
	height: 50px;
	font-weight: bold;
	font-size: 20px;
	position: relative;
	left: 100px;
	}
	
span{font-weight: bold;
	font-size: 15px;
	position: relative;
	top: 50px;
	left: 150px;
	color: blue;}
	
#pkgDetailTopRightBottom div{
	position: relative;
	top:49px;}
	
#price{position: static;
font-size: 20px;
color: black;}

#packageListBtn a{
	text-decoration: none;
	color: white;
	display: block;
}

#packageDetailBtnGroup{
	text-align: center;
}	

#pkgName, #pkgName:focus {
	border: none;
	outline: none;
}
#shipMaxCap{
	position: static;
	color: black;
	font-weight: lighter;
} 			 
</style>
</head>
<body>
<div class="row">
	<div class="col-lg-6">
	<h1><input value="<c:out value="${detail.pkgName}"/>" readonly="readonly" id="pkgName"></h1>
	</div>
</div>
<div id="pkgDetailTop">
	<div id="pkgDetailTopLeft">
		<div id="pkgDetailPic">
		<img src="http://localhost:8081/sajin/${detail.image.imageName}" style="width: 550px; height: 500px;">
		</div>
	</div>
	<div id="pkgDetailTopRight">
	<p>평일출발</p>
		<table>
		<tr>
			<th>구분</th>
			<th>선박금액</th>
			<th>숙박금액</th>
		</tr>	
		<tr>
			<td>1인요금</td>
			<td id="shipWeekPrice">${detail.ship.shipWeekPrice}</td>
			<td id="accomWeekPrice">${detail.accommodation.accomWeekPrice}</td>
		</tr>
		</table>
		<br>
	<p>주말출발</p>	
		<table>
			<th>구분</th>
			<th>선박금액</th>
			<th>숙박금액</th>
			<tr>
			<td>1인요금</td>
			<td id="shipWkndPrice">${detail.ship.shipWkndPrice}</td>
			<td id="accomWkndPrice">${detail.accommodation.accomWkndPrice}</td>
			</tr>
		</table><br>
		&nbsp;출발일 &nbsp;&nbsp;&nbsp;<input type="date" id="departure" name="stayDate">&nbsp;
		도착일 <input id="arrival" readonly="readonly" style="background-color: #EAEDE8">
		<br>
		<br>
		예약 인원 <select id="cnt" name="payPeopleCnt">
			<option selected="selected" disabled="disabled">인원을 선택하세요</option>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
			<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>
		</select>
		<br>
		<br>
		선박 이름:${detail.ship.shipName}&nbsp;&nbsp;선박 최대인원:${detail.ship.shipMaxCap}명&nbsp;&nbsp;출항 시간:${detail.ship.shipDeparture}
		<br>
		<br>
		숙박 업소:${detail.accommodation.memBrand}&nbsp;&nbsp;숙박 최대인원:${detail.accommodation.accomMaxCap}명&nbsp;&nbsp;평점 ${detail.star.starScore}/5.0
		<br>
		<br>
		주소 :${detail.accommodation.accomAddr}
		<div id="pkgDetailTopRightBottom">
		<span>결제 금액: <span id="price"></span></span>
			<div>
				<button id="payBtn" type="button">결제하기</button>
			</div>
		</div><!-- pkgDetailTopRightBottom -->
	</div><!-- pkgDetailTopRight -->
</div><!-- pkgDetailTop -->
<div id="pkgDetailBottom">
<textarea readonly="readonly">&lt;선박내용&gt;

${detail.ship.shipContent}

&lt;숙박내용&gt;

${detail.accommodation.accomContent }</textarea>
</div>
<input type="hidden" id="pkgNum" name="pkgNum" value="${detail.pkgNum}">
<input type="hidden" id="accomNum" name="accomNum" value="${detail.accommodation.accomNum}">
<input type="hidden" id="amount">
<div id="packageDetailBtnGroup">
<a href="/blueballoon/package/list" style="text-decoration: none;"><button type="button" class="btn btn-info" id="packageListBtn">목록</button></a>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="/blueballoon/package/update?pkgNum=${detail.pkgNum}&accomNum=${detail.accommodation.accomNum}&shipNum=${detail.ship.shipNum}" ><button type="submit" class="btn btn-info">수정</button></a>
<button type="button" id="deleteBtn" class="btn btn-info">삭제</button>
</sec:authorize>
</div>
</body>
</html>