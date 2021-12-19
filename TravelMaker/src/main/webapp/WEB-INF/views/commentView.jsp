<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
<script src='http://code.jquery.com/jquery-latest.min.js'></script>
<script type='text/javascript'>

     function backToList(obj){
       obj.action="list";
       obj.submit();
     }
 	 // 댓글 관련 
     function fn_enable_comment(obj){	  
  	   
  	   document.getElementById("content_comment").disabled = false;

  	   if (document.getElementById("content_comment") == null) {
  		   document.getElementById("content_comment").disabled = false;
  	   }
  	   document.getElementById("tr_btn_modify_comment").style.display='block';
  	   document.getElementById("tr_btn_comment").style.display='none';	   
  	}
     // 댓글 작성
     function fn_create_comment(){

    		var content = document.getElementById("content_comment").value;
    		if(!content){
    			alert('내용을 적어주세요.');
    			return false;
    		}
    	    if (!confirm("글을 생성하시겠습니까?")) {
    	        alert("취소(아니오)를 누르셨습니다.");
    	        return;
    	    } else {
    	        alert("확인(예)을 누르셨습니다.");
    	        document.getElementById("frm").submit();
    	    }
    	}
    //댓글 수정
    function fn_modify_update(){
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
            location.href="${contextPath}/board/comment/delete?travelNO=${comment.travelNO}";
        }
    	
    }
 
 </script>
</head>
<body>
  <form name="frmArticle" method="post"  action="update">
  <table  border=0  align="center">
  <tr>

  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      작성자 아이디
   </td>
   <td >
    <input type=text value="${article.id }" name="writer"  disabled />
    <input type=text value="${member.name }" name="writer"  disabled />
   </td>
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      제목 
   </td>
   <td>
    <input type=text value="${article.title }"  name="title"  id="i_title" disabled />
   </td>   
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      내용
   </td>
   <td>
    <textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />${article.content }</textarea>
   </td>  
  </tr>
 
  <tr>
      <td width="150" align="center" bgcolor="#FF9933">
         등록일자
      </td>
      <td>
       <input type=text value="<fmt:formatDate value="${article.writeDate}" />" disabled />
      </td>   
  </tr>
  <tr   id="tr_btn_modify"  >
      <td colspan="2"   align="center" >
          <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
           <input type=button value="취소"  onClick="backToList(frmArticle)">
      </td>   
  </tr>
    
  <tr  id="tr_btn"    >
   <td colspan="2" align="center">
       <input type=button value="수정하기" onClick="fn_enable(this.form)">
       <input type=button value="삭제하기" onClick="fn_remove_article('delete', ${article.articleNO})">
       <input type=button value="리스트로 돌아가기"  onClick="backToList(this.form)">
        <input type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})">
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