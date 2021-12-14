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
	<div align="center">
		<br>
		<h1>홍보상품</h1>
	</div>
	<br>
	<br>
	<div class="row gx-4 gx-lg-5">
	<c:forEach var="promotion" items="${promotion}" >
		<div class="col-md-4 mb-5">
			<div class="card h-100">
			
				<img	src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />" 	width="100%" height="100%" />
				<div class="card-footer">
					<a href="promotion/view?promotionNO=${promotion.promotionNO }">${promotion.title }</a>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
		<a href="notice/add">글쓰기</a>

	<hr>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>