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
@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.font1 {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 36px;
  font-weight: bold;
  color:#4a1b1b;
 
}

.font2 {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 18px;
  font-weight: bold;
  color:#5e0c0c;
}

.font3 {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 14px;
  font-weight: bold;
  color:#5e0c0c;
}

.value {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 18px;
  font-weight: bold;
  color: #754343;
}

body {
	min-height: 100vh;
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

<script src='http://code.jquery.com/jquery-latest.min.js'></script>
<script type='text/javascript'>
	var cnt = 1;
	function fn_addFile() {
		if (cnt === 4) {
			alert("최대 3개만 생성할 수 있습니다.");
			return;
		}
		$("#d_file")
				.append(
						"<br>"
								+ "<p id='image"+cnt+" '><input type='file' name='image" + cnt + " ' />");
		cnt++;
	}

	function backToList(obj) {
		if (!confirm("메인화면으로 이동하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			obj.method = "POST";
			obj.action = "${contextPath}";
			obj.submit();
		}
	}

	function fn_create() {
		var title = document.getElementById("title").value;
		if (!title) {
			alert('제목을 적어주세요.');
			return false;
		}
		var content = document.getElementById("content").value;
		if (!content) {
			alert('내용을 적어주세요.');
			return false;
		}
		if (!confirm("글을 생성하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			document.getElementById("frm").submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3 font1">공지 글 쓰기</h4>
				<form id="frm" action="addDone" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="adminID" value="${userSession.adminID}">
					<div class="row">
						<div class="col-md-3 mb-3 font2">
							<label for="name">카테고리</label> <select class="form-control"
								id="name" name="name">
								<option value="공지사항">공지사항</option>
								<option value="이벤트">이벤트</option>
							</select>
						</div>
						<div class="col-md-9 mb-3 font2">
							<label for="title">글 제목</label> <input type="text"
								class="form-control" name="title" id="title"
								placeholder="제목 입력해주세요." required>
						</div>
					</div>
					<div class="mb-3 font2">
						<label for="image">이미지 파일 첨부</label> <input type="button"
							class="btn btn-info btn-lg btn-block font2" onClick="fn_addFile()"
							value="파일 추가"><small class="font3">*최대 3개까지 첨부 가능합니다.</small>
						<div id="d_file"></div>
					</div>
					<div class="mb-3 font2">
						<label for="content">글 내용</label>
						<textarea class="form-control" name="content" id="content"
							placeholder="내용 입력해주세요." maxlength="4000"></textarea>
					</div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block font2" type="button"
								onClick="fn_create()">작성 하기</button>
						</div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block font2" type="reset">다시
								작성</button>
						</div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block font2" type="button"
								onClick='backToList(this.form);'>취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>