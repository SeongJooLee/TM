<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	alert(' ※ 결제 확인을 누르셔야 결제가 완료됩니다!!');
	
	function fn_thankyou(){
		alert('결제 확인 되었습니다.');
		document.getElementById('kakaoPay').method = "POST";
		document.getElementById('kakaoPay').action = "${contextPath}/board/reservation/payment";
		document.getElementById('kakaoPay').submit();
	}
</script>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-8 mx-auto">
				<h4 class="mb-3" align="center">결제  확인</h4>
				<br>
				<div class="row">
					<div class="col-md-4">
						<label for="title">결제 일시</label>
					</div>
					<div class="col-md-8">
						<label for="title">${info.approved_at}</label>
					</div>
					<div class="col-md-4">
						<label for="title">사이트명</label>
					</div>
					<div class="col-md-8">
						<label for="title">${info.partner_order_id}</label>
					</div>
					<div class="col-md-4">
						<label for="title">상품 명</label>
					</div>
					<div class="col-md-8">
						<label for="title">${info.item_name}</label>
					</div>
					<div class="col-md-4">
						<label for="title">상품 수량</label>
					</div>
					<div class="col-md-8">
						<label for="title">${info.quantity}</label>
					</div>
					<div class="col-md-4">
						<label for="title">결제 금액</label>
					</div>
					<div class="col-md-8">
						<label for="title">${info.amount.total}</label>
					</div>
					<div style="position: absolute; right: 0px; bottom: 0px;">
						카카오페이 결제가 정상적으로 완료되었습니다.
					</div>
					<form id="kakaoPay">
						<input type="hidden" name="reserNO" value="${info.item_code }">
					</form>
					
					<div class="col-md-6"></div>
					<div class="col-md-6">
						<button type="button" onClick="fn_thankyou()" class="btn btn-primary btn-lg btn-block">결제 확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	
 
 
 


</body>
</html>