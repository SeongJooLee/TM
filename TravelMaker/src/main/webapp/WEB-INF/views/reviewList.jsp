<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기 목록</title>
</head>
<body>

	<jsp:include page="/resources/include/header.jsp" />

	<table align="center" border="1" width="80%">
		<tr height="10" align="center" bgcolor="lightgreen">
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성일</td>
		</tr>

			<c:forEach var="list" items="${list}" varStatus="status">
				<tr height="10" align="center">
					<td>${list.reviewNO}</td>
					<td><a href="list/view?listNO=${review.reviewNO }">${review.title }</a>
					<td>${list.content }</td>
				    <td>${notice.writeDate }</td>
					<td>${list.id }</td>
				</tr>
			</c:forEach>
			
		
	</table>
	<a class="cls1" href="review/add"><p class="cls2">글쓰기</p></a>
	
<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>