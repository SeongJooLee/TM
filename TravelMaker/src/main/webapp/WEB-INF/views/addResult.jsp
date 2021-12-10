<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="false" %>

<!DOCTYPE html>

<html>
<head>
<script>
	var a = ${result}
	function ss(){
	alert('회원가입이 완료되었습니다.');
	location.href = "../";
	}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if var='ret' test = '${result==1}'>
		<script>
			ss();
		</script>
	</c:if>
</body>
</html>