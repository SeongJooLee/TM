<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	 src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
</script>
<style>
.sns_test {
	float: right;
	margin: 5px;
	font-size: 40px;
}

.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px;
	right:30px;
	z-index:999;
	border:1px solid #ccc;
	outline:none;
	background-color:white;
	color:#333;
	cursor:pointer;
	padding:15px 20px;
	border-radius:100%;
}

</style>
</head>
<body>
		<div class="sns_test">
        	<a class="sns-link" href="https://www.instagram.com/ggul_min/?hl=ko"><i class="fab fa-instagram" ></i></a>
        	<a class="sns-link" href="https://www.instagram.com/ggul_min/?hl=ko"><i class="fab fa-facebook" ></i></a>
        	<a class="sns-link" href="https://www.instagram.com/ggul_min/?hl=ko"><i class="fab fa-twitter" ></i></a>
   	    </div>
   	    <div class="caution_text" style = "background-color: gray;">
   	    <p align="center"> 주의사항 </p><br>
   	    <p align="center"> 주의사항 </p><br>
   	    </div>
   	    <a href="#" class="btn_gotop">
  		<span class="glyphicon glyphicon-chevron-up">
 		</span>
		</a>
</body>
</html>