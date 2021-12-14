<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 여행 뷰</title>
<script src='http://code.jquery.com/jquery-latest.min.js'></script>
<script type='text/javascript'>

function fn_enable(obj){
   document.getElementById("title").disabled = false;
   document.getElementById("content").disabled = false;
   if(document.getElementById("image")!=null){
   	document.getElementById("imgUpdateBtn").disabled = false;
   }
   document.getElementById("tr_btn_modify").style.display='block';
   document.getElementById("tr_btn").style.display='none';
}
function fn_image(obj){
	   document.getElementById("image").disabled = false;
	   }

function fn_modify_update(){
    if (!confirm("수정 하시겠습니까?")) {
        alert("취소(아니오)를 누르셨습니다.");
        return;
    } else {
        alert("확인(예)을 누르셨습니다.");
	document.getElementById('frmPromotion').method= "POST";
	document.getElementById('frmPromotion').action = "${contextPath}/board/promotion/update";
   document.getElementById('frmPromotion').submit();
    }
}

function fn_delete(){
    if (!confirm("삭제 하시겠습니까?")) {
        alert("취소(아니오)를 누르셨습니다.");
        return;
    } else {
        alert("확인(예)을 누르셨습니다.");
        location.href="${contextPath}/board/promotion/delete?promotionNO=${promotion.promotionNO}";
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

function backToList(obj){
   obj.method ="POST";
   obj.action = "${contextPath}/tm/board/promotion";
   obj.submit();
}

</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>
	<div align="center">

		<form id="frmPromotion" enctype="multipart/form-data">
			<table border="1" align="center">
				<tr>
					<td>글 번호 : <input type="text" value="${promotion.promotionNO }"
						id="promotionNO" name="promotionNO" readonly />
					</td>
					<td><input type="text" value="${promotion.title }" id="title"
						name="title" disabled />
					<td><input type="hidden" value="${promotion.name }" name="name" />
					</td>
				</tr>
				<tr>
					<td width="150" align="center">작성자 아이디</td>
					<td><input type="text" value="${promotion.sellerID }"
						name="sellerID" readonly /></td>
				</tr>
				<c:if test="${not empty image.image1 && image.image1 !='null' }">
					<tr align="center">
						<td colspan="2">
							<p>첫 번째 사진</p> <input type="hidden" name="originalFileName"
							value="${image.image1 }" /> <img
							src="${contextPath }/download?image=${image.image1}&promotionNO=${promotion.promotionNO}&name=${promotion.name}" />
							<div align="right">
								<input type="button" value="파일 수정" id="imgUpdateBtn"
									onClick="fn_image(this.form)" disabled /> <input type="file"
									name="image1" id="image" disabled onchange="readURL(this)" /><br>
							</div> <c:if test="${not empty image.image2 && image.image2 !='null' }">
								<input type="hidden" name="image2" value="${image.image2 }" />
								<img
									src="${contextPath }/download?image=${image.image2}&noticeNO=${notice.noticeNO}&name=${notice.name}">
                  &nbsp;<input type="file" name="image2" id="image"
									disabled onchange="readURL(this)" />
								<br>
							</c:if> <c:if test="${not empty image.image3 && image.image3 !='null' }">
								<img
									src="${contextPath }/download?image=${image.image3}&noticeNO=${notice.noticeNO}&name=${notice.name}">
								<br>
							</c:if> <c:if test="${not empty image.image4 && image.image4 !='null' }">
								<img
									src="${contextPath }/download?image=${image.image4}&noticeNO=${notice.noticeNO}&name=${notice.name}">
								<br>
							</c:if> <c:if test="${not empty image.image5 && image.image5 !='null' }">
								<img
									src="${contextPath }/download?image=${image.image5}&noticeNO=${notice.noticeNO}&name=${notice.name}">
								<br>
							</c:if> <c:if test="${not empty image.image6 && image.image6 !='null' }">
								<img
									src="${contextPath }/download?image=${image.image6}&noticeNO=${notice.noticeNO}&name=${notice.name}">
								<br>
							</c:if> <c:if test="${not empty image.image7 && image.image7 !='null' }">
								<img
									src="${contextPath }/download?image=${image.image7}&noticeNO=${notice.noticeNO}&name=${notice.name}">
								<br>
							</c:if> <c:if test="${not empty image.image8 && image.image8 !='null' }">
								<img
									src="${contextPath }/download?image=${image.image8}&noticeNO=${notice.noticeNO}&name=${notice.name}">
								<br>
							</c:if> <c:if test="${not empty image.image9 && image.image9 !='null' }">
								<img
									src="${contextPath }/download?image=${image.image9}&noticeNO=${notice.noticeNO}&name=${notice.name}">
								<br>
							</c:if> <c:if
								test="${not empty image.image10 && image.image10 !='null' }">
								<img
									src="${contextPath }/download?image=${image.image10}&noticeNO=${notice.noticeNO}&name=${notice.name}">
							</c:if>
						</td>
					</tr>
				</c:if>
				<tr>
					<td width="150" align="center">글내용</td>
					<td><textarea rows="20" cols="60" name="content" id="content"
							disabled>${promotion.content } </textarea></td>
				</tr>
				<tr>
					<td>작성 날짜</td>
					<td>${promotion.writeDate }</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div id="tr_btn_modify" style="display: none">
							<input type="button" value="수정 반영하기"
								onClick="fn_modify_update(frmPromotion)" /> <input type="button"
								value="취소하기" onClick="backToList(frmPromotion)" />
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
	<hr>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>