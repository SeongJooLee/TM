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
<script>
	function start(){
		alert('해당 게시물로 이동합니다.');
		location.href = "/tm/board/travel/view?travelNO=${travel.travelNO}";
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
							<form action='/tm/member/mypage' method='post'>
								<input type="hidden" name="testKey" value="one">					
								<input class='form-control' type='submit'  value='회원정보'>
							</form>
						</div>
						<div class="col-md-4 mb-3">
							<form action='/tm/member/mypage' method='post'>
								<input type="hidden" name="testKey" value="two">					
								<input class='form-control' type='submit'  value='내가 쓴 글 보기''>
							</form>
						</div>
						<div class="col-md-4 mb-3">
							<form action='/tm/member/mypage' method='post'>
								<input type="hidden" name="testKey" value="three">					
								<input class='form-control' type='submit'  value='예약확인'>
							</form>
						</div>
					</div>
					
					<hr>
					
					<br>
					<br>
					<h4 class="mb-3" align="center">[ ${userSession.id} ] 님의 테마여행 게시글</h4>
					<br>
					<br>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>글 번호</label> 
						</div>
						<div class="col-md-10 mb-3">
							<label class='form-control'>${travel.travelNO }</label> 
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>제목</label> 
						</div>
						<div class="col-md-10 mb-3">
							<label class='form-control'>${travel.title }</label> 
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>내용</label> 
						</div>
						<div class="col-md-10 mb-3">
							<label class='form-control'>${travel.content }</label> 
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>작성 날짜</label> 
						</div>
						<div class="col-md-10 mb-3">
							<label class='form-control'>${travel.writeDate }</label> 
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label class='form-control'>작성자 ID</label> 
						</div>
						<div class="col-md-10 mb-3">
							<label class='form-control'>${travel.id }</label> 
						</div>
					</div>
					
					
					
				<button class="btn btn-primary btn-lg btn-block" type='button' onclick='start()'>글 이동하기</button>
					
					
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