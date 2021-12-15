<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
<script>
	function nameOrder(){
		location.href='/tm/admin/mypage?list=name';
		}
	function dateOrder(){
		location.href='/tm/admin/mypage?list=date';
		}
	
</script>
<style type="text/css">
.wrap {
	display: grid;
	grid-template-columns: 5% 15% 5% 60% 15%;
	grid-template-rows: 100%;    
}

.wrap>div {
	margin: 1px; 
	padding: 10px;
	font-size: 16px;
}

.grid1 {
	grid-column-start: 2;
	grid-column-end: 3;
	background: ghostwhite;
	border: 3px solid royalblue;
}

.grid2 {
	grid-column-start: 4;
	grid-column-end: 5;
	background: ghostwhite;
	border: 3px solid royalblue;
}
</style>
</head>
<body>
	<h1>관리자 전용 페이지</h1>
	<div class="wrap">
		<div class="grid1">
			
			<ul style="background-color: CornflowerBlue; text-align: center;" >
				<li>
					<form action='' method='post'>
						<input type='hidden' name='key' value='one'>
						<input type='submit' value='게시판 글 관리'>
					</form>
				</li><br>
				<li>
					<form action='' method='post'>
						<input type='hidden' name='key' value='two'>
						<input type='submit' value='회원조회'>
					</form>
				</li><br>
				<li>
					<form action='' method='post'>
						<input type='hidden' name='key' value='three'>
						<input type='submit' value='예약 조회'>
					</form>
				</li><br>
				
				
			</ul>
		</div>
		<div class="grid2">
		<h3>작성한 글</h3>
		<table border='1'>
			<tr>
				<td>작성한 게시판</td>
				<td>글 제목</td>
				
			</tr>
			<c:forEach var='travel' items='${travelList}'>
			<tr>
				<td>${travel.name}</td>
				<td><a href='/tm/admin/mypage/detail?travelNO=${travel.travelNO}'>${travel.title}</a></td>
			</tr>
			</c:forEach>
			<c:forEach var='review' items='${reviewList}'>
			<tr>
				<td>${review.name}</td>
				<td><a href='/tm/admin/mypage/detail?reviewNO=${review.reviewNO}'>${review.title}</a></td>
			</tr>
			</c:forEach>
		</table>
			
		</div>
	</div>
</body>


</html>