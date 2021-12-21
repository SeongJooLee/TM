<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 유저 회원가입</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>


<script>	
	function check(){
		var result = confirm("취소할거니..?");
		if(result){
			location.href = "../";
		}else{
		    return;
		}
	}	
		
	function myFunction() {
		  var myWindow = window.open("", "passwordPopUp", "width=700, height=450, top=300, left=100");
		  myWindow.document.write("<p>※비밀번호 도움말!<br><br>1. 8~18자의 영문 대문자, 영문 소문자, 숫자, 특수문자만 가능합니다.<br><br>2. 영문 대문자, 영문 소문자, 숫자 , 특수문자를 3가지 이상 혼용하십시오.<br><br>3. 학번, 전화번호 혹은 연속된 숫자 및 문자, 사전에 포함된 단어 등 타인이 쉽게 알아낼 수 있는 비밀번호 사용은 위험합니다.<br><br>4. 타 사이트와 동일한 비밀번호의 사용, 이전에 사용했던 비밀번호의 재사용은 안전하지 않을 수 있습니다.<br><br>5. 비밀번호는 비밀번호 안전도에 따라 3~6개월에 한번씩 주기적으로 바꾸어 사용하시는 것이 안전합니다.<br><br>6. 비밀번호는 길수록, 그리고 많이 혼용할수록 안전합니다.<br><br>7. 공백은 비밀번호로 사용할 수 없습니다.<br><br>8. 숫자만(또는 문자만)으로 이루어진 비밀번호는 사용할 수 없습니다.<br><br></p>");
		}
	
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">일반 유저 회원가입</h4>
				<form class="validation-form" action='userAdd' method='post' novalidate>
				
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" name="id" id="id" placeholder="" value="" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="password">비밀번호</label><button type="button" onclick = "myFunction() ">비밀번호 도움말</button> <input type="password"
								class="form-control" name="pw" id="pw" placeholder="" value=""
								required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" name="name" id="name" placeholder="" required>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="birth">생년월일</label> <input type="text"
							class="form-control" name="birth" id="birth" placeholder="ex)19960522"
							required>
						<div class="invalid-feedback">생년월일을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="phone">연락처</label> <input type="text"
							class="form-control" name="phone" id="phone" placeholder="" required>
						<div class="invalid-feedback">연락처를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" name="address" id="address" placeholder="" required>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>
				<button class="btn btn-primary btn-lg btn-block" type="submit"
				value='회원가입'>가입 완료</button>
			<button class="btn btn-primary btn-lg btn-block" type="button"
				onclick='check();'>취소</button>
				</form>
			</div>
		</div>
	</div>


<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>