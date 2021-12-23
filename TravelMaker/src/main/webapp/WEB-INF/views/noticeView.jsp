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
.imagetest {
	width: 100%;
	height: 500px;
	object-fit: contain;
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
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

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
		document.getElementById("imgUpdate").disabled = false;
		if (!confirm("사진을 삭제 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return false;
		} else {

			alert("확인(예)을 누르셨습니다.");

			$.ajax({
						type : 'POST',
						url : 'noticeImgDelete',
						dataType : "json",
						data : {
							'noticeNO' : '${notice.noticeNO}',
							'name' : '${notice.name}'
						},
						success : function(data) {
							if (data.result == 'false') {
								alert('삭제 실패');
							} else {
								alert('파일을 삭제했습니다.');
								$("#d_filetest").remove();
								location.href = "${contextPath}/board/notice/view?noticeNO=${notice.noticeNO }";
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
			document.getElementById('frmNotice').method = "POST";
			document.getElementById('frmNotice').action = "${contextPath}/board/notice/update";
			document.getElementById('frmNotice').submit();
		}
	}

	function fn_reser() {
		if (!confirm("예약 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			document.getElementById('frmNotice').method = "GET";
			document.getElementById('frmNotice').action = "${contextPath}/board/notice";
			document.getElementById('frmNotice').submit();
		}
	}

	function fn_delete() {
		if (!confirm("삭제 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			location.href = "${contextPath}/board/notice/delete?noticeNO=${notice.noticeNO}";
		}
	}

	function backToList(obj) {
		obj.method = "POST";
		obj.action = "${contextPath}/board/notice";
		obj.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">공지사항 보기</h4>
				<form id="frmNotice" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-2 mb-3">
							<label for="noticeNO">번호</label> <input type="text"
								class="form-control" value="${notice.noticeNO }" id="noticeNO"
								name="noticeNO" readonly />
						</div>
						<div class="col-md-10 mb-3">
							<label for="title">제목</label> <input type="text"
								class="form-control" value="${notice.title }" id="title"
								name="title" disabled />
						</div>
					</div>

					<div class="row">
						<div class="col-md-5 mb-3">
							<label for="image">이미지 파일 첨부</label>
							<div id="update">
								<input type="button" value="파일 삭제" id="imgUpdateBtn"
									class="btn btn-danger btn-lg btn-block"
									onClick="fn_imgUpdateBtn()" disabled /> <small>
									&nbsp;&nbsp; * 클릭시 전체 파일이 삭제됩니다.</small>
							</div>
							<input type="button" value="파일 추가" id="imgUpdate"
								class="btn btn-info btn-lg btn-block" onClick="fn_addFile()"
								disabled /> <small> &nbsp;&nbsp; * 최대 3개까지 첨부 가능합니다.</small>
						</div>
						<div id="d_file"></div>
						<div id="d_filetest">
							<div id="demo" class="carousel slide" data-bs-ride="carousel">
								<div class="row">
									<div class="col-md-2 mb-5"></div>

									<div class="col-md-8 mb-5" data-bs-ride="carousel">
										<div class="carousel-inner">
											<c:if
												test="${not empty image.image1 && image.image1 !='null' }">
												<div class="carousel-item active ">
													<input type="hidden" id="originalFileName" name="image1"
														value="${image.image1 }" /> <img class="imagetest"
														src="${contextPath }/board/notice/download?image=${image.image1}&noticeNO=${notice.noticeNO}&name=${notice.name}" />
												</div>
											</c:if>

											<c:if
												test="${not empty image.image2 && image.image2 !='null' }">
												<div class="carousel-item">
													<input type="hidden" id="originalFileName" name="image2"
														value="${image.image2 }" /> <img class="imagetest"
														src="${contextPath }/board/notice/download?image=${image.image2}&noticeNO=${notice.noticeNO}&name=${notice.name}" />
												</div>
											</c:if>
											<c:if
												test="${not empty image.image3 && image.image3 !='null' }">
												<div class="carousel-item">
													<input type="hidden" id="originalFileName" name="image3"
														value="${image.image3 }" /> <img class="imagetest"
														src="${contextPath }/board/notice/download?image=${image.image3}&noticeNO=${notice.noticeNO}&name=${notice.name} " />
												</div>
											</c:if>
										</div>

										<!-- / 슬라이드 쇼 끝 -->
										<!-- 왼쪽 오른쪽 화살표 버튼 -->
										<a class="carousel-control-prev" href="#demo"
											data-slide="prev"> <span
											class="carousel-control-prev-icon" aria-hidden="true"></span>
											<!-- <span>Previous</span> -->
										</a> <a class="carousel-control-next" href="#demo"
											data-slide="next"> <span
											class="carousel-control-next-icon" aria-hidden="true"></span>
											<!-- <span>Next</span> -->
										</a>
										<!-- / 화살표 버튼 끝 -->
										<!-- 인디케이터 -->
										<ul class="carousel-indicators">
											<li data-target="#demo" data-slide-to="0" class="active"></li>
											<!--0번부터시작-->
											<li data-target="#demo" data-slide-to="1"></li>
											<li data-target="#demo" data-slide-to="2"></li>
										</ul>

									</div>
									<div class="col-md-2 mb-5"></div>
								</div>


							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="content">글 내용</label>
						<textarea class="form-control" rows="20" cols="60" name="content"
							id="content" disabled>${notice.content } </textarea>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label for="name">카테고리</label> <input class="form-control"
								type="text" value="${notice.name }" readonly> <input
								type="hidden" value="${notice.name }" name="name" />
						</div>
						<div class="col-md-4 mb-3">
							<label for="adminID">작성자</label> <input type="text"
								class="form-control" name="adminID" id="adminID"
								value="${notice.adminID }" readonly>
						</div>
						<div class="col-md-6 mb-3">
							<label for="title">작성날짜</label> <input type="text"
								class="form-control" name="writeDate" id="writeDate"
								value="${notice.writeDate }" readonly>
						</div>
					</div>
					<hr>
					<div id="tr_btn_modify" style="display: none">
						<div class="row">
							<div class="col-md-1 mb-3"></div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-info btn-lg btn-block" type="button"
									value="수정 반영하기" onClick="fn_modify_update(frmNotice)" />
							</div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-info btn-lg btn-block" type="button"
									value="취소하기" onClick="backToList(frmNotice)" />
							</div>
							<div class="col-md-1 mb-3"></div>
						</div>
					</div>
					<div id="tr_btn">
						<div class="row">
							<c:if test='${userSession.grade.equals("admin")}'>
								<div class="col-md-4 mb-3">
									<input class="btn btn-primary btn-lg btn-block" type="button"
										value="수정하기" onClick="fn_enable(this.form)" />
								</div>
								<div class="col-md-4 mb-3">
									<input class="btn btn-danger btn-lg btn-block" type="button"
										value="삭제하기" onClick="fn_delete(this.form)" />
								</div>
								<div class="col-md-4 mb-3">
									<input class="btn btn-primary btn-lg btn-block" type="button"
										value="리스트로 돌아가기" onClick="backToList(this.form)" />
								</div>
							</c:if>
						</div>
					</div>
					<div class="row">
						<c:if test='${userSession.grade.equals("user")}'>
							<div class="col-md-4 mb-3"></div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block" type="button"
									value="리스트로 돌아가기" onClick="backToList(this.form)" />
							</div>

						</c:if>

						<c:if test='${userSession.grade.equals("seller")}'>
							<div class="col-md-4 mb-3"></div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block" type="button"
									value="리스트로 돌아가기" onClick="backToList(this.form)" />
							</div>

						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<hr>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>