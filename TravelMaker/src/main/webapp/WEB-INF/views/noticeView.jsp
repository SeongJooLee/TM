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
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />
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
			return;
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
						location.href="${contextPath}/board/notice/view?noticeNO=${notice.noticeNO }";
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
	
	function next(){
		location.href = "${contextPath}/board/notice/view?noticeNO=${notice.noticeNO}&page=page";
	}
	
	
</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>


	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<div class="col-md-6 mb-3">
					<label for="title">글 번호</label> <input type="text"
						class="form-control" name="noticeNO" id="noticeNO" placeholder=""
						value="${notice.noticeNO }"> <input type="hidden"
						value="${notice.name }" name="name" />
				</div>
				<div class="col-md-6 mb-3">
					<label for="title">글 제목</label> <input type="text"
						class="form-control" name="title" id="title" placeholder=""
						value="${notice.title }"> <input type="hidden"
						value="${notice.name }" name="name" />
				</div>
				<br>
				<div class="col-md-6 mb-3">
					<label for="title">작성자</label> <input type="text"
						class="form-control" name="adminID" placeholder=""
						value="${notice.adminID }"> 
				</div>

			
				<tr align="center">
					<td align='left' colspan="2">이미지 파일 첨부<br>
						<div id="update">
							<input type="button" value="파일 삭제" id="imgUpdateBtn"
								onClick="fn_imgUpdateBtn()" disabled /> <small>
								&nbsp;&nbsp; * 클릭시 전체 파일이 삭제됩니다.</small>
						</div> <input type="button" value="파일 추가" id="imgUpdate"
						onClick="fn_addFile()" disabled /> <small> &nbsp;&nbsp; *
							최대 3개까지 첨부 가능합니다.</small>

						<div id="d_file"></div>
						<div id="d_filetest">
							<c:if test="${not empty image.image1 && image.image1 !='null' }">
								<input type="hidden" id="originalFileName" name="image1"
									value="${image.image1 }" />
								<img
									src="${contextPath }/board/notice/download?image=${image.image1}&noticeNO=${notice.noticeNO}&name=${notice.name}" />
							</c:if>

							<c:if test="${not empty image.image2 && image.image2 !='null' }">
								<input type="hidden" id="originalFileName" name="image2"
									value="${image.image2 }" />
								<img
									src="${contextPath }/board/notice/download?image=${image.image2}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

							<c:if test="${not empty image.image3 && image.image3 !='null' }">
								<input type="hidden" id="originalFileName" name="image3"
									value="${image.image3 }" />
								<img
									src="${contextPath }/board/notice/download?image=${image.image3}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>

						</div>
					</td>
				</tr>

									<div class="mb-3">
						<label for="content">글 내용</label>
						<textarea	class="form-control" name="content" id="content" placeholder="" maxlength="4000"></textarea>
						
					</div>
									<div class="col-md-6 mb-3">
					<label for="title">작성날짜</label> <input type="text"
						class="form-control" name="writeDate" placeholder=""
						value="${notice.writeDate }"> 
				</div>

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
					<td colspan="2" align="center"><c:if
							test='${userSession.grade.equals("admin")}'>

							<input type="button" value="수정하기" onClick="fn_enable(this.form)" />
							<input type="button" value="삭제하기" onClick="fn_delete(this.form)" />
						</c:if> <input type="button" value="리스트로 돌아가기"
						onClick="backToList(this.form)" /></td>
				</tr>
				</table>
				<button type="button" onClick="next()">다음 글 보기</button>
				
			</div>
			</div>
			</div>
			
			<hr>
			<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>