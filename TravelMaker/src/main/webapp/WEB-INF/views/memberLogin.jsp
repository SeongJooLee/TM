<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action='/member/login' method='post'>
		<input type='text' name='id' value='ID' ><br>
		<input type='password' name='pw' value='PW'><br>  <input type='submit' value='로그인'>
	</form>
	
	<form action='/member/find'>
		<input type='submit' value='ID/PW 찾기'>
	</form>
	
	<form action='/member/register'>
		<input type='submit' value='회원가입'>
	</form>
	
</body>
</html>