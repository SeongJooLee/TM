<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travelAddDone</title>
</head>
<body>

<script>
	alert("글이 생성되었습니다.");
	location.href="../travel";
</script>

	<h1> 3초 후 /board/travel로 이동합니다. </h1>
	
	<script>
		setTimeout(function() {
			location.href='../travel';
		} ,3000);	
	</script>
</body>
</html>