<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function logout(){
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