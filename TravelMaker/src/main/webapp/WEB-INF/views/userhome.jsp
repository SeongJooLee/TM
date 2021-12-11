<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function logout(){
		alert('${userSession.id}님 미친듯이 환영합니다~!!!!!');
		location.href='../';
	}
</script>
</head>
<body>
<c:if test='${true}'>
		<script>
		logout();
		</script>
	</c:if>
</body>
</html>