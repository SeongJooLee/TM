<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="false" %>
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
		<div align="center">
			<c:forEach var="i" begin="1" end="${page }">
				<c:if test="${selectPage == i}">
				<strong><a href="${contextPath }/tm/board/comment/select?selectPage=${i}">	${i } </a>&nbsp;&nbsp;&nbsp;</strong>
				</c:if>
				<c:if test="${selectPage != i }">
					<a href="${contextPath }/tm/board/comment/select?selectPage=${i}">	${i } </a>&nbsp;&nbsp;&nbsp;
				</c:if>
				</c:forEach>
		</div>

	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>