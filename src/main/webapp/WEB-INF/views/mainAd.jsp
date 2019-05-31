<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
	margin: 0 auto;
}

#section {
	min-height: 900px;
	border: 1px solid black;
	padding: 0px;
	margin-top: 30px;
	width: 1050px;
}	

#jb-sidebar {
	float: left;
	border: 1px solid #bcbcbc;
}

#left-table tr {
	height: 40px;
	border: 1px solid #444444;
	text-align: center;
	font-family: "Nanum Gothic", sans-serif;
	font-size: 20px;
	font-weight: bold;
}
</style>
<script>
	$(function(){
		// 로그아웃
		$("#logout").on("click", function(e){
			var $form = $("<form></form>").attr("action","/blueballoon/admin/logout").attr("method","post");
			$("<input>").attr("type","hidden").attr("name", "_csrf").val("${_csrf.token}").appendTo($form);
			$form.appendTo("body");
			$.ajax({
				url:"/blueballoon/admin/logout",
				method:"post",
				data:$form.serialize(),
				success:function(){
					location.reload();
				}
			})
		});
	});
</script>
</head>
<body>
	<div id="page">
		<div id="jb-sidebar">
			<table id="left-table">
				
				<tr>
					<td><a href="/blueballoon/admin/manageList">회원 관리</a></td>
				</tr>
				<tr>
					<td><a href="/blueballoon/island/write">섬 등록</a></td>
				</tr>
				<tr>
					<td><a href="/blueballoon/attr/write">명소 등록</a></td>
				</tr>
				<tr>
					<td><a href="/blueballoon/package/write">패키지 등록</a></td>
				</tr>
				<tr>
					<td><a href="/blueballoon/admin/boardManage">게시판 관리</a></td>
				</tr>
				<tr>
					<td><a href="/blueballoon/admin/stats">통계</a></td>
				</tr>
				<tr>
					<td><a href="/blueballoon/admin/blockList">블락회원</a></td>
				</tr>
				<tr>
					<td><a href="#" id="logout">로그아웃</a></td>
				</tr>
			</table>

		</div>

		<section id="section">
			<jsp:include page="${adView}" />
		</section>

	</div>
</body>
</html>