<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function sellerUpdate(){
		
		location.href = "/tm/member/mypage/sellerUpdate";
	}

	function sellerDelete(){
		location.href='/tm/member/sellerMypage/delete?sellerId=${userSession.sellerID}';
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
<%--  <jsp:include page="/resources/include/header.jsp" /> --%>
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
		<p>아이뒤 : ${userSession.sellerID}</p> 
		<p>비빔면호 : ${userSession.pw}</p> 
		<p>이름 : ${userSession.name}</p> 
		<p>연락처 : ${userSession.phone}</p> 
		<p>주소 : ${userSession.address}</p> 
		<p>가입날짜 : ${userSession.joinDate}</p> 
		
		<button onclick='sellerUpdate()'>수정하기</button>
		<button onclick='sellerDelete()'>삭제하기</button>
		</div>
		
	</div>
<%--   <jsp:include page="/resources/include/footer.jsp" />  --%>
</body>
</html>