

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	
</script>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
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
<script>
$(function(){

	$(".permit").on("click",function(){
		var tempId = $(this).data("tempid")
		var authName = $("#authName").val()
		console.log(authName)
		var params={
				tempId: tempId,
				authName: authName,
				_csrf:'${_csrf.token}',
				_method: 'put'
		}
		$.ajax({
			url:'/blueballoon/admin/permitCompany',
			method:'post',
			data: params,
			success:function(){
				alert("회원이 승인 되었습니다");
				location.href ="/blueballoon/admin/permitCompany";
			}
		});
	});
});
</script>
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
					<col width="20%">
					<col width="10%">
					<col width="10%">
					<col width="10%">

				</colgroup>
				<tr>
					<th>아이디</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>이름</th>
					<th>업체명</th>
					<th>사업자번호</th>
					<th></th>
				</tr>
				<c:forEach items="${map.list}" var="permit">
					<tr>
						<td>${permit.tempId}</td>
						<td>${permit.tempEmail}</td>
						<td>${permit.tempTel}</td>
						<td>${permit.tempName}</td>
						<td>${permit.tempBrand}</td>
						<td>${permit.tempLicence}</td>
						<td>
							<select name="authName" id="authName">
								<option value="ROLE_SHIP">선박</option>
								<option value="ROLE_ACCOM">숙박</option>
							</select>
						</td>
						<td><button class="permit" type="button" id="permit" name="tempId" data-tempid="${permit.tempId}">승인</button><td>
				
					</tr>
				</c:forEach>

			</table>
						<div class="text-center">
				<ul class="pagination">
					<c:if test="${map.pagination.prev!=0}">
						<li class="previous"><a
							href="/blueballoon/admin/permitCompany?pageNo=${map.pagination.prev}">Previous</a></li>
					</c:if>
					<c:forEach begin="${map.pagination.startPage}"
						end="${map.pagination.endPage}" var="i">
						<c:choose>
							<c:when test="${map.pagination.page eq i }">
								<li class="active"><a
									href="/blueballoon/admin/permitCompany?pageNo=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="waves-effect"><a
									href="/blueballoon/admin/permitCompany?pageNo=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.pagination.next!=0}">
						<li class="next"><a
							href="/blueballoon/admin/permitCompany?pageNo=${map.pagination.next}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>


</body>
</html>

