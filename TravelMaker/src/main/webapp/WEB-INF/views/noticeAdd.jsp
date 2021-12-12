<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 여행 뷰</title>
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
				<td colspan="2">
					<input type="hidden" name="image1" value="image1">
					<input type="hidden" name="image2" value="image2">
					<input type="hidden" name="image3" value="image3">
					<input type="hidden" name="image4" value="image4">
					<input type="hidden" name="image5" value="image5">
					<input type="hidden" name="image6" value="image6">
					<input type="hidden" name="image7" value="image7">
					<input type="hidden" name="image8" value="image8">
					<input type="hidden" name="image9" value="image9">
					<input type="hidden" name="image10" value="image10">
					<p>사진 추가 공간</p>
				</td>
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