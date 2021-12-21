<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 회원가입</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
       <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />
        
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


function fn_imgUpdate(obj) {
	var sellerID = $( 'input#id' ).val();
		$.ajax({
			type : 'POST',
			url : 'duplicationCheck',
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

	function check(){
		var result = confirm("취소할거니..?");
		if(result){
			location.href = "../";
		}else{
		    return;
		}
	}
/* 	$("#zz0509").onclick(function(){
		alert("준비완료");
	}); */

	function dldl(){
		alert('실행');
		
		}

/* 	function fn_imgUpdateBtn(obj) {
		var num = $( 'input#id' ).val();
		document.getElementById("zz0509").disabled = false;	
			alert("확인(예)을 누르셨습니다.");
			$.ajax({
				type : 'POST',
				url : 'duplicationCheck',
				dataType : "json",
				data : {
					'key1' :'11'
					'key2' : '222'
				},
				success : function(data) {
					alert('성공?');
				},
				error : function(err) {
					//서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
					alert('에러');
					return;
				}
			});
	}	 */
		
	
</script>
</head>
<body>

<jsp:include page="/resources/include/header.jsp" />


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">판매자 회원가입</h4>
				<form class="validation-form" action='sellerAdd' method='post' novalidate>
				
					<div class="row">
						<div class="col-md-9 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" name="sellerID" id="id" placeholder="" value="" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div><br>
						<div class="col-md-3 mb-3">
							<label for="**"><small>* 중복체크를 눌러주세요.</small> </label>
							<button id='hh0564' type='button' class="form-control" onclick='fn_imgUpdate();'>중복체크</button>
						</div>
					</div>
					<div class="mb-3">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" name="pw" id="pw" placeholder="" value=""
								required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="name">회사명</label> <input type="text"
							class="form-control" name="name" id="name" placeholder="" required>
						<div class="invalid-feedback">회사명을 입력해주세요.</div>
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
					
				<button id='zz0509' class="btn btn-primary btn-lg btn-block" type="submit"
				value='회원가입' disabled >가입 완료</button>
			<button  class="btn btn-primary btn-lg btn-block" type="button"
				onclick='check();'>취소</button>
				</form>
				
				
				
			<!-- 	<button id='zz0509' onclick='dldl()' disabled >테스트버튼 </button> -->
			</div>
		</div>
	</div>

<jsp:include page="/resources/include/footer.jsp" />
</body>

</html>