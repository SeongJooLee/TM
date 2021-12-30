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
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />
<script>
	function homeReturnOne(){
		alert('예약정보가 업데이트되었습니다');
		location.href='${contextPath}/admin/mypage';
		}
	function homeReturnTwo(){
		alert('성공적으로 삭제되었습니다');
		location.href='${contextPath}/admin/mypage';
		}
</script>
</head>
<body>
<jsp:include page="/resources/include/header.jsp" />

<c:if test='${result==1}'>
	<script>
		homeReturnOne();
	</script>
</c:if>

<c:if test='${deleteResult==1}'>
	<script>
		homeReturnTwo();
	</script>
</c:if>
<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>