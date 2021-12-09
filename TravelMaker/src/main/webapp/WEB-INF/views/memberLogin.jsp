<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function doOpenCheck(chk) {
		var obj = document.getElementsByName("userGrade");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	
	function register() {
		location.href = "register";

	}

	function find() {
		alert('내년에 개발예정');

	}
</script>
</head>
<body>
	<form action='/member/mypage' method='post'>
		<input type ='checkbox'  name='userGrade' value='user'onclick='doOpenCheck(this)'>
		<input type="radio" name='userGrade' value='user'> <input
			type="radio" name='sellerGrade' value='seller'> <input
			type="radio" name='adminGrade' value='admin'> <input
			type='text' name='id' value='ID'><br> <input
			type='password' name='pw' value='PW'><br> <input
			type='submit' value='로그인'>
	</form>


	<input type="checkbox">
	<button type='button' onclick='find()'>ID/PW찾기</button>

	<button type='button' onclick='register()'>회원가입</button>

</body>
</html>