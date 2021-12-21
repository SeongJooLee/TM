<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />

<script>
	
	function updateUser(){
			
			location.href = "/tm/member/mypage/update";
			

		}
	function deleteUser(){
		var result = confirm("삭제할거니..?");
		if(result){
			location.href = "/tm/member/mypage/delete?userId=${userSession.id}";
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
.btn{
width:110px;
}
</style>
</head>
<body>
<jsp:include page="/resources/include/header.jsp" />


	<h1>일반유저 페이지</h1>
	<h2>${userSession.id}님 정보</h2>  
	<div class="wrap">
		<div class="grid1">
			<br>
			<ul style="background-color: CornflowerBlue; text-align: center;" >
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="one">					
						<input class='btn' type='submit'  value='회원정보'>
					</form>
				</li><br>
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="two">					
						<input class='btn' type='submit'  value='내가 쓴 글 보기'>
					</form>			
				</li><br>
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="three">					
						<input class='btn' type='submit'  value='예약확인'>
					</form>	
				</li><br>
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="four">					
						<input class='btn' type='submit'  value='추천한 글(보류중)'>
					</form>	
				</li>
			</ul>
		</div>
		<div class="grid2">
		<p>아이디 : ${userSession.id}</p> 
		<p>비빌번호 : ${userSession.pw}</p> 
		<p>이름 : ${userSession.name}</p> 
		<p>생년월일 : ${userSession.birth}</p> 
		<p>연락처 : ${userSession.phone}</p> 
		<p>주소 : ${userSession.address}</p> 
		<p>가입날짜 : ${userSession.joinDate}</p> 
		
		<button type='button' onclick='updateUser()'>수정하기</button>
		<button onclick='deleteUser()'>삭제하기</button>
		
		</div>
	</div>
<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>