<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: ghostwhite;
}

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

li a.active {
  background-color: CornflowerBlue;
  color: white;
}

li a:hover:not(.active) {
  background-color: CornflowerBlue;
  color: white;
}
</style>
</head>
<body>

<ul>
  <li><a href="#">이거 어떻게 넣지?.....</a></li>
  <li><a class="active" href="mypage">회원정보</a></li>
  <li><a href="#">내가 쓴 글 보기</a></li>	
  <li><a href="#">예약확인</a></li>
  <li><a href="#">추천한 글(보류중)</a></li>
</ul>

</body>
</html>