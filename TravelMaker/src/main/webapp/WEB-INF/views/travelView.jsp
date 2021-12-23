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
						type : 'POST',
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
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">테마여행 게시글 보기</h4>
				<form id="frmTravel" enctype="multipart/form-data">
					<input type="hidden" value="${travel.name }" name="name" />
					<div class="row">
						<div class="col-md-2 mb-3">
							<label for="travelNO">번호</label> <input type="text"
								class="form-control" value="${travel.travelNO }"
								id="travelNO" name="travelNO" readonly />
						</div>
						<div class="col-md-10 mb-3">
							<label for="title">제목</label> <input type="text"
								class="form-control" value="${travel.title }" id="title"
								name="title" disabled />
						</div>
					</div>

					<div class="row">
						<div class="col-md-5 mb-3">
							<label for="image">이미지 파일 첨부</label>
							<div id="update">
								<input type="button" value="파일 삭제" id="imgUpdateBtn"
									class="btn btn-danger btn-lg btn-block" onClick="fn_imgUpdateBtn()" disabled /> <small>
									&nbsp;&nbsp; * 클릭시 전체 파일이 삭제됩니다.</small>
							</div>
							<input type="button" value="파일 추가" id="imgUpdate"
								class="btn btn-info btn-lg btn-block" onClick="fn_addFile()" disabled /> <small>
								&nbsp;&nbsp; * 최대 3개까지 첨부 가능합니다.</small>
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
														value="${image.image1 }" />
													<img class="imagetest"
														src="${contextPath }/board/travel/download?image=${image.image1}&travelNO=${travel.travelNO}&name=${travel.name}" />
											</div>
												</c:if>

												<c:if
													test="${not empty image.image2 && image.image2 !='null' }">
											<div class="carousel-item">
													<input type="hidden" id="originalFileName" name="image2"
														value="${image.image2 }" />
													<img class="imagetest"
														src="${contextPath }/board/travel/download?image=${image.image2}&travelNO=${travel.travelNO}&name=${travel.name}" />
											</div>
												</c:if>
												<c:if
													test="${not empty image.image3 && image.image3 !='null' }">
											<div class="carousel-item">
													<input type="hidden" id="originalFileName" name="image3"
														value="${image.image3 }" />
													<img class="imagetest"
														src="${contextPath }/board/travel/download?image=${image.image3}&travelNO=${travel.travelNO}&name=${travel.name}" />
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
							id="content" disabled>${travel.content } </textarea>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label for="categoryName">카테고리</label> <select
								class="form-control" name="categoryName" id="categoryName"
								disabled>
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
						<div class="col-md-4 mb-3">
							<label for="id">작성자</label> <input type="text"
								class="form-control" name="id" id="id"
								value="${travel.id }" readonly>
						</div>
						<div class="col-md-6 mb-3">
							<label for="title">작성날짜</label> <input type="text"
								class="form-control" name="writeDate" id="writeDate"
								value="${travel.writeDate }" readonly>
						</div>
					</div>
					<hr>
					<div id="tr_btn_modify" style="display: none">
						<div class="row">
							<div class="col-md-1 mb-3"></div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-info btn-lg btn-block" type="button" value="수정 반영하기"
									onClick="fn_modify_update(frmTravel)" />
							</div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-info btn-lg btn-block" type="button" value="취소하기"
									onClick="backToList(frmTravel)" />
							</div>
							<div class="col-md-1 mb-3"></div>
						</div>
					</div>
					<div id="tr_btn">
						<div class="row">
							<c:if test='${userSession.grade.equals("user")}'>
								<c:forEach var='list' items='${list}'>
									<c:if
										test='${list.travelNO == travel.travelNO && list.id.equals(travel.id)}'>
										<div class="col-md-4 mb-3">
											<input class="btn btn-primary btn-lg btn-block" type="button" value="수정하기"
												onClick="fn_enable(this.form)" />
										</div>
										<div class="col-md-4 mb-3">
											<input class="btn btn-danger btn-lg btn-block" type="button" value="삭제하기"
												onClick="fn_delete(this.form)" />
										</div>
										<div class="col-md-4 mb-3">
											<input class="btn btn-primary btn-lg btn-block" type="button" value="리스트로 돌아가기"
												onClick="backToList(this.form)" />
										</div>
										<c:set var="check" value="1" />
									</c:if>
								</c:forEach>
								<c:if test='${check!=1}'>
									<div class="col-md-4 mb-3"></div>
									<div class="col-md-4 mb-3"></div>
									<div class="col-md-4 mb-3">
										<input class="btn btn-primary btn-lg btn-block" type="button" value="리스트로 돌아가기"
											onClick="backToList(this.form)" />
									</div>
								</c:if>
							</c:if>
						</div>
					</div>
					<div class="row">

						<c:if test='${userSession.grade.equals("admin")}'>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block" type="button" value="수정하기"
									onClick="fn_enable(this.form)" />
							</div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-danger btn-lg btn-block" type="button" value="삭제하기"
									onClick="fn_delete(this.form)" />
							</div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block" type="button" value="리스트로 돌아가기"
									onClick="backToList(this.form)" />
							</div>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--  해당 글 댓글 보이기 -->
	<div class="container">
	
	<c:if test="${comment != null }">
	
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">


				<c:forEach var="comment" items="${comment}">
					<div class="row">
						<div class="col-md-2 mb-3">
							<label for="id">작성자ID</label> <input type="text"
								class="form-control" value="${comment.id }" id="id" name="id"
								readonly />
						</div>
						<div class="col-md-8 mb-3">
							<label for="content">댓글 내용</label> <input type="text"
								class="form-control" value="${comment.content }" id="content"
								name="content" readonly />
						</div>
						<div class="col-md-2 mb-3">
							<label for="writeDate">작성 날짜</label> <input type="text"
								class="form-control" value="${comment.writeDate}" id="writeDate"
								name="writeDate" readonly />
						</div>

					</div>
				</c:forEach>

				<c:if test='${userSession.grade.equals("user")}'>
					<form action="/tm/board/travel/add" method="post">
						<div class="row">
							<div class="col-md-12 mb-3">
								<label for="comment">댓글 쓰기 :</label> <input type="text"
									class="form-control" name="content">
								<hr>
							</div>
							<input type="hidden" name="id" value="${userSession.id }">
							<input type="hidden" name="commentTravelNO"
								value="${travel.travelNO }">
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block" type="submit"
									value="댓글쓰기">
							</div>
						</div>
					</form>
				</c:if>
			</div>
		</div>
		</c:if>
		
	</div>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

	<jsp:include page="/resources/include/footer.jsp" />

</body>
</html>