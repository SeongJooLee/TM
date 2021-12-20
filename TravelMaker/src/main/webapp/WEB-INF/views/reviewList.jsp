<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기 목록</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
<style>
.button {
   background-color: #4CAF50; /* Green */
   border: none;
   color: white;
   padding: 16px 32px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   -webkit-transition-duration: 0.4s; /* Safari */
   transition-duration: 0.4s;
   cursor: pointer;
}

.button4 {
   background-color: white;
   color: black;
   border: 2px solid #e7e7e7;
}

.button4:hover {
   background-color: #e7e7e7;
}
</style>
</head>
<body>

	<jsp:include page="/resources/include/header.jsp" />

<div class="container px-4 px-lg-5">

      <div class="row gx-4 gx-lg-5">
         <c:forEach var="review" items="${review}">
            <div class="col-md-4 mb-5">
               <div class="card h-100">

                  <c:if test="${review.image1 != null }">
                     <img
                        src="${contextPath }/tm/board/review/download?image=${review.image1}&reviewNO=${review.reviewNO}&name=${review.name}"
                        width="100%" height="100%" />
                  </c:if>

                  <c:if test="${review.image1 == null }">
                     <img
                        src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />"
                        width="100%" height="100%" />
                  </c:if>

                  <div class="card-footer">
                     <a class="btn btn-primary btn-sm">${review.categoryName }</a>&nbsp;&nbsp;&nbsp;<a href="${contextPath}/tm/board/review/view?reviewNO=${review.reviewNO }">${review.title }</a>
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
		<div align="center">
			<c:forEach var="i" begin="1" end="${page }">
				<c:if test="${selectPage == i}">
				<strong><a href="${contextPath }/tm/board/review/select?selectPage=${i}">	${i } </a>&nbsp;&nbsp;&nbsp;</strong>
				</c:if>
				<c:if test="${selectPage != i }">
					<a href="${contextPath }/tm/board/review/select?selectPage=${i}">	${i } </a>&nbsp;&nbsp;&nbsp;
				</c:if>
				</c:forEach>
		</div>
</div>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>