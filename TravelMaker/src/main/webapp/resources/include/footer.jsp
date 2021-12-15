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
	padding:10px 10px;
	border-radius:100%;
}


.corp_item a {display:block; width:150px; height:40px; background:lightgray; color:black; border: 1px lightblue; font-size:14px; 

 text-align:center; padding-top:10px; text-decoration:none;}

.corp_item a span {display:block;}


.corp_item a:hover {background:white; text-decoration:none;}



li {
float: left;
matgin-right: 20px;
}

ul {
list-style:none;
}


</style>
</head>
<body>
		<div class="sns_test">
        	<a class="sns-link" href="https://www.instagram.com/"><i class="fab fa-instagram" ></i></a>
        	<a class="sns-link" href="https://www.facebook.com/"><i class="fab fa-facebook" ></i></a>
        	<a class="sns-link" href="https://www.twitter.com/"><i class="fab fa-twitter" ></i></a>
   	    </div>
   	    <div class="caution_text" style = "background-color: lightgray;">
   	    <div class="corp_area" data-clk-prefix="plc"> 
   	    	<ul class="list_corp"> 
   	    		<li class="corp_item"><a href="https://www.navercorp.com">회사소개</a></li> 
   	    		<li class="corp_item"><a href="https://recruit.navercorp.com/naver/recruitMain" >광고문의</a></li> 
   	    		<li class="corp_item"><a href="https://www.navercorp.com/naver/proposalGuide" >이용약관</a></li>
   	    		<li class="corp_item"><a href="/policy/service.html" >개인정보처리방침</a></li>
   	        </ul>
   	    </div>
   	    </div>
   	    <a href="#" class="btn_gotop">
  		<span class="glyphicon glyphicon-chevron-up">
  		<img src="https://www.iconpacks.net/icons/2/free-curved-arrow-icon-2259-thumb.png" style="width:20px">
 		</span>
		</a>
	
</body>
</html>