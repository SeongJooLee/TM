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
table {
	width: 100%;
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
	<div class="container px-4 px-lg-5">
		<h1 style="text-align: center">예약 확인</h1>
		<br>
		<br>
	<form id="kakaoFrm" method="post" action="${contextPath }/kakaoPay">
		<table border="1" >
			<tr>
				<td >
					<h1 ><input type="hidden" name="title" value="${promotion.title }">${promotion.title }</h1>
				<td>
			<tr>
			<tr>
				<td>
					예약 번호 : ${reser.reserNO }
				</td>
			</tr>
			<tr>
				<td>
				 	<input type="hidden" name="name" value="${userSession.name }"> 예 약 자 : ${userSession.name }
				</td>
			</tr>
			<tr>	
				<td>
					예약 날짜 : ${reser.reserDate }
				</td>
			</tr>
			<tr>	
				<td>
					<input type="hidden" name="headCount" value="${reser.headCount }"> 인 원  수 : ${reser.headCount }
				</td>
			</tr>
			<tr>	
				<td>
					연  락  처 : ${userSession.phone }
				</td>
			</tr>
			<tr>	
				<td>
					상품  번호 : ${reser.promotionNO }
				</td>
			</tr>
			<tr>	
				<td>
					<input type="hidden" name="price" value="${promtion.price }"> 가   격   : ${promotion.price } 원
				</td>
			</tr>
			<tr align="right">
				<td>
				<br><br>

						<button type="button" onClick="kakaoPay()">카카오페이로 결제하기</button>

				<br><br>
					 <input type="button" value="이용 후기 작성" onClick="fn_create()">
					<br><br>
					<input type="button" value="예약 취소" onClick="fn_delete()">
					<input type="button" value="메인 화면으로 이동" onClick="goHome()">
				</td>
			</tr>
		</table>
	</form>		
	</div>
	<hr>
	<jsp:include page="/resources/include/footer.jsp" />

</body>
</html>