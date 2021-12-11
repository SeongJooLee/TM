<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  %>
	<%@page session='false' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <c:if test = '${userSession.id==null}'>
		<script>
			ss();
		</script>
	</c:if>  --%>
테스트홈페이지
${userSession.id}
</body>
</html>