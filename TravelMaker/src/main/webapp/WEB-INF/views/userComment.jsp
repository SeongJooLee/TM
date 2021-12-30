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
				<h4 class="mb-3" align="center">회원 정보</h4>
				<input type="hidden" name="id" value="${userSession.id}">
				<div class="row">
					<div class="col-md-3 mb-3">
						<form action='${contextPath}/member/mypage' method='post'>
							<input type="hidden" name="testKey" value="one"> <input
								class='form-control' type='submit' value='회원정보'>
						</form>
					</div>
					<div class="col-md-3 mb-3">
						<form action='${contextPath}/member/mypage' method='post'>
							<input type="hidden" name="testKey" value="two"> <input
								class='form-control' type='submit' value='내가 쓴 글 보기'>
						</form>
					</div>
					<div class="col-md-3 mb-3">
						<form action='${contextPath}/member/mypage' method='post'>
							<input type="hidden" name="testKey" value="three"> <input
								class='form-control' type='submit' value='예약확인'>
						</form>
					</div>
					<div class="col-md-3 mb-3">
							<form action='${contextPath}/member/mypage/comment' method='get'>					
								<input class='form-control' type='submit'  value='내가 쓴 댓글 보기'>
							</form>
						</div>
				</div>

				<hr>
				
				<br> <br>
				<h4 class="mb-3" align="center">[ ${userSession.id} ] 님이 작성한 댓글</h4>
				<br> <br>
				<div class="row">
					

						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									
									<th>게시판 종류</th>
									<th>댓글 내용</th>
									<th>작성 날짜</th>
									<th>작성자 ID</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var='list' items='${userComment}'>
									<tr>
										<c:choose>
											<c:when test='${list.travelNO!=0}'>
												<td><a href='${contextPath}/board/travel/view?travelNO=${list.travelNO}'>테마여행</a></td>
											</c:when>
											<c:when test='${list.reviewNO!=0}'>
												<td><a href='${contextPath}/board/review/view?reviewNO=${list.reviewNO}'>이용후기</a></td>
											</c:when>			
										</c:choose>
							
										<td>${list.content}</td>
										<td>${list.writeDate}</td>
										<td>${list.id}</td>
										
									</tr>
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