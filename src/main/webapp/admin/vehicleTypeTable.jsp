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

        <title>User Tables</title>

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

                            <!-- Page Heading -->

                            <!-- DataTales Example -->

                            <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Create Vehicle Type</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>

                                        </div>
                                        <div class="modal-body">
                                            <form action="VehicleTypeController" method="POST">


                                                <label for="vehicleTypeName">Vehicle Type Name</label>
                                                <input type="text" name="vehicleTypeName" id="vehicleTypeName" required="">
                                                <br>
                                                <label for="totalSeat">Total Seat</label>
                                                <input type="number" name="totalSeat" id="totalSeat" required="">


                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" name="action" value="create" class="btn btn-primary">Create</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 d-flex justify-content-center align-items-center">

                                        <div>
                                            <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#add">
                                                Add Vehicle Type
                                            </button>
                                            <a href="${pageContext.request.contextPath}/admin/VehicleTypeController?action=show" style="margin-right: 10px" class="btn btn-primary float-right">Show All</a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th> No. </th>
                                                    <th>Vehicle Type ID</th>
                                                    <th> Vehicle Type Name </th>
                                                    <th> Total Seats </th>
                                                    <th> Modify </th>
                                                    <th> Delete </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.VEHICLE_TYPE_LIST}" var="v" varStatus="counter">
                                                    <tr>

                                                        <td>${counter.count}</td>
                                                        <td>${v.vehicleTypeID}</td>
                                                        <td>${v.vehicleTypeName}</td>
                                                        <td>${v.totalSeat}</td>

                                                        <td>
                                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modify-${v.vehicleTypeID}">
                                                                <i class="fa fa-pen"></i>
                                                            </button>
                                                            <div class="modal fade" id="modify-${v.vehicleTypeID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Update Vehicle Type</h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form action="VehicleTypeController">
                                                                                <input type="hidden" name="vehicleTypeID" value="${v.vehicleTypeID}">
                                                                                <label for="vehicleTypeName">Vehicle Type Name</label>
                                                                                <input type="text" name="vehicleTypeName" id="vehicleTypeName" required="" value="${v.vehicleTypeName}">
                                                                                <br>
                                                                                <label for="totalSeat">Total Seat</label>
                                                                                <input type="number" name="totalSeat" id="totalSeat" required="" value="${v.totalSeat}">

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
                                                            <form action="VehicleTypeController" method="GET">
                                                                <input type="hidden" name="vehicleTypeID" value="${v.vehicleTypeID}">
                                                                <input type="submit" name="action" value="delete">
                                                            </form>
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
                                <span>Copyright &copy; ETransportationManagement_GROUP STRESS</span>
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
            <script>
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
            </script>

            <script>
                var vehicleTypeName = document.querySelector("input[name=vehicleTypeName]");
                var totalSeat = document.querySelector("input[name=totalSeat]");

                document.querySelector("button[value=create]").addEventListener("click", function () {
                    sessionStorage.setItem("vehicleTypeName", vehicleTypeName.value);
                    sessionStorage.setItem("totalSeat", totalSeat.value);
                }
                );
                <c:if test="${requestScope.ERROR != null}">
                $(document).ready(function (e) {
                    $(".add-modal").modal('show');
                });
                vehicleTypeName.value = sessionStorage.getItem("vehicleTypeName");
                totalSeat.value = sessionStorage.getItem("totalSeat");
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
                    $('input[type="search"]').val('${VEHICLE_TYPE_ID}').keyup();
                });
                </c:if>
            </script>
    </body>

</html>
