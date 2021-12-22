<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마여행 글쓰기</title>
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
	<hr>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3" align="center">이용후기 작성</h4>
				<form id="frm" action="/tm/member/mypage/review" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="id" value="${userSession.id}"> <input
						type="hidden" name="name" value="이용후기"> <input
						type='hidden' name='promotionNO' value='${promotionNO}'>

					<div class="row">

						<div class="col-md-2 mb-3">
							<label class="form-control">글 제목</label>
						</div>
						<div class="col-md-10 mb-3">
							<input type="text" class="form-control" name="title" id="title"
								placeholder="글 제목을 입력해주세요.">
						</div>

					</div>
					<div class="mb-3">
						<label for="image">이미지 파일 첨부</label> <input type="button"
							class="btn btn-info btn-lg btn-block" onClick="fn_addFile()"
							placeholder="" value="파일 추가"><small>*최대 3개까지 첨부
							가능합니다.</small>
						<div id="d_file"></div>
					</div>
					<div class="mb-3">
						<label for="content">글 내용</label>
						<textarea class="form-control" name="content" id="content"
							placeholder="내용을 입력해주세요." maxlength="4000"></textarea>
					</div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="button"
								onClick="fn_create()">작성 하기</button>
						</div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="reset">다시
								작성</button>
						</div>
						<div class="col-md-4 mb-3">
							<button class="btn btn-primary btn-lg btn-block" type="button"
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
	<hr>


	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>