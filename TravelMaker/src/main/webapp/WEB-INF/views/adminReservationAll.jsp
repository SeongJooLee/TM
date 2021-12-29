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
function nameOrder(){
	alert('이름순으로 보여집니다.');
	location.href='${contextPath}/admin/mypage?list=name';
	}
function dateOrder(){
	alert('날짜순으로 보여집니다.');
	location.href='${contextPath}/admin/mypage?list=date';
	}
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
						<form action='${contextPath}/admin/mypage' method='post'>
							<input type="hidden" name="key" value="one"> <input
								class='form-control' type='submit' value='게시판 글 관리'>
						</form>
					</div>
					<div class="col-md-4 mb-3">
						<form action='${contextPath}/admin/mypage' method='post'>
							<input type="hidden" name="key" value="two"> <input
								class='form-control' type='submit' value='회원 조회''>
						</form>
					</div>
					<div class="col-md-4 mb-3">
						<form action='${contextPath}/admin/mypage' method='post'>
							<input type="hidden" name="key" value="three"> <input
								class='form-control' type='submit' value='예약 조회'>
						</form>
					</div>
				</div>

				<hr>

				<br> <br>
				<h4 class="mb-3" align="center">모든 예약 리스트</h4>
				<br> <br>
				<form action='${contextPath}/admin/mypage/search' method='get'>
					<div class="row">
						<div class="col-md-3 mb-3">
							<label class='form-control'>아이디조회</label>


						</div>
						<div class="col-md-7 mb-3">
							<input class='form-control' type="search" name='search'>
						</div>
						<div class="col-md-2 mb-3">
							<input class='form-control' type='submit' value='검색'>
						</div>
					</div>
				</form>



				<div class="row">

					<table class="table table-hover">
						<thead>
							<tr class="table-primary">
								<th>예약번호</th>
								<th>예약날짜</th>
								<th>상품번호</th>
								<th>상품제목</th>
								<th>가격</th>
								<th>인원수</th>
								<th>예약자아이디</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var='proList' items='${proList}'>
								<c:forEach var='reserList' items='${reserList}'>
									<tr>
										<c:if test='${proList.promotionNO==reserList.promotionNO}'>

											<td>${reserList.reserNO}</td>
											<td>${reserList.reserDate}</td>
											<td><a
												href='${contextPath}/board/promotion/view?promotionNO=${proList.promotionNO}'>${proList.promotionNO}</a></td>
											<td>${proList.title}</td>
											<td>${proList.price}</td>
											<td>${reserList.headCount}</td>
											<td>${reserList.id}</td>



										</c:if>

									</tr>
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>




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
	<hr>

	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>