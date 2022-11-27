<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="colorlib">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>Car Booking</title>

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/linearicons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/jquery-ui.css">				
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/nice-select.css">							
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/animate.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/owl.carousel.css">				
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css">
        <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        
<!--        test-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/datalist2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/coupon.css">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    </head>
    
    <body>
        <header id="header">
            <jsp:include page="menu.jsp"></jsp:include>
        </header>
<!--    Login, Register, Forgot Password, Confirm email-->

        <jsp:include page="login.jsp"></jsp:include>


<!--    END Login, Register, Forgot Password, Confirm email-->
        <!-- #header -->
        <!-- start banner Area -->
        <section class="banner-area relative">
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div class="row fullscreen align-items-center justify-content-between">
                    <div class="col-lg-12 col-md-12 mt-60 pt-60">
<!--                        <h6 class="text-white">Away from monotonous life</h6>-->
                    <c:if test="${sessionScope.LOGIN_USER!=null}">
                        <h1 class="text-white" style="font-size: 400%">Hello, ${sessionScope.LOGIN_USER.username}!</h1>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER==null}">
                        <h1 class="text-white" style="font-size: 500%">Magical Travel</h1>
                        <p class="text-white" style="font-size: 120%">
                            If you are looking at blank cassettes on the web, you may be very confused at the difference in
                            price. You may see some for as low as $.17 each.
                        </p>
                    </c:if>                      
<!--                        <a href="#" class="primary-btn text-uppercase">Get Started</a>-->
                    </div>
                    <div class="col-lg-12 col-md-12 banner-right" style="margin-top: -40px; height: 300px;">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <h3 class="nav-link bg-white" style="cursor: pointer; color: #00b3ee">
                                    <i class="fa fa-bus" aria-hidden="true" style="padding-right: 10px">    Booking</i></h3>
                                <!-- <a class="nav-link active" id="flight-tab" data-toggle="tab" href="#flight" role="tab"
                                        aria-controls="flight" aria-selected="true">Book A Car</a> -->
                            </li>
                        </ul>

                        <div class="tab-content" id="myTabContent" style="height: 10vh"> 
                            <div class="tab-pane fade show active row" id="flight" role="tabpanel">
                                <form class="form-wrap col-md-12" style="display: inline-flex" action="book" id="searchTripForm">
                                    <div id="universe" class="col-md-7 d-flex" style="margin:-39px 0 0 -20px;">
                                        <i class="fa-sharp fa-solid fa-location-dot" style="font-size: 50px;margin-top: 15px;color: #36b9cc"></i>
                                        <ul class="select-list-group" id="listone">
                                            <li>
                                                <div class="col-md-12">
                                                    <div>
                                                        <input type="text" class="select-list-group__search" placeholder="Place . . ." id="data1" autocomplete="off"
                                                               style="font-size: 25px" name="routeName" required=""/>
                                                        <input type="hidden" name="routeID" value="" id="routeIDInput">
                                                    </div>
                                                    <ul class="select-list-group__list" data-toggle="false" style="margin-left: 0px">
                                                        <c:forEach var="route" items="${requestScope.LIST_ROUTE}">
                                                            <li value="${route.routeID}" class="select-list-group__list-item" id="routeID" data-display="true" data-highlight="false">${route.routeName}</li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    
                                    <div class="col-md-3 d-flex" style=" margin-left: 25px">
                                        <i  class="fa-solid fa-calendar-days" style="font-size: 50px; margin: -20px 0 0 0px;padding-left: 0px;color: #36b9cc"></i>
