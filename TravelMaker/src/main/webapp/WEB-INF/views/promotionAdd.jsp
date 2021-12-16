<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%       
   request.setCharacterEncoding("utf-8");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />
<script src='http://code.jquery.com/jquery-latest.min.js'></script>
<script type='text/javascript'>
var cnt = 1;
function fn_addFile(){
if(cnt===4){
	alert("최대 3개만 생성할 수 있습니다.");
	return;        
    }
    $("#d_file").append("<br>" + "<p id='image"+cnt+" '><input type='file' name='image" + cnt + " ' />");
    cnt++;
}

function backToList(obj){
	obj.method ="POST";
	obj.action = "${contextPath}/tm/board/promotion";
	obj.submit();
}

function fn_create(){
	var category = document.getElementById("categoryName").value;
	if(category=='null'){
		alert('카테고리를 선택해주세요.');
		return false;
	}
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
	var price = document.getElementById("price").value;
	if(!price||price<0){
		alert('가격을 적어주세요.');
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
</head>
<body>
    <jsp:include page="/resources/include/header.jsp" />
    <hr>
    
	<h1 style="text-align: center">홍보 글 쓰기</h1>
	<form id="frm" action="addDone" method="post" enctype="multipart/form-data">
		<input type="hidden" name="sellerID" value="seller">
		<input type="hidden" name="name" value="promotion">
		<table border="1" align="center">
			<tr>
				<td>
					<select name="categoryName" id="categoryName" >
						<option value="null">선택해주세요.</option>
						<option value="쇼핑">쇼핑</option>
						<option value="음식">음식</option>
						<option value="문화">문화</option>
						<option value="체험">체험</option>
						<option value="전시">전시</option>
						<option value="교통">교통</option>
						<option value="지역">지역</option>
					</select>
				</td>
				<td align='left'>
					&nbsp;&nbsp;글 제목 : <input type="text" name="title" id="title">
				</td>
			</tr>
			<tr>
				<td align='left' colspan="2">
					&nbsp;&nbsp;가격: <input type="number" name="price" id="price">
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
 <hr>
     <jsp:include page="/resources/include/footer.jsp" />

</body>
</html>