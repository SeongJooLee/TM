<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
    
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
		location.href = "${contextPath}/register?name=user";
	}
	function sellerRegister() {
		location.href = "${contextPath}/register?name=seller";
	}
</script>
<style>
html, body {
   position: absolute;
   padding: 0;
   margin: 0;
   width: 100%;
   height: 100%;
}


.login-container {
   position: relative;
   min-height: 100vh;
   top: 10%;
}

.login_form {
   padding: 10%;
   left: 25%;
   background: #fff;
   box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
      rgba(0, 0, 0, 0.19);
   text-align: center;
}

.btnSubmit {
   font-weight: 600;
   width: 45%;
   color: white;
   background-color: #4a3a3a;
   border: none;
   border-radius: 1rem;
   padding: 2%;
   font-family: 'Nanum Gothic', sans-serif;
}

</style>
</head>
<body>

<jsp:include page="/resources/include/header.jsp" />

	<div class="container login-container">
      <div class="row">
         <div class="col-md-6 login_form">

            <div class="form-group">
               
	<button type='button' class="btnSubmit" onclick='userRegister()'>일반 사용자</button>
	<button type='button' class="btnSubmit" onclick='sellerRegister()'>업체 판매자</button>
            </div>
         </div>
      </div>
   </div>
<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>