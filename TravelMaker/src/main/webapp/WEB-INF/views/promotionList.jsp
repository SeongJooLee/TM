<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
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

</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<!-- Responsive navbar-->
	<hr>
	<div class="container px-4 px-lg-5">
	<div class="card text-white bg-secondary my-5 py-4 text-center">
		<div class="card-body"><p class="text-white m-0">홍보상품</p></div>
	</div>
	<br>
		<div class="row gx-4 gx-lg-5">
	<c:forEach var="promotion" items="${promotion}" >
			<div class="col-md-4 mb-5">
				<div class="card h-100">
				<img	src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />" 	width="100%" height="100%" />
				<div class="card-footer">
					<a class="btn btn-primary btn-sm">${category.categoryName }</a><a href="promotion/view?promotionNO=${promotion.promotionNO }">${promotion.title }</a>
				</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
		<a href="promotion/add">글쓰기</a>

	<hr>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>