<!--                                        <input type="date" name="start" class="form-control" id="inputDateSearch" aria-describedby="emailHelp"
                                               autocomplete="off" placeholder="Enter Start Date" required=""
                                               style="margin: -35px 0 0 0; height: 9vh;font-size: 25px; border: none">-->
                                        <input type="text" class="form-control date-picker "  name="start" placeholder="Start " autocomplete="off"
                                           onfocus="this.placeholder = ''" onblur="this.placeholder = 'Start'"value="${java.time.LocalDate.now()}"
                                        style="margin: -35px 0 0 0; height: 9vh;font-size: 25px; border: none" id="inputDateSearch" required="">
                                    </div>

                                        <input type="submit" class="primary-btn text-uppercase col-md-2 float-right"
                                               style="height: 10vh; margin: -40px 0 0 15px; font-size: 20px" name="action" value="Search" id="findTrip"/>
                                        <input type="hidden" name="page" value="1">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End banner Area -->

        <!-- Start popular-destination Area -->
        <section class="recent-blog-area">
            <div class="container">
                <div class="row d-flex justify-content-center align-items-center">
                    <div class="menu-content pb-60 col-lg-9">
                        <div class="title text-center">
                            <h1 class="mb-10 mt-30">Popular Route</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="active-recent-blog-carusel">
                        <div class="single-recent-blog-post item">
                            <div class="">
                                <div class="overlay overlay-bg"></div>
                                <img class="img-fluid" 
                                     src="https://storage.googleapis.com/vex-config/cms-tool/destination/images/3/img_hero.png" 
                                     alt="">
                            </div>
                            <div class="desc text-center mt-10">
                                <h4>Sài Gòn - Đà Lạt</h4>
                                <a href="#" class="price-btn">150.000đ</a>
                                <del href="#" class="price-btn ml-10">200.000đ</del>
                            </div>
                        </div>
                        <div class="single-recent-blog-post item">
                            <div class="thumb">
                                <div class="overlay overlay-bg"></div>
                                <img class="img-fluid" 
                                     src="https://storage.googleapis.com/vex-config/cms-tool/destination/images/5/img_hero.png?v1" 
                                     alt="">
                            </div>
                            <div class="desc text-center mt-10">
                                <h4>Sài Gòn - Nha Trang</h4>
                                <a href="#" class="price-btn">231.000đ</a>
                                <!-- <del href="#" class="price-btn ml-10">200.000đ</del> -->
                            </div>
                        </div>
                        <div class="single-recent-blog-post item">
                            <div class="thumb">
                                <div class="overlay overlay-bg"></div>
                                <img class="img-fluid" src="https://storage.googleapis.com/vex-config/cms-tool/destination/images/20/img_hero.png?v1" alt="">
                            </div>
                            <div class="desc text-center mt-10">
                                <h4>Sài Gòn - Đà Nẵng</h4>
                                <a href="#" class="price-btn">231.000đ</a>
                                <!-- <del href="#" class="price-btn ml-10">200.000đ</del> -->
                            </div>
                        </div>
                        <div class="single-recent-blog-post item">
                            <div class="thumb">
                                <div class="overlay overlay-bg"></div>
                                <img class="img-fluid" src="https://storage.googleapis.com/vex-config/cms-tool/destination/images/27/img_hero.png" alt="">
                            </div>
                            <div class="desc text-center mt-10">
                                <h4>Nha Trang - Sài Gòn</h4>
                                <a href="#" class="price-btn">240.000đ</a>
                                <!-- <del href="#" class="price-btn ml-10">200.000đ</del> -->
                            </div>
                        </div>
                        <div class="single-recent-blog-post item">
                            <div class="thumb">
                                <div class="overlay overlay-bg"></div>
                                <img class="img-fluid" src="https://storage.googleapis.com/vex-config/cms-tool/destination/images/21/img_hero.png" alt="">
                            </div>
                            <div class="desc text-center mt-10">
                                <h4>Sài Gòn - Vũng Tàu</h4>
                                <a href="#" class="price-btn">150.000đ</a>
                                <!-- <del href="#" class="price-btn ml-10">200.000đ</del> -->
                            </div>
                        </div>
                        <div class="single-recent-blog-post item">
                            <div class="thumb">
                                <div class="overlay overlay-bg"></div>
                                <img class="img-fluid" src="https://storage.googleapis.com/vex-config/cms-tool/destination/images/24/img_hero.png" alt="">
                            </div>
                            <div class="desc text-center mt-10">
                                <h4>Sài Gòn - Buôn Ma Thuột</h4>
                                <a href="#" class="price-btn">270.000đ</a>
                                <del href="#" class="price-btn ml-10">300.000đ</del>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-destination Area -->

        <!-- Start other-issue Area -->
        
            <section class="recent-blog-area">
                <div class="container">
                    <div class="row d-flex justify-content-center align-items-center">
                        <div class="menu-content pb-60 col-lg-9">
                            <div class="title text-center">
                                <h1 class="mb-10 mt-30">Coupon</h1>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin: auto">
                        
                            <div class="active-recent-blog-carusel"> 
                            <c:forEach var="coupon" items="${requestScope.LIST_COUPON}">
                                <div class="">
                                    <div class="single-other-issue">
                                        
                                        <div class="coupon">
                                            <h3 style="padding-top: 10px">Discount Coupon</h3>
                                            <h2>${coupon.percent}%</h2>
                                            <h5>Off All Trips</h5>
                                            <h5>Number of Coupon: (${coupon.count})</h5>
                                            <p>Valid to: ${coupon.expiryDate} at ${coupon.expiryTime.getHours()}h${coupon.expiryTime.getMinutes()}m</p>
                                        </div>
                                        
                                        <div class="get-coupon">
                                            <c:if test="${sessionScope.LOGIN_USER==null}">
                                                <button type="button" class="login text-light" data-toggle="modal" data-target="#loginForm"
                                                    style="width: 100%;height: 50px;font-size: 30px" >
                                                Get Now!
                                            </button>
                                            </c:if>
                                            <c:if test="${sessionScope.LOGIN_USER!=null}">
                                            <a href="${pageContext.request.contextPath}/Coupon?action=getCoupon&couponID=${coupon.couponID}&numOfCoupon=${coupon.count}">Get Now!</a>
                                            </c:if>
                                        </div>
                                        
                                    </div>
                                </div>
                           </c:forEach>
                        </div>
                        
                        
                    </div>
                </div>
            </section>
        
        
        <!-- End other-issue Area -->

        <!-- Start Platform and connect -->
        <section class="other-issue-area">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content pb-70 col-lg-9">
                        <div class="title text-center">
                            <h1 class="mb-10">Platform and networks</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="single-other-issue d-flex flex-col justify-content-centerc align-items-center">
                            <div class="mr-20">
                                <i style="font-size:60px; color: blue;" class="fa fa-bus" aria-hidden="true"></i>
                            </div>
                            <div class="p-100" href="#"zz>
                                <h4>2000+ nhà xe chất lượng cao</h4>
                                <p>5000+ tuyến đường trên toàn quốc, chủ động và đa dạng lựa chọn.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="single-other-issue d-flex flex-col justify-content-centerc align-items-center">
                            <div class="mr-20">
                                <i style="font-size:60px; color: yellow;" class="fa fa-ticket" aria-hidden="true"></i>
                            </div>
                            <div class="p-100" href="#">
                                <h4>Đặt vé dễ dàng</h4>
                                <p>Đặt vé chỉ với 60s. Chọn xe yêu thích cực nhanh và thuận tiện.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="single-other-issue d-flex flex-col justify-content-centerc align-items-center">
                            <div class="mr-20">
                                <i style="font-size:60px; color: green;" class="fa fa-check-circle-o" aria-hidden="true"></i>
                            </div>
                            <div class="p-100" href="#">
                                <h4>2000+ nhà xe chất lượng cao</h4>
                                <p>5000+ tuyến đường trên toàn quốc, chủ động và đa dạng lựa chọn.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="single-other-issue d-flex flex-col justify-content-centerc align-items-center">
                            <div class="mr-20">
                                <i style="font-size:60px; color: red;" class="fa fa-tags" aria-hidden="true"></i>
                            </div>
                            <div class="p-100" href="#">
                                <h4>2000+ nhà xe chất lượng cao</h4>
                                <p>5000+ tuyến đường trên toàn quốc, chủ động và đa dạng lựa chọn.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Platform and connect -->

        <!-- Start Gas station -->
        <section class="other-issue-area">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content pb-70 col-lg-9">
                        <div class="title text-center">
                            <h1 class="mb-10">Gas Station</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="single-other-issue">
                            <div class="thumb">
                                <img class="img-fluid" src="https://storage.googleapis.com/fe-production/images/bx-mien-dong.jpg" alt="">
                            </div>
                            <a href="#">
                                <h4 class="text-center">Bến Xe Miền Đông</h4>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="single-other-issue">
                            <div class="thumb">
                                <img class="img-fluid" src="https://storage.googleapis.com/fe-production/images/bx-nuoc-ngam.jpg" alt="">
                            </div>
                            <a href="#">
                                <h4 class="text-center">Bến Xe Miền Tây</h4>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="single-other-issue">
                            <div class="thumb">
                                <img class="img-fluid" src="https://storage.googleapis.com/fe-production/images/bx-gia-lam.jpg" alt="">
                            </div>
                            <a href="#">
                                <h4 class="text-center">Bến Xe An Sương</h4>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="single-other-issue">
                            <div class="thumb">
                                <img class="img-fluid" src="https://storage.googleapis.com/fe-production/images/bx-my-dinh.jpg" alt="">
                            </div>
                            <a href="#">
                                <h4 class="text-center">Bến Xe Gia Lâm</h4>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Gas station -->

        <!-- start footer Area -->
        <footer class="footer-area">
            <div class="container">

                <div class="row">
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>About Agency</h6>
                            <p>
                                The world has become so fast paced that people don’t want to stand by reading a page of
                                information, they would much rather look at a presentation and understand the message. It
                                has come to a point
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Navigation Links</h6>
                            <div class="row">
                                <div class="col">
                                    <ul>
                                        <li><a href="#">Home</a></li>
                                        <li><a href="#">Feature</a></li>
                                        <li><a href="#">Services</a></li>
                                        <li><a href="#">Portfolio</a></li>
                                    </ul>
                                </div>
                                <div class="col">
                                    <ul>
                                        <li><a href="#">Team</a></li>
                                        <li><a href="#">Pricing</a></li>
                                        <li><a href="#">Blog</a></li>
                                        <li><a href="#">Contact</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget">
                            <h6>Newsletter</h6>
                            <p>
                                For business professionals caught between high OEM price and mediocre print and graphic
                                output.
                            </p>
                            <div id="mc_embed_signup">
                                <form target="_blank"
                                      action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                      method="get" class="subscription relative">
                                    <div class="input-group d-flex flex-row">
                                        <input name="EMAIL" placeholder="Email Address" onfocus="this.placeholder = ''"
                                               onblur="this.placeholder = 'Email Address '" required="" type="email">
                                        <button class="btn bb-btn"><span class="lnr lnr-location"></span></button>
                                    </div>
                                    <div class="mt-10 info"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3  col-md-6 col-sm-6">
                        <div class="single-footer-widget mail-chimp">
                            <h6 class="mb-20">InstaFeed</h6>
                            <ul class="instafeed d-flex flex-wrap">
                                <li><img src="img/i1.jpg" alt=""></li>
                                <li><img src="img/i2.jpg" alt=""></li>
                                <li><img src="img/i3.jpg" alt=""></li>
                                <li><img src="img/i4.jpg" alt=""></li>
                                <li><img src="img/i5.jpg" alt=""></li>
                                <li><img src="img/i6.jpg" alt=""></li>
                                <li><img src="img/i7.jpg" alt=""></li>
                                <li><img src="img/i8.jpg" alt=""></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row footer-bottom d-flex justify-content-between align-items-center">
                    <p class="col-lg-8 col-sm-12 footer-text m-0">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is
                        made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com"
                                                                                         target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                    <div class="col-lg-4 col-sm-12 footer-social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-dribbble"></i></a>
                        <a href="#"><i class="fa fa-behance"></i></a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End footer Area -->
        <div class="modal fade" id="showsuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="fa fa-check-circle" style="font-size:70px; color: greenyellow" aria-hidden="true"></i>
                        </div>
                        <h4 class="text-center font-weight-bold" style="margin:30px 0 40px 0;">${requestScope.CHECK_OUT_SUCCESS}</h4>
                    </div>
                </div>
            </div>
        </div>
                 
