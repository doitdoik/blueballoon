<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script>
	$(function() {
		var msg = "${msg}";
		var dest = "${dest}";
		if (dest != "") {
			location.href = dest;
		} else if (msg != "") {
			$("#msg").text(msg);
			$("#alert").show();
			setTimeout(function() {
				location.href = "/blueballoon/member/login";
			}, 3000);
		} else {
			location.href = "/blueballoon/member/login";
		}

	})
</script>
<style>
#alert {
	min-height: 100px;
	border: 1px solid black;
	width: 1000px;
	margin: auto;
	margin-top: 300px;
	
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="alert alert-success alert-dismissible" id="alert"
		style="display: none;">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>서버 메시지</strong>&nbsp;&nbsp;&nbsp;<span id="msg"></span>
	</div>
</body>
</html>