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
	function ss(){
		alert('계정정보가 없어서 로그인 못하지롱~~');
		location.href = "login";
	}
	function updateUser(){
			
			location.href = "/tm/member/mypage/update";
			

		}
	function deleteUser(){
		location.href = "/tm/member/mypage/delete?userId=${userSession.id}";
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
	<%-- <c:if test = '${user==null}'>
		<script>
			ss();
		</script>
	</c:if>  --%>
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
				</li><br>
				<li><a href="#">로스트아크 인벤이동</a></li><br>
			</ul>
		</div>
		<div class="grid2">
		<p>아이뒤 : ${userSession.id}</p> 
		<p>비빔면호 : ${userSession.pw}</p> 
		<p>이름 : ${userSession.name}</p> 
		<p>생년월일 : ${userSession.birth}</p> 
		<p>연락처 : ${userSession.phone}</p> 
		<p>주소 : ${userSession.address}</p> 
		<p>가입날짜 : ${userSession.joinDate}</p> 
		
		<button type='button' onclick='updateUser()'>수정하기</button>
		<button onclick='deleteUser()'>삭제하기</button>
		
		</div>
	</div>
</body>
</html>