<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  %>
	<%@page session='true' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	


	
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
<script
	 src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>

.fakeimg {
	height: 200px;
	background: #aaa;
}
.sns_test {
	float: right;
	margin: 5px;
}
</style>
</head>
<body>
		<div class="sns_test" style="font-size: 30px;">
        	<a class="sns-link" href="https://www.instagram.com/ggul_min/?hl=ko"><i class="fab fa-instagram" ></i></a>
        	<a class="sns-link" href="https://www.instagram.com/ggul_min/?hl=ko"><i class="fab fa-facebook" ></i></a>
        	<a class="sns-link" href="https://www.instagram.com/ggul_min/?hl=ko"><i class="fab fa-twitter" ></i></a>
   	    </div>
   			<c:if test='${userSession.name != null}'>
   			<div class="jumbotron text-center" style="margin-bottom: 0;">
			<img class="card-img-top" src="<c:url value="/resources/img/logo_1.png" />" width="50" height="300" />
					
			<p align="right">${userSession.name}님 <a href="member/mypage">마이페이지</a> <a href="member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp;<a href="#">고객센터</a></p>
			</div>
			</c:if>
			
			<c:if test='${userSession.name == null}'>
			<div class="jumbotron text-center" style="margin-bottom: 0;">
			<img class="card-img-top" src="<c:url value="/resources/img/logo_1.png" />" width="50" height="300" />
			<p align="right"><a href="member/login">로그인</a>&nbsp;&nbsp;&nbsp;<a href="member/registerCheck">회원가입</a>&nbsp;&nbsp;&nbsp;<a href="#">고객센터</a></p>		
			</div>
   			</c:if>
   		
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="board/notice">공지사항</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="board/promotion">홍보상품</a></li>
				<li class="nav-item"><a class="nav-link" href="board/review">이용후기</a></li>
				<li class="nav-item"><a class="nav-link" href="board/travel">테마여행</a></li>
				<li class="nav-item"><button class="nav-button" href="board/popupEnter" style="margin-left: 1400px; background-color: lightblue;">&nbsp;통합검색&nbsp;</button>
			</ul>
		</div>
	</nav>
</body>
</html>