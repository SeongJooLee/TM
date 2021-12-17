<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택</title>
       <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />
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

<jsp:include page="/resources/include/header.jsp" />

	<h1>회원가입 구분을 선택해라~~~~!!!!!!!</h1>
	<button type='button' onclick='userRegister()'>일반 사용자</button>
	<button type='button' onclick='sellerRegister()'>업체 판매자</button>
	
<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>