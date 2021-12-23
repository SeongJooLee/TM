<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session='true'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>
<script>
function fn_serch() {
	var title = document.getElementById("headSearchOption").value;
	if (!headSearchOption) {
		alert('검색 옵션을 선택해주세요.');
		return false;
	}
	var content = document.getElementById("headSearchResult").value;
	if (!headSearchResult) {
		alert('검색내용을 입력해주세요.');
		return false;
	}
		document.getElementById("frmHeadSerch").submit();
	}
}
</script>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:if
	test='${userSession.name != null && userSession.grade.equals("user")}'>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; background-color: white; padding: 0;">
		<a href="/tm"><img class="logo_img"
			src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
		<p align="right">${userSession.name}님
			<a href="${contextPath}/member/mypage">마이페이지</a> <a
				href="${contextPath}/member/logout">로그아웃</a> &nbsp;&nbsp;&nbsp;<a
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
			<a href="${contextPath}/member/mypage">마이페이지</a> <a
				href="${contextPath}/member/logout">로그아웃</a> &nbsp;&nbsp;&nbsp;<a
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
			<a href="${contextPath}/admin/mypage">마이페이지</a> <a
				href="${contextPath}/member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp; <a
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
			<a href="${contextPath}/member/login">로그인</a>&nbsp;&nbsp;&nbsp; <a
				href="${contextPath}/member/registerCheck">회원가입</a>
			&nbsp;&nbsp;&nbsp;<a
				href="https://korean.visitseoul.net/tourist-complaint-center">관광불편처리센터</a>&nbsp;&nbsp;&nbsp;
			<a href="https://kto.visitkorea.or.kr/kor/customer/call/1330.kto">관광통역안내</a>	
		</p>
	</div>
</c:if>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand"
		href="https://www.youtube.com/watch?v=q8lYrRzgYD4">Travel Maker</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/board/notice">공지사항</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/board/promotion">홍보상품</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/board/review">이용후기</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/board/travel">여행게시판</a></li>
		</ul>

		<form id="frmHeadSerch" class="form-inline my-2 my-lg-0" action="/tm/board/popupEnter" method="post">
			<select class="form-control" name="headSearchOption">
				<option value="null">검색 옵션</option>
				<option value="person">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="titleContent">제목+내용</option>
			</select>&nbsp;&nbsp;
			 <input class="form-control" type='text' name='headSearchResult'
				placeholder='검색어 입력' required>&nbsp;&nbsp;
			<button class="form-control" onClick="fn_serch()">검색</button>
		</form>
  </div>
</nav>