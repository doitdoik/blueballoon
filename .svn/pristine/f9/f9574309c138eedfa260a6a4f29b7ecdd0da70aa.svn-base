<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<style>
body {
  width: 600px;
  margin: 0 auto;
  margin-top:150px;
}
.first {
	background-color: #f3f3f3;
	text-align: center;

}

</style>
<script>
	// 서버에서 보내온 데이터를 화면에 출력
	function printUser(member) {
		console.log(member);
		$("#pwdArea").hide();
		$("#memId").text(member.memId);
		$("#memName").text(member.memName);
		$("#memTel").text(member.memTel);
		$("#memBrand").text(member.memBrand);
		$("#memEmail").text(member.memEmail);

	}

	$(function() {
		var member = JSON.parse('${member}')
		printUser(member);

		// 비밀번호 변경 화면 보이기
		$("#activateChangePwd").on("click", function() {
			$("#pwdArea").toggle();
		});

		// 비밀번호 변경 버튼을 클릭한 경우 ajax 처리
		$("#changePwd").on("click", function() {
			var memNewPwd = $("#memNewPwd");
			var memNewPwd2 = $("#memNewPwd2");
			var regexp = /^[0-9A-Za-z]{6,12}/;
			// 정규식 확인
			if (!regexp.test(memNewPwd.val())) {
				toastr.error("비밀번호는 영숫자 6~12자입니다")
				memNewPwd.val("");
				memNewPwd2.val("");
				return;
			}
			// 비밀번호 일치 확인
			else if (memNewPwd.val() != memNewPwd2.val()) {
				memNewPwd2.val("");
				memNewPwd2.attr("placeholder", "비밀번호가 일치하지 않습니다");
				return;
			}

			var param = {
				_method : "patch",
				_csrf : "${_csrf.token}",
				memPwd : $("#memPwd").val(),
				memNewPwd : memNewPwd.val(),
			};

			$.ajax({
				url : "/blueballoon/member/memPwd",
				method : "post",
				data : param,
				success : function() {
					toastr.success("비밀번호를 변경했습니다", '서버 메시지');
				},
				error : function(xhr) {
					console.log(xhr.status);
					toastr.error("비밀번호 변경에 실패했습니다", '서버 메시지');
				}
			})
		});
		//탈퇴
		$("#exit").on("click", function() {
			var param = {
				_method : "put",
				_csrf : "${_csrf.token}",
			}
			var choice = confirm('회원을 탈퇴하시겠습니까?');
			if (choice == false)
				return;

			$.ajax({
				url : "/blueballoon/member/exit",
				method : "post",
				data : param,
				success : function(result) {
					location.href = "/blueballoon/member"
				},
				error : function() {

				}
			});

		});

	});
</script>
</head>
<body>
<h1>업체정보관리</h1>
	<table class="table table-hover">
		<tr>
			<td class="first">아이디</td>
			<td colspan="2"><span id="memId"></span></td>
		</tr>
		<tr>
			<td class="first">이름</td>
			<td colspan="2"><span id="memName"></span></td>
		</tr>
		<tr>
			<td class="first">전화번호</td>
			<td colspan="2"><span id="memTel"></span>
		</td></tr>
		<tr>
			<td class="first">업체명</td>
			<td colspan="2"><span id="memBrand"></span></td>
		</tr>
			<tr>
			<td class="first">이메일</td>
			<td colspan="2"><span id="memEmail"></span></td>
		</tr>
		<tr>
			<td class="first">비밀번호</td>
			<td colspan="2">
				<button type="button" class="btn btn-info" id="activateChangePwd">비밀번호
					수정</button>
				<div id="pwdArea">
					<span class="key">현재 비밀번호 : </span><input type="password"
						id="memPwd"><br> <span class="key">새 비밀번호 : </span><input
						type="password" id="memNewPwd"><br> <span class="key">새
						비밀번호 확인 : </span><input type="password" id="memNewPwd2">
					<button type="button" class="btn btn-info" id="changePwd">변경</button>


				</div>
			</td>
		</tr>
	</table>
	<button type="button" class="btn btn-success" id="exit">탈퇴하기</button>
		<button type="button" class="btn btn-info"
			onclick="location.href='/blueballoon/company/myPage';">확인</button>
</body>
</html>