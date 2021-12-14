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

#collapsibleNavbar ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

#collapsibleNavbar .nav-link {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#collapsibleNavbar .nav-link:hover {
	color: lightgray;
	background-color: #4d4d4d;
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
				<a href="${contextPath}/member/mypage">마이페이지</a>
				 <a href="${contextPath}/member/logout">로그아웃</a>
				 &nbsp;&nbsp;&nbsp;<a href="#">고객센터</a>
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
				<a href="${contextPath}/member/mypage">마이페이지</a>
				 <a href="${contextPath}/member/logout">로그아웃</a>
				 &nbsp;&nbsp;&nbsp;<a href="#">고객센터</a>
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
				<a href="${contextPath}/admin/mypage">마이페이지</a>
				 <a href="${contextPath}/member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;
				 <a href="#">고객센터</a>
			</p>
		</div>
	</c:if>

	<c:if test='${userSession.name == null}'>
		<div class="jumbotron text-center"
			style="margin-bottom: 0; background-color: white; padding: 0;">
			<a href="/tm"><img class="logo_img"
				src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
			<p align="right">
				<a href="${contextPath}/member/login">로그인</a>&nbsp;&nbsp;&nbsp;
				<a 	href="${contextPath}/member/registerCheck">회원가입</a>
				&nbsp;&nbsp;&nbsp;<a href="#">고객센터</a>
			</p>
		</div>
	</c:if>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand">Travel Maker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
   		 <ul class="navbar-nav mr-auto">
     				<li class="nav-item"><a class="nav-link" href="${contextPath}/board/notice">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/board/promotion">홍보상품</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/board/review">이용후기</a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/board/travel">여행게시판</a></li>
   		 </ul>
    <form class="form-inline my-2 my-lg-0">
      
     			    <button class="btn btn-outline-success my-2 my-sm-0" type=button onclick = "location.href = 'board/popupEnter' "> 통합검색</button>
    </form>
  </div>
</nav>
</body>
</html>