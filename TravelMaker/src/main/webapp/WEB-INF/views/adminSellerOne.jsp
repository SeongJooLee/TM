<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script>

</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" align="center">${userSession.name}화면</h4>
				<input type="hidden" name="id" value="${userSession.adminID}">
				<div class="row">
					<div class="col-md-4 mb-3">
						<form action='/tm/admin/mypage' method='post'>
							<input type="hidden" name="key" value="one"> <input
								class='form-control' type='submit' value='게시판 글 관리'>
						</form>
					</div>
					<div class="col-md-4 mb-3">
						<form action='/tm/admin/mypage' method='post'>
							<input type="hidden" name="key" value="two"> <input
								class='form-control' type='submit' value='회원 조회'>
						</form>
					</div>
					<div class="col-md-4 mb-3">
						<form action='/tm/admin/mypage' method='post'>
							<input type="hidden" name="key" value="three"> <input
								class='form-control' type='submit' value='예약 조회'>
						</form>
					</div>
				</div>

				<hr>

				<br> <br>
				<h4 class="mb-3" align="center">상품내역</h4>
				<br> <br>

				<div class="row">
					<table class="table table-hover">
						<thead>
							<tr class="table-primary">
								<th>상품 번호</th>
								<th>상품 제목</th>
								<th>상품 가격</th>
								<th>등록 일자</th>
								<th>등록자 아이디</th>

							</tr>
						</thead>
						<tbody>

							<c:forEach var='seller' items='${seller}'>
								<tr>
									<td><a href='/tm/board/promotion/view?promotionNO=${seller.promotionNO}'>${seller.promotionNO}</a></td>
									<td>${seller.title}</td>
									<td>${seller.price}</td>
									<td>${seller.writeDate}</td>
									<td>${seller.sellerID}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>











			</div>
		</div>
	</div>
	<script>
			
			</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>

	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>