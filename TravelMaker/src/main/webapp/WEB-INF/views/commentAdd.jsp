<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function backToList(obj){
	obj.method ="POST";
	obj.action = "${contextPath}/board/comment";
	obj.submit();
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
        document.getElementById("frm").submit();
    }
}
</script>
</head>
<body>
<jsp:include page="/resources/include/header.jsp" />
	<!-- Responsive navbar-->
	<hr>
	<h1 style="text-align: center">댓글 쓰기</h1>
	<form id="frm" action="addDone" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${userSession.id}">
		<input type="hidden" name="name" value="댓글">
		<table border="1" align="center">

			<tr>
				<td align="center" valign="top">글내용</td>
				<td colspan=2>
					<textarea name="content" rows="10" cols="65" maxlength="4000"></textarea>
				</td>
			</tr>
		</table>
		<br><br>
		<div align="center">
			<input type="submit" value="작성하기"  onClick="fn_create()">
			<input type="reset" value="다시 작성">
			<input type="button" value="목록 보기" onClick="backToList(this.form)">
		</div>
	</form>
 <hr>
     <jsp:include page="/resources/include/footer.jsp" />
</body>
</html>