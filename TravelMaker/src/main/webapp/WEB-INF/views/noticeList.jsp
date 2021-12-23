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
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>공지사항 목록</title>
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

.button4:hover {
	background-color: #e7e7e7;
}
</style>

<script>
	function rhdwl() {
		alert('공지사항 카테고리');
		location.href = '/tm/board/notice/category?key=공지사항';
	}
	function dlqpsxm() {
		alert('이벤트 카테고리');
		location.href = '/tm/board/notice/category?key=이벤트';
	}
	function chrlghk() {
		alert('설정을 초기화합니다.');
		location.href = '/tm/board/notice';
	}
</script>
</head>
<body>

	<jsp:include page="/resources/include/header.jsp" />

	<div class="container px-4 px-lg-5">
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<p class="text-white m-0">공지사항</p>
			</div>
		</div>
		<div class="col-md-12 mb-4">
			<button type="button" class="button button4" onclick='rhdwl()'>공지사항</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='dlqpsxm()'>이벤트</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='chrlghk()'>설정
				초기화</button>
		</div>
		<div class="row gx-4 gx-lg-5">
			<c:forEach var="notice" items="${notice}">
				<div class="col-md-4 mb-5">

					<div class="card h-100">

						<c:if test="${notice.image1 != null }">
							<img
								src="${contextPath }/board/notice/download?image=${notice.image1}&noticeNO=${notice.noticeNO}&name=${notice.name}"
								width="100%" height="250px" />
						</c:if>

						<c:if test="${notice.image1 == null }">
							<img
								src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />"
								width="100%" height="250px" />
						</c:if>

						<div class="card-footer">
							<a class="btn btn-primary btn-sm">${notice.name }</a>&nbsp;&nbsp;&nbsp;<a
								href="${contextPath}/board/notice/view?noticeNO=${notice.noticeNO }">${notice.title }</a>
						</div>
					</div>

				</div>
			</c:forEach>
		</div>
		<c:if test='${userSession.grade.equals("admin")}'>
			<div align="right">
				<a href="${contextPath}/board/notice/add"
					class="btn btn-primary btn-sm" id="mainColor">글쓰기</a>
			</div>
		</c:if>


		<div align="center">
			<c:forEach var="i" begin="1" end="${page }">
				<c:if test="${selectPage == i}">
					<strong><a
						href="${contextPath }/board/notice/select?selectPage=${i}">
							${i } </a>&nbsp;&nbsp;&nbsp;</strong>
				</c:if>
				<c:if test="${selectPage != i }">
					<a href="${contextPath }/board/notice/select?selectPage=${i}">
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