
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	var member;
	$(function() {

		$(".delete").on("click", function() {
			var param = {
				_method : "patch",
				memId : $(this).data("id"),
				_csrf : "${_csrf.token}"
			};
			console.log($(this).data("id"));
			console.log(param);

			$.ajax({
				url : "/blueballoon/admin/userBlock",
				method : "post",
				data : param,
				success : function(result) {
					alert("회원이 블락 되었습니다");
					location.href = "/blueballoon/admin/companyList";
				}
			})
		})

	});
</script>
<style>
#list {
	float: right;
	border: 1px solid #bcbcbc;
	width: 1047px;
}

table it {
	width: 1047px;
}
</style>
</head>
<body>
	<div>

		<div id="list">
			<table class="table table-hover" id="it">
				<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
					<col width="10%">

				</colgroup>
				<tr>
					<th>아이디</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>이름</th>
					<th>업체명</th>
					<th>사업자번호</th>

				</tr>
				<%-- 업체 회원 리스트 만 출력 --%>
				<c:forEach items="${map.list}" var="member">
					<c:choose>
						<c:when test="${member.memLicence==null}"></c:when>
						<c:when test="${member.memId eq 'admin' }"></c:when>
						<c:when test="${member.memEnabled==false}"></c:when>
						<c:otherwise>
							<tr>
								<td>${member.memId}</td>
								<td>${member.memEmail}</td>
								<td>${member.memTel}</td>
								<td>${member.memName}</td>
								<td>${member.memBrand}</td>
								<td>${member.memLicence}</td>
								<td><button class="delete" data-id="${member.memId}">블락</button></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>

			</table>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${map.pagination.prev!=0}">
						<li class="previous"><a
							href="/blueballoon/admin/companyList?pageNo=${map.pagination.prev}">Previous</a></li>
					</c:if>
					<c:forEach begin="${map.pagination.startPage}"
						end="${map.pagination.endPage}" var="i">
						<c:choose>
							<c:when test="${map.pagination.page eq i }">
								<li class="active"><a
									href="/blueballoon/admin/companyList?pageNo=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="waves-effect"><a
									href="/blueballoon/admin/companyList?pageNo=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.pagination.next!=0}">
						<li class="next"><a
							href="/blueballoon/admin/companyList?pageNo=${map.pagination.next}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<!--<c:forEach items="${map.list}" var="member">
	<tr>
		<td>${member.memId }</td>
		<td>
	<tr>
	</c:forEach>
	-->
</body>
