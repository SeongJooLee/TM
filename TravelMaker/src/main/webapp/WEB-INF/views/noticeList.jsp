<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>공지사항 목록</title>
</head>
<body>
<table align="center" border="1"  width="80%"  >
  <tr height="10" align="center"  bgcolor="lightblue">
     <td >공지사항 글번호</td>
     <td >제목</td>              
     <td >내용</td>              
     <td >작성자</td>
     <td >작성일</td>
     <td >게시판 종류</td>
  </tr>
  <c:forEach var="notice" items="${notice}" varStatus="status">

  <tr height="10" align="center"  bgcolor="lightblue">
     <td >${notice.noticeNO }</td>
     <td><a href="notice/view?noticeNO=${notice.noticeNO }">${notice.title }</a>
     <td >${notice.content }</td>
     <td >${notice.adminID }</td>
     <td >${notice.writeDate }</td>
     <td >${notice.name }</td>
  </tr>
  </c:forEach>
  	<a href="notice/add">글쓰기</a>
  
 </table>
</body>
</html>