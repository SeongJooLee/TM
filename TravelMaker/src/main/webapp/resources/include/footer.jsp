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
	
	font-size: 40px;

}

.btn_gotop {
	display:none;
	position:fixed;
	bottom:55px;
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


.footer_inner {
	padding:0; margin:0; 
}
.footer_inner:after {
	display:block;
	clear:both;
	content:''
}
.footer_inner .box_cs {
	position : relative;
	float: left;
	width: 33%;
	height: 210px;
	border-right: 1px solid #f5f5f5;
	padding: 10px 60px 10px 50px;
}
.footer_inner .box_cs .tit {
	font-size:11px;
	color:#444;
}
.footer_inner .box_cs .bignum {
	font-size: 36px;
	margin: 10px 0;
	font-family: "Roboto", sans-serif;
	letter-spacing: 0.05em;
	font-weight:bold;
}
.footer_inner .box_cs .ss_txt {
	font-size:11px;
	color:#666;
	margin-bottom:3px;
}
.footer_inner .box_cs .partner {
	margin: 15px 0 0 0;
}
.footer_inner .promo {
	position: relative;
	float: left;
	width: 33%;
	height: 210px;
	border-right: 1px solid #f5f5f5;
	padding: 10px 60px 10px 50px;
}
.footer_inner .promo .tit {
	font-size:11px;
	color:#444;
	margin-bottom:20px;
}

.footer_inner .promo .team {
	margin-bottom: 13px;
	font-size: 13px;
	color: black;
}

.footer_inner .box_quick {
	float: left;
	width: 145px;
	height: 260px;
	border-right: 1px solid #f5f5f5;
	padding: 0 70px 0 55px;
}
.footer_inner .box_quick .tit {
	font-size:11px;
	color:#444;
	margin-bottom:7px;
}
.footer_inner .box_quick .quick {
	margin-bottom:4px;
}
.footer_inner .box_quick .quick a img {margin-right:10px; height:28px;}
.footer_inner .box_about {
    position: relative;
	float: right;
	width: 33%;
    height: 210px;
    padding-left: 45px;
    padding: 10px 60px 10px 50px;
}
.footer_inner .box_about .tit {
	font-size:11px;
	color:#444;
	margin-bottom:20px;
}
.footer_inner .box_about .txt {
	color: #666;
	font-size: 13px;
	margin-bottom: 8px;
}
</style>
</head>
<body>
 <div class="footer_inner">
    <div class="box_cs">
      <div class="tit">고객센터</div>
      <div class="bignum">1234-1234</div>
      <div class="ss_txt">MON-FRI : AM 10:00 ~ PM 05:00</div>
      <div class="ss_txt">LUNCH: PM 01:00 ~ PM 02:00</div>
          <div class="sns_test">
           <a class="sns-link" href="https://www.instagram.com/"><i class="fab fa-instagram" ></i></a>
           <a class="sns-link" href="https://www.facebook.com/"><i class="fab fa-facebook" ></i></a>
           <a class="sns-link" href="https://www.twitter.com/"><i class="fab fa-twitter" ></i></a>
          </div>
    
    </div>
    <div class="promo">
      <div class="tit">홍보 문의</div>
      <div class="team"> · 대표 : 김나연 acourve@naver.com</div>
      <div class="team"> · 개발팀 : 이성주 tjdwn0948@naver.com </div>
      <div class="team"> · 품질관리팀 : 김민수 kms970408@naver.com</div>
      <div class="team"> · 기획팀 : 김강민 kkm8057@naver.com </div>
    </div>
    <div class="box_about">
      <div class="tit">회사 정보</div>
      <div class="txt">Travel Maker</div>
      <div class="txt">사업자 등록 번호 : 123-45-6789</div>
      <div class="txt">E-mail : kkm8057@naver.com</div>
      <div class="txt">주소 : 경기도 고양시 덕양구 행신2동</div>
      <div class="txt">책임자 : 김나연, 이성주, 김민수, 김강민 <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=&apv_perm_no=2011386021230200126" target="_blank"> [사업자정보확인]</a></div>
    </div>
  </div>
            <a href="#" class="btn_gotop">
        <span class="glyphicon glyphicon-chevron-up">
        <img src="https://www.iconpacks.net/icons/2/free-curved-arrow-icon-2259-thumb.png" style="width:20px">
       </span>
      </a>
  
</body>
</html>