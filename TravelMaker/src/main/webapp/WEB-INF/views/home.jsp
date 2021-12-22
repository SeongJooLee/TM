<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Small Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
<style>
.imageTest{
width:100%;
 height:250px; 
}

</style>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<!-- Responsive navbar-->

	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Heading Row-->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<a class="text-white m-0" href="${contextPath}/tm/board/notice">공지사항</a>
			</div>
		</div>
		<!-- Content Row-->
		<div class="row gx-4 gx-lg-5">
			<c:forEach var="notice" items="${notice}" begin="0" end="2">
				<div class="col-md-4 mb-5">
					<div class="card h-100">
						<c:if test="${notice.image1 != null }">
							<img class="imageTest"
								src="${contextPath }/board/notice/download?image=${notice.image1}&noticeNO=${notice.noticeNO}&name=${notice.name}"
								 />
						</c:if>

						<c:if test="${notice.image1 == null }">
							<img
								src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />"
								 />
						</c:if>
						<div class="card-footer">
							<a class="btn btn-primary btn-sm">${notice.name }</a>&nbsp;&nbsp;&nbsp;<a
								href="${contextPath}/board/notice/view?noticeNO=${notice.noticeNO }">${notice.title }</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 여기서 for문 i < 3 -->


		<!-- 이친구들을 반복해서 만들건데 받아올 값은 홍보 리스트 처럼 -->

		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<a class="text-white m-0" href="${contextPath}/tm/board/promotion">홍보상품</a>
			</div>
		</div>
		<!-- Content Row-->
		<div class="row gx-4 gx-lg-5">
			<c:forEach var="promotion" items="${promotion}" begin="0" end="2">
				<div class="col-md-4 mb-5">
					<div class="card h-100">
						<c:if test="${promotion.image1 != null }">
							<img
								src="${contextPath }/board/promotion/download?image=${promotion.image1}&promotionNO=${promotion.promotionNO}&name=${promotion.name}"
								 />
						</c:if>

						<c:if test="${promotion.image1 == null }">
							<img
								src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />"
								 />
						</c:if>

						<div class="card-footer">
							<a class="btn btn-primary btn-sm">${promotion.categoryName }</a>&nbsp;&nbsp;&nbsp;<a
								href="${contextPath}/board/promotion/view?promotionNO=${promotion.promotionNO }">${promotion.title }</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>


	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>
