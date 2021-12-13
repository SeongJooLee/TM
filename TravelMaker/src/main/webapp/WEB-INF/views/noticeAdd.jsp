<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 여행 뷰</title>
<script src='http://code.jquery.com/jquery-latest.min.js'></script>
<script type='text/javascript'>
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
</script>
</head>
<body>
	<h1 style="text-align: center">공지 글 쓰기</h1>
	<form action="addDone" method="post" enctype="multipart/form-data">
		<input type="hidden" name="adminID" value="admin">
		<table border="1" align="center">
			<tr>
				<td>
					<select name="name">
						<option value="notice">공지사항</option>
						<option value="event">이벤트</option>
					</select>
				</td>
				<td>
					&nbsp;&nbsp;글 제목 : <input type="text" name="title" >
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
					<textarea name="content" rows="10" cols="65" maxlength="4000"></textarea>
				</td>
			</tr>
		</table>
		<br><br>
		<div align="center">
			<input type="submit" value="작성하기">
			<input type="reset" value="다기 작성">
		</div>
	</form>

</body>
</html>