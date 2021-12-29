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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	    if (!confirm("확인을 누르면 메인화면으로 이동합니다.")) {
	        alert("취소(아니오)를 누르셨습니다.");
	        return;
	    } else {
	        alert("확인(예)을 누르셨습니다.");
			location.href="${contextPath}/";
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

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-10 mx-auto">
				<h4 class="mb-3" align="center">예약 확인</h4>
				<br>
				<form id="kakaoFrm" method="post" action="${contextPath }/kakaoPay">
					<div class="row">
						<div class="col-md-2">
							<label for="title">상품 제목</label> <input type="hidden"
								name="title" value="${promotion.title }">
						</div>
						<div class="col-md-4">
							<p class="form-control">${promotion.title}</p>
						</div>
						<div class="col-md-2">
							<label for="reserNO">예약 번호</label> <input type="hidden"
								name="reserNO" value="${reser.reserNO }">
						</div>
						<div class="col-md-4">
							<p class="form-control">${reser.reserNO}</p>
						</div>
						<div class="col-md-2">
							<label for="promotionNO">상품 번호</label> <input type="hidden"
								name="promotionNO" value="${reser.promotionNO  }">
						</div>
						<div class="col-md-4">
							<p class="form-control">${reser.promotionNO}</p>
						</div>
						<div class="col-md-2">
							<label for="title">상품 가격</label> <input type="hidden" name="price"
								value="${promotion.price  }">
						</div>
						<div class="col-md-4">
							<p class="form-control">${promotion.price}</p>
						</div>
						<div class="col-md-2">
							<label for="title">예약날짜</label> <input type="hidden"
								name="reserDate" value="${reser.reserDate  }">
						</div>
						<div class="col-md-4">
							<p class="form-control">${reser.reserDate}</p>
						</div>
						<div class="col-md-2">
							<label for="headCount">인원 수</label> <input type="hidden"
								name="headCount" value="${reser.headCount  }">
						</div>
						<div class="col-md-4">
							<p class="form-control">${reser.headCount}</p>
						</div>						
						<div class="col-md-2">
							<label for="name">예약자</label> <input type="hidden" name="name"
								value="${userSession.name }">
						</div>
						<div class="col-md-4">
							<p class="form-control">${userSession.name}</p>
						</div>
						<div class="col-md-2">
							<label for="phone">연락처</label> <input type="hidden" name="phone"
								value="${userSession.phone }">
						</div>
						<div class="col-md-4">
							<p class="form-control">${userSession.phone}</p>
						</div>
						<div class="col-md-2">
							<label for="payment">결제 여부</label> 
						</div>
						<div class="col-md-4">
							<c:if test="${reser.payment=='Y' }">
							<p class="form-control">결제 완료!!</p>
							</c:if>
							<c:if test="${reser.payment!='Y' }">
							<p class="form-control">X</p>
							</c:if>
						</div>

					</div>

					<br>
					<hr>
					<div class="row">
					<c:if test="${reser.payment!='Y' }">
						<div class="col-md-2 mb-3">
						</div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="button"
								onClick="kakaoPay()">결제하기</button>
						</div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="button"
								onClick='fn_delete();'>예약 취소</button>
						</div>
					</c:if>
					<c:if test="${reser.complete=='Y' }">
					<div class="row">
						<div class="col-md-4 mb-3"></div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="button"
								onClick="fn_create()">이용 후기 작성</button>
						</div>
					</div>						
					</c:if>
						<div class="row">
						<div class="col-md-4 mb-3"></div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="button"
								onClick='goHome();'>메인으로 돌아가기</button>
						</div>
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
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>