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
	function updateUser() {
		location.href = "${contextPath}/member/mypage/update";
	}
	function deleteUser() {
		var result = confirm("삭제할거니..?");
		if (result) {
			location.href = "${contextPath}/member/mypage/delete?userId=${userSession.id}";
		} else {
			return;
		}
	}
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
						<div class="col-md-4 mb-3">
							<form action='${contextPath}/member/mypage' method='post'>
								<input type="hidden" name="testKey" value="one">					
								<input class='form-control' type='submit'  value='회원정보'>
							</form>
						</div>
						<div class="col-md-4 mb-3">
							<form action='${contextPath}/member/mypage' method='post'>
								<input type="hidden" name="testKey" value="two">					
								<input class='form-control' type='submit'  value='내가 쓴 글 보기''>
							</form>
						</div>
						<div class="col-md-4 mb-3">
							<form action='${contextPath}/member/mypage' method='post'>
								<input type="hidden" name="testKey" value="three">					
								<input class='form-control' type='submit'  value='예약확인'>
							</form>
						</div>
					</div>
					
					<hr>
					
					<br>
					<br>
					<h4 class="mb-3" align="center">[ 수정할 정보를 입력해주세요 ]</h4>
					<br>
					<br>
					<form action='${contextPath}/member/mypage/update' method='post'>
		
		
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>아이디</label> 
						</div>
						<div class="col-md-4 mb-3">
							<input class='form-control' type='text' name='id' value='${userSession.id}' readonly>
						</div>
						<div class="col-md-2 mb-3">
							<label class='form-control'>비밀번호</label> 
						</div>
						<div class="col-md-4 mb-3">
							<input type='text' name='pw' value='${userSession.pw}' class='form-control'> 
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>이 름</label> 
						</div>
						<div class="col-md-4 mb-3">
							 <input class='form-control' type='text' name='name' value='${userSession.name}' readonly> 
						</div>
						<div class="col-md-2 mb-3">
							<label class='form-control'>생년 월일</label> 
						</div>
						<div class="col-md-4 mb-3">
							<input class='form-control' type='text' name='birth' value='${userSession.birth}' >
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>연락처</label> 
						</div>
						<div class="col-md-4 mb-3">
							<input class='form-control' type='text' name='phone' value='${userSession.phone}' > 
						</div>
						<div class="col-md-2 mb-3">
							<label class='form-control'>가입날짜</label> 
						</div>
						<div class="col-md-4 mb-3">
							 <input class='form-control' type='text' name='joinDate' value='${userSession.joinDate}' readonly>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>주소</label> 
						</div>
						<div class="col-md-10 mb-3">
							<input class='form-control' type='text' name='address' value='${userSession.address}'> 
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<input type='hidden' name='testKey' value='userUpdate'>
							<input class='btn btn-primary btn-lg btn-block' type='submit' value='변경하기'>
						</div>
						
					</div>
					</form>
			
					
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