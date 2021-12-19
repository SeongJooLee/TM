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
var cnt = 1;
function fn_addFile(){
	if(cnt===4){
		alert("최대 3개만 생성할 수 있습니다.");
		return;        
	    }
	    $("#d_file").append("<br>" + "<p id='image"+cnt+" '><input type='file' name='image" + cnt + " ' />");
	    cnt++;
	}
	function updateUser(){
			
			location.href = "/tm/member/mypage/update";
			

		}
	function deleteUser(){
		location.href = "/tm/member/mypage/delete?userId=${userSession.id}";
		}
	function fn_create(){
		var title = document.getElementById("title").value;
		if(!title){
			alert('제목을 적어주세요.');
			return false;
		}
		var content = document.getElementById("content").value;
		if(!content){
			alert('내용을 적어주세요.');
			return false;
		}
		
	    if (!confirm("글을 생성하시겠습니까?")) {
	        alert("취소(아니오)를 누르셨습니다.");
	        return;
	    } else {
	        alert("확인(예)을 누르셨습니다.");
	        }
	        document.getElementById("frm").submit();
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
			<h3>리뷰를 작성해주세요</h3>
			<%-- <form action='/tm/member/mypage/review' method='get'>
			
				
				제목을 적어주세요: <input type='text' name='title'><br>
				내용을 입력해주세요: <input type='text' name='content'><br>
				<input type='hidden' type='text' name='promotionNO' value='${promotionNO}'>
				<input type='submit' value='작성하기'>
				
			</form> --%>
				<form id="frm" action="/tm/member/mypage/review" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${userSession.id}">
					<table border="1" align="center">
					<tr>
						<td></td>
						<td>
							&nbsp;&nbsp;글 제목 : <input type="text" name="title" id="title">
							<input type='hidden' name='name' value='이용후기'>
							<input type='hidden' name='promotionNO' value='${promotionNO}'>
						</td>
					</tr>
					<tr>
						<td align='left' colspan="2">이미지 파일 첨부<br>
						<p><input type="button" value="파일 추가" onClick="fn_addFile()"><small> &nbsp;&nbsp;*최대 3개까지 첨부 가능합니다.</small>
						<div id="d_file">
					
						</div>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">글내용</td>
						<td colspan=2>
						<textarea id="content" name="content" rows="10" cols="65" maxlength="4000"></textarea>
						</td>
					</tr>
			</table>
		<br><br>
		<div align="center">
			<input type="button" value="작성하기" onClick="fn_create()">
			<input type="reset" value="다시 작성">
			<input type="button" value="목록 보기" onClick="backToList(this.form)">
		</div>
	</form>
		
		</div>
	</div>
<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>