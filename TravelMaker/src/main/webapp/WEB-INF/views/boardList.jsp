<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  button{
    -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  
  background: var(--button-bg-color);
  color: var(--button-color);
  
  margin: 0;
  padding: 0.5rem 1rem;
  
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;
  
  border: none;
  border-radius: 4px;
  
  display: inline-block;
  width: auto;
  
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  
  cursor: pointer;
  
  transition: 0.5s;
  }
  </style>
</head>
<body>
<div class="container-fluid">
  <h1>회원 목록 만들기 </h1>
  <div class="row">
    <div class="col-sm-1" >빈칸</div>
    <div class="col-sm-2" style="background-color:lavender;">
    	<br>
    	<div>
			<button> 회원 목록 </button>
    	</div>
    	<br>
    	<br>
    	<div>
    		<button> 내 글 목록</button>
    	</div>
    	<br>
    	<br>
    	<div>
			<button> 추천한 글 </button>
    	</div>
    	<br>
    	<br>
    	<div>
    		<button> 예약확인 </button>
    	</div>
    	<br>
    	<br>
    </div>
    <div class="col-sm-1" >빈칸</div>
    <div class="col-sm-7" style="background-color:lavenderblush;" style="text-align:center">
    	<div  position="center"  style="width:20%; heigth:20%; border:2px solid blue;">
    		<p>예약내역</p>
    	</div>
    </div>
  </div>
</div>
</body>
</html>