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
                                            Add Driver License
                                        </button>
                                        <a href="${pageContext.request.contextPath}/admin/driverlicense?action=show" style="margin-right: 10px" class="btn btn-primary float-right">Show All</a>
                                </div>
                                <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Add new Driver License</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="driverlicense" method="POST">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Driver License ID</label>
                                                        <input type="text" name="driverLicenseID" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Driver License ID" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Nationality</label>
                                                        <input type="text" name="nationality" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Nationality" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Class</label>
                                                        <input type="text" name="classes" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Class" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Date Expired</label>
                                                        <input type="date" name="dateExpired" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Date Expired" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Driver</label>
                                                        <select name="driverID" class="form-control">
                                                            <c:forEach items="${requestScope.DRIVER_LIST}" var="d" >
                                                                <option value="${d.driverID.trim()}">${d.driverName}</option>
                                                            </c:forEach>
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
                                                <th>Driver License ID</th>
                                                <th>Driver Name</th>
                                                <th>Nationality</th>
                                                <th>Class</th>
                                                <th>Date Expired</th>
                                                <th>Modify</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody id="content-data-update">
                                            <c:forEach items="${requestScope.DRIVER_LICENSE_LIST}" var="dl" varStatus="counter">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${dl.driverLicenseID}</td>
                                                    <td>${dl.getDriver().getDriverName()}</td>
                                                    <td>${dl.nationality}</td>
                                                    <td>${dl.classes}</td>
                                                    <td>
                                                        ${dl.dateExpired}
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modify-${dl.driverLicenseID.trim()}">
                                                            <i class="fa fa-pen"></i>
                                                        </button>
                                                        <div class="modal fade" id="modify-${dl.driverLicenseID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Modify Driver License ${dl.getDriver().driverName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="driverlicense" method="POST">
                                                                        <div class="modal-body">
                                                                            <div class="modal-body">
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">DriverLicense ID</label>
                                                                                    <input type="text" name="driverLicenseID" class="form-control" value="${dl.driverLicenseID}" id="exampleInputEmail1" readonly placeholder="Enter Driver LicenseID">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Nationality</label>
                                                                                    <input type="text" name="nationality" class="form-control" value="${dl.nationality}" id="exampleInputEmail1" placeholder="Enter Nationality">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Class</label>
                                                                                    <input type="text" name="classes" class="form-control" value="${dl.classes}" id="exampleInputEmail1" placeholder="Enter Class">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Date Expired</label>
                                                                                    <input type="date" name="dateExpired" class="form-control" value="${dl.dateExpired}" id="exampleInputEmail1" placeholder="Enter Date Expired">
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
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#delete-${dl.driverLicenseID.trim()}">
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </button>
                                                        <div class="modal fade" id="delete-${dl.driverLicenseID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Delete Driver License Of ${dl.getDriver().driverName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="driverlicense" method="POST">
                                                                        <div class="modal-footer">
                                                                            <input type="hidden" name="driverLicenseID" value="${dl.driverLicenseID}">
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
                var driverLicenseID = document.querySelector("input[name=driverLicenseID]");
                var nationality = document.querySelector("input[name=nationality]");
                var classes = document.querySelector("input[name=classes]");
                var dateExpired = document.querySelector("input[name=dateExpired]");
                var driver = document.querySelector("input[name=driverID]");

                document.querySelector("button[value=create]").addEventListener("click", function () {
                        sessionStorage.setItem("driverLicenseID", driverLicenseID.value);
                        sessionStorage.setItem("nationality", nationality.value);
                        sessionStorage.setItem("classes", classes.value);
                        sessionStorage.setItem("dateExpired", dateExpired.value);
                        sessionStorage.setItem("driverID", document.querySelector('select[name=driverID]').value);
                    }
                );
            <c:if test="${requestScope.ERROR != null}">
                $(document).ready(function (e) {
                    $(".add-modal").modal('show');
                });
                driverLicenseID.value = sessionStorage.getItem("driverLicenseID");
                nationality.value = sessionStorage.getItem("nationality");
                classes.value = sessionStorage.getItem("classes");
                dateExpired.value = sessionStorage.getItem("dateExpired");
                driverID.value = sessionStorage.getItem("driverID");

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
                    $('input[type="search"]').val('${DRIVER_LICENSE_ID}').keyup();
                });
                </c:if>
        </script>
    </body>
</html>
