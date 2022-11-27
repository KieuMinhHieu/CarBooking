<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>RoutesTable</title>

        <!-- Custom fonts for this template -->
        <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>

    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <jsp:include page="sidebar.jsp"></jsp:include>
                <!-- End of Sidebar -->

                <!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->
                    <jsp:include page="topbar.jsp"></jsp:include>
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <h2 class="m-0 font-weight-bold text-primary">ROUTES</h2>
                                    <div>

                                        <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#add">
                                            Add Route
                                        </button>
                                        <a href="${pageContext.request.contextPath}/admin/route?action=show" style="margin-right: 10px" class="btn btn-primary float-right">Show All</a>
                                    <a href="${pageContext.request.contextPath}/admin/route?action=showDelete" style="margin-right: 10px" class="btn btn-primary float-right">Delete History</a>
                                </div>



                                <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Add new Route</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="route" method="POST">
                                                <div class="modal-body">

                                                    <div class="form-group">                                                      
                                                        <label for="exampleInputEmail1">Start Location</label>
                                                        <select name="startLocation" class="form-control" data-live-search="true">
                                                            <c:forEach var="start" items="${requestScope.LOCATION_LIST}">
                                                                <option value="${start.locationID}" data-display="true" data-highlight="false">${start.locationName} (${start.city.cityName})</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">End Location</label>
                                                        <select name="endLocation" class="form-control" data-live-search="true">

                                                            <c:forEach var="end" items="${requestScope.LOCATION_LIST}">
                                                                <option value="${end.locationID}" data-display="true" data-highlight="false">${end.locationName} (${end.city.cityName})</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Description</label>
                                                        <textarea rows="5" type="text"  name="description" class="form-control" id="exampleInputEmail1">   
                                                        </textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Status</label>
                                                        <select name="status" class="form-control">
                                                            <option value="1" selected>ACTIVE</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" name="action" value="create" class="btn btn-primary">Create</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <c:if test="${requestScope.ROUTE_LIST != null}">
                                                    <th>Route ID</th>
                                                    <th>Route Name</th>
                                                    <th>Start Location</th>
                                                    <th>End Location</th>
                                                    <th>Description</th>
                                                    <th>Modify</th>
                                                    <th>Delete</th>
                                                    <th>Create Trip</th>
                                                    </c:if>
                                                    <c:if test="${requestScope.DELETE_LIST != null}"> 
                                                    <th>Route ID</th>
                                                    <th>Route Name</th>
                                                    <th>Start Location</th>
                                                    <th>End Location</th>
                                                    <th>Description</th>
                                                    <th>Recover</th>
                                                    </c:if>
                                            </tr>
                                        </thead>
                                        <tbody id="content-data-update">
                                            <c:if test="${requestScope.DELETE_LIST != null}"> 
                                                <c:forEach items="${requestScope.DELETE_LIST}" var="r">
                                                    <tr>
                                                        <td>${r.routeID}</td>
                                                        <td>${r.routeName}</td>
                                                        <td>${r.startLocation.getLocationName()}</td>
                                                        <td>${r.endLocation.getLocationName()}</td>
                                                        <td>
                                                            ${r.description}
                                                        </td>

                                                        <td>
                                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#delete-${r.routeID}">
                                                                <i class="fa fa-solid fa-arrow-up" aria-hidden="true"></i>
                                                            </button>
                                                            <div class="modal fade" id="delete-${r.routeID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Recover Route ${r.routeName}</h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <form action="route" method="POST">
                                                                            <div class="modal-footer">
                                                                                <input type="hidden" name="routeID" value="${r.routeID}">
                                                                                <button type="submit" name="action" value="recover" class="btn btn-primary">
                                                                                    Recover
                                                                                </button>
                                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>

                                                    </tr></c:forEach>
                                            </c:if>

                                            <c:forEach items="${requestScope.ROUTE_LIST}" var="r" varStatus="counter">
                                                <tr>

                                                    <td>${r.routeID}</td>
                                                    <td>${r.routeName}</td>
                                                    <td>${r.startLocation.getLocationName()}</td>
                                                    <td>${r.endLocation.getLocationName()}</td>
                                                    <td>
                                                        ${r.description}
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modify-${r.routeID}">
                                                            <i class="fa fa-pen"></i>
                                                        </button>
                                                        <div class="modal fade" id="modify-${r.routeID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Modify Route ${r.routeName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="route" method="POST">
                                                                        <div class="modal-body">
                                                                            <div class="modal-body">
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Route ID</label>
                                                                                    <input type="text" name="routeID" class="form-control" value="${r.routeID}" id="exampleInputEmail1" readonly placeholder="Enter Vehicle ID">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1"></label>
                                                                                    <input type="text" name="routeName" class="form-control" value="${r.routeName}" id="exampleInputEmail1" placeholder="Enter Driver Name" readonly="">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Start Location</label>
                                                                                    <select name="startLocation" class="form-control">
                                                                                        <option value="${r.startLocation.getLocationID()}">${r.startLocation.getLocationName()}</option>
                                                                                        <c:forEach items="${LOCATION_LIST}" var="sL">


                                                                                            <c:if test="${sL.locationID != r.startLocation.getLocationID()}">
                                                                                                <option value="${sL.locationID}">${sL.locationName}</option>
                                                                                            </c:if>
                                                                                        </c:forEach>

                                                                                    </select>

                                                                                </div>

                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">End Location</label>
                                                                                    <select name="endLocation" class="form-control">
                                                                                        <option value="${r.endLocation.getLocationID()}">${r.endLocation.getLocationName()}</option>
                                                                                        <c:forEach items="${LOCATION_LIST}" var="eL">


                                                                                            <c:if test="${eL.locationID != r.endLocation.getLocationID()}">
                                                                                                <option value="${eL.locationID}">${eL.locationName}</option>
                                                                                            </c:if>
                                                                                        </c:forEach>

                                                                                    </select>

                                                                                </div>       
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1" >Description</label>
                                                                                    <textarea name="description"class="form-control" value="${r.description}"></textarea>
                                                                                    
                                                                                    
                                                                                </div>

                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Status</label>
                                                                                    <select name="status" class="form-control">
                                                                                        <option value="1">ACTIVE</option>
                                                                                        <option value="0">INACTIVE</option>


                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                            <button type="submit" name="action" value="update" class="btn btn-primary">Modify</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#delete-${r.routeID}">
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </button>
                                                        <div class="modal fade" id="delete-${r.routeID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Delete Route ${r.routeName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="route" method="POST">
                                                                        <div class="modal-footer">
                                                                            <input type="hidden" name="routeID" value="${r.routeID}">
                                                                            <button type="submit" name="action" value="delete" class="btn btn-primary">
                                                                                Delete
                                                                            </button>
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#create-${r.routeID}">
                                                            <i class="fa fa-check-circle"></i>
                                                        </button>
                                                            <p id="" style="display: none"></p>
                                                            <input type="hidden" value="${r.routeName}" id="defaultTripName">
                                                        <div class="modal fade" id="create-${r.routeID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Create Trip For ${r.routeName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                        <!--createTripForm-->
                                                                    <form action="route" method="post" id="createTripForm">
                                                                        <div class="modal-body">
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Trip Name</label>
                                                                                


                                                                                <input type="text" name="tripName" class="add-dob form-control" id="exampleInputTripName" aria-describedby="emailHelp" placeholder="Enter Trip Name" value="${r.routeName}" required>

                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Start Date Time</label>
                                                                                <input type="date" name="startdate" class="add-dob form-control" onchange="myFunction()" id="exampleInputDate" aria-describedby="emailHelp" placeholder="Enter Start Date" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Start Time</label>
                                                                                <input type="time" name="startTime" class="add-dob form-control" id="timeStart" onchange="setNameTime()"  placeholder="Enter Start Date" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Policy</label>
                                                                                <textarea type="text" rows="5" name="policy" class="add-dob form-control" id="exampleInputEmail1">   
                                                                                </textarea>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Route Name: </label>
                                                                                <input type="text" name="routeName" class="add-dob form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${r.routeName}" readonly="">
                                                                                <input type="hidden" name="routeID" class="add-dob form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${r.routeID}" readonly="">
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                            <input type="submit" name="action" value="Add" class="btn btn-primary" id="createTrip">
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->
                <div class="choose_driver_vehicle modal fade" id="" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h5 class="modal-title" id="exampleModalLabel">Assign For ${requestScope.tripName}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                                <!--createTripForm-->
                            <form action="route" method="post" id="">
                                <div class="modal-body">
                                    <input type="hidden" name="tripID" value="${requestScope.tripID}">
                                    <input type="hidden" name="tripName" value="${requestScope.tripName}">
                                    <input type="hidden" name="startdate" value="${requestScope.startdate}">
                                    <input type="hidden" name="startTime" value="${requestScope.startTime}">
                                    <input type="hidden" name="policy" value="${requestScope.policy}">
                                    <input type="hidden" name="routeID" value="${requestScope.routeID}">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Vehicle Name: </label>
                                        <select class="form-control form-select" aria-label="Default select example" name="vehicleID">
                                            <c:forEach var="av" items="${requestScope.LIST_ACTIVE_VEHICLE}">
                                                <option value="${av.vehicleID}">${av.vehicleName}(Total seat: ${av.vehicleType.totalSeat})</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Driver Name: </label>
                                        <select class="form-control form-select" aria-label="Default select example" name="driverID">
                                            <c:if test="${requestScope.LIST_ACTIVE_DRIVER==null}">
                                                <option selected value="">No Driver</option>
                                            </c:if>
                                            <c:if test="${requestScope.LIST_ACTIVE_DRIVER!=null}">
                                                <c:forEach var="ad" items="${requestScope.LIST_ACTIVE_DRIVER}">
                                                    <option value="${ad.driverID}">${ad.driverName}_${ad.driverID}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <input type="submit" name="action" value="Assign" class="btn btn-primary" id="createTrip">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>E-Transportation Website</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/Logout">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal show success and fail-->
        <!-- Button trigger modal -->
        <!--<button type="button" class="btn btn-primary show-success-modal" style="" data-toggle="modal" data-target="#showsuccess">click</button>-->

        <!-- Modal visibility: hidden; opacity: 0;-->
        <div class="modal fade" id="showsuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="fa fa-check-circle" style="font-size:70px; color: greenyellow" aria-hidden="true"></i>
                        </div>
                        <h4 class="text-center font-weight-bold" style="margin-top: 20px">${requestScope.SUCCESS}</h4>
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
                        <h4 class="text-center font-weight-bold" style="margin-top: 20px">${requestScope.ERROR}</h4>
                        <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End Modal show success and fail-->
        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/admin/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/admin/js/sb-admin-2.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/validationTripForm.js"></script>
        <!-- Page level plugins -->
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Page level custom scripts -->
        <script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/validationTripForm.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/validationDate2.js"></script>
        <script type="text/javascript">
            <c:if test="${requestScope.SUCCESS!=null}">
            $(document).ready(function () {
                $("#showsuccess").modal('show');
//                    window.location.replace("${pageContext.request.contextPath}/driver?action=show");
            });
            </c:if>
            <c:if test="${requestScope.ERROR!=null}">
            $(document).ready(function () {
                $("#showerror").modal('show');
//                    window.location.replace("${pageContext.request.contextPath}/driver?action=show");
            });
            </c:if>
