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

        <title>Vehicles Table</title>

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
                                    <h2 class="m-0 font-weight-bold text-primary">VEHICLES</h2>
                                    <div>

                                        <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#add">
                                            Add Vehicle
                                        </button>
                                        <a href="${pageContext.request.contextPath}/admin/VehicleController?action=show" style="margin-right: 10px" class="btn btn-primary float-right">Show All</a>
                                    <a href="${pageContext.request.contextPath}/admin/VehicleController?action=showDelete" style="margin-right: 10px" class="btn btn-primary float-right">Delete History</a>
                                </div>
                                <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Add new Vehicle</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="VehicleController" method="POST">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">VehicleID</label>
                                                        <input type="text" name="vehicleID" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Vehicle ID" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Vehicle Name</label>
                                                        <input type="text" name="vehicleName" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Vehice Name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">License Plate</label>
                                                        <input type="text" name="licensePlate" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter License Plate">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">VehicleType</label>
                                                        <select name="vehicleTypeID" class="form-control">
                                                            <c:forEach items="${requestScope.VEHICLE_TYPE_LIST}" var="vT" >
                                                                <option value="${vT.vehicleTypeID}">${vT.vehicleTypeName}</option>

                                                            </c:forEach>
                                                        </select>
                                                    </div>


                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Status</label>
                                                        <select name="status" class="form-control">
                                                            <option value="0">INACTIVE</option>
                                                            <option value="1" selected>ACTIVE</option>
                                                            <option value="2">ONGOING</option>
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
                                                <th>No.</th>
                                                <th>Vehicle ID</th>
                                                <th>Vehicle Name</th>
                                                <th>License Plate</th>
                                                <th>Vehicle Type</th>
                                                <th>Status</th>
                                                <th>Modify</th>
                                                <th>
                                                    <c:if test="${requestScope.DELETE_HISTORY == null}"> Delete </c:if>
                                                    <c:if test="${requestScope.DELETE_HISTORY != null}"> Recover </c:if>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="content-data-update">
                                            <c:forEach items="${requestScope.VEHICLE_LIST}" var="v" varStatus="counter">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${v.vehicleID}</td>
                                                    <td>${v.vehicleName}</td>
                                                    <td>${v.licensePlate}</td>
                                                    <td>${v.getVehicleType().getVehicleTypeName()}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${v.status eq 0}">
                                                                INACTIVE
                                                            </c:when>
                                                            <c:when test="${v.status eq 1}">
                                                                ACTIVE
                                                            </c:when>
                                                            <c:when test="${v.status eq 2}">
                                                                ONGOING
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modify-${v.vehicleID}">
                                                            <i class="fa fa-pen"></i>
                                                        </button>
                                                        <div class="modal fade" id="modify-${v.vehicleID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Modify Driver ${v.vehicleName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="VehicleController">
                                                                        <div class="modal-body">
                                                                            <div class="modal-body">
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Vehicle ID</label>
                                                                                    <input type="text" name="vehicleID" class="form-control" value="${v.vehicleID}" id="exampleInputEmail1" readonly placeholder="Enter Vehicle ID">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Vehicle Name</label>
                                                                                    <input type="text" name="vehicleName" class="form-control" value="${v.vehicleName}" id="exampleInputEmail1" placeholder="Enter Driver Name">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">LicensePlate</label>
                                                                                    <input type="text" name="licensePlate" class="form-control" value="${v.licensePlate}" id="exampleInputEmail1" placeholder="Enter DOB">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">VehicleType</label>
                                                                                    <select name="vehicleTypeID" class="form-control">
                                                                                        <c:forEach items="${VEHICLE_TYPE_LIST}" var="vT">
                                                                                            <option value="${vT.vehicleTypeID}">${vT.vehicleTypeName}</option>
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                </div>

                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Status</label>
                                                                                    <select name="status" class="form-control">
                                                                                        <option value="0" ${d.status eq 0?"selected":""}>INACTIVE</option>
                                                                                        <option value="1" ${d.status eq 1?"selected":""}>ACTIVE</option>
                                                                                        <option value="2" ${d.status eq 2?"selected":""}>ONGOING</option>
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


                                                        <c:if test="${requestScope.DELETE_HISTORY != null}"> 
                                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#recover-${v.vehicleID}">
                                                                <i class="fa fa-solid fa-arrow-up" aria-hidden="true"></i>
                                                            </button>

                                                            <div class="modal fade" id="recover-${v.vehicleID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Recover Vehice ${v.vehicleName}</h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                            <form action="VehicleController" method="POST">
                                                                            <div class="modal-footer">
                                                                                <input type="hidden" name="vehicleID" value="${v.vehicleID}">
                                                                                <button type="submit" name="action" value="recover" class="btn btn-primary">
                                                                                    Recover
                                                                                </button>
                                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${requestScope.DELETE_HISTORY == null}">
                                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#delete-${v.vehicleID}">
                                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                                            </button>

                                                            <div class="modal fade" id="delete-${v.vehicleID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Delete Vehice ${v.vehicleName}</h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <form action="VehicleController">
                                                                            <div class="modal-footer">
                                                                                <input type="hidden" name="vehicleID" value="${v.vehicleID}">
                                                                                <button type="submit" name="action" value="delete" class="btn btn-primary">
                                                                                    Delete
                                                                                </button>
                                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:if>
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
        <!-- Page level plugins -->
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Page level custom scripts -->
        <script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>
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
                    $('input[type="search"]').val('${VEHICLE_ID}').keyup();
                });
            </c:if>
        </script>
    </body>
</html>
