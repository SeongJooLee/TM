<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	function rhdwl(){
		alert('공지사항 카테고리');
		location.href='/tm/board/notice/category?key=notice';
		}
	function dlqpsxm(){
		alert('이벤트 카테고리');
		location.href='/tm/board/notice/category?key=event';
		}
	function chrlghk(){
		alert('설정을 초기화합니다.');
		location.href='/tm/board/notice';
		}
</script>
</head>
<body>

	<jsp:include page="/resources/include/header.jsp" />
	<hr>

	<div class="container px-4 px-lg-5">

		<div class="col-md-12 mb-4">
			<button type="button" class="button button4" onclick='rhdwl()'>
				공지사항</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='dlqpsxm()'>
				이벤트</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='chrlghk()'>
				설정 초기화</button>
		</div>

		<table align="center" border="1" width="100%">
			<tr height="10" align="center" bgcolor="lightblue">
				<td>글번호</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>게시판 종류</td>
			</tr>

			<c:forEach var="notice" items="${notice}">

				<tr height="10" align="center">

					<td>${notice.noticeNO }</td>
					<td><a
						href="${contextPath }/tm/board/notice/view?noticeNO=${notice.noticeNO }">${notice.title }</a></td>
					<td>${notice.content }</td>
					<td>${notice.adminID }</td>
					<td>${notice.writeDate }</td>
					<td>${notice.name }</td>

				</tr>
			</c:forEach>
		</table>
		<div align="center">
			<c:forEach var="i" begin="1" end="${page }">
				<a href="${contextPath }/board/noticeSelect?selectPage=${i}">	${i } </a>&nbsp;&nbsp;&nbsp;
				</c:forEach>
		</div>

	</div>

	<c:if test='${userSession.grade.equals("admin")}'>
		<a href="${contextPath }/tm/board/notice/add">글쓰기</a>
	</c:if>
	<hr>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>