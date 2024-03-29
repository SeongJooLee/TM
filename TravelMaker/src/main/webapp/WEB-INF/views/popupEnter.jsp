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
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" align="center">통합검색</h4>
				<form action="${contextPath}/board/popupEnter" method="post">
					<div class="row">
						<div class="col-md-3 mb-3">
							<select class="form-control" name="headSearchOption" required>
								<option value="">검색 옵션</option>
								<option value="person">작성자</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="titleContent">제목+내용</option>
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<input class="form-control" type='text' name='headSearchResult'
								placeholder='검색어 입력' required>
						</div>
						<div class="col-md-3 mb-3">
							<button class="btn btn-primary btn-md btn-block" type="submit">검색</button>
						</div>
					</div>
				</form>
				<br>
				<div align="center">
					<small>* 제목을 누르면 해당 글로 이동합니다.</small>
				</div>
				<br>
				<div class="row" align="center">
					<div class="col-md-2 mb-3">No</div>
					<div class="col-md-2 mb-3">게시판</div>

					<div class="col-md-6 mb-3">제목</div>

					<div class="col-md-2 mb-3">작성자</div>
				</div>
				<hr>
				<c:forEach var='list' items='${boardList}'>
					<div class="row" align="center">
						<div class="col-md-2 mb-3">${list.count}</div>
						<div class="col-md-2 mb-3">${list.name}</div>

						<div class="col-md-6 mb-3">
							<a
								href='${contextPath}/board/popupCheck?randomNO=${list.noticeNO}&randomName=${list.name}'>${list.title}</a>
						</div>

						<div class="col-md-2 mb-3">${list.adminID}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>
