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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
	display: none;
}
</style>

<script type='text/javascript'>
	var cnt = 1;
	function fn_addFile() {
		if (cnt === 11) {
			alert("최대 10개만 생성할 수 있습니다.");
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
			return;
		} else {
			alert("확인(예)을 누르셨습니다.");
			$.ajax({
				type : 'POST',
				url : 'imgDelete',
				dataType : "json",
				data : {
					'noticeNO' : '${notice.noticeNO}'
				},
				success : function(data) {
					if (data.result == 'false') {
						alert('삭제 실패');
					} else {
						alert('파일을 삭제했습니다.');
						$("#updateResult").remove();
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

	function fn_image(obj){
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
	<div align="center">
		<form id="frmNotice" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td>글 번호 : <input type="text" value="${notice.noticeNO }"
						id="noticeNO" name="noticeNO" readonly />
					</td>
					<td><input type="text" value="${notice.title }" id="title"
						name="title" disabled />
					<td><input type="hidden" value="${notice.name }" name="name" />
					</td>
				</tr>
				<tr>
					<td align="center">작성자 아이디</td>
					<td><input type="text" value="${notice.adminID }"
						name="adminID" readonly /></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="w3-content w3-display-container">
							<c:if test="${not empty image.image1 && image.image1 !='null' }">
								<input type="hidden" id="originalFileName" name="image1"
									value="${image.image1 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image1}&noticeNO=${notice.noticeNO}&name=${notice.name}" />
							</c:if>

							<c:if test="${not empty image.image2 && image.image2 !='null' }">
								<input type="hidden" id="originalFileName" name="image2"
									value="${image.image2 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image2}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image3 && image.image3 !='null' }">
								<input type="hidden" id="originalFileName" name="image3"
									value="${image.image3 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image3}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image4 && image.image4 !='null' }">
								<input type="hidden" id="originalFileName" name="image4"
									value="${image.image4 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image4}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image5 && image.image5 !='null' }">
								<input type="hidden" id="originalFileName" name="image5"
									value="${image.image5 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image5}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image6 && image.image6 !='null' }">
								<input type="hidden" id="originalFileName" name="image6"
									value="${image.image6 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image6}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image7 && image.image7 !='null' }">
								<input type="hidden" id="originalFileName" name="image7"
									value="${image.image7 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image7}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image8 && image.image8 !='null' }">
								<input type="hidden" id="originalFileName" name="image8"
									value="${image.image8 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image8}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image9 && image.image9 !='null' }">
								<input type="hidden" id="originalFileName" name="image9"
									value="${image.image9 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image9}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if
								test="${not empty image.image10 && image.image10 !='null' }">
								<input type="hidden" id="originalFileName" name="image10"
									value="${image.image10 }" />
								<img class="mySlides" style="width:100%"
									src="${contextPath }/download?image=${image.image10}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>
							<button class="w3-button w3-black w3-display-left"
								onclick="plusDivs(-1)">&#10094;</button>
							<button class="w3-button w3-black w3-display-right"
								onclick="plusDivs(1)">&#10095;</button>
						</div>
					</td>
				</tr>

				<tr align="center">
					<td align='left' colspan="2">이미지 파일 첨부<br>
						<div id="update">
							<input type="button" value="파일 삭제" id="imgUpdateBtn"
								onClick="fn_imgUpdateBtn()" disabled /> <small>
								&nbsp;&nbsp; * 클릭시 전체 파일이 삭제됩니다.</small>
						</div> <input type="button" value="파일 추가" id="imgUpdate"
						onClick="fn_addFile()" disabled /> <small> &nbsp;&nbsp; *
							최대 10개까지 첨부 가능합니다.</small>
					
						<div id="d_file"></div>
						<div id="updateResult">


							<c:if test="${not empty image.image1 && image.image1 !='null' }">
								<input type="hidden" id="originalFileName" name="image1"
									value="${image.image1 }" />
								<img
									src="${contextPath }/download?image=${image.image1}&noticeNO=${notice.noticeNO}&name=${notice.name}" />
							</c:if>

							<c:if test="${not empty image.image2 && image.image2 !='null' }">
								<input type="hidden" id="originalFileName" name="image2"
									value="${image.image2 }" />
								<img
									src="${contextPath }/download?image=${image.image2}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image3 && image.image3 !='null' }">
								<input type="hidden" id="originalFileName" name="image3"
									value="${image.image3 }" />
								<img
									src="${contextPath }/download?image=${image.image3}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image4 && image.image4 !='null' }">
								<input type="hidden" id="originalFileName" name="image4"
									value="${image.image4 }" />
								<img
									src="${contextPath }/download?image=${image.image4}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image5 && image.image5 !='null' }">
								<input type="hidden" id="originalFileName" name="image5"
									value="${image.image5 }" />
								<img
									src="${contextPath }/download?image=${image.image5}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image6 && image.image6 !='null' }">
								<input type="hidden" id="originalFileName" name="image6"
									value="${image.image6 }" />
								<img
									src="${contextPath }/download?image=${image.image6}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>
							<c:if test="${not empty image.image7 && image.image7 !='null' }">
								<input type="hidden" id="originalFileName" name="image7"
									value="${image.image7 }" />
								<img
									src="${contextPath }/download?image=${image.image7}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image8 && image.image8 !='null' }">
								<input type="hidden" id="originalFileName" name="image8"
									value="${image.image8 }" />
								<img
									src="${contextPath }/download?image=${image.image8}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image9 && image.image9 !='null' }">
								<input type="hidden" id="originalFileName" name="image9"
									value="${image.image9 }" />
								<img
									src="${contextPath }/download?image=${image.image9}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if
								test="${not empty image.image10 && image.image10 !='null' }">
								<input type="hidden" id="originalFileName" name="image10"
									value="${image.image10 }" />
								<img
									src="${contextPath }/download?image=${image.image10}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">글내용</td>
					<td><textarea rows="20" cols="60" name="content" id="content"
							disabled>${notice.content } </textarea></td>
				</tr>
				<tr>
					<td>작성 날짜</td>
					<td>${notice.writeDate }</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div id="tr_btn_modify" style="display: none">
							<input type="button" value="수정 반영하기"
								onClick="fn_modify_update(frmNotice)" /> <input type="button"
								value="취소하기" onClick="backToList(frmNotice)" />
						</div>
					</td>
				</tr>
				<tr id="tr_btn">
					<td colspan="2" align="center"><input type="button"
						value="수정하기" onClick="fn_enable(this.form)" /> <input
						type="button" value="삭제하기" onClick="fn_delete(this.form)" /> <input
						type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
		<hr>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>