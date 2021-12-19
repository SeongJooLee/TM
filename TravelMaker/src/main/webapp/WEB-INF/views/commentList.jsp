<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 목록</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />	
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<!-- Responsive navbar-->
	<hr>
	<table align="center" border="1" width="80%">
		<tr height="10" align="center" bgcolor="lightblue">
			<td>작성자</td>
			<td>내용</td>
			<td>작성일</td>
			<td>여행글번호</td>
			<td>리뷰글번호</td>	
		</tr>

			<c:forEach var="comment" items="${comment}" varStatus="status">
				<tr height="10" align="center">
					<td>${comment.id}</td>					
					<td>${comment.content }</td>
				    <td>${comment.writeDate }</td>
					<td>${travel.travelNO }</td>
					<td>${review.promotionNO }</td>
				</tr>
			</c:forEach>
	</table>


	<c:if test='${userSession.grade.equals("user")}'>
  <a href="${contextPath }/board/comment/add">글쓰기</a>  
  </c:if>
    <hr>
  	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

 <jsp:include page="/resources/include/footer.jsp" /> 
</body>
</html>