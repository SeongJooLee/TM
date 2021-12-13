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
	grid-template-columns: 5% 15% 5% 60% 15% 5%;
	grid-template-rows: 400px 400px 400px;    
}

.wrap>div {
	margin: 2px; 
	padding: 10px;
	font-size: 16px;
}

.grid1 {
	grid-column-start: 2;
	grid-column-end: 3;
	grid-row-start: 1;
	grid-row-end: 3;
	background: ghostwhite;
	border: 3px solid royalblue;
}

.grid2 {
	grid-column-start: 4;
	grid-column-end: 5;
	grid-row-start: 1;
	grid-row-end: 3;
	background: ghostwhite;
	border: 3px solid royalblue;
}
</style>
</head>
<body>
	<h1>나연 관리자 메인 화면입니다.</h1>

</body>
	<div class="wrap">
		<div class="grid1">
			나연 관리자 사이드 메뉴<br>
			<ul style="background-color: CornflowerBlue; text-align: center;" >
				<li><a href="nayounTest/adminHome.jsp">관리자메뉴 홈</a></li><br>
				<li><a href="adminBoardList">게시판 글 관리</a></li><br>
				<li><a href="nayounTest/adminListView.jsp">리스트 출력</a></li><br>
				<li><a href="nayounTest/adminMemberView.jsp">회원 조회</a></li><br>
				<li><a href="nayounTest/adminSellerView.jsp">업체 조회</a></li><br>
			</ul>
		</div>
    	<div class="grid2">
		content
		</div>
	</div>
<%@ include file="/resources/include/nayounLeft.jsp"%>
</html>