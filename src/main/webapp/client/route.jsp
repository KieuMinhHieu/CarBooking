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
<!--        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/stylechoosecar.css">-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/trip3.css">

    </head>

    <body>
        <header id="header">
            <jsp:include page="menu.jsp"></jsp:include>
            </header><!-- #header -->


            <!--    Login, Register, Forgot Password, Confirm email-->

        <jsp:include page="login.jsp"></jsp:include>

            <!--    END Login, Register, Forgot Password, Confirm email-->

            <!-- start banner Area -->
            <section class="about-banner relative" style="height: 27vh">
                <div class="overlay overlay-bg"></div>
                <div class="container">
                    <div class="row d-flex align-items-center justify-content-center">
                        <div class="about-content col-lg-12" >
                            <h1 class="text-white"style="margin-top: -15px;">
                                Trips
                            </h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End banner Area -->
            <!-- Start destinations Area -->
            <section class="destinations-area section-gap col-md-12">
                <!--                <div class="container">-->
                <div class="align-items-center " style="margin-top: -35px">
                    <div class="row trip">
                        <!-- Shop Sidebar Start -->
                        <div class="col-md-2 shop-sidebar" style="margin-top: -8px">
                            <!-- Price Start -->
                            <div class="mb-4 pb-4 filter-by-price">
                                <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                                <form action="">
                                    <div class="d-flex align-items-center justify-content-between mb-3">
                                        <input type="text" name="lowPrice" style="width: 90px" placeholder="Low Price">
                                        <span class="mr-8 ml-8"> - </span>
                                        <input type="text" name="highPrice" style="width: 90px" placeholder="High Price">
                                        <button type="submit" style="border: 1px solid #0069d9;background-color: #0069d9;font-size: 17px;color: white" >
                                            <i class="fa fa-search" aria-hidden="true"></i>
                                        </button>
                                    </div>

                                </form>
                            </div>
                            <!-- Price End -->

                            <!-- Time Start -->
                            <div class="mb-4 pb-4 filter-by-time">
                                <h5 class="font-weight-semi-bold mb-4">Filter by time</h5>
                                <div class="d-flex align-items-center justify-content-between text-center" style="color: white">
                                    <div class="phan-loai-theo-h">
                                        <a style="" class="btn btn-primary mb-3"
                                           href="${pageContext.request.contextPath}/book?action=SortByTime&from=0&to=6&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">
                                        0:00-6:00<br>AM
                                    </a>
                                    <a style="" class="btn btn-primary" 
                                       href="${pageContext.request.contextPath}/book?action=SortByTime&from=6&to=12&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}"   >
                                        6:00-12:00<br>AM
                                    </a>
                                </div>
                                <div class="phan-loai-theo-h">
                                    <a style="" class="btn btn-primary mb-3"
                                       href="${pageContext.request.contextPath}/book?action=SortByTime&from=12&to=18&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">
                                        12:00-18:00<br>PM
                                    </a>
                                    <a style="" class="btn btn-primary"
                                       href="${pageContext.request.contextPath}/book?action=SortByTime&from=18&to=24&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">
                                        18:00-24:00<br>PM
                                    </a>
                                </div>
                            </div>


                        </div>
                        <div class="mb-4 pb-4 filter-by-seat">
                            <h5 class="font-weight-semi-bold mb-4 text-center">Filter by Seat</h5>
                            <h4 id="filter-by-seat">Select<i class="fa fa-chevron-down" aria-hidden="true" style="margin-left: 170px"></i></h4>
                            <div class="chon-loai-xe" id="chon-loai-xe">
                                <a href="${pageContext.request.contextPath}/book?action=chooseCar&carName=Ford Transit&seat=16&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">Ford Transit</a>
                                <a href="${pageContext.request.contextPath}/book?action=chooseCar&carName=Toyota Hiace&seat=16&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">Toyota Hiace</a>
                                <a href="${pageContext.request.contextPath}/book?action=chooseCar&carName=Huyndai County&seat=16&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">Huyndai County</a>
                                <a href="${pageContext.request.contextPath}/book?action=chooseCar&carName=Daewo Aero Class&seat=16&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">Daewo Aero Class</a>
                                <a href="${pageContext.request.contextPath}/book?action=chooseCar&carName=Mercedes Supersport&seat=16&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">Mercedes Supersport</a>
                                <a href="${pageContext.request.contextPath}/book?action=chooseCar&carName=Huyndai Universe&seat=16&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">Huyndai Universe 2010</a>
                            </div>    
                        </div>
                        <!-- Time end -->

                    </div>
                    <!-- Shop Sidebar End -->
                    <!-- Shop Product Start -->
                    <div class="col-md-6 shop-product" style="">
                        <div class="row pb-3">
                            <div class="col-12 pb-1">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h4>Sort By:</h4>
                                    <a href="${pageContext.request.contextPath}/book?action=Sort&sort=ascendingbyDate&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">Ascending by Date</a>
                                    <a href="${pageContext.request.contextPath}/book?action=Sort&sort=descendingbyDate&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">Descending by Date</a>
                                    <a href="${pageContext.request.contextPath}/book?action=Sort&sort=ascendingbyPrice&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}" >Ascending by Price</a>
                                    <a href="${pageContext.request.contextPath}/book?action=Sort&sort=descendingbyPrice&routeID=${requestScope.ROUTEID}&start=${requestScope.STARTDAY}">Descending by Price</a>
                                </div>
                            </div>
                            <c:if test="${LIST_ALL_TRIP_BY_LOCATION.size()>0}">
                                <c:forEach items="${LIST_ALL_TRIP_BY_LOCATION}" var="trip">

                                    <div class="col-lg-12 col-md-6 col-sm-12 ">

                                        <div class="card product-item mb-4 trip-detail">
                                            <div class="card-body border-left border-righ p-0 pt-4">
                                                <div class="row">
                                                    <div class="collapse noidungthongbao" id="notify-${trip.tripID.trim()}" style="">
                                                        <div class="card card-body">
                                                            <div class="tab-content ">
                                                                Please be at the pick up point 30 minutes in advance and present the ticket number before boarding, otherwise the ticket will be canceled and the operator will not support
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 thongbao">

                                                        <button class="view-notification-button" type="button" data-toggle="collapse" data-target="#notify-${trip.tripID.trim()}" aria-expanded="false" aria-controls="collapseExample" >
                                                            <i class="fa fa-bullhorn" aria-hidden="true"></i> Notification
                                                        </button>
                                                        <h5 style="float: right;margin-right: 20px;color:lightslategray ">Start day: ${trip.startDateTime}</h5>
                                                    </div>

                                                    <div class="vehicle-image col-md-3" >
                                                        <img src="https://image.shutterstock.com/image-photo/bus-traveling-on-asphalt-road-260nw-1345741577.jpg" style="width: 100%; height: 200px;border: 1px solid black"/>
                                                    </div>
                                                    <div class="chuyen-xe col-md-5" style="">
                                                        <h3 class="font-weight-bold" style="color:black;">${trip.vehicle.vehicleName}</h3>
                                                        <p>Total seat: <strong>${trip.vehicle.vehicleType.totalSeat}</strong></p>
                                                        <div class="thoigian-diadiem" style="">
                                                            <div class="d-flex ">
                                                                <div class="">
                                                                    <i class="fa fa-circle" style="font-size: 25px; color:greenyellow; margin-right: 10px" aria-hidden="true"></i>
                                                                </div>
                                                                <div>
                                                                    <span class="">${trip.route.startLocation.locationName}</span>
                                                                </div>
                                                            </div>
                                                            <h6 class=""><span style="color: green">Start time:</span> ${trip.startTime.getHours()}h${trip.startTime.getMinutes()}m</h6>
                                                            <div class="d-flex " style="margin-top: -3px">
                                                                <div class="">
                                                                    <i class="fa fa-map-marker" style="font-size: 25px; color: red;margin-right: 10px" aria-hidden="true"></i>
                                                                </div>
                                                                <div>
                                                                    <span>${trip.route.endLocation.locationName}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="chuyenxe-giathanh col-md-3" style="">
                                                        <div class="">
                                                            <h3 class="" style="color: #007bff;">
                                                                150000 VNĐ
                                                            </h3>
                                                        </div>
                                                        <p class="font-weight-bold" style="color:black;">${trip.seatRemain} seat remain</p>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="card-footer bg-light border d-flex justify-content-between align-items-center">
                                                <h4 class="ten-route"style="color: #76787a" >${trip.tripName}</h4>
                                                <div class="nut-chon-ghe">
                                                    <div class="choose-seat-item">
                                                        <button class="view-more-detail-button" type="button" data-toggle="collapse" data-target="#collapse-${trip.tripID.trim()}" aria-expanded="false" aria-controls="collapseExample" >
                                                            View more detail <i class="fa fa-sort-desc" id="icon" aria-hidden="true" style="font-size: 25px; color: blue"></i>
                                                        </button>
                                                    </div>

                                                    <c:if test="${trip.seatRemain>0}">  
                                                        <div class="chon-ghe">
                                                            <a href="${pageContext.request.contextPath}/book?action=choose-ticket&tripID=${trip.tripID.trim()}&totalSeat=${trip.vehicle.vehicleType.totalSeat}" class="btn-choose-seat btn btn-primary" >Choose ticket</a>
                                                        </div>
                                                    </c:if> 
                                                    <c:if test="${trip.seatRemain==0}">       
                                                        <p class="no-seat" >No Seat Available</p>
                                                    </c:if> 
                                                </div>
                                            </div>
                                            <div class="collapse" id="collapse-${trip.tripID.trim()}">
                                                <div class="card card-body">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link active" id="picture"
                                                               data-toggle="tab" href="#1-${trip.tripID.trim()}" role="tab"
                                                               aria-controls="picture"
                                                               aria-selected="true">Picture</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="utilies"
                                                               data-toggle="tab" href="#2-${trip.tripID.trim()}" role="tab"
                                                               aria-controls="utilies"
                                                               aria-selected="true">Utilities</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="policy"
                                                               data-toggle="tab" href="#3-${trip.tripID.trim()}" role="tab"
                                                               aria-controls="policy"
                                                               aria-selected="true">Policy</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content ">
                                                        <div class="tab-pane active" id="1-${trip.tripID.trim()}"
                                                             role="tabpanel" aria-labelledby="picture">
                                                            <div id="carousel-${trip.tripID.trim()}" class="carousel slide" data-ride="carousel">
                                                                <div class="carousel-inner">
                                                                    <div class="carousel-item active">
                                                                        <img style="width: 100px; height: 350px;" class="d-block w-100" src="https://i.ytimg.com/vi/dip_8dmrcaU/maxresdefault.jpg" alt="First slide">
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <img style="width: 100px; height: 350px;" class="d-block w-100" src="https://maserati.scene7.com/is/image/maserati/maserati/regional/us/models/my22/levante/22_LV_Trofeo_PS_T1_HomePage_1920x1080.jpg?$1920x2000$&fit=constrain" alt="Second slide">
                                                                    </div>
                                                                    <div class="carousel-item">
                                                                        <img style="width: 100px; height: 350px;" class="d-block w-100" src="https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/apple_car_concept_199.jpeg" alt="Third slide">
                                                                    </div>
                                                                </div>
                                                                <a class="carousel-control-prev" href="#carousel-${trip.tripID.trim()}" role="button" data-slide="prev">
                                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                    <span class="sr-only">Previous</span>
                                                                </a>
                                                                <a class="carousel-control-next" href="#carousel-${trip.tripID.trim()}" role="button" data-slide="next">
                                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                    <span class="sr-only">Next</span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="2-${trip.tripID.trim()}" role="tabpanel"
                                                             aria-labelledby="utilities">
                                                            Utility
                                                        </div>
                                                        <div class="tab-pane" id="3-${trip.tripID.trim()}" role="tabpanel"
                                                             aria-labelledby="policy">
                                                            Policy
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>

                            <c:if test="${LIST_ALL_TRIP_BY_LOCATION.size()<=0}">
                                <div class="col-lg-12 col-md-6 col-sm-12">
                                    <div class="not-found">
                                        <img src="${pageContext.request.contextPath}/client/img/not-found.png">
                                        <a href="${pageContext.request.contextPath}/">Back to Home</a>
                                    </div>
                                </div>
                            </c:if>    
                            <!--Phân trang-->
                             <div class="col-12 pb-1">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center mb-3">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                        <%--<c:forEach items="${requestScope.totalPage}" begin="1" end="${requestScope.totalPage}" var="total">--%>
                                            <!--<li class="page-item"><a class="page-link" href="#"></a></li>-->
                                        <%--</c:forEach>--%>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div> 

                        </div>
                    </div>
                    <!-- Shop Product End -->
                </div>
            </div>
            <!--            </div>-->
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
        <!--<script src="js/chosing-seat.js"></script>-->

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

                            document.getElementById("filter-by-seat").addEventListener("mouseover", showList);
                            var check = false;
                            function showList() {
                                if (check == false) {
                                    document.getElementById("chon-loai-xe").style.display = "block";
                                    document.getElementById("filter-by-seat").style.backgroundColor = "#0083ff";
                                    check = true;
                                } else {
                                    document.getElementById("chon-loai-xe").style.display = "none";
                                    document.getElementById("filter-by-seat").style.backgroundColor = "white";
                                    check = false;
                                }
                            }

                            document.getElementById("chon-loai-xe").addEventListener("mouseleave", showOff);
                            function showOff() {
                                document.getElementById("chon-loai-xe").style.display = "none";
                                document.getElementById("filter-by-seat").style.backgroundColor = "white";
                            }

        </script>

    </body>

</html>
