<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session='true'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.logo_img {
	max-width: 250px;
	width: 100%;
	height: auto;
}
</style>
</head>
<body>

	<c:if
		test='${userSession.name != null && userSession.grade.equals("user")}'>
		<div class="jumbotron text-center"
			style="margin-bottom: 0; background-color: white; padding: 0;">
			<a href="/tm"><img class="logo_img"
				src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
			<p align="right">${userSession.name}님
				<a href="member/mypage">마이페이지</a> <a href="member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;<a
					href="#">고객센터</a>
			</p>
		</div>
	</c:if>

	<c:if
		test='${userSession.name != null && userSession.grade.equals("seller")}'>
		<div class="jumbotron text-center"
			style="margin-bottom: 0; background-color: white; padding: 0;">
			<a href="/tm"><img class="logo_img"
				src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
			<p align="right">${userSession.name}님
				<a href="member/mypage">마이페이지</a> <a href="member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;<a
					href="#">고객센터</a>
			</p>
		</div>
	</c:if>

	<c:if
		test='${userSession.name != null && userSession.grade.equals("admin")}'>
		<div class="jumbotron text-center"
			style="margin-bottom: 0; background-color: white; padding: 0;">
			<a href="/tm"><img class="logo_img"
				src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
			<p align="right">${userSession.name}님
				<a href="admin/mypage">마이페이지</a> <a href="member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;<a
					href="#">고객센터</a>
			</p>
		</div>
	</c:if>

	<c:if test='${userSession.name == null}'>
		<div class="jumbotron text-center"
			style="margin-bottom: 0; background-color: white; padding: 0;">
			<a href="/tm"><img class="logo_img"
				src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
			<p align="right">
				<a href="member/login">로그인</a>&nbsp;&nbsp;&nbsp;<a
					href="member/registerCheck">회원가입</a>&nbsp;&nbsp;&nbsp;<a href="#">고객센터</a>
			</p>
		</div>
	</c:if>




	<ul class="nav justify-content-end">
		<li class="nav-item"><a href="board/popupEnter"
			class="btn btn-primary">&nbsp;통합검색&nbsp;</a></li>
		<li class="nav-item"><a class="nav-link disabled" href="#">통합검색
				버튼을 눌러 사용하세요!</a></li>
	</ul>




	<nav class="navbar navbar-inverse-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="board/travel">트래블메이커 여행</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="nav navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${contextPath}/board/travel">여행게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath}/board/notice">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath}/board/promotion">홍보상품</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath}/board/review">이용후기</a></li>

			</ul>
		</div>
	</nav>


</body>
</html>