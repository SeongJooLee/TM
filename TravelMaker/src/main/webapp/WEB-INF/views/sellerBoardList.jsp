<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- <script>
	function ss(){
		alert('계정정보가 없어서 로그인 못하지롱~~');
		location.href = "login";
	}
</script> -->
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
	<h1>판매유저 페이지</h1>
	<h2>${userSession.sellerID}님정보</h2>

	<div class="wrap">
		<div class="grid1">
			<br>
			<ul style="background-color: CornflowerBlue; text-align: center;">
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="sellerOne"> <input
							class='btn' type='submit' value='회원정보'>
					</form>
				</li>
				<br>
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="sellerTwo"> <input
							class='btn' type='submit' value='내가 등록한 상품 보기'>
					</form>
				</li>
				<br>

			</ul>
		</div>
		<div class="grid2">
			<div class="container">
				<h3>${userSession.sellerID}님이등록한상품정보</h3>
				<p>여기다가 넣어야되나</p>
				<table class="table table-hover">
					<thead>
						<tr class="table-primary">
							<th>상품 번호</th>
							<th>상품 제목</th>
							<th>상품 내용</th>
							<th>상품 가격</th>
							<th>판매자 ID</th>
							<th>상품 예약내역 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var='list' items='${proList}' varStatus='num'>


								<td>${list.promotionNO}</td>
								<td>${list.title}</td>
								<td>${list.content}</td>
								<td>${list.price}</td>
								<td>${list.sellerID}</td>
								<td>
									<!-- <form action='mypage' method='post'>
					<input type="hidden" name="testKey" value="sellerThree">				
					<input class='btn' type='submit'  value='예약내역 확인하기'>
				</form> --> <a
									href='/tm/member/mypage?promotionNO=${list.promotionNO}'>예약내역
										확인하기</a>
								</td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>