<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<style>
	form{
	margin:0 auto;
		margin-top: 70px;
		margin-bottom:30px;
		width:400px;
		
	}
</style>
<script>
	// 1. 아이디 사용여부
	 function checkTempId() {
      var patt = /^[A-Za-z0-9]{6,12}$/;
      var tempId = $("#tempId").val();
      if (tempId.length == 0) {
         $("#helper_tempId").text("필수입력입니다").css("color", "red").css("font-size", "0.75em");
         return false;
      }
      if (!patt.test(tempId)) {
         $("#helper_tempId").text("아이디는 영숫자 6~12자입니다").css("color", "red")
               .css("font-size", "0.75em");
         return false;
      }
      return true;
   }
   function ajaxTempId() {
      var tempId = $("#tempId").val();
      $.ajax({
         url: "/blueballoon/tempMember/id/" + tempId,
         method: "get",
         success:function(result) {
            if(result)
               $("#helper_tempId").text("사용가능합니다").css("color","green").css("font-size","0.75em");
            else
               $("#helper_tempId").text("사용중인 아이디입니다").css("color","red").css("font-size","0.75em");
            return result;
         }, error: function(xhr) {
            toastr.warning(xhr.responseText);
         }
      }); 
   }
	// 2. 이메일을 정규식으로 확인
	 function checkTempEmail() {
      var patt = /^[A-Za-z][A-Za-z0-9\.]+@[A-Za-z\.]+$/;
      var tempEmail = $("#tempEmail").val();
      if(tempEmail.length==0) {
         $("#helper_tempEmail").text("필수입력입니다").css("color","red").css("font-size", "0.75em");
         return false;
      } 
      if(patt.test(tempEmail)==false) {
         $("#helper_tempEmail").text("이메일형식에 어긋납니다").css("color","red").css("font-size", "0.75em");
         return false;
      }
      return true;   
   }
	 function ajaxTempEmail() {
	      var tempEmail = $("#tempEmail").val();
	      $.ajax({
	         url: "/blueballoon/tempMember/email",
	         method: "get",
	         data: "tempEmail=" + tempEmail,
	         success:function(result) {
	            if(result)
	               $("#helper_tempEmail").text("사용가능합니다").css("color","green").css("font-size", "0.75em");
	            else
	               $("#helper_tempEmail").text("사용중입니다").css("color","red").css("font-size", "0.75em");
	            return result;
	         }, error: function(xhr) {
	             toastr.warning(xhr.responseText);
	         }
	      });
	   }
	// 3. 비밀번호를 정규식으로 확인
	 function checkTempPwd() {
      var patt = /^[A-Za-z0-9]{6,12}$/;
      var tempPwd = $("#tempPwd").val();
      if(tempPwd.length==0) {
         $("#helper_tempPwd").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      if(patt.test(tempPwd)==false) {
         $("#helper_tempPwd").text("비밀번호는 영숫자 6~12자입니다").css("color","red").css("font-size","0.75em");
         return false;
      }else
         $("#helper_tempPwd").text("안전합니다").css("color","green").css("font-size","0.75em");
      return true;
   }
	// 4. 비밀번호 확인을 정규식으로 확인
	 function checkTempPwd2() {
      var tempPwd = $("#tempPwd").val();
      var tempPwd2 = $("#tempPwd2").val();
      if(tempPwd2.length==0) {
         $("#helper_tempPwd2").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      if(tempPwd!=tempPwd2) {
         $("#helper_tempPwd2").text("비밀번호가 일치하지 않습니다").css("color","red").css("font-size","0.75em");
         return false;
      }else
         $("#helper_tempPwd2").text("Ok").css("color","green").css("font-size","0.75em");
      return true;
   }
	// 5. 생년월일 확인
	function checkTempBirthDate() {
      if($("#tempBirthDate").val().length==0) {
         $("#helper_tempBirthDate").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      return true;
   }
	// 6. 휴대폰번호 확인
	 function checkTempTel() {
      var tempTelPattern = /^[0-9]{10,11}$/;
      var tempTel = $("#tempTel").val().replace(/\-/g,'');
      if(tempTel.length==0) {
         $("#helper_tempTel").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      if(!tempTelPattern.test(tempTel)) {
         $("#helper_tempTel").text("정확한 전화번호를 입력해 주세요").css("color","red").css("font-size","0.75em");
         return false;
      }else
         $("#helper_tempTel").text("Ok").css("color","green").css("font-size","0.75em");
      return true;
   }
	// 7. 이름 확인
	function checkTempName() {
      var patt = /^[가-힣]{2,10}$/
      var tempName = $("#tempName").val();
      if(tempName.length==0) {
         $("#helper_tempName").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      } 
      if(patt.test(tempName)==false) {
         $("#helper_tempName").text("이름은 한글 2~10자입니다").css("color","red").css("font-size","0.75em");
         return false;
      }else
      $("#helper_tempName").text("Ok").css("color","green").css("font-size","0.75em");
      return true;
   }
	// 8. 업체명 확인
	function checkTempBrand() {
      var patt = /^[가-힣0-9]{2,10}$/
      var tempBrand = $("#tempBrand").val();
      if(tempBrand.length==0) {
         $("#helper_tempBrand").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      } 
      if(patt.test(tempBrand)==false) {
         $("#helper_tempBrand").text("업체명은 한글,숫자 2~10자입니다").css("color","red").css("font-size","0.75em");
         return false;
      }else
      $("#helper_tempBrand").text("Ok").css("color","green").css("font-size","0.75em");
      return true;
   }
	// 9. 사업자번호 확인
	function checkTempLicence() {
      var tempLicencePattern = /^[0-9]{10}$/;
      var tempLicence = $("#tempLicence").val().replace(/\-/g,'');
      if(tempLicence.length==0) {
         $("#helper_tempLicence").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      if(!tempLicencePattern.test(tempLicence)) {
         $("#helper_tempLicence").text("사업자등록 번호는 숫자 10자리입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      return true;
   }
	 function ajaxTempLicence() {
	      var tempLicence = $("#tempLicence").val();
	      console.log(tempLicence);
	      $.ajax({
	         url: "/blueballoon/tempMember/licence",
	         method: "get",
	         data: "tempLicence=" + tempLicence,
	         success:function(result) {
	            if(result)
	               $("#helper_tempLicence").text("사용가능합니다").css("color","green").css("font-size", "0.75em");
	            else
	               $("#helper_tempLicence").text("사용중입니다").css("color","red").css("font-size", "0.75em");
	            return result;
	         }, error: function(xhr) {
	             toastr.warning(xhr.responseText);
	         }
	      });
	   }
	// 10. 회원가입
	
	 function join() {
      var formData = new FormData(document.getElementById("joinForm"));
      for (var key of formData.keys()) {
         console.log(key);
      }
      for(var value of formData.values()) {
         console.log(value);
      }
      $.ajax({
         url:"/blueballoon/tempMember",
         method: "post",
         processData:false,
         contentType:false,
         data:formData,
         success:function(result) {
            console.log(result);
         }, error:function(xhr) {
            console.log("에러 코드 :" + xhr.status);
            console.log("에러 메시지 :" + xhr.responseText);
         }
      })
   }
   
   
   
   $(function() {
      $("#tempId").on("blur", function() {
         if(checkTempId()==true)
            ajaxTempId();
      })
      $("#tempName").on("blur", checkTempName);
      $("#tempPwd").on("blur", checkTempPwd);
      $("#tempPwd2").on("blur", checkTempPwd2);
      $("#tempTel").on("blur", checkTempTel);
      $("#tempEmail").on("blur", function() {
         if(checkTempEmail()==true)
        	 ajaxTempEmail();
      });
      $("#tempBirthDate").on("blur", checkTempBirthDate);
      $("#tempBrand").on("blur", checkTempBrand);
      $("#tempLicence").on("blur", function(){
    	  if(checkTempLicence()==true)
         	 ajaxTempLicence();
      })
      
   
      $("#join").on("click", function() {
      
         if(!checkTempId() || !checkTempName() || !checkTempPwd() || !checkTempPwd2() || !checkTempTel() || !checkTempEmail() || !checkTempBirthDate() || !checkTempBrand() || !checkTempLicence())
            return;
         
   
         $.ajax({
            url: "/blueballoon/tempMember/id/" + $("#tempId").val(),
            method: "get",
            success:function(result) {
               
               if(result) {
                  $.ajax({
                     url: "/blueballoon/tempMember/email",
                     method: "get",
                     data: "tempEmail=" + $("#tempEmail").val(),
                     success:function(result) {
                        
                        if(result) {
                          
                           $("#joinForm").submit();
                        } else {
                           $("#helper_tempEmail").text("사용중인 이메일입니다").css("color","red").css("font-size","0.75em");
                        }
                     }
                  })
               } else {
                  $("#helper_tempId").text("사용중인 아이디입니다").css("color","red").css("font-size","0.75em");
               }
            }
         })
         
      })
      
   });
</script>
</head>
<body>
	<div id="wrap">
		<form id="joinForm" action="/blueballoon/company/join" method="post">
			<div class="form-group">
				<label for="tempId">아이디</label> 
				<span class="helper-text" id="helper_tempId"></span>
				<input type="text" class="form-control" id="tempId" name="tempId">
			</div>
			<div class="form-group">
				<label for="tempEmail">이메일:</label>
				<span class="hepler-text" id="helper_tempEmail">
				<!-- 이메일형식확인용span --></span>
				<input type="text" id="tempEmail" name="tempEmail" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="tempPwd">비밀번호:</label>
				<span class="hepler-text" id="helper_tempPwd">
				<!-- 비밀번호확인용span --></span>
				<input type="password" id="tempPwd" name="tempPwd" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="tempPwd2">비밀번호확인:</label>
				<span class="hepler-text" id="helper_tempPwd2">
				<!-- 비밀번호중복확인용span --></span>
				<input type="password" id="tempPwd2" name="tempPwd2" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="tempBirthDate">생년월일:</label>
				<span class="hepler-text" id="helper_tempBirthDate">
				<!-- 생년월일확인용 span --></span>
				<input type="date" id="tempBirthDate" name="tempBirthDate" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="tempTel">휴대폰번호:</label>
				<span class="hepler-text" id="helper_tempTel">
				<!-- 휴대폰번호형식확인span --></span>
				<input type="text" id="tempTel" name="tempTel" class="form-control" />
			</div>
			<div class="form-group">
				<label for="tempName">이름:</label>
				<span class="hepler-text" id="helper_tempName">
				<!-- 이름형식확인span --></span>
				<input type="text" id="tempName" name="tempName" class="form-control" />
			</div>
			<div class="form-group">
				<label for="tempBrand">업체명:</label>
				<span class="hepler-text" id="helper_tempBrand">
				<!-- 업체명확인span --></span>
				<input type="text" id="tempBrand" name="tempBrand" class="form-control" />
			</div>
			<div class="form-group">
				<label for="tempLicence">사업자등록번호:</label>
				<span class="hepler-text" id="helper_tempLicence">
				<!-- 사업자등록번호 확인 span --></span>
				<input type="text" id="tempLicence" name="tempLicence" class="form-control"/>
			</div>
			<input type="hidden" name="_csrf" value="${_csrf.token}">
			<button type="button" id="join" class="btn btn-info">가입</button>
		</form>
	</div>
</body>
</html>