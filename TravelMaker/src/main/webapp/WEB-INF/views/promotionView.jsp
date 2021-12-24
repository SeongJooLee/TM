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
  font-size: 38px;
  font-weight: bold;
  color:#4a1b1b;
 
}

.font2 {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 20px;
  font-weight: bold;
  color:#5e0c0c;
}

.font3 {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 16px;
  font-weight: bold;
  color:#5e0c0c;
}

.value {
  font-family: 'Cafe24SsurroundAir' !important;
  font-size: 20px;
  font-weight: bold;
  color: #754343;
}
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
		document.getElementById("price").disabled = false;
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
		if(${userSession.grade.equals("seller")}){
		document.getElementById("tr_btn1").style.display = 'none';
		}
		if(${userSession.grade.equals("admin")}){
		document.getElementById("tr_btn2").style.display = 'none';
		}
	}
	function fn_imgUpdateBtn(obj) {
		document.getElementById("imgUpdate").disabled = false;
		if (!confirm("사진을 삭제 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return false;
		} else {

			alert("확인(예)을 누르셨습니다.");

			$
					.ajax({
						type : 'POST',
						url : 'promotionImgDelete',
						dataType : "json",
						data : {
							'promotionNO' : '${promotion.promotionNO}',
						},
						success : function(data) {
							if (data.result == 'false') {
								alert('삭제 실패');
							} else {
								alert('파일을 삭제했습니다.');
								$("#d_filetest").remove();
								location.href = "${contextPath}/board/promotion/view?promotionNO=${promotion.promotionNO }";
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
			document.getElementById('frmPromotion').method = "POST";
			document.getElementById('frmPromotion').action = "${contextPath}/board/promotion/update";
			document.getElementById('frmPromotion').submit();
		}
	}

	function fn_reser() {
		if (!confirm("예약 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			document.getElementById('frmPromotion').method = "GET";
			document.getElementById('frmPromotion').action = "${contextPath}/board/reservation";
			document.getElementById('frmPromotion').submit();
		}
	}

	function fn_delete() {
		if (!confirm("삭제 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			location.href = "${contextPath}/board/promotion/delete?promotionNO=${promotion.promotionNO}";
		}
	}

	function backToList(obj) {
		obj.method = "POST";
		obj.action = "${contextPath}/board/promotion";
		obj.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3 font1" align="center">홍보상품</h4>
				<form id="frmPromotion" enctype="multipart/form-data">
					<input type="hidden" value="${promotion.name }" name="name" />
					<div class="row">
						<div class="col-md-2 mb-3 font2">
							<label for="promotionNO">번호</label> <input type="text"
								class="form-control" value="${promotion.promotionNO }"
								id="promotionNO" name="promotionNO" readonly />
						</div>
						<div class="col-md-10 mb-3 font2">
							<label for="title">제목</label> <input type="text"
								class="form-control" value="${promotion.title }" id="title"
								name="title" disabled />
						</div>
					</div>

					<div class="row">
						<div class="col-md-5 mb-3 font2">
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
						<div class="col-md-1 mb-3"></div>
						<div class="col-md-3 mb-3 font2">
							<label for="price">가격</label> <input type="number"
								class="form-control" value="${promotion.price }" id="price"
								name="price" disabled />
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
														src="${contextPath }/board/promotion/download?image=${image.image1}&promotionNO=${promotion.promotionNO}&name=${promotion.name}" />
											</div>
												</c:if>

												<c:if
													test="${not empty image.image2 && image.image2 !='null' }">
											<div class="carousel-item">
													<input type="hidden" id="originalFileName" name="image2"
														value="${image.image2 }" />
													<img class="imagetest"
														src="${contextPath }/board/promotion/download?image=${image.image2}&promotionNO=${promotion.promotionNO}&name=${promotion.name}" />
											</div>
												</c:if>
												<c:if
													test="${not empty image.image3 && image.image3 !='null' }">
											<div class="carousel-item">
													<input type="hidden" id="originalFileName" name="image3"
														value="${image.image3 }" />
													<img class="imagetest"
														src="${contextPath }/board/promotion/download?image=${image.image3}&promotionNO=${promotion.promotionNO}&name=${promotion.name} " />
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
					<div class="mb-3 font2">
						<label for="content">글 내용</label>
						<textarea class="form-control" rows="20" cols="60" name="content"
							id="content" disabled>${promotion.content } </textarea>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3 font2">
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
						<div class="col-md-4 mb-3 font2">
							<label for="sellerID">작성자</label> <input type="text"
								class="form-control" name="sellerID" id="sellerID"
								value="${promotion.sellerID }" readonly>
						</div>
						<div class="col-md-6 mb-3 font2">
							<label for="title">작성날짜</label> <input type="text"
								class="form-control" name="writeDate" id="writeDate"
								value="${promotion.writeDate }" readonly>
						</div>
					</div>
					<hr>
					<div id="tr_btn_modify" style="display: none">
						<div class="row">
							<div class="col-md-2 mb-3"></div>
							<div class="col-md-4 mb-3 font2">
								<input class="btn btn-info btn-lg btn-block font2" type="button" value="수정 반영하기"
									onClick="fn_modify_update(frmPromotion)" />
							</div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-info btn-lg btn-block font2" type="button" value="취소하기"
									onClick="backToList(frmPromotion)" />
							</div>
							<div class="col-md-1 mb-3"></div>
						</div>
					</div>
					<div id="tr_btn1">
						<div class="row">
							<c:if test='${userSession.grade.equals("seller")}'>
								<c:forEach var='list' items='${proList}'>
									<c:if
										test='${list.promotionNO == promotion.promotionNO && list.sellerID.equals(promotion.sellerID)}'>
										<div class="col-md-4 mb-3">
											<input class="btn btn-primary btn-lg btn-block font2" type="button" value="수정하기"
												onClick="fn_enable(this.form)" />
										</div>
										<div class="col-md-4 mb-3">
											<input class="btn btn-danger btn-lg btn-block font2" type="button" value="삭제하기"
												onClick="fn_delete(this.form)" />
										</div>
										<div class="col-md-4 mb-3">
											<input class="btn btn-primary btn-lg btn-block font2" type="button" value="리스트로 돌아가기"
												onClick="backToList(this.form)" />
										</div>
										<c:set var="check" value="1" />
									</c:if>
								</c:forEach>
								<c:if test='${check!=1}'>
									<div class="col-md-4 mb-3"></div>
									<div class="col-md-4 mb-3"></div>
									<div class="col-md-4 mb-3">
										<input class="btn btn-primary btn-lg btn-block font2" type="button" value="리스트로 돌아가기"
											onClick="backToList(this.form)" />
									</div>
								</c:if>
							</c:if>
						</div>
					</div>
					<div id="tr_btn2">
					<div class="row">
						<c:if test='${userSession.grade.equals("user")}'>
							<div class="col-md-4 mb-3"></div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block font2" type="button" value="리스트로 돌아가기"
									onClick="backToList(this.form)" />
							</div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block font2" type="button" value="예약하기"
									onClick="fn_reser(this.form)" />
							</div>

						</c:if>
						<c:if test='${userSession.grade.equals("admin")}'>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block font2" type="button" value="수정하기"
									onClick="fn_enable(this.form)" />
							</div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-danger btn-lg btn-block font2" type="button" value="삭제하기"
									onClick="fn_delete(this.form)" />
							</div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block font2" type="button" value="리스트로 돌아가기"
									onClick="backToList(this.form)" />
							</div>
						</c:if>

					</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>