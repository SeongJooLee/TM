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
function view(){
	alert('상세이동시키기');
}
function success(){
	alert('${result}로 검색한 결과입니다');
	
	}
function waitd(){
	alert('검색 결과가 없습니다 게시판 관리 페이지로 이동합니다');
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
						<input type='submit' value='회원 조회'>
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
		<h2>검색결과${result}</h2>
		<form action='/tm/admin/mypage/search' method='get'>
			아이디 조회 : <input type="search" name='search'><input type='submit' value='검색'>
		</form><br><br>
		
			<table border='1'>
	<tr>
		<td>예약번호</td>
		<td>예약날짜</td>
		<td>상품번호</td>
		<td>상품제목</td>
		<td>상품내용</td>
		<td>가격</td>
		<td>인원수</td>
		<td>예약자아이디</td>
		<td>상품보기</td>
	</tr>
<c:forEach var='proList' items='${proList}' >
	
	<c:forEach var='reserList' items='${reserList}' >
		
		<c:if test='${proList.promotionNO==reserList.promotionNO && result.equals(reserList.id)}'>
			<tr>
				<td>${reserList.reserNO}</td>
				<td>${reserList.reserDate}</td>
				<td>${proList.promotionNO}</td>
				<td>${proList.title}</td>
				<td>${proList.content}</td>
				<td>${proList.price}</td>
				<td>${reserList.headCount}</td>
				<td>${reserList.id}</td>
				<td><button onclick='view()'>${proList.title} 상품보기</button></td>
			</tr>
		</c:if>
		 
		
		
	</c:forEach>
	
	
</c:forEach>
	
	<script>
			success();
	</script>
</table>
		</div>
	</div>

</body>
</html>