<!--        Show fail-->
        <div class="modal fade" id="showfail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="fa fa-window-close" style="font-size:70px; color: red" aria-hidden="true"></i>
                        </div>
                        <h4 class="text-center font-weight-bold" style="margin:30px 0 40px 0;">${requestScope.FAIL}</h4>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/client/js/vendor/jquery-2.2.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/vendor/bootstrap.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
        <script src="${pageContext.request.contextPath}/client/js/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/hoverIntent.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/superfish.min.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/jquery.ajaxchimp.min.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/jquery.nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/mail-script.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/validation.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/validationSignUp.js"></script>
        <script src="https://smtpjs.com/v3/smtp.js"></script>
        <script src="https://www.google.com/recaptcha/api.js"></script>
        
        <script src="${pageContext.request.contextPath}/client/js/datalist2.js"></script>
    </body>
        <c:if test="${requestScope.ACTIVE_LOGINFORM!=null}">
            <script>
            $(window).load(function () {
                $('#loginForm').modal('show');
            });
            </script>
        </c:if>
        <c:if test="${requestScope.ACTIVE_LOGINFORM!=null}">
            <script>
            $(window).load(function () {
                $('.toast').modal('show');
            });
            </script>
        </c:if>
        <c:if test="${requestScope.ERROR_FOR_LOGIN!=null}">
            <script>
            $(window).load(function () {
                $('#loginForm').modal('show');
            });
            </script>
        </c:if>
        <c:if test="${requestScope.ERROR_USERID!=null}">
            <script>
            $(window).load(function () {
                $('#registerForm').modal('show');
            });
            </script>
        </c:if>
        <c:if test="${requestScope.RESET_PASSWORD!=null}">
            <script>
            $(window).load(function () {
                $('#demo-2').modal('show');
            });
            </script>
        </c:if>
        <c:if test="${requestScope.ERROR_CODE!=null}">
            <script>
            $(window).load(function () {
                $('#confirmEmail').modal('show');
            });
            </script>
        </c:if>
        <c:if test="${requestScope.CHECK_MAIL!=null}">
            <script>
            $(window).load(function () {
                $('#confirmEmail').modal('show');
            });
            </script>
        </c:if>
        <c:if test="${requestScope.ACTIVE_ACCOUNT!=null}">
            <script>
                $(window).load(function () {
                    $('#activeAccount').modal('show');
                });
            </script>
        </c:if>
        <c:if test="${requestScope.CHECK_OUT_SUCCESS!=null}">
            <script>
                $(window).load(function () {
                    $('#showsuccess').modal('show');
                });
            </script>
        </c:if>
        <c:if test="${requestScope.FAIL!=null}">
            <script>
                $(window).load(function () {
                    $('#showfail').modal('show');
                });
            </script>
        </c:if>
         
	<script>
            const dayInput=document.getElementById('inputDateSearch');
            
            function getPreviousDay(date = new Date()) {
                const previous = new Date(date.getTime());
                previous.setDate(date.getDate() - 1);

                return previous;
              }
            function myFunction(){
                const currentDate=new Date();
                const previousDate=getPreviousDay(currentDate);
                let dayCheck=new Date(dayInput.value);
                if(previousDate>dayCheck){
                    console.log(previousDate);
                    document.getElementById('inputDateSearch').setCustomValidity('Day Start must higher or equal current day!');
                    return false;
                }else{
                    document.getElementById('inputDateSearch').setCustomValidity('');
                    return true;
                }
                return true;

            }
            var inputs = document.querySelectorAll('input:not([type="submit"])');


            var submit =  document.getElementById('findTrip');
            var form = document.getElementById('searchTripForm');
            
            submit.addEventListener('click', myFunction);
            form.addEventListener('submit', myFunction);
    </script>
</html>

