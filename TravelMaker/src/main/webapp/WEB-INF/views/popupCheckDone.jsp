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
	function returnNotice(){
		alert('공지사항 상세보기로 이동됩니다');
		opener.location.href='/tm/board/notice/view?noticeNO=${notice.noticeNO}';
		self.close();
		}
	function returnPromotion(){
		alert('홍보상품 상세보기로 이동됩니다');
		opener.location.href='/tm/board/promotion/view?promotionNO=${promotion.promotionNO}';
		self.close();
		}
	function returnReview(){
		alert('이용후기 상세보기로 이동됩니다');
		opener.location.href='/tm/board/review/view?reviewNO=${review.reviewNO}';
		self.close();
		}
	function returnTravel(){
		alert('테마여행 상세보기로 이동됩니다');
		opener.location.href='/tm/board/travel/view?travelNO=${travel.travelNO}';
		self.close();
		}
</script>
</head>
<body>
	<c:choose>
		<c:when test='${notice!=null}'>
			<script>returnNotice();</script>
		</c:when>
		<c:when test='${promotion!=null}'>
			<script>returnPromotion();</script>
		</c:when>
		<c:when test='${review!=null}'>
			<script>returnReview();</script>
		</c:when>
		<c:when test='${travel!=null}'>
			<script>returnTravel();</script>
		</c:when>
	</c:choose>
</body>
</html>