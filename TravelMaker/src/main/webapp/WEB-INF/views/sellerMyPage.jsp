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
	function ss(){
		alert('계정정보가 없어서 로그인 못하지롱~~');
		location.href = "login";
	}
</script>
</head>
<body> 
	<c:if test = '${seller==null}'>
		<script>
			ss();
		</script>
	</c:if> 
	<h1>${seller.sellerID}님 정보</h1> 
	
</body>
</html>