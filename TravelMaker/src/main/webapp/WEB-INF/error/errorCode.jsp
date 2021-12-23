<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>오류 페이지</title>

  <!-- CSS style sheets taken from https://sourcegraph.d.musta.ch/airbnb/airbnb/-/blob/app/views/routes/helpful_404.html.erb -->
  <link href="https://a0.muscache.com/airbnb/static/packages/dls/common_o2.1_cereal-4e0adc51966c85fefe84f5454591ffe2.css" media="all" rel="stylesheet" type="text/css">
  <link href="https://a0.muscache.com/airbnb/static/error_pages_pretzel-8249b587d67dfc3b37f6db39ec0a80f1.css" media="all" rel="stylesheet" type="text/css">

</head>

<body>

  <div class="page-container page-container-responsive">
    <div class="row space-top-8 space-8">
        <div class="col-5 col-middle">
          <h1 class="text-jumbo text-ginormous">아이고!</h1>
          <h2>찾으시는 페이지가 없습니다.</h2>
          <h6>오류 번호 : 404 not found</h6>
          <ul class="list-unstyled">
            <li><a style="color: #008489;" href="/tm">메인 화면으로 돌아가기</a></li>
            <li><a style="color: #008489;" href="https://i.ytimg.com/vi/POurA_Qph8Q/maxresdefault.jpg">떨어진 아이스크림이 안 아까우시다면?</a></li>

          </ul>
        </div>
        <div class="col-5 col-middle text-center">
          <img src="https://a0.muscache.com/airbnb/static/error_pages/404-Airbnb_final-d652ff855b1335dd3eedc3baa8dc8b69.gif" width="313" height="428" >
        </div>
      </div>  
    </div>

</body>
</html>
