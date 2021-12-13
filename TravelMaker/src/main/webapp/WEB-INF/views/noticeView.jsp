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
<title>테마 여행 뷰</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
li {
    list-style-type: none;
}
/* 보여줄 구간의 높이와 넓이 설정 */
#slideShow {
    width: 500px;
    height: 300px;
    position: relative;
    margin: 50px auto;
    overflow: hidden;
    /*리스트 형식으로 이미지를 일렬로 정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은 hidden으로 숨겨줘야됨*/
}
.slides {
    position: absolute;
    left: 0;
    top: 0;
    width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
    transition: 0.5s ease-out;
    /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}
/* 첫 번째 슬라이드 가운데에 정렬하기위해 첫번째 슬라이드만 margin-left조정 */
.slides li:first-child {
    margin-left: 100px;
}
/* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child) {
    float: left;
    margin-right: 100px;
}
.slides li {
    float: left;
}
.controller span {
    position: absolute;
    background-color: transparent;
    color: black;
    text-align: center;
    border-radius: 50%;
    padding: 10px 20px;
    top: 50%;
    font-size: 1.3em;
    cursor: pointer;
}
/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
.controller span:hover {
    background-color: rgba(128, 128, 128, 0.11);
}
.prev {
    left: 10px;
}
/* 이전 화살표에 마우스 커서가 올라가 있을때 이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
.prev:hover {
    transform: translateX(-10px);
}
.next {
    right: 10px;
}
/* 다음 화살표에 마우스 커서가 올라가 있을때 이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
.next:hover {
    transform: translateX(10px);
}
</style>
<script src='http://code.jquery.com/jquery-latest.min.js'></script>
<script type='text/javascript'>

function fn_enable(obj){
	document.getElementById("title").disabled = false;
	document.getElementById("content").disabled = false;
	
	document.getElementById("tr_btn_modify").style.display='block';
	document.getElementById("tr_btn").style.display='none';
}

function fn_modify_article(obj){
	obj.action = "${contextPath}/board/modArticle.do";
	obj.submit();
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
	obj.action = "${contextPath}/board/notice";
	obj.submit();
}

function fn_remove_article(url,articleNO){
	var form = document.createElement("form");
	form.setAttribute("method","post");
	form.setAttribute("action", url);
	var articleNOInput = document.createElement("input");
	articleNOInput.setAttribute("type","hidden");
	articleNOInput.setAttribute("name","articleNO");
	articleNOInput.setAttribute("value",articleNO);
	form.appendChild(articleNOInput);
	document.body.appendChild(form);
	form.submit();
}

</script>
</head>
<body>
<form name="frmArticle" method="GET" action="&{contextPath}" enctype="multipart/form-data">
	<table border="1" align="center">
		<tr>
			<td>글 번호 : <input type="text" value="${notice.noticeNO }" name="noticeNO" readonly />
			</td>
			<td><input type="text" value="${notice.title }" id="title" name="title" disabled />
		</td>
		</tr>
		<tr>
			<td width="150" align="center">작성자 아이디</td>
			<td><input type="text" value="${notice.adminID }" name="adminID" readonly /></td>
		</tr>
							<c:if test="${not empty image.image1 && image.image1 !='null' }">
			<tr>
				<td colspan="2">
				<div id="slideShow">
					<ul class="slides">
					<c:if test="${not empty image.image1 && image.image1 !='null' }">
						<li><img src="${contextPath }/download?image=${image.image1}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>>
					</c:if>
					<c:if test="${not empty image.image2 && image.image2 !='null' }">
					<li>	<img src="${contextPath }/download?image=${image.image2}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>>
					</c:if>
					<c:if test="${not empty image.image3 && image.image3 !='null' }">
						<li><img src="${contextPath }/download?image=${image.image3}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>>
					</c:if>
					<c:if test="${not empty image.image4 && image.image4 !='null' }">
					<li>	<img src="${contextPath }/download?image=${image.image4}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>>
					</c:if>
					<c:if test="${not empty image.image5 && image.image5 !='null' }">
						<li><img src="${contextPath }/download?image=${image.image5}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>>
					</c:if>
					<c:if test="${not empty image.image6 && image.image6 !='null' }">
						<li><img src="${contextPath }/download?image=${image.image6}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>>
					</c:if>
					<c:if test="${not empty image.image7 && image.image7 !='null' }">
						<li><img src="${contextPath }/download?image=${image.image7}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>>
					</c:if>
					<c:if test="${not empty image.image8 && image.image8 !='null' }">
						<li><img src="${contextPath }/download?image=${image.image8}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>>
					</c:if>
					<c:if test="${not empty image.image9 && image.image9 !='null' }">
						<li><img src="${contextPath }/download?image=${image.image9}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>>
					</c:if>
					<c:if test="${not empty image.image10 && image.image10 !='null' }">
						<li><img src="${contextPath }/download?image=${image.image10}&noticeNO=${notice.noticeNO}&name=${notice.name}" ></li>
					</c:if>
					 </ul>
					    <p class="controller">
      <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 --> 
      <span class="prev">&lang;</span> 
      <span class="next">&rang;</span>
    </p>
					
									</div>
				</td>
			</tr>
			</c:if>
		<tr>
			<td width="150" align="center">글내용</td>
			<td><textarea rows="20" cols="60" name="content" id="content" disabled >${notice.content } </textarea></td>
		</tr>
		<tr>
			<td>작성 날짜 </td><td>${notice.writeDate }</td>
		</tr>
		<tr>
			<td colspan="2" align="center" >
				<input type="button" value="수정하기" onClick="fn_enable(this.form)" />
				<input type="button" value="삭제하기" onClick="#" />
				<input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
			</td>
		</tr>
	</table>
	</form>
	<script>

	let slides = document.querySelector(".slides");
	let slideImg = document.querySelectorAll(".slides li");
	currentIdx = 0;
	slideCount = slideImg.length;
	prev = document.querySelector(".prev");
	next = document.querySelector(".next");
	slideWidth = 300;
	slideMargin = 100;

	makeClone();
	initfunction();

	function makeClone(){
	  let cloneSlide_first = slideImg[0].cloneNode(true); //slideImg.firstElementChild.cloneNode(true);
	  let cloneSlide_last = slides.lastElementChild.cloneNode(true);
	  slides.append(cloneSlide_first); 
	  slides.insertBefore(cloneSlide_last,slides.firstElementChild);
	}

	function initfunction(){
	  slides.style.width = (slideWidth + slideMargin) * (slideCount+2) + "px";
	  slides.style.left = -(slideWidth + slideMargin) + "px";
	}

	next.addEventListener('click', function () {
	  if (currentIdx <= slideCount-1) {
	    slides.style.left = -(currentIdx+2) * (slideWidth+slideMargin) + "px";
	    slides.style.transition = `${0.5}s ease-out`;
	  }if (currentIdx === slideCount-1){
	    setTimeout(function(){
	      slides.style.left = -(slideWidth + slideMargin) + "px";
	      slides.style.transition = `${0}s ease-out`;
	    },500);
	    currentIdx = -1;
	    } 
	    currentIdx+=1;
	  }
	);

	prev.addEventListener('click', function () {
	  console.log(currentIdx);
	    if (currentIdx >= 0) {
	      slides.style.left = -(currentIdx) * (slideWidth + slideMargin) + "px";
	      slides.style.transition = `${0.5}s ease-out`;
	    }if (currentIdx === 0){
	      setTimeout(function(){
	        slides.style.left = -(slideCount) * (slideWidth + slideMargin)+ "px";
	        slides.style.transition = `${0}s ease-out`;
	      },500);
	      currentIdx=slideCount;
	      } 
	      currentIdx-=1;
	    }
	);


	</script>
</body>
</html>