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
						url : 'reviewImgDelete',
						dataType : "json",
						data : {
							'reviewNO' : '${review.reviewNO}'
						},
						success : function(data) {
							if (data.result == 'false') {
								alert('삭제 실패');
							} else {
								alert('파일을 삭제했습니다.');
								$("#d_filetest").remove();
								location.href = "${contextPath}/board/review/view?reviewNO=${review.reviewNO }";
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
			document.getElementById('frmReview').method = "POST";
			document.getElementById('frmReview').action = "${contextPath}/board/review/update";
			document.getElementById('frmReview').submit();
		}
	}

	function fn_delete() {
		if (!confirm("삭제 하시겠습니까?")) {
			alert("취소(아니오)를 누르셨습니다.");
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			location.href = "${contextPath}/board/review/delete?reviewNO=${review.reviewNO}";
		}

	}
	
	function readURL(input){
		   if(input.files && input.files[0]){
		      var reader = new FileReader();
		      reader.onload=function(e){
		         $('#preview').attr('src',e.target.result);
		      }
		      reader.readAsDataURL(input.files[0]);
		   }
		}

	function backToList(obj) {
		obj.method = "POST";
		obj.action = "${contextPath}/board/review";
		obj.submit();
	}

</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>

	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">이용후기 보기</h4>
				<form id="frmReview" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="name">글 번호</label> <input type="text"
								class="form-control" id="reviewNO" name="reviewNO"
								placeholder="" value="${review.reviewNO }" readonly />
						</div>
						<div class="col-md-9 mb-3">
							<label for="name">글 제목</label> <input type="text"
								class="form-control" placeholder="" value="${review.title }"
								id="title" name="title" disabled /> <input type="hidden"
								class="form-control" placeholder="" value="${review.name }"
								id="name" name="name" />
						</div>
					</div>
					<div class="row">	
						<div class="col-md-3 mb-3">
							<label for="name">작성자</label> <input type="text"
								class="form-control" name="id" placeholder=""
								value="${review.id }" readonly />
						</div>

						<div class="col-md-6 mb-3">
							<label for="writeDate">작성 날짜</label> <input type="text"
								class="form-control" name="writeDate" placeholder=""
								value="${review.writeDate }" readonly />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="name">이미지 파일 첨부</label> <input type="button"
								class="btn btn-danger btn-lg btn-block" name=""
								id="imgUpdateBtn" placeholder="" value="파일 삭제"
								onClick="fn_imgUpdateBtn()" disabled /> <small>* 클릭 시
								전체 파일이 삭제됩니다.</small> <input type="button"
								class="btn btn-info btn-lg btn-block" name="" id="imgUpdate"
								placeholder="" value="파일 추가" onClick="fn_addFile()" disabled />
							<small>* 최대 3개까지 첨부 가능합니다.</small>
						</div>

						<div id="d_file"></div>
						<div id="d_filetest">
							<div class="row">
								<div class="col-md-4 mb-5">
									<c:if
										test="${not empty image.image1 && image.image1 !='null' }">
										<input type="hidden" id="originalFileName" name="image1"
											value="${image.image1 }" />
										<img
											src="${contextPath }/board/review/download?image=${image.image1}&reviewNO=${review.reviewNO}&name=${review.name}"
											width="100%" height="100%" />
									</c:if>
								</div>
								<div class="col-md-4 mb-5">
									<c:if
										test="${not empty image.image2 && image.image2 !='null' }">
										<input type="hidden" id="originalFileName" name="image2"
											value="${image.image2 }" />
										<img
											src="${contextPath }/board/review/download?image=${image.image2}&reviewNO=${review.reviewNO}&name=${review.name}">
									</c:if>
								</div>
								<div class="col-md-4 mb-5">
									<c:if
										test="${not empty image.image3 && image.image3 !='null' }">
										<input type="hidden" id="originalFileName" name="image3"
											value="${image.image3 }" />
										<img
											src="${contextPath }/board/review/download?image=${image.image3}&reviewNO=${review.reviewNO}&name=${review.name}">
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="content">글 내용</label>
						<textarea class="form-control" name="content" id="content"
							placeholder="" rows="20" cols="60" disabled>${review.content }</textarea>
					</div>

					<hr>
					<div id="tr_btn_modify" style="display: none">
						<div class="row">
							<div class="col-md-1 mb-3"></div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block" type="button"
									value="수정 반영하기" onClick="fn_modify_update(frmReview)" />
							</div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block" type="button"
									value="취소하기" onClick="backToList(frmReview)" />
							</div>
							<div class="col-md-1 mb-3"></div>
						</div>
					</div>
					<div id="tr_btn">
						<div class="row">
							<c:if test='${userSession.grade.equals("user")}'>
								<c:forEach var='list' items='${list}'>
									<c:if test='${list.reviewNO == review.reviewNO}'>
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
										<c:set var="check" value="1" />
									</c:if>
								</c:forEach>

								<c:if test='${check!=1}'>
									<div class="col-md-4 mb-3"></div>
									<div class="col-md-4 mb-3"></div>
									<div class="col-md-4 mb-3">
										<input class="btn btn-primary btn-lg btn-block" type="button"
											value="리스트로 돌아가기" onClick="backToList(this.form)" />
									</div>
								</c:if>
							</c:if>
						</div>
					</div>
					<div class="row">
						<c:if test='${userSession.grade.equals("admin")}'>
							<div class="col-md-4 mb-3"></div>
							<div class="col-md-4 mb-3"></div>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block" type="button"
									value="리스트로 돌아가기" onClick="backToList(this.form)" />
							</div>
						</c:if>

						<c:if test='${userSession.grade.equals("seller")}'>
							<div class="col-md-4 mb-3">
								<input class="btn btn-primary btn-lg btn-block" type="button"
									value="리스트로 돌아가기" onClick="backToList(this.form)" />
							</div>
						</c:if>

						<c:if test='${userSession.grade == null}'>
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

	<!--  해당 글 댓글 보이기 -->
	<div class="container">
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
				<form action="/tm/board/review/add" method="post">
					<div class="row">
						<div class="col-md-12 mb-3">
							<label for="comment">댓글 쓰기 :</label> <input type="text"
								class="form-control" name="content">
						<hr>
						</div>
						<input type="hidden" name="id" value="${userSession.id }">
						<input	type="hidden" name="commentReviewNO" value="${review.reviewNO }">
						<div class="col-md-4 mb-3">
							<input class="btn btn-primary btn-lg btn-block" type="submit"
								value="댓글쓰기">
						</div>
					</div>
				</form>
			</c:if>
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
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

	<jsp:include page="/resources/include/footer.jsp" />

</body>
</html>