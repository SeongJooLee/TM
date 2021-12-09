<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function register(){
		location.href="register";

		}

	function find(){
		alert('내년에 개발예정');

		}
	
</script>
</head>
<body>
	<form action='/member/login' method='post'>
		<input type='text' name='id' value='ID' ><br>
		<input type='password' name='pw' value='PW'><br>  <input type='submit' value='로그인'>
	</form>
	
	<button type='button' onclick='find()'>ID/PW찾기</button>
	
	<button type='button' onclick='register()'>회원가입</button>
	
</body>
</html>