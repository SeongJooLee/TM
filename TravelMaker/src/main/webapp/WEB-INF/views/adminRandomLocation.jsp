<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>
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
	function notice(){
		alert('해당 notice 게시물로 이동합니다');
		location.href='/tm/board/notice/view?noticeNO=${notice.noticeNO}';
		}
	function promotion(){
		alert('해당 promotion 게시물로 이동합니다');
		location.href='/tm/board/promotion/view?promotionNO=${promotion.promotionNO}';
	}
	function travel(){
		alert('해당 travel 게시물로 이동합니다');
		location.href='/tm/board/travel/view?travelNO=${travel.travelNO}';
	}
	function review(){
		alert('해당 review 게시물로 이동합니다');
		location.href='/tm/board/review/view?reviewNO=${review.reviewNO}';
	}
</script>
</head>
<body>
<jsp:include page="/resources/include/header.jsp" />

	<c:choose>
		<c:when test='${notice != null}'>
			<script>
				notice();
			</script>
		</c:when>
		<c:when test='${promotion != null}'>
			<script>
				promotion();
			</script>
		</c:when>
		<c:when test='${travel != null}'>
			<script>
				travel();
			</script>
		</c:when>
		<c:when test='${review != null}'>
			<script>
				review();
			</script>
		</c:when>
	
	</c:choose>
	<jsp:include page="/resources/include/footer.jsp" />
</body>
</html>