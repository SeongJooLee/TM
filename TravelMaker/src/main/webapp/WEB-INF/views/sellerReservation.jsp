<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 유저 회원가입</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
<style>
body {
	min-height: 100vh;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>

<script src='http://code.jquery.com/jquery-latest.min.js'></script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" align="center">회원 정보</h4>
				<input type="hidden" name="id" value="${userSession.sellerID}">
				<div class="row">
					<div class="col-md-6 mb-3">
						<form action='mypage' method='post'>
							<input type="hidden" name="testKey" value="sellerOne"> <input
								class='form-control' type='submit' value='회원정보'>
						</form>
					</div>
					<div class="col-md-6 mb-3">
						<form action='mypage' method='post'>
							<input type="hidden" name="testKey" value="sellerTwo"> <input
								class='form-control' type='submit' value='내가 등록한 상품 보기'>
						</form>
					</div>

				</div>

				<hr>

				<br> <br>
				<h4 class="mb-3" align="center">${proNO}번상품예약내역</h4>
				<br> <br>
				<div class="row">
					<form id="reserComplete">
						<table class="table table-hover">
							<thead align="center">
								<tr class="table-primary">
									<th>상품 번호</th>
									<th>예약 번호</th>
									<th>예약 날짜</th>
									<th>인원 수</th>
									<th>예약자 ID</th>
									<th>결제 여부</th>
									<th>이용 여부</th>

								</tr>
							</thead>
							<tbody align="center">
								<c:forEach var='list' items='${reservation}' varStatus='num'>
									<tr>
										<td>${proNO}</td>
										<td>${list.reserNO}</td>
										<td>${list.reserDate}</td>
										<td>${list.headCount}</td>
										<td>${list.id}</td>
										<td><c:if test="${list.payment=='Y' }">
									${list.payment}
									</c:if> <c:if test="${list.payment!='Y' }">
									N
									</c:if></td>
										<td><c:if test="${list.complete=='Y' }">
										이용 완료
									</c:if> <c:if test="${list.payment=='Y' && list.complete!='Y' }">
										<a href="${contextPath}/member/seller/reservation/complete?reserNO=${list.reserNO}">확정</a>
										</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>