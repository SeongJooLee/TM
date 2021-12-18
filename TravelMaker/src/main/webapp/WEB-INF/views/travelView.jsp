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
function fn_enable(obj){
   document.getElementById("categoryName").disabled = false;
   document.getElementById("title").disabled = false;
   document.getElementById("content").disabled = false;
   if(document.getElementById("originalFileName")!=null){
   	document.getElementById("imgUpdateBtn").disabled = false;
   }
	if (document.getElementById("originalFileName") == null) {
		document.getElementById("imgUpdate").disabled = false;
	}
   document.getElementById("tr_btn_modify").style.display='block';
   document.getElementById("tr_btn").style.display='none';
}

function fn_imgUpdateBtn(obj) {
	document.getElementById("imgUpdate").disabled = false; // 여기 수정
	if (!confirm("사진을 삭제 하시겠습니까?")) {
		alert("취소(아니오)를 누르셨습니다.");
		return;
	} else {
		alert("확인(예)을 누르셨습니다.");
		$.ajax({
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
					location.href="${contextPath}/board/travel/view?travelNO=${travel.travelNO }";
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
	document.getElementById('frmTravel').method= "POST";
	document.getElementById('frmTravel').action = "${contextPath}/board/travel/update";
   document.getElementById('frmTravel').submit();
}
}

function fn_delete(){
    if (!confirm("삭제 하시겠습니까?")) {
        alert("취소(아니오)를 누르셨습니다.");
        return;
    } else {
        alert("확인(예)을 누르셨습니다.");
        location.href="${contextPath}/board/travel/delete?travelNO=${travel.travelNO}";
    }
	
}

function backToList(obj){
   obj.method ="POST";
   obj.action = "${contextPath}/board/travel";
   obj.submit();
}

function next(){
	location.href = "${contextPath}/board/travel/view?travelNO=${travel.travelNO}&page=page";
}

// 댓글 관련
function fn_enable_comment(obj){	  
	   
	   document.getElementById("content_comment").disabled = false;
	   document.getElementById("tr_btn_modify_comment").style.display='block';
	   document.getElementById("tr_btn_comment").style.display='none';
	}
// 댓글 작성
function fn_create_comment(){

	var content = document.getElementById("").value;
	if(!content){
		alert('내용을 적어주세요.');
		return false;
	}
    if (!confirm("글을 생성하시겠습니까?")) {
        alert("취소(아니오)를 누르셨습니다.");
        return;
    } else {
        alert("확인(예)을 누르셨습니다.");
        document.getElementById("").submit();
    }
}
// 댓글 수정
function fn_modify_update_comment(){
    if (!confirm("수정 하시겠습니까?")) {
        alert("취소(아니오)를 누르셨습니다.");
        return;
    } else {
        alert("확인(예)을 누르셨습니다.");
	document.getElementById('frmComment').method= "POST";
	document.getElementById('frmComment').action = "${contextPath}/board/comment/update";
    document.getElementById('frmComment').submit();
	}
}
// 댓글 삭제
function fn_delete_comment(){
    if (!confirm("삭제 하시겠습니까?")) {
        alert("취소(아니오)를 누르셨습니다.");
        return;
    } else {
        alert("확인(예)을 누르셨습니다.");
        location.href="${contextPath}/board/travel/delete?travelNO=${travel.travelNO}";
    }     
	
}

</script>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<hr>
	<div align="center">

		<form id="frmTravel" enctype="multipart/form-data">
			<table border="1" align="center">
				<tr>
					<td>글 번호 : <input type="text" value="${travel.travelNO }"
						id="travelNO" name="travelNO" readonly />
					</td>
					<td><input type="text" value="${travel.title }" id="title"
						name="title" disabled />
					<td><input type="hidden" value="${travel.name }" name="name" />
					</td>
				</tr>
				<tr>
					<td>카테고리 : <select name="categoryName" id="categoryName"
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
					</td>
					<td align="center">작성자 아이디</td>
					<td><input type="text" value="${travel.id }" name="id"
						readonly /></td>
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
									src="${contextPath }/board/travel/download?image=${image.image1}&travelNO=${travel.travelNO}&name=${travel.name}" />
							</c:if>

							<c:if test="${not empty image.image2 && image.image2 !='null' }">
								<input type="hidden" id="originalFileName" name="image2"
									value="${image.image2 }" />
								<img
									src="${contextPath }/board/travel/download?image=${image.image2}&travelNO=${travel.travelNO}&name=${travel.name}" />
							</c:if>

							<c:if test="${not empty image.image3 && image.image3 !='null' }">
								<input type="hidden" id="originalFileName" name="image3"
									value="${image.image3 }" />
								<img
									src="${contextPath }/board/travel/download?image=${image.image3}&travelNO=${travel.travelNO}&name=${travel.name}" />
							</c:if>

						</div>
					</td>
				</tr>
				<tr>
					<td align="center">글내용</td>
					<td><textarea rows="20" cols="60" name="content" id="content"
							disabled>${travel.content } </textarea></td>
				</tr>
				<tr>
					<td>작성 날짜</td>
					<td>${travel.writeDate }</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<div id="tr_btn_modify" style="display: none">
							<input type="button" value="수정 반영하기" onClick="fn_modify_update(frmTravel)" /> 
							<input type="button" value="취소하기" onClick="backToList(frmTravel)" />
						</div>
					</td>
				</tr>

				<tr id="tr_btn">
					<td colspan="2" align="center">
						<c:if test='${userSession.grade.equals("user")}'>
							<c:forEach var='list' items='${list}'>
								<c:if test='${list.travelNO == travel.travelNO}'>
									<input type="button" value="수정하기" onClick="fn_enable(this.form)" /> 
									<input type="button" value="삭제하기" onClick="fn_delete(this.form)" /> 									
									<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
									<c:set var="check" value="1" />	
								</c:if>
							</c:forEach>
							
							<c:if test='${check==0}'>
								<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
							</c:if>
							
						</c:if>
						
						<c:if test='${userSession.grade.equals("admin")}'>			
							<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
						</c:if>
						
						<c:if test='${userSession.grade.equals("seller")}'>			
							<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
						</c:if>
						
						<c:if test='${userSession.grade == null}'>			
							<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
						</c:if>
					</td>
				</tr>		
					
			</table>
		</form>
	</div>
	
	
	//댓글목록
	<form name="frmComment" action="${contextPath}/board/travel/view?travelNO=${travel.travelNO }" method="post">
		<table border="3" align="center">
			<input type="hidden" name="travelNO" value="${travel.travelNO}"/>				
				<div>
					<tr height="10" align="center" bgcolor="cornflowerblue" border="1" >
						<th rowspan="2">댓글</th>
						<th>내용</th>
						<th>작성일</th>
						<th>작성자</th>					
					</tr>
				

					<tr height="10" align="center" border="1">
						<%-- <td><a href="travel/view?travelNO=${travel.travelNO }">${travel.travelNO}</a></td> --%>
						<%-- <td>${travel.travelNO}</a></td> --%>
						<td>${travel.content }</td>
						<td>${travel.writeDate }</td>
						<td>${travel.id }</td>
						<td><input type="button" value="댓글쓰기" onClick="fn_create_comment"></td>					  
					</tr>
				</div>
		</table>	
	</form>
	
	// 게시판 글 목록	
	<form action="${contextPath}/board/travel/view?travelNO=${travel.travelNO }" method="post">
		<table border="3" align="center">			
			<div>
				<tr height="10" align="center" border="1">
					<th>이전글</th>						
					<%-- <td><a href="travel/view?content=${travel.travelNO}">${travel.content }</a></td> --%>	
				</tr>
				
				<tr align="center" border="1">
					<th>다음글</th>					
					<%-- <td><a href="travel/view?content=${travel.travelNO}">${travel.content }</a></td> --%>	
					<td><button type="button" onClick="next()"> 다음 글 보기</button></td>						  
				</tr>
			</div>
		</table>	
	</form>
	
	
	// 댓글쓰기
	<form name="frmComment" action="${contextPath}/board/travel/view?travelNO=${travel.travelNO }" method="post">
		
			<table border="3" align="center">
			<tr>
				<td width="150" align="center" bgcolor="cornflowerblue">댓글내용</td>
				<td colspan=2>
					<textarea name="content" rows="10" cols="50" maxlength="500" id="content_comment" disabled />${comment.content }</textarea>
				</td>
			</tr>
			
			<tr>
      			<td width="150" align="center" bgcolor="cornflowerblue">
        			 작성일
      			</td>
      		<td>
       			<input type=text value="<fmt:formatDate value="${comment.writeDate}" />" disabled />
      		</td> 
     	    <td width="150" align="center" bgcolor="cornflowerblue">
     			 	작성자
  			</td>  
  			<td >
   				<input type=text value="${travel.id }" name="writer"  disabled />    			
   			</td>
  			
  			</tr>
			
			<tr id="tr_btn_modify_comment">
				<td colspan="2" align="center">
					<div id="tr_btn_create_comment" style="display: none">
						<input type="button" value="댓글 작성하기" onClick="fn_create_comment()" /> 
						<input type="button" value="이전으로" onClick="backToList(frmTravel)"/>
						
					</div>
				</td>			
			</tr>
			
			<tr  id="tr_btn_comment">
				<c:if test='${userSession.grade.equals("user")}'>
				<c:forEach var='list' items='${list}'>
				<c:if test='${list.travelNO == travel.travelNO}'>
   					<td colspan="2" align="center">
       					<input type=button value="수정하기" onClick="fn_enable_comment(this.form)">
       					<input type=button value="삭제하기" onClick="fn_remove_comment(this.form)">
      					<input type=button value="이전으로 돌아가기"  onClick="backToList(frmTravel)">  
      				<c:set var="check" value="1" />	
      			</c:if>	
      			</c:forEach>	
      			<c:if test='${check==0}'>
					<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
				</c:if>
							
				</c:if>
						
				<c:if test='${userSession.grade.equals("admin")}'>			
					<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
				</c:if>
						
				<c:if test='${userSession.grade.equals("seller")}'>			
					<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
				</c:if>
						
				<c:if test='${userSession.grade == null}'>			
					<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
				</c:if>      			
   				</td>
  			</tr>			

			
		</table>		
	</form>
	  
  
    <hr>
  	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

 <jsp:include page="/resources/include/footer.jsp" /> >
</body>
</html>