//            <c:if test="${requestScope.ID_EXIST!=null}">
//            $(document).ready(function () {
            //               $("#${requestScope.ID_EXIST}").modal('show');
//            });
//            </c:if>
//            <c:if test="${requestScope.SUCCESS!=null}">
//                    $.ajax({
//                        url:"/ETrans/admin/VehicleController?action=vehicleUpdate",
//                        type:"get",
//                        success: function (data) {
//                            var row = document.getElementById("content-data-update");
//                            row.innerHTML = data;
//                        },
//                        error: function (jqXHR, textStatus, errorThrown) {
//                            
//                        }
//                    });
//                </c:if>
//                <c:if test="${requestScope.SUCCESS!=null}">
//                    const inputField = document.querySelectorAll("input[type=search]");
//                    inputField.addEventListener('input',function(e){
//                        $.ajax({
//                            url:"/ETrans/admin/VehicleController?action=search",
//                            type:"get",
//                            data:{
//                                txt : e.target.value
//                            },
//                            success: function (data) {
//                                var row = document.getElementById("content-data-update");
//                                row.innerHTML = data;
//                            },
//                            error: function (jqXHR, textStatus, errorThrown) {
//
//                            }
//                        });
//                    });
//                </c:if>
                    <c:if test="${requestScope.ADD_TRIP_CONTINUE!=null}">
                        $(document).ready(function () {
                            $('.choose_driver_vehicle').modal('show')    
                        });
                    </c:if>


            </script>

            <script>
                var vehicleID = document.querySelector("input[name=vehicleID]");
                var vehicleName = document.querySelector("input[name=vehicleName]");
                var licensePlate = document.querySelector("input[name=licensePlate]");
                var vehicleType = document.querySelector("input[name=vehicleType]");
                var status = document.querySelector("input[name=status]");

                document.querySelector("button[value=create]").addEventListener("click", function () {
                    sessionStorage.setItem("vehicleID", vehicleID.value);
                    sessionStorage.setItem("vehicleName", vehicleName.value);
                    sessionStorage.setItem("licensePlate", licensePlate.value);
                    sessionStorage.setItem("vehicleType", vehicleType.value);
                    sessionStorage.setItem("status", status.value);
                }
                );
            <c:if test="${requestScope.ERROR != null}">
                $(document).ready(function (e) {
                    $(".add-modal").modal('show');
                });
                vehicleID.value = sessionStorage.getItem("vehicleID");
                vehicleName.value = sessionStorage.getItem("vehicleName");
                licensePlate.value = sessionStorage.getItem("licensePlate");
                vehicleType.value = sessionStorage.getItem("vehicleType");
                status.value = sessionStorage.getItem("status");

            </c:if>

            <c:if test="${requestScope.SUCCESS != null}">
                $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
                    var idField = parseInt($('input[type="search"]').val(), 10);
                    var id = parseFloat(data[1]) || 1; // use data for the age column

                    if ((isNaN(idField)) || (isNaN(idField)) ||
                            (idField <= id) || (idField <= id)) {
                        return true;
                    }
                    return false;
                });
                $(document).ready(function (e) {
                    $("#showsuccess").modal('show');
                    var table = $('#example').DataTable();
                    // Event listener to the two range filtering inputs to redraw on input
                    $('input[type="search"]').keyup(function () {
                        table.draw();
                    });
                    $('input[type="search"]').val('${ROUTE_ID}').keyup();
                });
            </c:if>

        </script>
<!--        <script>
            var form = document.getElementById('createTripForm');
            const dayInput = form.querySelector('#exampleInputDate');
            

            function myFunction() {
                const currentDate = new Date();
                let dayCheck = new Date(dayInput.value);
                if (currentDate > dayCheck) {
                    console.log(currentDate > dayCheck);
                    document.getElementById('exampleInputDate').setCustomValidity('Day Start must higher than current day!');
                } else {
                    document.getElementById('exampleInputDate').setCustomValidity('');
                }

            }
            
            var submit = document.getElementById('createTrip');
            

            submit.addEventListener('click', myFunction);
            form.addEventListener('submit', myFunction);
        </script>-->
    </body> 
</html>
