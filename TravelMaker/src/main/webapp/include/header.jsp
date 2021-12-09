<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.fakeimg {
	height: 200px;
	background: #aaa;
}
</style>
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1><img src="../webapp/img/unnamed.png" ></h1>
		<p>Resize this responsive page to see the effect!</p>
		<p align="right"><a href="member/login">로그인</a>&nbsp;&nbsp;&nbsp;<a href="member/register">회원가입</a>&nbsp;&nbsp;&nbsp;<a href="#">고객센터</a></p>
		<p align="right"><a href="#">로그아웃</a>&nbsp;&nbsp;&nbsp;<a href="#">고객센터</a></p>
	
	</div>
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
			</ul>
		</div>
	</nav>
</body>
</html>