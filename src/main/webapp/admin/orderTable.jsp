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
                    <c:if test="${requestScope.RETURN_SUCCESS!=null}">
                        <div class="mt-10 alert alert-success" role="alert">
                            <h1 class="alert-heading text-center">Well done!</h1>
                            <h4 class="text-center mb-0">Return ticket successfully !!!</h4>
                        </div>
                    </c:if>
                    <!-- Return Ticket Information -->
                    <c:if test="${requestScope.RETURN_SUCCESS==null}">
                        <h2 class="text-center">The Order is Belong to ${requestScope.ORDER.user.username}</h2>
                        <table class="m-auto">
                            <tbody>
                                <tr>
                                    <td style="font-size: 20px">Order ID</td>
                                    <td style="font-size: 20px">: ${requestScope.ORDER.orderID}</td>
                                </tr>
                                <tr>
                                    <td style="font-size: 20px">Total Price</td>
                                    <td style="font-size: 20px">: ${requestScope.ORDER.totalPrice}</td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- Begin Page Content -->
                        <form class="text-center" action="order" method="POST">
                            <input type="hidden" value="${requestScope.ORDER.orderID}" name="orderID">
                            <c:if test="${requestScope.ORDER.status == 3}"> 
                            <input type="submit" style="margin-top: 10px" class="btn btn-primary" value="Approve" name="action">
                            </c:if>
                            <input type="submit" style="margin-top: 10px"class="btn btn-danger" value="Reject" name="action">
                        </form>
                    </c:if>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->
                <!--Success alert-->

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






    </body> 
</html>
