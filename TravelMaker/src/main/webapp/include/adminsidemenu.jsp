<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 사이드메뉴</title>

<style>
body {
  margin: 0;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

li a.active {
  background-color: #04AA6D;
  color: white;
}

li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
</style>
</head>
<body>
	<ul>
		<li><a class="active" href="#home">관리자 메뉴</a></li>
		<li><a href="#news">게시판 글 관리</a></li>
		<li><a href="#contact">리스트 출력</a></li>
		<li><a href="#about">회원 조회</a></li>
		<li><a href="#about">업체 조회</a></li>
	</ul>
</body>
</html>