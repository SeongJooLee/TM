<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성 창</title>
<script>


function backToList(obj){
	obj.method ="POST";
	obj.action = "${contextPath}/board/commentView";
	obj.submit();
}


function fn_create(){

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
		<input type="hidden" name="id" value="user">
		<input type="hidden" name="name" value="테마여행">
		<table border="1" align="center">

			<tr>
				<td align="center" valign="top">글내용</td>
				<td colspan=2>
					<textarea name="content" rows="5" cols="30" maxlength="100"></textarea>
				</td>
			</tr>
			
				<tr id="tr_btn">
					<td colspan="2" align="center">
						<input type="button" value="수정하기" onClick="fn_enable(this.form)" /> 
						<input type="button" value="삭제하기" onClick="fn_delete(this.form)" /> 
						<input type="button" value="댓글쓰기" onClick="fn_create(this.form)" /> 
						<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
					</td>
				</tr>
				
		</table>
		<br><br>
		<div align="center">
			<input type="submit" value="작성하기"  onClick="fn_create()">
		</div>
	</form>
	
	  <a href="${contextPath }/board/travel/commentAdd">글쓰기</a> 
	  
 <hr>
     <jsp:include page="/resources/include/footer.jsp" />
</body>
</html>