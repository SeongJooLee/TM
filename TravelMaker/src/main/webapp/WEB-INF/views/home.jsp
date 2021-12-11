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
    <jsp:include page="../../include/header.jsp" />
        <!-- Responsive navbar-->
        
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="<c:url value="/resources/img/bf.PNG" />" width="200" height="100" alt="..." /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">민수의 여행사이트</h1>
                    <p>민수와 여행을 같이 떠나볼까요~?</p>
                    
                </div>
            </div>
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">테마게시판 !!</p></div>
            </div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card One</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div> -->
                        <img  src="<c:url value="/resources/img/bf.PNG" />" width="100%" height="100%" /> 
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">제목1</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card Two</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id dolore voluptates quos eligendi labore.</p>
                        </div> -->
                        <img  src="<c:url value="/resources/img/pop.PNG" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">제목2</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card Three</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div> -->
                        <img  src="<c:url value="/resources/img/rava.PNG" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">제목3</a></div>
                    </div>
                </div>
                
                <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">홍보상품 !!</p></div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card Three</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div> -->
                        <img  src="<c:url value="/resources/img/rava.PNG" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">제목3</a></div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <!-- <div class="card-body">
                            <h2 class="card-title">Card Three</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
                        </div> -->
                        <img  src="<c:url value="/resources/img/rava.PNG" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">제목3</a></div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <img  src="<c:url value="/resources/img/rava.PNG" />" width="100%" height="100%" />
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">제목3</a></div>
                    </div>
                </div>
                
                
            
            </div>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
