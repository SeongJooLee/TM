<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%       
   request.setCharacterEncoding("utf-8");
 %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>NoticeViewImage</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />

    <!-- Demo styles -->
    <style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width: 500px;
        height: 500px;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 500px;
        height: 500px;
        object-fit: cover;
      }

      .swiper {
        margin-left: auto;
        margin-right: auto;
      }
    </style>
  </head>

  <body>
    <!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">

		<c:if test="${not empty image.image1 && image.image1 !='null' }">
		<div class="swiper-slide">
		<input type="hidden" id="originalFileName" name="image1" value="${image.image1 }" />
		<img src="${contextPath }/download?image=${image.image1}&noticeNO=${notice.noticeNO}&name=${notice.name}" />
		</div>
		</c:if>
		
		<c:if test="${not empty image.image2 && image.image2 !='null' }">
		<div class="swiper-slide">
			<input type="hidden" id="originalFileName" name="image2" value="${image.image2 }" />
			<img src="${contextPath }/download?image=${image.image2}&noticeNO=${notice.noticeNO}&name=${notice.name}">
		</div>
		</c:if>

		<c:if test="${not empty image.image3 && image.image3 !='null' }">
		<div class="swiper-slide">
			<input type="hidden" id="originalFileName" name="image3" value="${image.image3 }" />
			<img src="${contextPath }/download?image=${image.image3}&noticeNO=${notice.noticeNO}&name=${notice.name}">
		</div>
		</c:if>
		
		<c:if test="${not empty image.image4 && image.image4 !='null' }">
		<div class="swiper-slide">
			<input type="hidden" id="originalFileName" name="image4" value="${image.image4 }" />
			<img src="${contextPath }/download?image=${image.image4}&noticeNO=${notice.noticeNO}&name=${notice.name}">
		</div>
		</c:if>
		
		<c:if test="${not empty image.image5 && image.image5 !='null' }">
		<div class="swiper-slide">
			<input type="hidden" id="originalFileName" name="image5" value="${image.image5 }" />
			<img src="${contextPath }/download?image=${image.image5}&noticeNO=${notice.noticeNO}&name=${notice.name}">
		</div>
		</c:if>
		
		<c:if test="${not empty image.image6 && image.image6 !='null' }">
		<div class="swiper-slide">
			<input type="hidden" id="originalFileName" name="image6" value="${image.image6 }" />
			<img src="${contextPath }/download?image=${image.image6}&noticeNO=${notice.noticeNO}&name=${notice.name}">
		</div>
		</c:if>
		
		<c:if test="${not empty image.image7 && image.image7 !='null' }">
		<div class="swiper-slide">
			<input type="hidden" id="originalFileName" name="image7" value="${image.image7 }" />
			<img src="${contextPath }/download?image=${image.image7}&noticeNO=${notice.noticeNO}&name=${notice.name}">
		</div>
		</c:if>
		
		<c:if test="${not empty image.image8 && image.image8 !='null' }">
		<div class="swiper-slide">
			<input type="hidden" id="originalFileName" name="image8" value="${image.image8 }" />
			<img src="${contextPath }/download?image=${image.image8}&noticeNO=${notice.noticeNO}&name=${notice.name}">
		</div>
		</c:if>
		
		<c:if test="${not empty image.image9 && image.image9 !='null' }">
		<div class="swiper-slide">
			<input type="hidden" id="originalFileName" name="image9" value="${image.image9 }" />
			<img src="${contextPath }/download?image=${image.image9}&noticeNO=${notice.noticeNO}&name=${notice.name}">
		</div>
		</c:if>
		
		<c:if test="${not empty image.image10 && image.image10 !='null' }">
		<div class="swiper-slide">
			<input type="hidden" id="originalFileName" name="image10" value="${image.image10 }" />
			<img src="${contextPath }/download?image=${image.image10}&noticeNO=${notice.noticeNO}&name=${notice.name}">
		</div>
		</c:if>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>
  </div>							

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
  </body>
</html>
