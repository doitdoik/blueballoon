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

#accomContent{
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
#accomTitle{
   height:50px;
   resize: none;
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
   // 인원선택후 선박페이지로
function departure(){
   // 출발일 반환
   var departure = $('#departure').val()
   setInterval(function(){
      departure
   },100)
   return departure;
}
function initCnt(){
   // 인원 초기화
   $("#stayCanCap").find("option:eq(0)").prop("selected", true);
}
function initDate(){
   // 출발일, 도착일 초기화
   $('#departure').val("")
}
$(function(){
   $("#goShip").on("click",function(e){
      $("#goShip").attr("type","button");
      var accomNum = $("#accomNum").val();
      var stayCanCap = $("#stayCanCap").val();
      var stayNum = '${stayNum}'
      var stayDate = $("#departure").val();
      var session = '${newUser}'
      var cnt = $("#stayCanCap").val();
      console.log(cnt)
      console.log(stayDate)
       if(cnt==null){
          alert("인원을 선택하세요.")   
          initDate()
          return;
       }else if(stayDate==''){
          alert("출발일을 선택하세요.")
          initCnt()
          return;
       }else if(cnt==null && stayDate==''){
         alert("항목을 모두 채워주세요.")
         return;
      }
      var params1={
            accomNum : accomNum,               
            stayCanCap : stayCanCap,
            _method:'patch',
            _csrf:'${_csrf.token}'
      }
      var params2={
            accomNum : accomNum,               
            stayCanCap : stayCanCap,
            stayNum : stayNum,
            stayDate: stayDate,
            _method:'patch',
            _csrf:'${_csrf.token}'
      }
      if(session==''){
         $.ajax({
            url:'/blueballoon/accom/updateCnt',
            method:'post',
            data:params1,
            success:function(){
               $("form").submit();
            }, error:function(){
               alert("실패")
            }
         });
      }
      $("form").submit();
      
   });
   
   $("#deleteBtn").on("click",function(){
      var accomnum = $("#deleteBtn").data("accomnum");
      var params ={
            accomnum:accomnum,
            _csrf:'${_csrf.token}',
            _method:'delete'
      }
      $.ajax({
         url:'/blueballoon/accom/delete',
         method:'post',
         data:params,
         success:function(){
            self.location.replace('/blueballoon/accom/list')
         }
      });
   });
   
   $("#departure").on("change",function(){
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
});   
   
</script>
</head>
<body>
      <form action="/blueballoon/accom/detail"  method="post">
         <input type="hidden" name="accomNum" id="accomNum" value="${detail.accomNum}" />
         <input type="hidden" name="accomMaxCap" class="accomMaxCap" value="${detail.accomMaxCap}"/>
         <div id="title">
         <h1>
         <c:out value="${detail.memBrand}"/>
       <!-- NewUser : ${newUser}  --> 
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
                  <td class="second"><textarea id="accomAddr" name="accomAddr" class="results" readonly="readonly"><c:out value="${detail.accomAddr}"/></textarea></td>
               </tr>
            <tr>
               <td class="first">전화번호</td>
               <td class="second"><div id="memTel">
                  <c:out value="${detail.member.memTel}"/>
               </div></td>
            </tr>
            <tr>
               <td class="first">주중가격</td>
               <td class="second"><textarea id="accomWeekPrice" name="accomWeekPrice" class="results" readonly="readonly" ><c:out value="${detail.accomWeekPrice}"/></textarea></td>
            </tr>
            <tr>
               <td class="first">주말가격</td>
               <td class="second"><textarea id="accomWkndPrice" name="accomWkndPrice" class="results" readonly="readonly"><c:out value="${detail.accomWkndPrice}"/></textarea></td>
            </tr>
            <tr>
               <td class="first">최대수용인원</td>
               <td class="second"><textarea id="accomMaxCap"  class="results" readonly="readonly"><c:out value="${detail.accomMaxCap}" /></textarea></td>
            </tr>
            <tr>
               <td class="first">수용가능인원</td>
               <td class="second">
                  <div>
                     <c:out value="${detail.accomMaxCap-detail.stay.stayCanCap }"></c:out>
                  </div>
               </td>
            </tr>
               <tr>
               <td class="first">숙박인원</td>
               <td class="second">
                  <select id="stayCanCap" name="cnt">
                     <option selected="selected" disabled="disabled">인원을 선택하세요</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                     <option value="6">6</option>
                     <option value="7">7</option>
                     <option value="8">8</option>
                     <option value="9">9</option>
                     <option value="10">10</option>
                  </select>
               </td>
            </tr>
            <tr>
               <td class="first">출발일</td>
               <td class="second"><div>
               <input type="date" id="departure" name="stayDate">
               </div></td>
            </tr>
            <tr>
               <td class="first">도착일</td>
               <td class="second"><div>
               <input id="arrival" readonly="readonly" style="background-color: #EAEDE8">
               </div></td>
            </tr>
            <tr>
               <td class="first">평점</td>
               <td class="second"><div id="starScore" name="starScore">
               <c:out value="${detail.star.starScore}"/>/5.0
               </div></td>
            </tr>
         </table>
         <div>
         <sec:authorize access="hasRole('ROLE_ACCOM')">
            <button class="btn btn-info" id="deleteBtn" type="button" data-accomnum="${detail.accomNum }">삭제</button>
            <a href="/blueballoon/accom/update?accomNum=${detail.accomNum}"><button class="btn btn-info" id="update" type="button">수정</button></a>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">
           <a href="/blueballoon/ship/list?isNum=${detail.isNum}&pageNo=1"> <button class="btn btn-info" id="goShip" name="goShip">확정</button></a>
           </sec:authorize>
         </div>            
         <div>
         <textarea id="accomContent" name="accomContent" readonly="readonly">${detail.accomContent}</textarea>
         </div>      
         <input type="hidden" value="${_csrf.token}" name="_csrf">
         <input type="hidden" value="${detail.isNum}" name="isNum">
         <div id="map"></div>
      
   <!-- 입력된 주소값을 지도로 표시하는 api -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e55fb4c99860108c9564cfb89bc19d5&libraries=services"></script>      
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
           center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
             level: 3 // 지도의 확대 레벨
             };  

      // 지도를 생성합니다    
      var map = new daum.maps.Map(mapContainer, mapOption); 

      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new daum.maps.services.Geocoder();

      // 주소로 좌표를 검색합니다
      geocoder.addressSearch(value="${detail.accomAddr}", function(result, status) {

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
            content: '<div style="width:220px;text-align:center;padding:6px 0;">${detail.memBrand}<br>${detail.accomAddr}</div> '
            
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
   </form>
</body>
</html>