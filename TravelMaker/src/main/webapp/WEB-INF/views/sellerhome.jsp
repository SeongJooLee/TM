<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function success(){
		alert('${userSession.sellerID}님 미친듯이 환영합니다~!!!!!');
		location.href='../';
	}
	function fail(){
		alert('다시 로그인해라~!!!!!!!!!');
		location.href='../member/login';
	}
</script>
</head>
<body>
	<c:if test='${userSession.sellerID!=null}'>
		<script>
			success();
		</script>
	</c:if>
	<c:if test='${userSession.sellerID==null}'>
		<script>
			fail();
		</script>
	</c:if>
</body>
</html>