<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored = "false" %>
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
<title>리뷰 뷰</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
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
				'reviewNO' : '${review.reviewNO}'
			},
			success : function(data) {
				if (data.result == 'false') {
					alert('삭제 실패');
				} else {
					alert('파일을 삭제했습니다.');
					$("#d_filetest").remove();
					location.href="${contextPath}/board/review/view?reviewNO=${review.reviewNO }";
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

function fn_modify_update(){
    if (!confirm("수정 하시겠습니까?")) {
        alert("취소(아니오)를 누르셨습니다.");
        return;
    } else {
        alert("확인(예)을 누르셨습니다.");
	document.getElementById('frmReview').method= "POST";
	document.getElementById('frmReview').action = "${contextPath}/board/review/update";
   document.getElementById('frmReview').submit();
    }
}

function fn_delete(){
    if (!confirm("삭제 하시겠습니까?")) {
        alert("취소(아니오)를 누르셨습니다.");
        return;
    } else {
        alert("확인(예)을 누르셨습니다.");
        location.href="${contextPath}/board/review/delete?reviewNO=${review.reviewNO}";
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
   obj.action = "${contextPath}/board/review";
   obj.submit();
}

</script>

</head>
<body>
    <jsp:include page="/resources/include/header.jsp" />
    
	<div align="center">
		<form id="frmReview" enctype="multipart/form-data">
			<table border='1' align="center">
				<tr>
					<td >글 번호 : <input type="text" value="${review.reviewNO }"
						id="reviewNO" name="reviewNO" readonly />
					</td>
					<td>글 제목 : <input type="text" value="${review.title }" id="title"
						name="title" disabled />
					<input type="hidden" value="${review.name }" name="name" />
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" value="${review.id }"
						name="ID" readonly /></td>
				</tr>
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
									src="${contextPath }/board/review/download?image=${image.image1}&reviewNO=${review.reviewNO}&name=${review.name}" />
							</c:if>

							<c:if test="${not empty image.image2 && image.image2 !='null' }">
								<input type="hidden" id="originalFileName" name="image2"
									value="${image.image2 }" />
								<img
									src="${contextPath }/board/review/download?image=${image.image2}&noticeNO=${review.reviewNO}&name=${review.name}">
							</c:if>

							<c:if test="${not empty image.image3 && image.image3 !='null' }">
								<input type="hidden" id="originalFileName" name="image3"
									value="${image.image3 }" />
								<img
									src="${contextPath }/board/review/download?image=${image.image3}&noticeNO=${review.reviewNO}&name=${review.name}">
							</c:if>

						</div>
					</td>
				</tr>
				<tr>
					<td align="center">글내용</td>
					<td><textarea rows="20" cols="60" name="content" id="content"
							disabled>${review.content } </textarea></td>
				</tr>
				<tr>
					<td align="center">작성 날짜 : </td>
					<td>${review.writeDate }</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div id="tr_btn_modify" style="display: none">
							<input type="button" value="수정 반영하기"
								onClick="fn_modify_update(frmReview)" /> <input type="button"
								value="취소하기" onClick="backToList(frmReview)" />
						</div>
					</td>
				</tr>
				<tr id="tr_btn">
					
					<td colspan="2" align="center">
						<c:if test='${userSession.grade.equals("user")}'>
							<c:forEach var='list' items='${list}'>
							
								 <c:if test='${list.reviewNO == review.reviewNO}'> 
									<input type="button" value="수정하기" onClick="fn_enable(this.form)" /> 
									<input type="button" value="삭제하기" onClick="fn_delete(this.form)" />
									<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />	
									<c:set var="check" value="1" />															
								 </c:if>  				
							</c:forEach>	
								<c:if test='${check!=1}'>
									<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
								</c:if>	
						</c:if>
						
						<c:choose>
							<c:when test='${userSession.grade.equals("admin")}'>
								<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
							</c:when>
							
							<c:when test='${userSession.grade.equals("seller")}'>
								<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
							</c:when>
							
							<c:when test='${userSession.grade==null}'>
								<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
							</c:when>
						</c:choose>
					</td>
					
					
					
				</tr>
			</table>
		</form>
	</div>
     <jsp:include page="/resources/include/footer.jsp" />
</body>
</html>