<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<head>
<meta charset="UTF-8">
<title>테마 여행 글쓰기창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

var cnt = 1;
var previewCnt = 1;
function fn_addFile(){
if(cnt===11){
	alert("최대 10개만 생성할 수 있습니다.");
	return;        
    }
    $("#d_file").append("<br>" + "<input type='file' name='image" + cnt + " ' />");
    cnt++;
}
function backToList(obj){
	obj.method ="POST";
	obj.action = "${contextPath}/board/travel";
	obj.submit();
}

function fn_create(){
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
    <hr>
	<h1 style="text-align: center">여행 글 쓰기</h1>
	<form id="frm" action="addDone" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="user">
		<table border="1" align="center">
			<tr>
				<td>
					<select name="name">
						<option value="shopping">쇼핑</option>
						<option value="food">음식</option>
						<option value="culture">문화</option>
						<option value="activity">체험</option>
						<option value="exhibition">전시</option>
						<option value="transper">교통</option>
						<option value="map">지도</option>
					</select>
				</td>
				<td>
					&nbsp;&nbsp;글 제목 : <input type="text" name="title" required>
				</td>
			</tr>
			<tr>
				<td align='left' colspan="2">이미지 파일 첨부<br>
					<p><input type="button" value="파일 추가" onClick="fn_addFile()"><small> &nbsp;&nbsp;*최대 10개까지 첨부 가능합니다.</small></p>
					<div id="d_file">
					
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" valign="top">글내용</td>
				<td colspan=2>
					<textarea name="content" rows="10" cols="65" maxlength="4000" required></textarea>
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