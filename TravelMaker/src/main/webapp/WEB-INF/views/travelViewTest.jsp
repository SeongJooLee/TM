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
<title>테마 여행 뷰</title>
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
	function fn_enable(obj) {
		document.getElementById("categoryName").disabled = false;
		document.getElementById("title").disabled = false;
		document.getElementById("content").disabled = false;
		if (document.getElementById("originalFileName") != null) {
			document.getElementById("imgUpdateBtn").disabled = false;
		}
		if (document.getElementById("originalFileName") == null) {
			document.getElementById("imgUpdate").disabled = false;
		}
		document.getElementById("tr_btn_modify").style.display = 'block';
		document.getElementById("tr_btn").style.display = 'none';
	}

	function fn_imgUpdateBtn(obj) {
		document.getElementById("imgUpdate").disabled = false; // 여기 수정
		if (!confirm("사진을 삭제 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			$
					.ajax({
						type : 'GET',
						url : 'travelImgDelete',
						dataType : "json",
						data : {
							'travelNO' : '${travel.travelNO}'
						},
						success : function(data) {
							if (data.result == 'false') {
								alert('삭제 실패');
							} else {
								alert('파일을 삭제했습니다.');
								$("#d_filetest").remove();
								location.href = "${contextPath}/board/travel/view?travelNO=${travel.travelNO }";
							}
						},
						error : function(err) {
							//서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
							alert('에러떳는데 난 몰랑');
							return;
						}
					});
			document.getElementById("update").style.display = 'none';
		}
	}

	function fn_image(obj) {
		document.getElementById("image").disabled = false;
	}

	function fn_modify_update() {
		if (!confirm("수정 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			document.getElementById('frmTravel').method = "POST";
			document.getElementById('frmTravel').action = "${contextPath}/board/travel/update";
			document.getElementById('frmTravel').submit();
		}
	}

	function fn_delete() {
		if (!confirm("삭제 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			location.href = "${contextPath}/board/travel/delete?travelNO=${travel.travelNO}";
		}

	}

	function backToList(obj) {
		obj.method = "POST";
		obj.action = "${contextPath}/board/travel";
		obj.submit();
	}

	function next() {
		location.href = "${contextPath}/board/travel/view?travelNO=${travel.travelNO}&page=page";
	}

	// 댓글 작성
	function commentSubmit() {
		var commentTest = document.getElementById("commentContent").value;
		$.ajax({
			type : 'GET',
			url : 'commentTravelAdd',
			dataType : "json",
			data : {
				'travelNO' : '${travel.travelNO}',
				'id' : '${userSession.name}',
				'content' : '${commentTest}',
			},
			success : function(data) {
				if (data.result == 'false') {
					alert('댓글 생성 실패');
				} else {
					alert('댓글을 생성했습니다.');

				}
			},
			error : function(err) {
				//서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
				alert('에러떳는데 난 몰랑');
				return;
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>

	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">여행 게시글 보기</h4>
					<form id="frmTravel" enctype="multipart/form-data">
						<label for="name">글 번호</label>
						<input type="text" value="${travel.travelNO }"
						id="travelNO" name="travelNO" readonly />
						<input type="text" value="${travel.title }" id="title"
						name="title" disabled />
						<input type="hidden" value="${travel.name }" name="name" />
						<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">카테고리</label> 
								<select class="form-control" id ="categoryName" name="categoryName">
									<option value="${category.categoryName }">${category.categoryName }</option>
									<option value="쇼핑">쇼핑</option>
									<option value="음식">음식</option>
									<option value="문화">문화</option>
									<option value="체험">체험</option>
									<option value="전시">전시</option>
									<option value="교통">교통</option>
									<option value="지역">지역</option>
								</select>
						</div>
						</div>
						<div class="col-md-6 mb-3">
						<label for="name">작성자 id</label> 
						<input type="text" value="${travel.id }" name="id"
						readonly />
						</div>
					</form>
			</div>
		</div>
	</div>


	<br><br>
	<br><br>
	<br><br>
	<hr>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

	<jsp:include page="/resources/include/footer.jsp" />
	>
</body>
</html>