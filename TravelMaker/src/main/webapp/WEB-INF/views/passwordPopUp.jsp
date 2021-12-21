<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 도움말</title>
<script>
<!--비밀번호 8자리 이상
숫자 포함
영대 문자 포함
영소 문자 포함
특수문자 포함 -->
/* function chkPW(){

	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

	var pw = $("#password").val();

	if(false === reg.test(pw)) {
	alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
	}else {
	console.log("통과");
	}
} */
</script>
</head>
<body>
	<h1>비밀번호 도움말</h1>
	
	<form action="/tm/board/passwordPopUp" method="post">		
	</form>
	<br><br><br>
	<table border="1">
	<div>
	※비밀번호 도움말 내용
	</div>
	
    
	</table>
<!-- <form>
<input type="text" id="id">
<input type="password" id="password">
<button onclick="chkPW()">signUp</button>
</form>	 -->
</body>
</html>