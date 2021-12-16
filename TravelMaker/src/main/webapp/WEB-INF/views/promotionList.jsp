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

.button4:hover {background-color: #e7e7e7;}
	</style>
	

</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<!-- Responsive navbar-->
	<hr>
	<div class="container px-4 px-lg-5">
	<div class="card text-white bg-secondary my-5 py-4 text-center">
		<div class="card-body"><p class="text-white m-0">홍보상품</p></div>
	</div>
	
	<div class="col-md-12 mb-4">
		<button type="button" class="button button4">지역</button>&nbsp;&nbsp;
		<button type="button" class="button button4">음식</button>&nbsp;&nbsp;
		<button type="button" class="button button4">교통</button>&nbsp;&nbsp;
		<button type="button" class="button button4">문화</button>&nbsp;&nbsp;
		<button type="button" class="button button4">힐링</button>&nbsp;&nbsp;
		<button type="button" class="button button4">체험</button>
	</div>
	
		<div class="row gx-4 gx-lg-5">
	<c:forEach var="promotion" items="${promotion}" >
			<div class="col-md-4 mb-5">
				<div class="card h-100">
				
				<c:if test="${promotion.image1 != null }">
				<img	src="${contextPath }/tm/board/promotion/download?image=${promotion.image1}&promotionNO=${promotion.promotionNO}&name=${promotion.name}"  	width="100%" height="100%" />
				</c:if>
				
				<c:if test="${promotion.image1 == null }">
				<img	src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />" 	width="100%" height="100%" />
				</c:if>
				
				<div class="card-footer">
					<a class="btn btn-primary btn-sm">${promotion.categoryName }</a>&nbsp;&nbsp;&nbsp;<a href="promotion/view?promotionNO=${promotion.promotionNO }">${promotion.title }</a>
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