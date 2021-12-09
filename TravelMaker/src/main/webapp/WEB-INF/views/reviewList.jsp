<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table align="center" border="1" width="80%">
		<tr height="10" align="center" bgcolor="lightgreen">
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>내용</td>
			<td>이미지파일</td>
			<td>작성일자</td>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr height="10">
					<td colspan="4">
						<p align="center">
							<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
						</p>
					</td>
				</tr>
			</c:when>
			<c:when test="${!empty list}">
				<c:forEach var="list" items="${list }">
					<tr align="center">
						<td width="5%">${list.reviewNO}</td>
						<td width="10%">${list.title }</td>
						<td width="10%">${list.content }</td>
						<td width="10%">${list.imageFileName }</td>
						<td width="10%"><fmt:formatDate value="${list.writeDate}" /></td>
						<td width="10%">${list.id }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<a class="cls1" href="#"><p class="cls2">글쓰기</p></a>

</body>
</html>