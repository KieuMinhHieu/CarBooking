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
            #paypal-payment-button{
                margin-top: 10px;
                width: 98px;
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
            <section class="about-banner relative">
                <div class="overlay overlay-bg"></div>
                <div class="container">
                    <div class="row d-flex align-items-center justify-content-center">
                        <div class="about-content col-lg-12">
                            <h1 class="text-white">
                                Recharge Money
                            </h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End banner Area -->

            <!-- Start destinations Area -->
            <section class="destinations-area section-gap">
                <h1 class="text-center">Recharge with Paypal or MoMo</h1>
                <div class="container">
                    <div id="accordion">
                        <div class="card">
                            <button class="btn" data-toggle="collapse" data-target="#momo" aria-expanded="true" aria-controls="collapseOne">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        MoMo 
                                    </h5>
                                </div>
                            </button>
                            <div id="momo" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/MoMoRequest" method="post">
                                    <input type="text" name="amount" value="${sessionScope.ORDER.totalPrice}" placeholder="Enter your money">
                                    <input type="submit" value="sendMoMo" name="action">
                                </form>                                    
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <button class="btn" data-toggle="collapse" data-target="#paypal" aria-expanded="true" aria-controls="collapseOne">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    Paypal 
                                </h5>
                            </div>
                        </button>
                        <div id="paypal" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">
                                <form action="PayPalRequest" method="post">

                                    <input type="text" name="amount" value="${sessionScope.ORDER.totalPrice}" placeholder="Enter your money" oninput="myFunc()">
<!--                                    <div id="paypal-payment-button" role="button"></div>-->

                                    <input type="submit" name="action" value="sendPayPal">
                                </form>                               
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <button class="btn" data-toggle="collapse" data-target="#vnpay" aria-expanded="true" aria-controls="collapseOne">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    Vnpay 
                                </h5>
                            </div>
                        </button>
                        <div id="vnpay" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">
                                <form action="VnpayRequest" method="post">
                                    <input type="text" name="amount" value="${sessionScope.ORDER.totalPrice}" placeholder="Enter your money">
                                    <input type="submit" name="action" value="sendVnpay">
                                </form>                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Shop Product End -->
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
        <div class="modal fade" id="showsuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="fa fa-check-circle" style="font-size:70px; color: greenyellow" aria-hidden="true"></i>
                        </div>
                        <h4 class="text-center font-weight-bold" style="margin-top: 20px">${requestScope.MONEY_RECHARGE_SUCCESS}</h4>
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
                            <i class="fa fa-ban" style="font-size:70px; color: red" aria-hidden="true"></i>
                        </div>
                        <h4 class="text-center font-weight-bold" style="margin-top: 20px">${requestScope.MONEY_RECHARGE_FAIL}</h4>
                        <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">Close</button>
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
        <script src="${pageContext.request.contextPath}/client/js/jquery.seat-charts.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/validation.js"></script>
        <script src="${pageContext.request.contextPath}/client/js/validationSignUp.js"></script>
        <script src="https://www.paypal.com/sdk/js?client-id=AX4UhpEHB2X515a9jh0AddikEHLWVWa9Kcf768IagpsshpnxgJjEmJU_nmNWHN2EMmRRhNsqkp4Xp0mm&disable-funding=credit,card" data-namespace="paypal_sdk"></script>
        <script>
            <c:if test="${requestScope.MONEY_RECHARGE_SUCCESS!=null}">
                $(document).ready(function (e) {
                    $("#showsuccess").modal('show');
                });
            </c:if>
            <c:if test="${requestScope.MONEY_RECHARGE_FAIL!=null}">
                $(document).ready(function (e) {
                    $("#showerror").modal('show');
                });
            </c:if>
        </script>
    </body>
</html>
