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
<title>테마 여행 목록</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<style>
body {
	min-height: 100vh;
}

#mainColor{
	background-color:#876b6b !important;
	solid:#876b6b !important;

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
}
</style>

<script>
	function tyvld(){
		alert('쇼핑 카테고리');
		location.href='/tm/board/travel/category?key=쇼핑';
		}
	function wldur(){
		alert('지역 카테고리');
		location.href='/tm/board/travel/category?key=지역';
		}
	function dmatlr(){
		alert('음식 카테고리');
		location.href='/tm/board/travel/category?key=음식';
		}
	function ryxhd(){
		alert('교통 카테고리');
		location.href='/tm/board/travel/category?key=교통';
		}
	function ansghk(){
		alert('문화 카테고리');
		location.href='/tm/board/travel/category?key=문화';
		}
	function wjstl(){
		alert('전시 카테고리');
		location.href='/tm/board/travel/category?key=전시';
		}
	function cpgja(){
		alert('체험 카테고리');
		location.href='/tm/board/travel/category?key=체험';
		}
	function chrlghk(){
		alert('설정을 초기화합니다.');
		location.href='/tm/board/travel';
		}
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<!-- Responsive navbar-->
	<div class="container px-4 px-lg-5">
		<div class="card text-white bg-secondary my-5 py-4 text-center" id="mainColor">
			<div class="card-body">
				<h5 class="text-white m-0" >테 마 여 행</h5>
			</div>
		</div>

		<div class="col-md-12 mb-4">
			<button type="button" class="button button4" onclick='tyvld()'>쇼핑</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='dmatlr()'>음식</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='ansghk()'>문화</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='cpgja()'>체험</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='wjstl()'>전시</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='ryxhd()'>교통</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='wldur()'>지역</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='chrlghk()'>설정
				초기화</button>
		</div>
		
		<div class="row gx-4 gx-lg-5">
			<c:forEach var="travel" items="${travel}">
				<div class="col-md-4 mb-5">
					<div class="card h-100">

						<c:if test="${travel.image1 != null }">
							<img
								src="${contextPath }/board/travel/download?image=${travel.image1}&travelNO=${travel.travelNO}&name=${travel.name}"
								width="100%" height="250px" />
						</c:if>

						<c:if test="${travel.image1 == null }">
							<img
								src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />"
								width="100%" height="250px" />
						</c:if>

						<div class="card-footer">
							<a class="btn btn-primary btn-sm" id="mainColor">${travel.categoryName }</a>&nbsp;&nbsp;&nbsp;
							<a
								href="${contextPath}/board/travel/view?travelNO=${travel.travelNO }">${travel.title }</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test='${userSession.grade.equals("user")}'>
			<div align="right">
				<a href="${contextPath }/board/travel/add" class="btn btn-primary btn-sm" id="mainColor">글쓰기</a>
			</div>
		</c:if>

		<div align="center">
			<c:forEach var="i" begin="1" end="${page }">
				<c:if test="${selectPage == i}">
					<strong><a
						href="${contextPath }/board/travel/select?selectPage=${i}">
							${i } </a>&nbsp;&nbsp;&nbsp;</strong>
				</c:if>
				<c:if test="${selectPage != i }">
					<a href="${contextPath }/board/travel/select?selectPage=${i}">
						${i } </a>&nbsp;&nbsp;&nbsp;
				</c:if>
			</c:forEach>
		</div>
	</div>

	
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>
