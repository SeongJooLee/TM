<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session='true'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:if
	test='${userSession.name != null && userSession.grade.equals("user")}'>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; background-color: white; padding: 0;">
		<a href="/tm"><img class="logo_img"
			src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
		<p align="right">${userSession.name}님
			<a href="${contextPath}/member/mypage">마이페이지</a> <a
				href="${contextPath}/member/logout">로그아웃</a> &nbsp;&nbsp;&nbsp;<a
				href="#">고객센터</a>
		</p>
	</div>
</c:if>


<c:if
	test='${userSession.name != null && userSession.grade.equals("seller")}'>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; background-color: white; padding: 0;">
		<a href="/tm"><img class="logo_img"
			src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
		<p align="right">${userSession.name}님
			<a href="${contextPath}/member/mypage">마이페이지</a> <a
				href="${contextPath}/member/logout">로그아웃</a> &nbsp;&nbsp;&nbsp;<a
				href="#">고객센터</a>
		</p>
	</div>
</c:if>

<c:if
	test='${userSession.name != null && userSession.grade.equals("admin")}'>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; background-color: white; padding: 0;">
		<a href="/tm"><img class="logo_img"
			src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
		<p align="right">${userSession.name}님
			<a href="${contextPath}/admin/mypage">마이페이지</a> <a
				href="${contextPath}/member/logout">로그아웃</a>&nbsp;&nbsp;&nbsp; <a
				href="#">고객센터</a>
		</p>
	</div>
</c:if>

<c:if test='${userSession.name == null}'>
	<div class="jumbotron text-center"
		style="margin-bottom: 0; background-color: white; padding: 0;">
		<a href="/tm"><img class="logo_img"
			src="<c:url value="/resources/img/Travel Maker (3).png" />" /></a>
		<p align="right">
			<a href="${contextPath}/member/login">로그인</a>&nbsp;&nbsp;&nbsp; <a
				href="${contextPath}/member/registerCheck">회원가입</a>
			&nbsp;&nbsp;&nbsp;<a
				href="${contextPath}/board/notice/view?noticeNO=3">고객센터</a>
		</p>
	</div>
</c:if>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand"
		href="https://www.youtube.com/watch?v=q8lYrRzgYD4">Travel Maker</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/board/notice">공지사항</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/board/promotion">홍보상품</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/board/review">이용후기</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/board/travel">여행게시판</a></li>
		</ul>
		
		<form class="form-inline my-2 my-lg-0">

			<button class="btn btn-primary" data-toggle="modal"	data-target="#myModal" >통합검색</button>

			<div class="modal fade" id="myModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">통합 검색</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">
							<select id="searchOption" name="searchOption" required>
								<option value="">옵션 선택</option>
								<option value="person">작성자</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="titleContent">제목+내용</option>
							</select> <input type='text' id="searchResult" name='searchResult' placeholder='검색어를 입력하세요'
								required> <input type='button' onClick="pageEnter()" value='검색하기'> <br>
							<br>
							<br>
							<div id="insertData"></div>
							

						</div>
						<div class="modal-footer">
						
						    <table border='1'>
    	<tr>
    		<td>-</td>
    		<td>게시판종류</td>
    		<td>작성자</td>
    		<td>제목</td>
    		<td>내용</td>
    	</tr>
    		<c:forEach var='list' items='${boardList}'>
    			<tr>
    				<td>${list.count}</td>
    				<td>${list.name}</td>
    				<td>${list.adminID}</td>
    				<td><a href='/tm/board/popupCheck?randomNO=${list.noticeNO}&randomName=${list.name}'>${list.title}</a></td>
    				<td>${list.content}</td>
    			</tr>
    		</c:forEach>
    
    </table>
						</div>
						
												
					</div>
				</div>
			</div>


			<!--location.href = '/tm/board/popupEnter'  -->
		</form>
	</div>
	<script>
	function pageEnter(){
		var searchOption = $('select#searchOption').val();
		var searchResult = $('input#searchResult').val();
		alert('검색합니다.')
		$.ajax({
			type : 'POST',
			url : '/board/popupEnter',
			dataType : "json",
			data : {
				'searchOption' : searchOption,
				'searchResult' : searchResult
			},
			success : function(data) {
				// 여기서 받아온값 뿌려주는거 
				
				
				if (data.result == 'false') {
					alert('삭제 실패');
				} else {
					alert('일단 들어옴.');
				}
				var insertData +='<div>정상작동 하는지 </div>'
					
					$('#insertData').append(insertData);
			},
			error : function(err) {
				//서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
				alert('에러떳는데 난 몰랑');
				return;
			}
		});
		}
	

    </script>

</nav>
