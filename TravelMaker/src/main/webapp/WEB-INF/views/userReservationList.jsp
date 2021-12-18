<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
       <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />
<script>
	function ss() {
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

.btn {
	width: 110px;
}

</style>
</head>
<body>
<jsp:include page="/resources/include/header.jsp" />
	<%-- <c:if test = '${user==null}'>
		<script>
			ss();
		</script>
	</c:if>  --%>
	<h1>일반유저 페이지</h1>
	<h2>${userSession.id}님정보</h2>

	<div class="wrap">
		<div class="grid1">
			<br>
			<ul style="background-color: CornflowerBlue; text-align: center;">
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="one"> <input
							class='btn' type='submit' value='회원정보'>
					</form>
				</li>
				<br>
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="two"> <input
							class='btn' type='submit' value='내가 쓴 글 보기'>
					</form>
				</li>
				<br>
				<li>
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="three"> <input
							class='btn' type='submit' value='예약확인'>
					</form>
				</li>
				<br>
				<li> 
					<form action='mypage' method='post'>
						<input type="hidden" name="testKey" value="four"> <input
							class='btn' type='submit' value='추천한 글(보류중)'>
					</form>
				</li>
			</ul>
		</div>
		<div class="grid2">
			<div class="container">
				<h2>예약확인</h2>
				<h4>예약번호를 누르시면 이용후기 작성이 가능합니다.</h4>
				<table class="table table-hover">
					<thead>
						<tr class="table-primary">
							<th>예약번호</th>
							<th>예약 상품번호</th>
							<th>예약날짜</th>
							<th>예약자 ID</th>
							
						</tr>
					</thead>
					<tbody>
							<c:forEach var='list' items='${list}' varStatus='num'>
						<tr>
								<td><a href='${contextPath }/tm/board/reservation/view?reserNO=${list.reserNO }' > ${list.reserNO}</a></td>
								<td>${list.promotionNO}</td>
								<td>${list.reserDate}</td>
								<td>${list.id}</td>
								
						</tr>
							</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>