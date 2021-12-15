<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
	function ss(){
		alert('계정정보가 없어서 로그인 못하지롱~~');
		location.href = "login";
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
			<ul style="background-color: CornflowerBlue; text-align: center;">			
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
		<h3>${userSession.id}님이 게시한 글</h3>
		<%-- <c:forEach var='travel' items='${travel}' varStatus='num'>
			<span>${num.count}</span>
			<span>${travel.name}</span>
			<span>${travel.title}</span><br><br>		
		</c:forEach> --%>
<div class="container">
  <table class="table table-hover">
    <thead>
				<tr class="table-primary">
					<td>게시판 종류</td>
					<td>글 제목</td>
					<td>글 내용</td>
				</tr>
    </thead>
    <tbody>
				<c:forEach var='travel' items='${travel}'>
				<tr>
					<td>${travel.name}</td>
					<td><a href='/tm/member/mypage?travelNO=${travel.travelNO}'>${travel.title}</a></td>
					<td>${travel.content}</td>
				</tr>
				</c:forEach>
				<c:forEach var='review' items='${review}'>
				<tr>
					<td>${review.name}</td>
					<td><a href='/tm/member/mypage?reviewNO=${review.reviewNO}'>${review.title}</a></td>
					<td>${review.content}</td>
				</tr>
				</c:forEach>				
    </tbody>
  </table>
</div>
		<%-- <div class="grid2">
		<h3>리뷰 게시판에 작성한 게시글,제목</h3>
		<c:forEach var='review' items='${review}' varStatus='num'>	
			<span>${num.count}</span>
			<span>${review.name}</span>
			<span> ${review.title}</span><br><br>
			
		</c:forEach>
		
		</div> --%>
	</div>
	
	<jsp:include page="/resources/include/adminsidemenu.jsp" />
	
</body>
</html>