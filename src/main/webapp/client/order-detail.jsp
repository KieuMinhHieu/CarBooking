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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/client/css/jquery.seat-charts.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/stylechoosecar.css">
        <style>
            .card-style1 {
                box-shadow: 0px 0px 10px 0px rgb(89 75 128 / 9%);
            }
            .border-0 {
                border: 0!important;
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0,0,0,.125);
                border-radius: 0.25rem;
            }

            section {
                padding: 120px 0;
                overflow: hidden;
                background: #fff;
            }
            .mb-2-3, .my-2-3 {
                margin-bottom: 2.3rem;
            }

            .section-title {
                font-weight: 600;
                letter-spacing: 2px;
                text-transform: uppercase;
                margin-bottom: 10px;
                position: relative;
                display: inline-block;
            }
            .text-primary {
                color: #ceaa4d !important;
            }
            .text-secondary {
                color: #15395A !important;
            }
            .font-weight-600 {
                font-weight: 600;
            }
            .display-26 {
                font-size: 1.3rem;
            }

            @media screen and (min-width: 992px){
                .p-lg-7 {
                    padding: 4rem;
                }
            }
            @media screen and (min-width: 768px){
                .p-md-6 {
                    padding: 3.5rem;
                }
            }
            @media screen and (min-width: 576px){
                .p-sm-2-3 {
                    padding: 2.3rem;
                }
            }
            .p-1-9 {
                padding: 1.9rem;
            }

            .bg-secondary {
                background: #15395A !important;
            }
            @media screen and (min-width: 576px){
                .pe-sm-6, .px-sm-6 {
                    padding-right: 3.5rem;
                }
            }
            @media screen and (min-width: 576px){
                .ps-sm-6, .px-sm-6 {
                    padding-left: 3.5rem;
                }
            }
            .pe-1-9, .px-1-9 {
                padding-right: 1.9rem;
            }
            .ps-1-9, .px-1-9 {
                padding-left: 1.9rem;
            }
            .pb-1-9, .py-1-9 {
                padding-bottom: 1.9rem;
            }
            .pt-1-9, .py-1-9 {
                padding-top: 1.9rem;
            }
            .mb-1-9, .my-1-9 {
                margin-bottom: 1.9rem;
            }
            @media (min-width: 992px){
                .d-lg-inline-block {
                    display: inline-block!important;
                }
            }
            .rounded {
                border-radius: 0.25rem!important;
            }
        </style>
    </head>

    <body>
        <header id="header">
            <jsp:include page="menu.jsp"></jsp:include>
            </header><!-- #header -->


            <!--    Login, Register, Forgot Password, Confirm email-->

        <jsp:include page="login.jsp"></jsp:include>

            <!--    END Login, Register, Forgot Password, Confirm email-->

            <!-- start banner Area -->
            <section class="about-banner relative" style="height: 28vh">
                <div class="overlay overlay-bg"></div>
                <div class="container">
                    <div class="row d-flex align-items-center justify-content-center">
                        <div class="about-content col-lg-12" style="margin-top: -70px">
                            <h1 class="text-white">
                                Profile
                            </h1>
                            <p class="text-white link-nav"><a href="/">Home </a> </p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End banner Area -->

            <!-- Start destinations Area -->
            <section class="bg-light mt-10"  style="margin-top: -70px">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 mb-4 mb-sm-5">
                            <div class="card card-style1 border-0" style="height: 35vh">
                                <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 mb-4 mb-lg-0">
                                            <img style="height: 28vh;margin-top: -25px"src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="...">
                                        </div>
                                        <div class="col-lg-6 px-xl-10">
                                            <div class="bg-secondary d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-1-9 rounded">
                                                <h3 class="h2 text-white mb-0">${sessionScope.LOGIN_USER.username}</h3>
                                        </div>
                                        <ul class="list-unstyled mb-1-9">
                                            <li class="mb-2 mb-xl-3 display-28" style="font-size: 22px"><span class="display-26 text-secondary me-2 font-weight-600">Email:</span> ${sessionScope.LOGIN_USER.email}</li>
                                            <li class="mb-2 mb-xl-3 display-28" style="font-size: 22px"><span class="display-26 text-secondary me-2 font-weight-600">Email:</span> ${sessionScope.LOGIN_USER.dob}</li>
                                            <li class="display-28" style="font-size: 22px"><span class="display-26 text-secondary me-2 font-weight-600">Phone:</span>${sessionScope.LOGIN_USER.phoneNumber}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 mb-4 mb-sm-5">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Ticket Detail</h6>
                            </div>
                            <div class="card-body">
                                <div class="">
                                    
                                    <table class="table table-bordered table-striped table-hover" id="dataTable">
                                        <thead>
                                            <tr>
                                                <th>Ticket ID</th>
                                                <th>Seat ID</th>
                                                <th>Trip ID</th>
                                                <th>Order ID</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.TICKET}" var="t"> 
                                                <tr>
                                                    <td>${t.ticketID}</td>
                                                    <td>${t.seat.seatID}</td>
                                                    <td>${t.trip.tripID}</td>
                                                    <td>${t.order.orderID}</td>
                                                </tr>
                                            </c:forEach>
                                        
                                        </tbody>
                                        
                                    </table>
                                    <form action="order" method="POST" style="margin-top: -55px"> 
                                            <input type="hidden" name="orderID" value="${requestScope.ORDER_ID}">
                                            <input type="submit" class="btn btn-secondary float-right" value="return" name="action">
                                    </form>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End destinations Area -->
        <div class="modal fade" id="showsuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="fa fa-check-circle" style="font-size:70px; color: greenyellow" aria-hidden="true"></i>
                        </div>
                        <c:if test="${requestScope.RETURN_ORDER_SUCCESS != null}"> <h4 class="text-center font-weight-bold" style="margin-top: 20px">${requestScope.RETURN_ORDER_SUCCESS}</h4> </c:if>
                        <c:if test="${requestScope.SUCCESS != null}"> <h4 class="text-center font-weight-bold" style="margin-top: 20px">${requestScope.SUCCESS}</h4> </c:if>
                        <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="showerror" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="fa fa-exclamation" style="font-size:70px; color: red" aria-hidden="true"></i>
                        </div>
                        <h4 class="text-center font-weight-bold" style="margin-top: 20px; color:red">${requestScope.ERROR}</h4>
                        <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
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
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>

        <script>
                            var flight_tab = document.querySelector("#flight-tab");
                            var hotel_tab = document.querySelector("#hotel-tab");
                            var holiday_tab = document.querySelector("#holiday-tab");

                            function AlwaysFlightClick() {
                                flight_tab.click();
                            }

                            function nextInFlights() {
                                hotel_tab.click();
                            }

                            function nextInHotels() {
                                holiday_tab.click();
                            }


            <c:if test="${requestScope.RETURN_ORDER_SUCCESS!=null}">
                            $(document).ready(function () {
                                $('#showsuccess').modal('show')
                            });
            </c:if>
            <c:if test="${requestScope.SUCCESS!=null}">
                            $(document).ready(function () {
                                $('#showsuccess').modal('show')
                            });
            </c:if>
            <c:if test="${requestScope.ERROR!=null}">
                            $(document).ready(function () {
                                $('#showerror').modal('show')
                            });
            </c:if>
        </script>
        <jsp:include page="/client/seat-script.jsp"></jsp:include>
    </body>

</html>
