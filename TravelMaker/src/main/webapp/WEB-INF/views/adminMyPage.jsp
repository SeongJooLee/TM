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
				<h4 class="mb-3" align="center">${userSession.name} 화면</h4>
					<input type="hidden" name="id" value="${userSession.adminID}">
					<div class="row">
						<div class="col-md-4 mb-3">
							<form action='${contextPath}/admin/mypage' method='post'>
								<input type="hidden" name="key" value="one">					
								<input class='form-control' type='submit'  value='게시판 글 관리'>
							</form>
						</div>
						<div class="col-md-4 mb-3">
							<form action='${contextPath}/admin/mypage' method='post'>
								<input type="hidden" name="key" value="two">					
								<input class='form-control' type='submit'  value='회원 조회''>
							</form>
						</div>
						<div class="col-md-4 mb-3">
							<form action='${contextPath}/admin/mypage' method='post'>
								<input type="hidden" name="key" value="three">					
								<input class='form-control' type='submit'  value='예약 조회'>
							</form>
						</div>
					</div>
					
					<hr>
					
					<br>
					<br>
					<h4 class="mb-3" align="center">모든 게시판 목록</h4>
					<br>
					<br>
					<div class="row">
						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									<th>index</th>
									<th>게시판 PK</th>
									<th>글 제목</th>
									<th>게시판 구분</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var='list' items='${boardList}'>
									<tr>
										<td>${list.count}</td>
										<td><a href='${contextPath}/admin/mypage/check?randomNO=${list.noticeNO}&randomName=${list.name}'>${list.noticeNO}번</a></td>
										<td>${list.title}</td>
										<td>${list.name}</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
						<div class="row">
							<div class="col-md-6 mb-3">
								<a class='form-control' href='${contextPath}/admin/mypage/before?indexOne=${notice.x}&indexTwo=${notice.y}'>이전페이지</a>
								
							</div>
								<div class="col-md-6 mb-3">
								<a class='form-control' href='${contextPath}/admin/mypage/next?indexOne=${notice.x}&indexTwo=${notice.y}'>다음페이지</a>
							</div>
						</div>
					
				
						
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