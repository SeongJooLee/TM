<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored = "false" %>
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
<title>테마 여행 뷰</title>
<script src='http://code.jquery.com/jquery-latest.min.js'></script>
<script type='text/javascript'>

function fn_enable(obj){
	document.getElementById("title").disabled = false;
	document.getElementById("content").disabled = false;
	
	document.getElementById("tr_btn_modify").style.display='block';
	document.getElementById("tr_btn").style.display='none';
}

function fn_modify_article(obj){
	obj.action = "${contextPath}/board/modArticle.do";
	obj.submit();
}

function readURL(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload=function(e){
			$('#preview').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function backToList(obj){
	obj.action = '${contextPath}/board/listArticles.do';
	obj.submit();
}

function fn_remove_article(url,articleNO){
	var form = document.createElement("form");
	form.setAttribute("method","post");
	form.setAttribute("action", url);
	var articleNOInput = document.createElement("input");
	articleNOInput.setAttribute("type","hidden");
	articleNOInput.setAttribute("name","articleNO");
	articleNOInput.setAttribute("value",articleNO);
	form.appendChild(articleNOInput);
	document.body.appendChild(form);
	form.submit();
}

</script>
</head>
<body>
<form name="frmArticle" method="post" action="&{contextPath}" enctype="multipart/form-data">
	<table border="1" align="center">
		<tr>
			<td>글 번호 : <input type="text" value="${notice.noticeNO }" name="noticeNO" readonly />
			</td>
			<td><input type="text" value="${notice.title }" id="title" name="title" disabled />
		</td>
		</tr>
		<tr>
			<td width="150" align="center">작성자 아이디</td>
			<td><input type="text" value="${notice.adminID }" name="adminID" readonly /></td>
		</tr>
<%-- 		
		<c:forEach var="image" items="${map.fileList }">
			<tr>
				<td colspan="2">
					<img src="${contextPath }/download?image=${image}">
					
				</td>
			</tr>
		</c:forEach>
		 --%>
		<tr>
			<td width="150" align="center">글내용</td>
			<td><textarea rows="20" cols="60" name="content" id="content" disabled >${notice.content } </textarea></td>
		</tr>
		<tr>
			<td>작성 날짜 </td><td>${notice.writeDate }</td>
		</tr>
		<tr>
			<td colspan="2" align="center" >
				<input type="button" value="수정하기" onClick="fn_enable(this.form)">
				<input type="button" value="삭제하기" onClick="#">
				<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>