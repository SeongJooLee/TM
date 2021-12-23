<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기 목록</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
<style>
body {
	min-height: 100vh;
}

#mainColor{
	background-color:#876b6b !important;
	solid:#876b6b !important;

}
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button4 {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}

.button4:hover {
	background-color: #e7e7e7;
}
</style>
<script>
function wkrtjd(obj){
	document.getElementById('reviewcreate').method= "POST";
	document.getElementById('reviewcreate').action = "${contextPath}/member/mypage";
   document.getElementById('reviewcreate').submit();
}
<!-- 여기 수정 덜됐습니다. -->
function tyvld(){
	alert('쇼핑 카테고리');
	location.href='/tm/board/travel/category?key=쇼핑';
	}
function wldur(){
	alert('지역 카테고리');
	location.href='/tm/board/travel/category?key=지역';
	}
function dmatlr(){
	alert('음식 카테고리');
	location.href='/tm/board/travel/category?key=음식';
	}
function ryxhd(){
	alert('교통 카테고리');
	location.href='/tm/board/travel/category?key=교통';
	}
function ansghk(){
	alert('문화 카테고리');
	location.href='/tm/board/travel/category?key=문화';
	}
function wjstl(){
	alert('전시 카테고리');
	location.href='/tm/board/travel/category?key=전시';
	}
function cpgja(){
	alert('체험 카테고리');
	location.href='/tm/board/travel/category?key=체험';
	}
function chrlghk(){
	alert('설정을 초기화합니다.');
	location.href='/tm/board/travel';
	}
</script>
</head>
<body>

	<jsp:include page="/resources/include/header.jsp" />

	<div class="container px-4 px-lg-5">
		<div class="card text-white bg-secondary my-5 py-4 text-center" id="mainColor">
			<div class="card-body">
				<h5 class="text-white m-0">이 용 후 기</h5>
			</div>
		</div>
		<!-- 여기 수정 덜됐습니다. -->
		<div class="col-md-12 mb-4">
			<button type="button" class="button button4" onclick='tyvld()'>쇼핑</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='dmatlr()'>음식</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='ansghk()'>문화</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='cpgja()'>체험</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='wjstl()'>전시</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='ryxhd()'>교통</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='wldur()'>지역</button>
			&nbsp;&nbsp;
			<button type="button" class="button button4" onclick='chrlghk()'>설정
				초기화</button>
		</div>		

		<div class="row gx-4 gx-lg-5">
			<c:forEach var="review" items="${review}">
				<div class="col-md-4 mb-5">
					<div class="card h-100">

						<c:if test="${review.image1 != null }">
							<img
								src="${contextPath }/board/review/download?image=${review.image1}&reviewNO=${review.reviewNO}&name=${review.name}"
								width="100%" height="250px" />
						</c:if>

						<c:if test="${review.image1 == null }">
							<img
								src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />"
								width="100%" height="250px" />
						</c:if>

						<div class="card-footer">
							<a class="btn btn-primary btn-sm">후기</a>&nbsp;&nbsp;&nbsp;<a
								href="${contextPath}/board/review/view?reviewNO=${review.reviewNO }">${review.title }</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
			<c:if test='${userSession.grade.equals("user")}'>
		<div align="right">
			<form id="reviewcreate">
				<input type="hidden" name="testKey" value="three" >
				<button class="btn btn-primary btn-sm" type="button" onClick="wkrtjd()" id="mainColor">이용후기 작성</button>
			</form>
		</div>
	</c:if>
		
		<div align="center">
			<c:forEach var="i" begin="1" end="${page }">
				<c:if test="${selectPage == i}">
					<strong><a
						href="${contextPath }/board/review/select?selectPage=${i}">
							${i } </a>&nbsp;&nbsp;&nbsp;</strong>
				</c:if>
				<c:if test="${selectPage != i }">
					<a href="${contextPath }/board/review/select?selectPage=${i}">
						${i } </a>&nbsp;&nbsp;&nbsp;
				</c:if>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>