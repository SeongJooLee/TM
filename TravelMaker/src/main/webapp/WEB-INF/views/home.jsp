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
<link rel="shortcut icon" type="image/x-icon" href="https://genfavicon.com/tmp/icon_cbe17ed8f879f2a2a624cded0d27c3f7.ico">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
<style>
body {
	min-height: 100vh;
}

#mainColor{
	background-color:#876b6b !important;
	solid:#876b6b !important;

}
.font1 {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 38px;
  font-weight: bold;
  color:#4a1b1b;
 
}

.font2 {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 20px;
  font-weight: bold;
  color:#5e0c0c;
}

.font3 {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 16px;
  font-weight: bold;
  color:#5e0c0c;
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


</style>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<!-- Responsive navbar-->

	<!-- Page Content-->
	<div class="container px-4 px-lg-5 font3">
		<!-- Heading Row-->
		<div class="card text-white bg-secondary my-5 py-4 text-center" id="mainColor">
			<div class="card-body">
				<h5 class="text-white m-0" >공 지 사 항</h5>
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
							<img class="imageTest"
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

		<div class="card text-white bg-secondary my-5 py-4 text-center" id="mainColor">
			<div class="card-body">
				<h5 class="text-white m-0" >홍 보 상 품</h5>
			</div>
		</div>
		<!-- Content Row-->
		<div class="row gx-4 gx-lg-5">
			<c:forEach var="promotion" items="${promotion}" begin="0" end="2">
				<div class="col-md-4 mb-5">
					<div class="card h-100">
						<c:if test="${promotion.image1 != null }">
							<img class="imageTest"
								src="${contextPath }/board/promotion/download?image=${promotion.image1}&promotionNO=${promotion.promotionNO}&name=${promotion.name}"
								 />
						</c:if>

						<c:if test="${promotion.image1 == null }">
							<img class="imageTest"
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
