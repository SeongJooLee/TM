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
	<h1>${userSession.name} 전용 페이지</h1>
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
			<button onclick='nameOrder()'>이름 순으로보기</button><br><br>
			<button onclick='dateOrder()'>가입날짜 순으로보기</button><br><br>
			<form action='/tm/admin/mypage' method='post'>
			아이디 조회 : <input type="search" name='search'><input type='submit' value='검색'>
			</form>
			
			<h3>모든 회원 목록</h3>
			<table	border='1'>
				<tr>
					<td>ID</td>
					<td>PW</td>
					<td>NAME</td>
					<td>PHONE</td>
					<td>ADDRESS</td>
					<td>JOINDATE</td>
					<td>GRADE</td>
				</tr>
			<c:forEach var='list' items='${list}'>
				<tr>
					<td><a href='/tm/admin/mypage?id=${list.id}&grade=${list.grade}'>${list.id}</a></td>
					<td>${list.pw}</td>
					<td>${list.name}</td>
					<td>${list.phone}</td>
					<td>${list.address}</td>
					<td>${list.joinDate}</td>
					<td>${list.grade}</td>
				</tr>			
			</c:forEach>

			</table>
		</div>
	</div>
</body>


</html>