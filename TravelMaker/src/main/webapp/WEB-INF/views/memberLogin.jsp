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
	
	function register() {
		location.href = "registerCheck";
	}

	function find() {
		alert('내년에 개발예정');
	}
</script>
</head>
<body>

	<form action='login' method='post'>
		<h1>로그인 구분 방식을 선택해주세용^^</h1>
		구매자 : <input type="radio" name='grade' value='user' required> 
		판매자 : <input type="radio" name='grade' value='seller' required> 
		관리자 : <input type="radio" name='grade' value='admin' required><br>
		아이디 : <input type='text' name='id' required><br> 
		비밀번호 : <input type='password' name='pw' required><br> 
		<input type='submit' value='로그인'>
	</form>
	
	<button type='button' onclick='find()'>ID/PW찾기</button>
	<button type='button' onclick='register()'>회원가입</button>
	
</body>
</html>