<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
   rel="stylesheet" />
<script>
   
   function register() {
      location.href = "registerCheck";
   }

   function find() {
      alert('내년에 개발예정'); 
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

.login_form h3 {
   text-align: center;
   margin-bottom: 5%;
   color: #363636;
   font-family: 'Nanum Gothic', sans-serif;
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
.font1 {
font-family: 'Nanum Gothic', sans-serif;
font-weight: bold;
}

</style>
</head>
<body> 

   <jsp:include page="/resources/include/header.jsp" />

   <div class="container login-container">
      <div class="row">
         <div class="col-md-6 login_form font1">
         <form action='login' method='post'>
            <h3><img class="logo_img" src="<c:url value="/resources/img/log.png" />" /></h3>
            구매자 : <input type="radio" name='grade' value='user' required>
            판매자 : <input type="radio" name='grade' value='seller' required>
            관리자 : <input type="radio" name='grade' value='admin' required>
            
               <div class="form-group">
                  <input name="id" type="text"><br>
               </div>
               <div class="form-group">
                  <input name="pw" type="password"><br>
               </div>
               <div class="login_one">

                  <div class="form-group">
                     <input type="submit" class="btnSubmit" value="로그인">
                  </div>
               </div>
            </form>
            <div class="form-group">
               <button type='button' class="btnSubmit" onclick='find()'>ID/PW찾기</button>

            </div>
            <div class="form-group">
               <button type='button' class="btnSubmit" onclick='register()'>회원가입</button>
            </div>
         </div>
      </div>
   </div>
   <jsp:include page="/resources/include/footer.jsp" />
</body>
</html>