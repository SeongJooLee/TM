<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="false" %>
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
	<%-- <c:if test = '${seller==null}'>
		<script>
			ss();
		</script>
	</c:if>  --%>
	<h1>판매자 유저 페이지</h1>
	<h2>${seller.sellerID}님 정보</h2> 
	
	<div class="wrap">
		<div class="grid1">
			<br>
			<ul style="background-color: CornflowerBlue; text-align: center;" >
				<li><a href="#">판매자 회원정보</a></li><br>
				<li><a href="#">판매자 뷰가..</a></li><br>
				<li><a href="#">스토리보드에..</a></li><br>
				<li><a href="#">없는데..??</a></li><br>
				<li><a href="#">로스트아크 인벤이동</a></li><br>
			</ul>
		</div>
		<div class="grid2">
		<p>아이뒤 : ${seller.sellerID}</p> 
		<p>비빔면호 : ${seller.pw}</p> 
		<p>이름 : ${seller.name}</p> 
		<p>연락처 : ${seller.phone}</p> 
		<p>주소 : ${seller.address}</p> 
		<p>가입날짜 : ${seller.joinDate}</p> 
		</div>
	</div>
	
</body>
</html>