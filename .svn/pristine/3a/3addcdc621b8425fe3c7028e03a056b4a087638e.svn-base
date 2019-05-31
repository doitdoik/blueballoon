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
form {
	margin: 0 auto;
	margin-top: 70px;
	margin-bottom: 30px;
	width: 400px;
}
</style>
<script>
  
   function checkMemberId() {
      var patt = /^[A-Za-z0-9]{6,12}$/;
      var memId = $("#memId").val();
      if (memId.length == 0) {
         $("#helper_memId").text("필수입력입니다").css("color", "red").css(
               "font-size", "0.75em");
         return false;
      }
      if (!patt.test(memId)) {
         $("#helper_memId").text("아이디는 영숫자 6~12자입니다").css("color", "red")
               .css("font-size", "0.75em");
         return false;
      }
      return true;
   }
   function ajaxMemberId() {
      var memId = $("#memId").val();
      $.ajax({
         url: "/blueballoon/member/id/" + memId,
         method: "get",
         success:function(result) {
            if(result)
               $("#helper_memId").text("사용가능합니다").css("color","green").css("font-size","0.75em");
            else
               $("#helper_memId").text("사용중인 아이디입니다").css("color","red").css("font-size","0.75em");
            return result;
         }, error: function(xhr) {
            toastr.warning(xhr.responseText);
         }
      });
   }
   function checkMemberName() {
      var patt = /^[가-힣]{2,10}$/
      var memName = $("#memName").val();
      if(memName.length==0) {
         $("#helper_memName").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      } 
      if(patt.test(memName)==false) {
         $("#helper_memName").text("이름은 한글 2~10자입니다").css("color","red").css("font-size","0.75em");
         return false;
      }else
      $("#helper_memName").text("Ok").css("color","green").css("font-size","0.75em");
      return true;
   }
   
   function checkMemberPwd() {
      var patt = /^[A-Za-z0-9]{6,12}$/;
      var memPwd = $("#memPwd").val();
      if(memPwd.length==0) {
         $("#helper_memPwd").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      if(patt.test(memPwd)==false) {
         $("#helper_memPwd").text("비밀번호는 영숫자 6~12자입니다").css("color","red").css("font-size","0.75em");
         return false;
      }else
         $("#helper_memPwd").text("안전합니다").css("color","green").css("font-size","0.75em");
      return true;
   }

   function checkMemberPwd2() {
      var memPwd = $("#memPwd").val();
      var memPwd2 = $("#memPwd2").val();
      if(memPwd2.length==0) {
         $("#helper_memPwd2").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      if(memPwd!=memPwd2) {
         $("#helper_memPwd2").text("비밀번호가 일치하지 않습니다").css("color","red").css("font-size","0.75em");
         return false;
      }else
         $("#helper_memPwd2").text("Ok").css("color","green").css("font-size","0.75em");
      return true;
   }
   
   function checkMemberTel() {
      var memTelPattern = /^[0-9]{10,11}$/;
      var memTel = $("#memTel").val().replace(/\-/g,'');
      if(memTel.length==0) {
         $("#helper_memTel").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      if(!memTelPattern.test(memTel)) {
         $("#helper_memTel").text("정확한 전화번호를 입력해 주세요").css("color","red").css("font-size","0.75em");
         return false;
      }else
         $("#helper_memTel").text("Ok").css("color","green").css("font-size","0.75em");
      return true;
   }
   
   function checkMemberEmail() {
      var patt = /^[A-Za-z][A-Za-z0-9\.]+@[A-Za-z\.]+$/;
      var memEmail = $("#memEmail").val();
      if(memEmail.length==0) {
         $("#helper_memEmail").text("필수입력입니다").css("color","red").css("font-size", "0.75em");
         return false;
      } 
      if(patt.test(memEmail)==false) {
         $("#helper_memEmail").text("이메일형식에 어긋납니다").css("color","red").css("font-size", "0.75em");
         return false;
      }
      return true;
      
   }
   function ajaxMeberEmail() {
      var memEmail = $("#memEmail").val();
      $.ajax({
         url: "/blueballoon/member/email",
         method: "get",
         data: "memEmail=" + memEmail,
         success:function(result) {
            if(result)
               $("#helper_memEmail").text("사용가능합니다").css("color","green").css("font-size", "0.75em");
            else
               $("#helper_memEmail").text("사용중입니다").css("color","red").css("font-size", "0.75em");
            return result;
         }, error: function(xhr) {
            toastr.warning(xhr.responseText);
         }
      });
   }
   
   function checkMemberBirthDate() {
      if($("#memBirthDate").val().length==0) {
         $("#helper_memBirthDate").text("필수입력입니다").css("color","red").css("font-size","0.75em");
         return false;
      }
      return true;
   }
   
   function join() {
      var formData = new FormData(document.getElementById("joinForm"));
      for (var key of formData.keys()) {
         console.log(key);
      }
      for(var value of formData.values()) {
         console.log(value);
      }
      $.ajax({
         url:"/blueballoon/member",
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
      $("#memId").on("blur", function() {
         if(checkMemberId()==true)
            ajaxMemberId();
      })
      $("#memName").on("blur", checkMemberName);
      $("#memPwd").on("blur", checkMemberPwd);
      $("#memPwd2").on("blur", checkMemberPwd2);
      $("#memTel").on("blur", checkMemberTel);
      $("#memEmail").on("blur", function() {
         if(checkMemberEmail()==true)
        	 ajaxMeberEmail();
      });
      $("#memBirthDate").on("blur", checkMemberBirthDate);
      
   
      $("#join").on("click", function() {
      
         if(!checkMemberId() || !checkMemberName() || !checkMemberPwd() || !checkMemberPwd2() || !checkMemberTel() || !checkMemberEmail() || !checkMemberBirthDate())
            return;
         
   
         $.ajax({
            url: "/blueballoon/member/id/" + $("#memId").val(),
            method: "get",
            success:function(result) {
               
               if(result) {
                  $.ajax({
                     url: "/blueballoon/member/email",
                     method: "get",
                     data: "memEmail=" + $("#memEmail").val(),
                     success:function(result) {
                        
                        if(result) {
                          
                           $("#joinForm").submit();
                        } else {
                           $("#helper_memEmail").text("사용중인 이메일입니다").css("color","red").css("font-size","0.75em");
                        }
                     }
                  })
               } else {
                  $("#helper_memId").text("사용중인 아이디입니다").css("color","red").css("font-size","0.75em");
               }
            }
         })
         
      })
      
   });
  
</script>

</head>
<body>
	<div id="wrap">
		<form id="joinForm" action="/blueballoon/member/join" method="post">
			<div class="form-group">
				<label for="memId">아이디</label>
				<span class="helper-text" id="helper_memId"></span>
				<input type="text" class="form-control" id="memId" name="memId">
			</div>

			<div class="form-group">
				<label for="memEmail">이메일</label> 
				<span class="helper-text" id="helper_memEmail"></span>
				<input id="memEmail" type="text" name="memEmail" class="form-control">
			</div>


			<div class="form-group">
				<label for="memPwd">비밀번호</label> 
				<span class="helper-text" id="helper_memPwd"></span> 
				<input id="memPwd" type="password" class="form-control" name="memPwd">
			</div>
			
			<div class="form-group">
				<label for="memPwd2">비밀번호 확인</label> 
				<span class="helper-text" id="helper_memPwd2"></span> 
				<input id="memPwd2" type="password" class="form-control">
			</div>


			<div class="form-group">
				<label for="memGender">성별</label> <span class="helper-text"
					id="helper_memGender"></span> <input id="memGender0" type="radio"
					name="memGender" checked="checked" value=0 /> 남 <input
					id="memGender1" type="radio" name="memGender" value=1 /> 녀

			</div>

			<div class="form-group">
				<label for="memBirthDate">생년월일</label> 
				<span class="helper-text" id="helper_memBirthDate"></span> 
				<input id="memBirthDate" type="date" name="memBirthDate" class="form-control">
			</div>


			<div class="form-group">
				<label for="memTel">전화번호</label> 
				<span class="helper-text" id="helper_memTel"></span> 
				<input id="memTel" type="text" name="memTel" class="form-control">
			</div>

			<div class="form-group">
				<label for="memName">이름</label> <span class="helper-text"
					id="helper_memName"></span> <input type="text" class="form-control"
					id="memName" name="memName">
			</div>

			
				<input type="hidden" name="_csrf" value="${_csrf.token}"> <input
					type="hidden" name="authority" value="ROLE_USER">
				<button type="button" id="join" class="btn btn-info">가입</button>
		
		</form>

	</div>
</body>
</html>