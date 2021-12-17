<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
       <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />
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
<script>
function success(){
	alert('예약변경이 완료되었습니다람쥐');
}
function deleteSuccess(){
	alert('삭제가 완료되었습니다람쥐');
}
</script>
</head>
<body>
<jsp:include page="/resources/include/header.jsp" />
<c:if test='${result==1}'>
	<script>

		success();
	</script>
</c:if>
<c:if test='${deleteResult==1}'>
	<script>

		deleteSuccess();
	</script>
</c:if>
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
		contentd
		</div>
	</div>
<jsp:include page="/resources/include/footer.jsp" />
</body>


</html>