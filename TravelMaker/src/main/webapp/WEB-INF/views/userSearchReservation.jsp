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
function returnHome(){
	alert('글관리로 돌아갑니다');
	location.href='${contextPath }/admin/mypage';
}
function success(){
	alert('${result}로 검색한결과입니다');
	
	}
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>
	<c:if test='${empty list}'>
		<script>
						waitd();
					</script>

	</c:if>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" align="center">${userSession.name}화면</h4>
				<input type="hidden" name="id" value="${userSession.adminID}">
				<div class="row">
					<div class="col-md-4 mb-3">
						<form action='${contextPath }/admin/mypage' method='post'>
							<input type="hidden" name="key" value="one"> <input
								class='form-control' type='submit' value='게시판 글 관리'>
						</form>
					</div>
					<div class="col-md-4 mb-3">
						<form action='${contextPath }/admin/mypage' method='post'>
							<input type="hidden" name="key" value="two"> <input
								class='form-control' type='submit' value='회원 조회''>
						</form>
					</div>
					<div class="col-md-4 mb-3">
						<form action='${contextPath }/admin/mypage' method='post'>
							<input type="hidden" name="key" value="three"> <input
								class='form-control' type='submit' value='예약 조회'>
						</form>
					</div>
				</div>

				<hr>
				
				<br> <br>
				<h4 class="mb-3" align="center">검색결과</h4>
				<br> <br>
				<form action='${contextPath }/admin/mypage/search' method='get'>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>아이디조회</label>

						</div>
						<div class="col-md-8 mb-3">
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
								<th>상품내용</th>
								<th>가격</th>
								<th>인원수</th>
								<th>예약자아이디</th>


							</tr>
						</thead>
						<tbody>
							<c:forEach var='proList' items='${proList}'>

								<c:forEach var='reserList' items='${reserList}'>

									<c:if
										test='${proList.promotionNO==reserList.promotionNO && result.equals(reserList.id)}'>

										<tr>
											<td>${reserList.reserNO}</td>
											<td>${reserList.reserDate}</td>
											<td><a
												href='${contextPath }/board/promotion/view?promotionNO=${proList.promotionNO}'>${proList.promotionNO}</a></td>
											<td>${proList.title}</td>
											<td>${proList.content}</td>
											<td>${proList.price}</td>
											<td>${reserList.headCount}</td>
											<td>${reserList.id}</td>

										</tr>
									</c:if>



								</c:forEach>


							</c:forEach>


						</tbody>
					</table>




				</div>
				<button class="btn btn-primary btn-lg btn-block" onclick='returnHome()'>돌아가기</button>



			</div>
		</div>
	</div>
	<script>
				success();
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