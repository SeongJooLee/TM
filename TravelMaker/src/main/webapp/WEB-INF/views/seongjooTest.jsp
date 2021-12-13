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
	grid-template-columns: 5% 15% 5% 65% 15%;
	grid-template-rows: 50px 150px 50px;
}

.wrap>div {
	margin: 1px; padding; 10 px;
	font-size: 20px;
}


.grid2 {
	grid-column-start: 2;
	grid-column-end: 3;
	background: lightskyblue;
 	border: 2px solid darkblue;
	height: 400px;
	width: 100%;
}

.grid3 {
	grid-column-start: 4;
	grid-column-end: 5;
	background: lightskyblue;
	border: 2px solid darkblue;
	height: 400px;
	width: 100%;
}


</style>
</head>
<body>
<h1>admin마이페이지</h1>

<div class="wrap">
	<div class="grid2">
		<div align="center">
		
			<jsp:include page="/resources/include/seongjooTest.jsp" />
		</div>
	</div>
	<div class="grid3">
		content
	</div>
</div>
</body>
</html>