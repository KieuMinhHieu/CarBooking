<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Trip Tables</title>

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
                                    <h2 class="m-0 font-weight-bold text-primary">TRIPS</h2>
                                    
                                    <div>
                                    <a href="${pageContext.request.contextPath}/admin/trip?action=report" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Feedback Report</a>
                                    </div>
                                    <div class="add-modal modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Add new Trip</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form action="trip" method="post">
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Trip ID</label>
                                                            <input type="text" name="tripID" class="add-dob form-control"  placeholder="Enter Trip ID" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Trip Name</label>
                                                            <input type="text" name="tripName" class="add-dob form-control"  placeholder="Enter Trip Name" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Start Date Time</label>
                                                            <input type="date" name="startdate" class="add-dob form-control"  placeholder="Enter Start Date" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Start Time</label>
                                                            <input type="time" name="startTime" class="add-dob form-control"  placeholder="Enter Start Date" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Policy</label>
                                                            <textarea style="height: 150px" type="text" name="policy" class="add-dob form-control" placeholder="Enter Policy" required>   
                                                            </textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="exampleInputEmail1">Route Name: </label>
                                                            <select class="form-control form-select" aria-label="Default select example" name="routeID">
                                                            <c:forEach var="ar" items="${requestScope.LIST_ACTIVE_ROUTE}">
                                                                <option value="${ar.routeID}">${ar.routeName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Vehicle Name: </label>
                                                        <select class="form-control form-select" name="vehicleID">
                                                            <c:forEach var="av" items="${requestScope.LIST_ACTIVE_VEHICLE}">
                                                                <option value="${av.vehicleID}">${av.vehicleName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Driver Name: </label>
                                                        <select class="form-control form-select" name="driverID">
                                                            <c:forEach var="ad" items="${requestScope.LIST_ACTIVE_DRIVER}">
                                                                <option value="${ad.driverID}">${ad.driverName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" name="action" value="add" class="btn btn-primary">Save</button>
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
                                                <th>No</th>
                                                <th>Trip ID</th>
                                                <th>Trip Name</th>
                                                <th>Start Date Time</th>
                                                <th>Start Time</th>
                                                <th>Policy</th>
                                                <th>Route Name</th>
                                                <th>Vehicle Name</th>
                                                <th>Driver Name</th>
                                                <th>Seat Remain</th>
                                                <th>Status</th>
                                                <th>Modify</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody id="content-data-update">
                                            <c:forEach items="${requestScope.LIST_ALL_TRIP}" var="t" varStatus="counter">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${t.tripID}</td>
                                                    <td>${t.tripName}</td>
                                                    <td>${t.startDateTime}</td>
                                                    <td>${t.startTime}</td>
                                                    <td>${t.policy}</td>
                                                    <td>${t.route.routeName}</td>
                                                    <td>${t.vehicle.vehicleName}</td>
                                                    <td>${t.driver.driverName}</td>
                                                    <td>${t.seatRemain}</td>
                                                    <td>${t.status}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modify-${t.tripID.trim()}">
                                                            <i class="fa fa-pen"></i>
                                                        </button>
                                                            
                                                        <div class="modal fade" id="modify-${t.tripID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Modify Trip ${t.tripName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="trip" method="post">
                                                                        <div class="modal-body">
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Trip ID</label>
                                                                                <input type="text" name="tripID" class="add-dob form-control" value="${t.tripID}" placeholder="Enter Trip ID" readonly>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Trip Name</label>
                                                                                <input type="text" name="tripName" class="add-dob form-control" value="${t.tripName}"  placeholder="Enter Trip Name" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Start Date Time</label>
                                                                                <input type="date" name="startdate" class="add-dob form-control" value="${t.startDateTime}"  placeholder="Enter Start Date" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Policy</label>
                                                                                <textarea style="height: 150px" type="text" name="policy" class="form-control" placeholder="Enter Policy" required>   
                                                                                    ${t.policy}
                                                                                </textarea>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Route Name: </label>
                                                                                <select class="form-control form-select" aria-label="Default select example" name="routeID">
                                                                                    <c:forEach var="ar" items="${requestScope.LIST_ACTIVE_ROUTE}">
                                                                                        <option value="${ar.routeID}">${ar.routeName}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Vehicle Name: </label>
                                                                                <select class="form-control form-select" aria-label="Default select example" name="vehicleID">
                                                                                    <option value="${t.vehicle.vehicleID}" selected>${t.vehicle.vehicleName}</option>
                                                                                    <c:forEach var="av" items="${requestScope.LIST_ACTIVE_VEHICLE}">
                                                                                        <option value="${av.vehicleID}">${av.vehicleName}</option>
                                                                                    </c:forEach>    
                                                                                </select>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Driver Name: </label>
                                                                                <select class="form-control form-select" aria-label="Default select example" name="driverID">
                                                                                    <option value="${t.driver.driverID}" selected>${t.driver.driverName}</option>
                                                                                    <c:forEach var="ad" items="${requestScope.LIST_ACTIVE_DRIVER}">
                                                                                        <option value="${ad.driverID}">${ad.driverName}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Seat Remain</label>
                                                                                <input type="number" name="seatRemain" class="add-dob form-control" value="${t.seatRemain}"  placeholder="Enter Trip Name" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1">Status</label>
                                                                                <select class="form-control form-select" aria-label="Default select example" name="status">
                                                                                    <option value="1" selected>ACTIVE</option>
                                                                                    <option value="0">INACTIVE</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                            <button type="submit" name="action" value="update" class="btn btn-primary">Save</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#delete-${t.tripID.trim()}">
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </button>
                                                        <div class="modal fade" id="delete-${t.tripID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Delete Driver ${t.tripName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="trip" method="post">
                                                                        <div class="modal-footer">
                                                                            <input type="hidden" name="tripID" value="${t.tripID.trim()}">
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
                        <h4 class="text-center font-weight-bold" style="margin-top: 20px">${sessionScope.SUCCESS}</h4>
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
        <!-- Page level plugins -->
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Page level custom scripts -->
        <script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>

        <script type="text/javascript">
            <c:if test="${sessionScope.SUCCESS != null}">
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
                $('input[type="search"]').val('${sessionScope.tripID}').keyup();
                
                
            });
            </c:if>

            var driverID = document.querySelector("input[name=driverID]");
            var driverName = document.querySelector("input[name=driverName]");
            var DOB = document.querySelector("input[name=DOB]");
            var sex = document.querySelector("select[name=sex]");
            var driverPic = document.querySelector("input[name=driverPic]");
            var phoneNumber = document.querySelector("input[name=phoneNumber]");

            document.querySelector("button[value=add]").addEventListener("click", function () {
                sessionStorage.setItem("driverID", driverID.value);
                sessionStorage.setItem("driverName", driverName.value);
                sessionStorage.setItem("DOB", DOB.value);
                sessionStorage.setItem("sex", sex.value);
                sessionStorage.setItem("driverPic", driverPic.value);
                sessionStorage.setItem("phoneNumber", phoneNumber.value);
            });

            <c:if test="${requestScope.ADD_ERROR != null}">
            $(document).ready(function (e) {
                $(".add-modal").modal('show');
            });

            driverID.value = sessionStorage.getItem("driverID");
            driverName.value = sessionStorage.getItem("driverName");
            DOB.value = sessionStorage.getItem("DOB");
            sex.value = sessionStorage.getItem("sex");
            driverPic.value = sessionStorage.getItem("driverPic");
            phoneNumber.value = sessionStorage.getItem("phoneNumber");
            </c:if>

        </script>
    </body>
</html>
