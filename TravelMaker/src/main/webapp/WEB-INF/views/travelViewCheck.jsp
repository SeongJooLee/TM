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
	function whffu(){
		alert('댓글생성');
		location.href='${contextPath}/board/travel/view?travelNO=${travel}';
		}
</script>
</head>
<body>
<script>
whffu();
</script>
</body>
</html>