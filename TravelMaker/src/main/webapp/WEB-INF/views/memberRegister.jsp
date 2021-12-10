<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>일반유저 회원가입창이다~!!!!!!!!!!</h1>
<h2>생성될 정보를 입력해주세요</h2>
<form action='userAdd' method='post'><br>
	아이디 : <input type='text' name='id'><br>
	비밀번호 : <input type='password' name='pw'><br>
	이름 : <input type='text' name='name'><br>
	연락처 : <input type='text' name='phone'><br>
	주소 : <input type='text' name='address'><br>
	<input type='submit' value='제출'><br>
</form>
</body>
</html>