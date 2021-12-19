<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Small Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet" />
       
    </head>
    <body>
    <jsp:include page="/resources/include/header.jsp" />
        <!-- Responsive navbar-->
        
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->

            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><a class="text-white m-0" href="${contextPath}/tm/board/notice">공지사항</a></div>
            </div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card One</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div> -->
                        <img  src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />" width="100%" height="100%" /> 
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="${contextPath}/tm/board/notice">공지사항</a><a class="title" href="${contextPath}/tm/board/notice/view?noticeNO=1"> 첫번째 글 연결</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card Two</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id dolore voluptates quos eligendi labore.</p>
                        </div> -->
                        <img  src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="${contextPath}/tm/board/notice">이벤트</a><a class="title" href="${contextPath}/tm/board/notice/view?noticeNO=2"> 두번째 글 연결</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card Three</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div> -->
                        <img  src="<c:url value="http://encosmall.kr/design/encos0720/shop/img/common/gonggi_top.jpg" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="${contextPath}/tm/board/notice">이벤트</a><a class="title" href="${contextPath}/tm/board/notice/view?noticeNO=3"> 세번째 글 연결</a></div>
                    </div>
                </div>
                
                <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><a class="text-white m-0" href="${contextPath}/tm/board/promotion">홍보상품</a></div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card Three</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div> -->
                        <img  src="<c:url value="https://blog.kakaocdn.net/dn/4EcjP/btquGWgVdxP/662m1kgoW6WVAkcZPXBs30/img.jpg" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="${contextPath}/tm/board/promotion">홍보상품</a><a class="title" href="#!"> 첫번째 홍보상품 글</a></div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card Three</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div> -->
                        <img  src="<c:url value="http://rgo4.com/files/attach/images/2676751/431/850/029/3788593f87c6c58876d68e0465a817aa.gif" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="${contextPath}/tm/board/promotion">홍보상품</a><a class="title" href="#!"> 두번째 홍보상품 글</a></div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <img  src="<c:url value="https://post-phinf.pstatic.net/MjAxOTAzMTNfNjUg/MDAxNTUyNDU0NTQwNjUz.yvVGf4GklXetQ8JfDMokhYSWi_AFvbpYM0dW49xWy6Ig.lhfTJzuFUtmLX5Sc-ZtW2-_wp6K2dqM9n6Bi3sRJqxog.GIF/%ED%87%B4%EC%82%AC%ED%9B%84%EB%B9%84%EB%A1%9C%EC%86%8C%EB%82%98%EB%8B%A4%EC%9A%B4%EC%9D%B8%EC%83%9D%EC%9D%B4%EC%8B%9C%EC%9E%91%EB%90%98%EC%97%88%EB%8B%A41.gif?type=w1200" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="${contextPath}/tm/board/promotion">홍보상품</a><a class="title" href="#!"> 세번째 홍보상품 글</a></div>
                    </div>
                </div>
                
                <a href="/tm/seongJooTest"> 성주 테스트 ㄱㄱ</a>
            
            </div>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <jsp:include page="/resources/include/footer.jsp" />
    </body>
</html>
