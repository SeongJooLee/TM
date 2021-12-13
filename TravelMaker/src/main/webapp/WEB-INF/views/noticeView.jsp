<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 여행 뷰</title>
</head>
<body>
<table border="1" align="center">
  <tr>
  	<td>${notice.noticeNO }</td><td>${notice.title }</td>
  </tr>
  
	  <tr>
  			<td colspan="2">
			</td>
  		</tr>
  	
  <tr>
  	<td colspan="2">${notice.content }</td>
  </tr>
  <tr>
  	<td>${notice.writeDate }</td>
  </tr>
  <tr>
  	<td>수정</td><td>삭제</td>
  	</tr>
  	</table>
</body>
</html>