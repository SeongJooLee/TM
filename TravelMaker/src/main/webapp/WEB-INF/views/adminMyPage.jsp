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
	grid-template-columns: 30% 70%;
	grid-template-rows: 50px 150px 50px;
}

.wrap>div {
	margin: 1px; padding; 10 px;
	font-size: 20px;
}

.grid1 {
	grid-column-start: 1;
	grid-column-end: 3;
	background: lightskyblue;
}

.grid2 {
	grid-column-start: 1;
	grid-column-end: 2;
	background: lightskyblue;
}

.grid3 {
	grid-column-start: 2;
	grid-column-end: 3;
	background: lightskyblue;
}

.grid4 {
	grid-column-start: 1;
	grid-column-end: 3;
	background: lightskyblue;
}

</style>
</head>
<body>
<h1>admin마이페이지</h1>

<div class="wrap">
<div class="grid1">header</div>
<div class="grid2">adminsidemenu</div>
<div class="grid3">content</div>
<div class="grid4">footer</div>
</div>
</body>
</html>