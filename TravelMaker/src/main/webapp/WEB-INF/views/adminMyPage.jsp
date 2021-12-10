<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
<style type="text/css">
.wrap {
	display: grid;
	grid-template-columns: 5% 15% 5% 60% 15%;
	grid-template-rows: 500px 150px 500px;
}

.wrap>div {
	margin: 1px; padding 10px;
	font-size: 16px;
}

.grid1 {
	grid-column-start: 2;
	grid-column-end: 3;
	background: snow;
	border: 3px solid royalblue;
}

.grid2 {
	grid-column-start: 4;
	grid-column-end: 5;
	background: snow;
	border: 3px solid royalblue;
}
</style>
</head>
<body>
	<h1>admin마이페이지</h1>

	<div class="wrap">

		<div class="grid1">
			adminsidemenu<br>
			<ul>
				<li><a href="#adminhome">관리자메뉴홈</a></li><br>
				<li><a href="#boardList">게시판 글 관리</a></li><br>
				<li><a href="#listView">리스트 출력</a></li><br>
				<li><a href="#memberView">회원 조회</a></li><br>
				<li><a href="#sellerView">업체 조회</a></li><br>
			</ul>
		</div>
		<div class="grid2">content</div>

	</div>
</body>

<%@ include file="../../include/adminsidemenu.jsp"%>
관리자 화면입니다.
</html>