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
	function nameOrder(){
		location.href='/tm/admin/mypage?list=name';
		}
	function dateOrder(){
		location.href='/tm/admin/mypage?list=date';
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
				
				
			</ul>
		</div>
		<div class="grid2">
		<h3>상세보기</h3>
		
			
				<p>글 번호: ${travel.travelNO}</p>
				<p>글 제목: ${travel.title}</p>
				<p>글 내용: ${travel.content}</p>
				<p>작성 일자: ${travel.writeDate}</p>
				<p>작성자 아이디: ${travel.id}</p>
				<p>게시판 종류: ${travel.name}</p>
			
				<button>수정하기</button>
				<button>삭제하기</button>
		</div>
	</div>
</body>


</html>