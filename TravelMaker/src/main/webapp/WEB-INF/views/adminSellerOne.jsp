<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<title>관리자 마이페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
	function nameOrder() {
		location.href = '/tm/admin/mypage?list=name';
	}
	function dateOrder() {
		location.href = '/tm/admin/mypage?list=date';
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
	<h1>${userSession.name}전용페이지</h1>
	<div class="wrap">
		<div class="grid1">

			<ul style="background-color: CornflowerBlue; text-align: center;">
				<li>
					<form action='' method='post'>
						<input type='hidden' name='key' value='one'> <input
							type='submit' value='게시판 글 관리'>
					</form>
				</li>
				<br>
				<li>
					<form action='' method='post'>
						<input type='hidden' name='key' value='two'> <input
							type='submit' value='회원조회'>
					</form>
				</li>
				<br>
				<li>
					<form action='' method='post'>
						<input type='hidden' name='key' value='three'> <input
							type='submit' value='예약조회'>
					</form>
				</li>
				<br>


			</ul>
		</div>
		<div class="container">
			<h3>등록한 상품 내역</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>상품 번호</th>
						<th>상품 제목</th>
						<th>상품 가격</th>
						<th>등록 일자</th>
						<th>등록자 아이디</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var='seller' items='${seller}'>
						<tr>
							<td><a href='#'>${seller.promotionNO}</a></td>
							<td>${seller.title}</td>
							<td>${seller.price}</td>
							<td>${seller.writeDate}</td>
							<td>${seller.sellerID}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>


</html>