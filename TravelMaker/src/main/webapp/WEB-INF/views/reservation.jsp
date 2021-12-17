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
	<div class="container px-4 px-lg-5">
		<h1 style="text-align: center">예약 하기</h1>
		<br>
		<br>
		<form id="frm" action="reservation/done" method="post">
			<table border="1" style="width:1000px">
				<thead>
					<tr>
						<th colspan="2" align="center">예약 정보</th>
						<th align="center">예약 상품</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>상품 제목</td>
						<td>
							<input type="hidden" name="promotionNO" value="${reser.promotionNO }" >
							<input type="hidden" name="title" value="${reser.title }" >
							${reser.title}
						</td>
						<td rowspan="4">
							<c:if test="${reser.image1 != null }">
								<img	src="${contextPath }/board/promotion/download?image=${reser.image1}&promotionNO=${reser.promotionNO}&name=${reser.name}"  	width="100%" height="100%" />
							</c:if>
						</td>
					</tr>
					<tr>
						<td>예약자 성명</td>
						<td>로그인 정보 출력</td>
					</tr>
					<tr>
						<td>예약 날짜</td>
						<td><input type="date" id="reserDate" name="reserDate"
							       value="2021-12-21"
							       min="2022-01-01" max="2022-12-31">
						</td>
					</tr>
					<tr>
						<td>연락처</td>
					<c:if test="${user.phone != null}">
						<td> [ ${user.phone } ]</td>
					</c:if>
					<c:if test="${user.phone == null}">
						<td>
							<small>등록된 번호가 없습니다.</small><br>
							<small>마이페이지에서 번호 등록을 해주세요.</small>
								
						</td>
					</c:if>
						
					</tr>
					<tr>
						<td>인원 수</td>
						<td><select name="headCount" id="headCount">
								<option value="null">선택해주세요.</option>
								<option value="1">1인</option>
								<option value="2">2인</option>
								<option value="3">3인</option>
								<option value="4">4인</option>
						</select> <small>*최대 4인</small></td>
						<td><input type="hidden" name="price" value="${reser.price }">가격 : [ ${reser.price } 원 ]</td>
					</tr>
				</tbody>
			</table>
			<br> <br>
			<div align="center">
				<input type="button" value="예약 신청" onClick="fn_create()"> <input
					type="reset" value="다시 작성"> <input type="button"
					value="예약 취소" onClick="backToList()">
			</div>
		</form>
	</div>
	<hr>
	<jsp:include page="/resources/include/footer.jsp" />

</body>
</html>