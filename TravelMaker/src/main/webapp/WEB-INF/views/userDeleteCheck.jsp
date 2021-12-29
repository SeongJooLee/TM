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
function check(){
	var result = confirm("탈퇴할거니");
	if(result){
		location.href = "${contextPath}/member/mypage/delete/?userId=${userSession.id}";
	}else{
	    location.href='${contextPath}/member/mypage';
	}
}
</script>
</head>
<body>
	<c:if test='${true}'>
		<script>
			check();
		</script>
	</c:if>
</body>
</html>