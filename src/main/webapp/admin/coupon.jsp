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
        <title>Coupon Tables</title>
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
                            <div class="row">
                                <h1 class="col-md-6 m-0 font-weight-bold text-primary" style="color: #00b3ee;" >Coupon Table</h1>
                                <div class="col-md-6">
                                    <button type="button" class="btn btn-primary float-right" style="margin-right: 10px" data-toggle="modal" data-target="#ADD">ADDING</button>
                                </div>
                                <!--Start-Modal Update-->

                                <div class="modal fade" id="ADD" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal"><i class="icon-xs-o-md"></i></button>
                                            <div class="modal-header">
                                                <h4 class="modal-title caps"><strong>Adding Coupon</strong></h4>
                                            </div>
                                            <div class="modal-body">
                                                <form action="${pageContext.request.contextPath}/Coupon" method="GET" id="formAdd">
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Discount</label>
                                                    <input type="number" class="form-control" id="percentInput" name="percent"  value="" required="" min="1">
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Expiration Date</label>
                                                    <input type="date" class="form-control" name="exDate"  value="" id="InputDateAdd" required="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Expiration Time</label> <br/>
                                                    <input type="time" class="form-control" name="exTime" id="InputTime"  value="" required="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="recipient-name" class="col-form-label">Number of Coupon</label>
                                                    <input type="number" class="form-control" name="count"  value="" min="1" required="">
                                                </div>

                                                <div class="modal-footer">
                                                    <input style="background-color: #5b83fc;border-radius: 5px; padding: 5px 10px; border-color: grey" id="AddCoupon" type="submit" name="action" value="Add" >
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- End- Modal Update-->
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive" >
                                    <table class="showall table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Coupon ID</th>
                                                <th>Discount</th>
                                                <th>Expiration Date</th>
                                                <th>Expiration Time</th>
                                                <th>Number of Coupon</th>
                                                <th>EDIT</th>
                                                <th>DELETE</th>
                                            </tr>
                                        </thead>
                                        <tbody id="geeks">
                                            <c:forEach var="coupon" varStatus="counter" items="${requestScope.LIST_COUPON}">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${coupon.couponID}</td>
                                                    <td>${coupon.percent}</td>
                                                    <td>${coupon.expiryDate}</td>
                                                    <td>${coupon.expiryTime}</td>
                                                    <td>${coupon.count}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Edit-${coupon.couponID}">EDIT</button>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-info" style="background-color:  #f04848" data-toggle="modal" data-target="#delete-${coupon.couponID}" data-dismiss="modal">Delete</button>
                                                    </td>
                                                </tr>
                                                <!--Start-Modal Update-->

                                            <div class="modal fade" id="Edit-${coupon.couponID}" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <button type="button" class="close" data-dismiss="modal"><i class="icon-xs-o-md"></i></button>
                                                        <div class="modal-header">
                                                            <h4 class="modal-title caps"><strong>Coupon</strong></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="${pageContext.request.contextPath}/Coupon" method="POST" id="formUpdate">
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">Coupon ID</label>
                                                                    <input type="text" class="form-control" name="couponID" readonly="" value="${coupon.couponID}">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">Discount</label>
                                                                    <input type="number" class="form-control" id="percentInput" name="percent"  value="${coupon.percent}" required="" readonly="" >
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">Expiration Date</label>
                                                                    <input type="date" class="form-control" name="exDate"  value="${coupon.expiryDate}" id="InputDate" required="">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">Expiration Time</label> <br/>
                                                                    <input type="time" class="form-control" name="exTime" id="InputTime"  value="${coupon.expiryTime}" required="">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">Number of Coupon</label>
                                                                    <input type="number" class="form-control" name="count"  value="${coupon.count}" min="1" required="">
                                                                </div>

                                                                <div class="modal-footer">
                                                                    <input style="background-color: #5b83fc;border-radius: 5px; padding: 5px 10px; border-color: grey" id="updateCoupon" type="submit" name="action" value="Update" >
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- End- Modal Update-->
                                            <!--Start-Modal Delete-->
                                            <div class="modal fade" id="delete-${coupon.couponID}" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <button type="button" class="close" data-dismiss="modal"><i class="icon-xs-o-md"></i></button>
                                                        <div class="modal-header">
                                                            <h4 class="modal-title caps"><strong>Delete Coupon #${coupon.couponID}</strong></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="${pageContext.request.contextPath}/Coupon" method="GET">
                                                                <div class="float-right">
                                                                    <input type="hidden" name="couponID" value="${coupon.couponID}">
                                                                    <button type="submit" style="background-color: #f04848" name="action" value="delete" class="btn btn-primary">
                                                                        Delete
                                                                    </button>
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--END-Modal Delete-->
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
                            <span>Copyright &copy; Your Website 2020</span>
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
                        <h4 class="text-center font-weight-bold" style="margin:30px 0 40px 0;">${requestScope.SUCCESS}</h4>
                    </div>
                </div>
            </div>
        </div>
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
        <script src="${pageContext.request.contextPath}/admin/js/validationUpdateUser.js"></script>
        <jsp:include page="script_coupon.jsp"></jsp:include>
            <script type="text/javascript">
            <c:if test="${requestScope.COUPONID != null}">
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
                    var table = $('#example').DataTable();
                    // Event listener to the two range filtering inputs to redraw on input
                    $('input[type="search"]').keyup(function () {
                        table.draw();
                    });
                    $('input[type="search"]').val('${COUPONID}').keyup();
                });
            </c:if>
            
            <c:if test="${requestScope.SUCCESS!=null}">
                $(document).ready(function (e) {
                    $("#showsuccess").modal('show');
                });
            </c:if>
            <c:if test="${requestScope.FAIL!=null}">
                $(document).ready(function (e) {
                    $("#showfail").modal('show');
                });
            </c:if>
            
        </script>
    </body>
</html>
