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
	function reserUpdate(){
		location.href='/tm/admin/mypage/reservationUpdate?key=${reservation.reserNO}';
		}
	/* function reserDelete(){
		location.href='/tm/admin/mypage/reservationDelete?key=${reservation.reserNO}';
		} */
	function check(){
		
		var result = confirm("삭제할거니..?");
		if(result){
			location.href = "/tm/admin/mypage/reservationDelete?key=${reservation.reserNO}";
		}else{
		    return;
		}
	
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
					<form action='/tm/admin/mypage' method='post'>
						<input type='hidden' name='key' value='three'>
						<input type='submit' value='예약 조회'>
					</form>
				</li><br>
				
				
			</ul>
		</div>
		<div class="grid2">
		<h3>예약 상세보기</h3>
		
			
			
				<p>예약 번호: ${reservation.reserNO}</p>
				<p>예약 상품 번호: ${reservation.promotionNO}</p>
				<p>예약 날짜: ${reservation.reserDate}</p>
				<p>인원 수: ${reservation.headCount}</p>
				<p>예약자 아이디: ${reservation.id}</p>
				
			
				<button onclick='reserUpdate()'>수정하기</button>
				<button onclick='check()'>삭제하기</button>
		</div>
	</div>
</body>


</html>