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
<title>테마 여행 목록</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
</head>
<body>
	<jsp:include page="/resources/include/header.jsp" />
	<!-- Responsive navbar-->
	<hr>
<table align="center" border="1"  width="80%"  >
  <tr height="10" align="center"  bgcolor="CornflowerBlue">
     <td >여행 글번호</td>
     <td >제목</td>
     <td >내용</td>            
     <td >작성일</td>
     <td >작성자id</td>     
     <td >게시판 종류</td>
  </tr>

    <c:forEach var="travel" items="${travel}" varStatus="status">

  <tr height="10" align="center"  bgcolor="ghostwhite">
     <td >${travel.travelNO }</td>
     <td><a href="travel/view?travelNO=${travel.travelNO }">${travel.title }</a>
     <td >${travel.content }</td>
     <td >${travel.writeDate }</td>
     <td >${travel.id }</td>     
     <td >${travel.name }</td>
  </tr>
  </c:forEach>
  <a href="travel/add">글쓰기</a>
  </table>
  
    <hr>
 <jsp:include page="/resources/include/footer.jsp" /> 
</body> 
</html>
