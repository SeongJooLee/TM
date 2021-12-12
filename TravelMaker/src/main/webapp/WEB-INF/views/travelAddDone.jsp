<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travelAddDone</title>
</head>
<body>
	<!-- 컨트롤러에서 넘어온 ret값을 이용하여 -->

<!--  0이면 에러 표시 -->
<c:if test="${ret == 0 }">
	<h1> 사용자 등록에 실패했습니다! </h1>
</c:if>

<!--  0이 아니면 성공 표시 -->
<c:if test="${ret != 0 }">
	<h1> 사용자 등록에 성공했습니다! </h1>
</c:if>	

	<h1> 3초 후 /board/list로 이동합니다. </h1>
	
	<script>
		setTimeout(function() {
			location.href='/board/travel';
		} ,3000);	
	</script>
</body>
</html>