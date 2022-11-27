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
                            <div class="main-block">
                                <h1 class="text-center text-primary font-weight-bold">Create Trip</h1>
                                <div class="m-auto d-flex justify-content-center align-items-center">
                                    <div class="col-md-6">
                                        <div class="form h-100">
                                            <form class="mb-5" method="post" id="contactForm" name="contactForm">
                                                <h3 class="text-info">Route Detail</h3>
                                                <div class="row">
                                                    <div class="col-md-6 form-group mb-5">
                                                        <label for="" class="col-form-label">Route Name: </label>
                                                        <select class="form-control form-select" aria-label="Default select example">
                                                            <option value="1">Hồ Chí Minh - Hà Nội</option>
                                                            <option value="2">Hồ Chí Minh - Đà Lạt</option>
                                                            <option value="3">Hồ Chí Minh - Nha Trang</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <h3 class="text-info">Vehicle Detail</h3>
                                                <div class="row">
                                                    <div class="col-md-6 form-group mb-5">
                                                        <label for="" class="col-form-label">Vehicle Name: </label>
                                                        <select class="form-control form-select" aria-label="Default select example">
                                                            <option value="1">Hồ Chí Minh - Hà Nội</option>
                                                            <option value="2">Hồ Chí Minh - Đà Lạt</option>
                                                            <option value="3">Hồ Chí Minh - Nha Trang</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6 form-group mb-5">
                                                        <label for="" class="col-form-label">Vehicle Name: </label>
                                                        <select class="form-control form-select" aria-label="Default select example">
                                                            <option value="1">Hồ Chí Minh - Hà Nội</option>
                                                            <option value="2">Hồ Chí Minh - Đà Lạt</option>
                                                            <option value="3">Hồ Chí Minh - Nha Trang</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <h3 class="text-info">Driver Detail</h3>
                                                <div class="row">
                                                    <div class="col-md-6 form-group mb-5">
                                                        <label for="" class="col-form-label">Driver Name: </label>
                                                        <select class="form-control form-select" aria-label="Default select example">
                                                            <option value="1">Hồ Chí Minh - Hà Nội</option>
                                                            <option value="2">Hồ Chí Minh - Đà Lạt</option>
                                                            <option value="3">Hồ Chí Minh - Nha Trang</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 form-group">
                                                        <input type="submit" value="Submit" class="btn btn-primary rounded-0 py-2 px-4 float-right">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
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
    </body>
</html>
