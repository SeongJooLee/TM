<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>

		<select name="searchOption" required>
			<option value="">옵션 선택</option>
   	    	<option value="person">작성자</option>
   			<option value="title">제목</option>
    		<option value="content">내용</option>
    		<option value="titleContent">제목+내용</option>
		</select>
		<input type='text' name='searchResult' placeholder='검색어를 입력하세요' required>
        <input type='submit' value='검색하기'>
    <br><br><br>
    <table border='1'>
    	<tr>
    		<td>-</td>
    		<td>게시판종류</td>
    		<td>작성자</td>
    		<td>제목</td>
    		<td>내용</td>
    	</tr>
    		<c:forEach var='list' items='${boardList}'>
    			<tr>
    				<td>${list.count}</td>
    				<td>${list.name}</td>
    				<td>${list.adminID}</td>
    				<td><a href='/tm/board/popupCheck?randomNO=${list.noticeNO}&randomName=${list.name}'>${list.title}</a></td>
    				<td>${list.content}</td>
    			</tr>
    		</c:forEach>
    
    </table>

</body>
</html>