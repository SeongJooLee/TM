<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기 목록</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button4 {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}

.button4:hover {
	background-color: #e7e7e7;
}
</style>
</head>
<body>

	<jsp:include page="/resources/include/header.jsp" />

	<div class="container px-4 px-lg-5">
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">이용후기</p>
			</div>
		</div>

		<div class="row gx-4 gx-lg-5">
			<c:forEach var="review" items="${review}">
				<div class="col-md-4 mb-5">
					<div class="card h-100">

						<c:if test="${review.image1 != null }">
							<img
								src="${contextPath }/board/review/download?image=${review.image1}&reviewNO=${review.reviewNO}&name=${review.name}"
								width="100%" height="250px" />
						</c:if>

						<c:if test="${review.image1 == null }">
							<img
								src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />"
								width="100%" height="250px" />
						</c:if>

						<div class="card-footer">
							<a
								href="${contextPath}/board/review/view?reviewNO=${review.reviewNO }">${review.title }</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div align="center">
			<c:forEach var="i" begin="1" end="${page }">
				<c:if test="${selectPage == i}">
					<strong><a
						href="${contextPath }/board/review/select?selectPage=${i}">
							${i } </a>&nbsp;&nbsp;&nbsp;</strong>
				</c:if>
				<c:if test="${selectPage != i }">
					<a href="${contextPath }/board/review/select?selectPage=${i}">
						${i } </a>&nbsp;&nbsp;&nbsp;
				</c:if>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>