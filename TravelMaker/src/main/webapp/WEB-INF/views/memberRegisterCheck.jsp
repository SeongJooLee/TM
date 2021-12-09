<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>


	function userRegister() {
		location.href = "register?name=user";
	}
	function sellerRegister() {
		location.href = "register?name=seller";
	}
</script>
</head>
<body>
	<h1>회원가입 구분을 선택해라~~~~!!!!!!!</h1>
	<button type='button' onclick='userRegister()'>일반 사용자</button>
	<button type='button' onclick='sellerRegister()'>업체 판매자</button>
</body>
</html>