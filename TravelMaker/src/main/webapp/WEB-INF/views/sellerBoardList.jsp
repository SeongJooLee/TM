<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	grid-template-rows: 500px 150px 500px;    
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
	<h2>${userSession.sellerID}님 정보</h2> 
	
	<div class="wrap">
		<div class="grid1">
			<br>
			<ul style="background-color: CornflowerBlue; text-align: center;" >
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="sellerOne">					
						<input class='btn' type='submit'  value='회원정보'>
					</form>
				</li><br>
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="sellerTwo">					
						<input class='btn' type='submit'  value='내가 등록한 상품 보기'>
					</form>			
				</li><br>
				
			</ul>
		</div>
		<div class="grid2">
		<h3>${userSession.sellerID}님이 등록한 상품정보</h3>
		<p>여기다가 넣어야되나</p>
		<table border='1'>
		
		<tr>
			<td>순번</td>
			<td>상품 제목</td>
			<td>상품 내용</td>
			<td>상품 가격</td>			
			<td>판매자 ID</td>
			<td>상품 예약내역 보기</td>
		</tr>
		<tr>
		<c:forEach var='list' items='${proList}' varStatus='num'>
			
				
			<td>${num.count}</td>
			<td>${list.title}</td>
			<td>${list.content}</td>	
			<td>${list.price}</td>
			<td>${list.sellerID}</td>
			<td>
				<!-- <form action='mypage' method='post'>
					<input type="hidden" name="testKey" value="sellerThree">				
					<input class='btn' type='submit'  value='예약내역 확인하기'>
				</form> -->
				<a href='/tm/member/mypage?promotionNO=${list.promotionNO}'>예약내역 확인하기</a>
			</td>
		</tr>	
		</c:forEach>
		
		</table>
		</div>
		
	</div>
	
</body>
</html>