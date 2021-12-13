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
	function success(){
		alert('${userSession.adminID}님 미친듯이 환영합니다~!!!!!');
		location.href='../';
	}
	function fail(){
		alert('다시 로그인해라~!!!!!!!!!');
		location.href='../member/login';
	}
</script>
</head>
<body>
	<c:if test='${userSession.adminID!=null}'>
		<script>
			success();
		</script>
	</c:if>
	<c:if test='${userSession.adminID==null}'>
		<script>
			fail();
		</script>
	</c:if>
</body>
</html>