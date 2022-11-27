<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/jquery-seat-charts1.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/stylechoosecar3.css">
    </head>

    <body>
        <header id="header">
            <jsp:include page="menu.jsp"></jsp:include>
            </header><!-- #header -->


            <!--    Login, Register, Forgot Password, Confirm email-->

        <jsp:include page="login.jsp"></jsp:include>

            <!--    END Login, Register, Forgot Password, Confirm email-->

            <!-- start banner Area -->
            <section class="about-banner relative" style="height: 30vh">
                <div class="overlay overlay-bg"></div>
                <div class="container">
                    <div class="row d-flex align-items-center justify-content-center">
                        <div class="about-content col-lg-12">
                            <h1 class="text-white">
                                [Ticket]${requestScope.trip.route.routeName}
                            </h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End banner Area -->

            <!-- Start destinations Area -->
            <section class="destinations-area section-gap" style="margin-top: -80px;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12" >
<!--                            <h2 style="text-align: center; color: #FC3B1F"></h2>-->
                            <div class="main-infor mt-10" style="padding: 10px;">
                                <div class="information col-md-12">
                                    <div class="driver col-md-6">
                                        <img class="col-md-6" src="${requestScope.trip.driver.driverPicture}">
                                        <div class="driver-information col-md-6">
                                            <h5 style="color: #c69500">Driver:</h5>
                                            <h4 style="text-align: center;">${requestScope.trip.driver.driverName}</h4>
                                            <p>Sex: <span style="color: #F89029">${requestScope.trip.driver.sex eq false ? "Female":"Male"}</span>  </p> 
                                            <p>Birthday: <span style="color: #F89029">${requestScope.trip.driver.DOB}</span> </p>
                                        </div>
                                    </div>
                                        <div class="trip-information col-md-5"  >
                                        <p>Vehicle Type: <span style="color: #F89029">${requestScope.trip.vehicle.vehicleName}</span> </p>
                                        <p>Date: <span style="color: #F89029">${requestScope.trip.startDateTime}</span> </p>
                                        <p>Start time: <span style="color: #F89029">${requestScope.trip.startTime}</span> </p>
                                    </div>
                                </div>
                                <div class="choose-ticket col-md-12" style="border: 1px solid #258391; margin-top: -6px">
                                        <div class="container-seat col-md-12"  >
<!--                                            <h4 class="text-center col-md-12" style="font-size: 40px" >Choosing seats</h1>-->
                                                <div class="seat-map-seat col-md-6" style="border:none">
                                                    <div class="text-center front-indicator-seat">
                                                        Choosing
                                                    </div>
                                                </div>
                                                <div class="booking-details-seat col-md-6" style="border-left: 2px dashed #656776">
                                                    <h2 style="font-size: 30px;font-weight: bold; margin-top: 3px">Booking Details</h2>
                                                    <h3 style="font-size: 20px"> Selected Seats (<span
                                                            class="counter-seat">0</span>):
                                                    </h3>
                                                    <ul class="selected-seats"></ul>
                                                    <div class="check-out">
                                                        <p class="total-content">
                                                            Total: 
                                                            <span class="total-seat" style="color: red">0</span> VNĐ
                                                        </p>
                                                        <button
                                                            class=" checkout-button-seat"
                                                            type="button">Checkout</button>
                                                    </div>
                                                    <div id="legend"></div>
                                                </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End destinations Area -->

            <!-- start footer Area -->
            <footer class="footer-area section-gap">
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
                                    <li><img src="${pageContext.request.contextPath}/client/img/i1.jpg" alt=""></li>
                                <li><img src="${pageContext.request.contextPath}/client/img/i2.jpg" alt=""></li>
                                <li><img src="${pageContext.request.contextPath}/client/img/i3.jpg" alt=""></li>
                                <li><img src="${pageContext.request.contextPath}/client/img/i4.jpg" alt=""></li>
                                <li><img src="${pageContext.request.contextPath}/client/img/i5.jpg" alt=""></li>
                                <li><img src="${pageContext.request.contextPath}/client/img/i6.jpg" alt=""></li>
                                <li><img src="${pageContext.request.contextPath}/client/img/i7.jpg" alt=""></li>
                                <li><img src="${pageContext.request.contextPath}/client/img/i8.jpg" alt=""></li>
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
        <script src="${pageContext.request.contextPath}/client/js/jquery.seat-charts.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/validation.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/validationSignUp.js"></script>
        <jsp:include page="/client/seat-script.jsp"></jsp:include>
    </body>
</html>
