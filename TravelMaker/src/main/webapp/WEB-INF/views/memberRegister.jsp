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
<<<<<<< HEAD
	}
	function fn_imgUpdate() {
		var sellerID = $( 'input#id' ).val();
			$.ajax({
				type : 'POST',
				url : 'duplicationCheckUser',
				dataType : "json",
				data : {
					
					'checkID' : sellerID
					
				},
				success : function(data) {
					if(data.result == null){
						alert('ID를 입력 후 체크해주세요');
						
					}else if(data.result == true){	
								
						alert('사용가능한 ID입니다');
						document.getElementById("zz0509").disabled = false;	
					}else{
						alert('중복된 ID입니다');
						document.getElementById("zz0509").disabled = true;
						}
					
				},
				error : function(err) {
					//서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
					alert('에러발생');
					return;
				}
			});
	}

	function fn_modify_update() {
		if (!confirm("가입 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			document.getElementById('frmNotice').method = "POST";
			document.getElementById('frmNotice').action = "/tm/member/userAdd";
			document.getElementById('frmNotice').submit();
		}
	}
=======
	}	
		
	function myFunction() {
		  var myWindow = window.open("", "passwordPopUp", "width=700, height=450, top=300, left=100");
		  myWindow.document.write("<p>비밀번호 도움말!</p>");
		}
	
/* 	function chkPW(){

		var pw = $("#password").val();
		var id = $("#id").val();
			
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		 
		if(false === reg.test(pw)) {
		alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
		}else if(/(\w)\1\1\1/.test(pw)){
		 alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
		 return false;
		 }else if(pw.search(id) > -1){
		 alert("비밀번호에 아이디가 포함되었습니다.");
		  return false;
		 }else if(pw.search(/\s/) != -1){
		 alert("비밀번호는 공백 없이 입력해주세요.");
		 return false;
		 }else if(hangulcheck.test(pw)){
		 alert("비밀번호에 한글을 사용 할 수 없습니다."); 
		 }else {
		 console.log("통과");
		 }
	} */
	
>>>>>>> branch 'main' of https://github.com/SeongJooLee/TM.git
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">일반 유저 회원가입</h4>
				<form id='frmNotice' class="validation-form" action='userAdd' method='post' novalidate>
				
					<div class="row">
						<div class="col-md-9 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" name="id" id="id" placeholder="" value="" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div><br>
						<div class='col-md-3 mb-3'>
							<label for="**"><small>* 중복체크를 눌러주세요</small></label>
							<button type='button' id='hh0564' class="form-control" onclick='fn_imgUpdate();'>중복체크</button>
						</div>

						<div class="mb-3">
							<label for="password">비밀번호</label> <input type="password">
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
				<button class="btn btn-primary btn-lg btn-block" type="button"
				value='회원가입' id='zz0509' disabled onclick='fn_modify_update()'>가입완료</button>
			<button class="btn btn-primary btn-lg btn-block" type="button"
				onclick='check();'>취소</button>
				
				</form>
				
			</div>
		</div>
	</div>
	

<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>