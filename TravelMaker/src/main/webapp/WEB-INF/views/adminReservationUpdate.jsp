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
	function reset(){
		
			var result = confirm("취소할거니..?");
			if(result){
				location.href = "/tm/admin/mypage";
			}else{
			    return;
			}
		
		}
	function check(){
		alert('ㅇㅇ');
		location.href='/tm/admin/mypage';
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
					<form action='/tm/admin/mypage' method='post'>
						<input type='hidden' name='key' value='one'>
						<input type='submit' value='게시판 글 관리'>
					</form>
				</li><br>
				<li>
					<form action='/tm/admin/mypage' method='post'>
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
			<h3>변경할 값을 입력해주세요</h3>
			<form action='/tm/admin/mypage/reservationUpdate' method='post'>
				예약번호: <input type='text' name='reserNO' value='${reservation.reserNO}' readonly><br>
				
				<br>변경할 상품을 선택해주세요<br>
				<c:forEach var='list' items='${proList}'>			
					${list.title} ${list.promotionNO} <input type='radio'  name='promotionNO' value='${list.promotionNO}' required>
					<br>
				</c:forEach>
				<br>예약 날짜: <input type='date' name='reserDate' value='${reservation.reserDate}' ><br><br>
				인원 수: <input type='number' name='headCount' value='${reservation.headCount}' ><br><br>
				예약자 ID: <input type='text'  name='id' value='${reservation.id}' readonly><br><br>
				<input type='submit' value='변경하기'>
				
				
			</form>
			<button onclick='reset()'>취소하기</button>
		</div>
	</div>
</body>


</html>