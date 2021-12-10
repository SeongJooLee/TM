<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
.wrap {
	display: grid;
	grid-template-columns: 35% 15% 35% 10% 5%;
	grid-template-rows: 10px 20px 20px 20px 20px 10px;
}

.wrap>div {
	margin: 1px; padding; 10 px;
	font-size: 5px;
}
.grid2 {
	grid-column-start: 2;
	grid-column-end: 3;
	grid-row-start: 2;
	grid-row-end: 6;
	background: lightskyblue;
 	border: 2px solid darkblue;
	height: 100%;
	width: 100%;
}
.grid4 {
	grid-column-start: 4;
	grid-column-end: 5;
	grid-row-start: 2;
	grid-row-end: 3;
	background: lightskyblue;
	border: 2px solid darkblue;
	height: 100%;
	width: 100%;
}
.grid4_1 {
	grid-column-start: 4;
	grid-column-end: 5;
	grid-row-start: 4;
	grid-row-end: 6;
	height: 100%;
	width: 100%;
}
.button {
  border: none;
  color: white;
  width: 50%;
  heigth:100%;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.button2:hover {
  background-color: #008CBA;
  color: white;
}
</style>
</head>
<body>
<div class="wrap">
	<div class="grid2">
		<p>로고이미지</p>
	</div>
	<div class="grid4">
		<p><small>로그인/고객문의</small></p>
	</div>
	<div class="grid4_1">
		<button class="button button2">마이페이지</button>
		<button class="button button2">예약내역</button>
	</div>
	
</div>
</body>
</html>