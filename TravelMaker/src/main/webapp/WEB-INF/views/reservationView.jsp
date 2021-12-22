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
<title>Insert title here</title>
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
<script type='text/javascript'>
function fn_create(){
	    if (!confirm("확인을 누르면 이용 후기 페이지로 이동합니다.")) {
	        alert("취소(아니오)를 누르셨습니다.");
	        return;
	    } else {
	        alert("확인(예)을 누르셨습니다.");
			location.href="${contextPath}/board/review/add?promotionNO=${reser.promotionNO}";
	    }
    }
function kakaoPay(){
	    if (!confirm("확인을 누르면 결제 페이지로 이동합니다.")) {
	        alert("취소(아니오)를 누르셨습니다.");
	        return;
	    } else {
	        alert("확인(예)을 누르셨습니다.");
			document.getElementById("kakaoFrm").submit();
	    }
    }
 	function goHome(obj) {
	    if (!confirm("확인을 누르면 상품페이지로 이동합니다.")) {
	        alert("취소(아니오)를 누르셨습니다.");
	        return;
	    } else {
	        alert("확인(예)을 누르셨습니다.");
			location.href="${contextPath}/board/promotion";
	    }
	}
 
 	function fn_delete(){
 	    if (!confirm("삭제 하시겠습니까?")) {
 	        alert("취소(아니오)를 누르셨습니다.");
 	        return;
 	    } else {
 	        alert("확인(예)을 누르셨습니다.");
 	        location.href="${contextPath}/board/reservation/delete?reserNO=${reser.reserNO}";
 	    }
 	}

</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-6 mx-auto">
				<h4 class="mb-3" align="center">예약 확인</h4>
				<form id="kakaoFrm" method="post" action="${contextPath }/kakaoPay">
					<div class="row">
						<div class="col-md-2">
							<label for="title">상품 제목</label>
								<input type="hidden" name="title" value="${promotion.title }">	
						</div>
						<div class="col-md-4">
							<p class="form-control">${promotion.title}</p>
						</div>
						<div class="col-md-4">
							<label for="date">예약 날짜</label> <input type="date" id="reserDate"
								name="reserDate" class="form-control" value="2021-12-21"
								min="2022-01-01" max="2022-12-31">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4">
							<label for="title">예약자</label> <input type="text"
								class="form-control" value="${userSession.name}" id="name"
								name="name" readonly />
								<input type="hidden" name="id" value="${userSession.id}">
						</div>
						<div class="col-md-4">
							<label for="price">연락처</label>
							<c:if test="${userSession.phone != null}">
								<input class="form-control" type="text" name="phone"
									value="${userSession.phone }" readonly>
							</c:if>
							<c:if test="${userSession.phone == null}">
								<small>등록된 번호가 없습니다.</small>
								<br>
								<small>마이페이지에서 번호 등록을 해주세요.</small>
							</c:if>
						</div>
						<div class="col-md-4">
							<label for="date">인원 수 <small> * 최대 4인</small></label> <select
								class="form-control" name="headCount" id="headCount">
								<option value="null">선택해주세요.</option>
								<option value="1">1인</option>
								<option value="2">2인</option>
								<option value="3">3인</option>
								<option value="4">4인</option>
							</select>
						</div>
					</div>
					<br>
					<div id="demo" class="carousel slide" data-bs-ride="carousel">
						<div class="row">
							<div class="col-md-2 mb-5"></div>

							<div class="col-md-8 mb-5" data-bs-ride="carousel">
								<div class="carousel-inner">
									<c:if
										test="${not empty reser.image1 && reser.image1 !='null' }">
										<div class="carousel-item active ">
											<input type="hidden" id="originalFileName" name="image1"
												value="${reser.image1 }" /> <img class="imagetest"
												src="${contextPath }/board/promotion/download?image=${reser.image1}&promotionNO=${reser.promotionNO}&name=${reser.name}" />
										</div>
									</c:if>

									<c:if
										test="${not empty reser.image2 && reser.image2 !='null' }">
										<div class="carousel-item">
											<input type="hidden" id="originalFileName" name="image2"
												value="${reser.image2 }" /> <img class="imagetest"
												src="${contextPath }/board/promotion/download?image=${reser.image1}&promotionNO=${reser.promotionNO}&name=${reser.name}" />
										</div>
									</c:if>
									<c:if
										test="${not empty reser.image3 && reser.image3 !='null' }">
										<div class="carousel-item">
											<input type="hidden" id="originalFileName" name="image3"
												value="${reser.image3 }" /> <img class="imagetest"
												src="${contextPath }/board/promotion/download?image=${reser.image1}&promotionNO=${reser.promotionNO}&name=${reser.name}" />
										</div>
									</c:if>
								</div>

								<!-- / 슬라이드 쇼 끝 -->
								<!-- 왼쪽 오른쪽 화살표 버튼 -->
								<a class="carousel-control-prev" href="#demo" data-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<!-- <span>Previous</span> -->
								</a> <a class="carousel-control-next" href="#demo" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<!-- <span>Next</span> -->
								</a>
								<!-- / 화살표 버튼 끝 -->
								<!-- 인디케이터 -->
								<ul class="carousel-indicators">
									<li data-target="#demo" data-slide-to="0" class="active"></li>
									<!--0번부터시작-->
									<li data-target="#demo" data-slide-to="1"></li>
									<li data-target="#demo" data-slide-to="2"></li>
								</ul>

							</div>
							<div class="col-md-2 mb-5"></div>
						</div>


					</div>





					<br>
					<hr>
					<div class="row">
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="button"
								onClick="fn_create()">예약 신청</button>
						</div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="reset">다시
								작성</button>
						</div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="button"
								onClick='backToList(this.form);'>예약 취소</button>
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