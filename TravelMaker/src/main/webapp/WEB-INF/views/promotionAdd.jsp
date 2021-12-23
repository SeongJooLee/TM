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
<title>홍보상품 글쓰기</title>
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
		obj.method = "POST";
		obj.action = "${contextPath}/board/promotion";
		obj.submit();
	}

	function fn_create() {
		var category = document.getElementById("categoryName").value;
		if (category == 'null') {
			alert('카테고리를 선택해주세요.');
			return false;
		}
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
		var price = document.getElementById("price").value;
		if (!price || price < 0) {
			alert('가격을 적어주세요.');
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
				<h4 class="mb-3">홍보 글 쓰기</h4>
				<form id="frm" action="addDone" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="sellerID"
						value="${userSession.sellerID}"> <input type="hidden"
						name="name" value="홍보상품">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">카테고리</label> <select class="form-control"
								id="categoryName" name="categoryName">
								<option value="null">선택해주세요.</option>
								<option value="쇼핑">쇼핑</option>
								<option value="음식">음식</option>
								<option value="문화">문화</option>
								<option value="체험">체험</option>
								<option value="전시">전시</option>
								<option value="교통">교통</option>
								<option value="지역">지역</option>
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<label for="title">글 제목</label> <input type="text"
								class="form-control" name="title" id="title"
								placeholder="제목을 입력해주세요." required>
						</div>

						<div class="col-md-6 mb-3">
							<label for="title">가격</label> <input type="number"
								class="form-control" name="price" id="price"
								placeholder="가격을 입력해주세요." value="" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="content">글 내용</label>
						<textarea class="form-control" name="content" id="content"
							placeholder="내용 입력해주세요." maxlength="4000"></textarea>
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
								onclick='backToList(this.form);'>취소</button>
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