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

		}
</script> 
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
<%--  <jsp:include page="/resources/include/header.jsp" /> --%>
	<h1>판매유저 페이지</h1>
	<h2>${userSession.sellerID}님 정보</h2> 
	
	<div class="wrap">
		<div class="grid1">
			<br>
			<ul style="background-color: CornflowerBlue; text-align: center;" >
				<li>
					<form action='/tm/member/mypage' method='post'>
						<input type="hidden" name="testKey" value="sellerOne">					
						<input class='btn' type='submit'  value='회원정보'>
					</form>
				</li><br>
				<li>
					<form action='/tm/member/mypage' method='post'>
						<input type="hidden" name="testKey" value="sellerTwo">					
						<input class='btn' type='submit'  value='내가 등록한 상품 보기'>
					</form>			
				</li><br>
				
			</ul>
		</div>
		<div class="grid2">
		
		<form action='/tm/member/mypage/sellerUpdate' method='post' >
			아이디: <input type='text' name='sellerID'value='${userSession.sellerID}' readonly><br>
			비밀번호: <input type='text' name='pw' value='${userSession.pw}'><br>
			업체이름: <input type='text' name='name' value='${userSession.name}' readonly><br>
			연락처: <input type='text' name='phone' value='${userSession.phone}'><br>
			주소: <input type='text' name='address' value='${userSession.address}'><br>
			<input type='submit' value='변경하기'>
		</form>
	
		

		</div>
		
	</div>
<%--   <jsp:include page="/resources/include/footer.jsp" />  --%>
</body>
</html>