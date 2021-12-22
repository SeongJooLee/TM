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
.imagetest {
	width: 100%;
	height: 500px;
	object-fit: contain;
}

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
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
</style>
<script src='http://code.jquery.com/jquery-latest.min.js'></script>
<script type='text/javascript'>
	function backToList(obj) {
	    if (!confirm("확인을 누르면 상품페이지로 이동합니다.")) {
	        alert("취소(아니오)를 누르셨습니다.");
	        return;
	    } else {
	        alert("확인(예)을 누르셨습니다.");
			location.href="${contextPath}/board/promotion/view?promotionNO=${reser.promotionNO}";
	    }
	}

	function fn_create() {
		var reserDate = document.getElementById("reserDate").value;
		if (reserDate == '2021-12-21') {
			alert('예약날짜를 선택해주세요.');
			return false;
		}
		var headCount = document.getElementById("headCount").value;
		if (headCount=='null') {
			alert('인원 수를 선택해주세요.');
			return false;
		}
		if (!confirm("예약을 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
		}
		document.getElementById("frm").submit();
	}

</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" align="center">예약 신청</h4>
				<form id="frm" action="reservation/done" method="post">

					<div class="row">
						<div class="col-md-4">
								<label for="title">상품 제목</label> <input type="text"
								class="form-control" value="${reser.title}"
								id="title" name="title" readonly />
						</div>
						<div class="col-md-4">
								<label for="price">가격</label> <input type="number"
								class="form-control" value="${reser.price}"
								id="price" name="price" readonly />
						</div>
						<div class="col-md-4">
								<label for="date">예약 날짜</label> <input type="number"
								class="form-control" value="${reser.reserDate}"
								id="reserDate" name="reserDate" readonly />
						</div>
					</div>







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