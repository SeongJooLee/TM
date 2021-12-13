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
	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload=function(e){
				$('#preview').attr('src',e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<h1 style="text-align: center">공지 글 쓰기</h1>
	<form action="addDone" method="post">
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
					<input type="text" name="title" value="글 제목 작성 칸">
				</td>
			</tr>
			<tr>
				<td align='right'>이미지 파일 첨부:
				<input type='file' name='image1' onchange='readURL(this);'/>
				</td>
				<td><img id='preview'  width=200 height = 200/></td>				
			</tr>
			<tr>
				<td align="right" valign="top">글내용</td>
				<td colspan=2>
					<textarea name="content" rows="10" cols="65" maxlength="4000"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="작성하기">
		<input type="reset" value="다기 작성">
	</form>

</body>
</html>