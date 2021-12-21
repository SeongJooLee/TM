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

function resultCount(){
	alert('${list.size()}개가 검색되었습니다');
}
function resultZero(){
	alert('검색결과가 없습니다');
}

function listAll() {
	  location.href="/tm/board/popupEnter";
	  
	}
</script>
</head>
<body>
	<h1>비빔짬뽕먹고싶다비빔짬뽕먹고싶다</h1>

	<form action='/tm/board/popupEnter' method='post'>
		<select name="searchOption" required>
			<option value="" >옵션선택</option>
    		<option value="person">작성자</option>
    		<option value="title">제목</option>
    		<option value="content">내용</option>
    		<option value="titleContent">제목+내용</option>
		</select>
	 	<input type='text' name='searchResult' placeholder='검색어입력 "해줘"' required>
   		<input type='submit' value='검색하기'>
   		
	</form>
	<button onclick='listAll()'>모두보기</button>
	<br><br><br>
	<table border='1'>
    	<tr>
    		<td>-</td>
    		<td>게시판종류</td>
    		<td>작성자</td>
    		<td>제목</td>
    		<td>내용</td>
    	</tr>
    		<c:forEach var='list' items='${list}'>
    			<tr>
    				<td>${list.count}</td>
    				<td>${list.name}</td>
    				<td>${list.adminID}</td>
    				<td><a href='/tm/board/popupCheck?randomNO=${list.noticeNO}&randomName=${list.name}'>${list.title}</a></td>
    				<td>${list.content}</td>
    			</tr>
    		</c:forEach>
    
    </table>
	<c:if test='${list.size()!=0}'>
		<script>
			resultCount();
		</script>
	</c:if>
	<c:if test='${list.size()==0}'>
		<script>
			resultZero();
		</script>
	</c:if>
	<!-- <button onclick='moveClose()'>이동하기</button> -->
</body>
</html>