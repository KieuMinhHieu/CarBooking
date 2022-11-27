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

        <title>Driver Tables</title>

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
                                    <h2 class="m-0 font-weight-bold text-primary">DRIVERS</h2>
                                    <div>
                                        <button type="button" class="ml-10 btn btn-primary float-right" data-toggle="modal" data-target="#add">
                                            Add Driver 
                                        </button>
                                    <%
                                        String action = request.getParameter("action");
                                        if (!action.equals("deleteHistory")) {
                                    %>
                                    <a href="${pageContext.request.contextPath}/driver?action=deleteHistory" style="margin-right: 10px;" class="btn btn-primary float-right">Delete History</a>
                                    <%}%>
                                    <%
                                        if (action.equals("deleteHistory")) {
                                    %>
                                    <a href="${pageContext.request.contextPath}/driver?action=show" style="margin-right: 10px;" class="btn btn-primary float-right">Show All</a>
                                    <%}%>
                                </div>

                                <div class="add-modal modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Add new Driver</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="driver" method="post">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Driver ID</label>
                                                        <input type="text" name="driverID" class="add-driverID form-control" 
                                                               id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Driver ID" required>
                                                        <small style="color:red" id="id-error">${ADD_ERROR.driverID}</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Driver Name</label>
                                                        <input type="text" name="driverName" class="add-driverName form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Driver Name" required>
                                                        <small style="color:red" id="name-error">${ADD_ERROR.driverName}</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">DOB</label>
                                                        <input type="date" name="DOB" class="add-dob form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter DOB" required>
                                                        <small style="color:red" id="dob-error">${ADD_ERROR.DOB}</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Gender</label>
                                                        <select name="sex" class="form-control add-gender" required>
                                                            <option value="true" selected>MALE</option>
                                                            <option value="false">FEMALE</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Driver Picture</label>
                                                        <input type="text" name="driverPic" class="add-picture form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Driver Picture" required>
                                                        <small style="color:red" id="url-error">${ADD_ERROR.driverPicture}</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Phone Number</label>
                                                        <input type="text" name="phoneNumber" class="add-number form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone Number" required>
                                                        <small style="color:red" id="phone-error">${ADD_ERROR.phoneNumber}</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">Status</label>
                                                        <select name="status" class="form-control" required>
                                                            <option value="1" selected>ACTIVE</option>
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
                                                <th>Driver ID</th>
                                                <th>Driver Name</th>
                                                <th>DOB</th>
                                                <th>Gender</th>
                                                <th>Driver Picture</th>
                                                <th>Phone Number</th>
                                                <th>Status</th>
                                                <th>Modify</th>
                                                    <%
                                                        if (!action.equals("deleteHistory")) {
                                                    %>
                                                <th>Delete</th>
                                                    <%}%>
                                            </tr>
                                        </thead>
                                        <tbody id="content-data-update">
                                            <c:forEach items="${requestScope.LIST_ALL_DRIVER}" var="d" varStatus="counter">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${d.driverID}</td>
                                                    <td>${d.driverName}</td>
                                                    <td>${d.DOB}</td>
                                                    <td>${d.sex eq "true"? "MALE":"FEMALE"}</td>
                                                    <td><img style="width: 125px; height: 100px;" src="${d.driverPicture}" alt="alt"/></td>
                                                    <td>${d.phoneNumber}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${d.status eq 0}">
                                                                INACTIVE
                                                            </c:when>
                                                            <c:when test="${d.status eq 1}">
                                                                ACTIVE
                                                            </c:when>
                                                            <c:when test="${d.status eq 2}">
                                                                ONGOING
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <%if (action.equals("deleteHistory")) {%>
                                                    <td>
                                                        <form action="driver" method="post">
                                                            <input type="hidden" name="driverID" value="${d.driverID.trim()}">
                                                            <button type="submit" class="btn btn-primary" name="action" value="activeDriver">
                                                                <i class="fa fa-pen"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                    <%}%>
                                                    <%if (!action.equals("deleteHistory")) {%>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modify-${d.driverID.trim()}">
                                                            <i class="fa fa-pen"></i>
                                                        </button>
                                                        <div class="modal fade" id="modify-${d.driverID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Modify Driver ${d.driverName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="driver" method="post">
                                                                        <div class="modal-body">
                                                                            <div class="modal-body">
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Driver ID</label>
                                                                                    <input type="text" name="driverID" class="form-control" value="${d.driverID.trim()}" id="exampleInputEmail1" readonly placeholder="Enter Driver ID">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Driver Name</label>
                                                                                    <input type="text" name="driverName" class="form-control" value="${d.driverName.trim()}" id="exampleInputEmail1" placeholder="Enter Driver Name">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">DOB</label>
                                                                                    <input type="date" name="DOB" class="form-control" value="${d.DOB}" id="exampleInputEmail1" placeholder="Enter DOB">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Gender</label>
                                                                                    <select name="sex" class="form-control">
                                                                                        <option value="true" ${d.sex eq "1"?"selected":""}>MALE</option>
                                                                                        <option value="false" ${d.sex eq "0"?"selected":""}>FEMALE</option>
                                                                                    </select>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Driver Picture</label>
                                                                                    <input  type="text" name="driverPic" class="form-control" value="${d.driverPicture.trim()}" id="exampleInputEmail1" placeholder="Enter Driver Picture">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Phone Number</label>
                                                                                    <input type="text" name="phoneNumber" class="form-control" value="${d.phoneNumber.trim()}" id="exampleInputEmail1" placeholder="Enter Phone Number">
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
                                                                            <button type="submit" name="action" value="update" class="update-button btn btn-primary">Save</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>

                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#delete-${d.driverID.trim()}">
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </button>
                                                        <div class="modal fade" id="delete-${d.driverID.trim()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Delete Driver ${d.driverName}</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="driver" method="post">
                                                                        <div class="modal-footer">
                                                                            <input type="hidden" name="driverID" value="${d.driverID.trim()}">
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
                                                    <%}%>
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
                $('input[type="search"]').val('${driverID}').keyup();
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
            <c:if test="${requestScope.ERROR!=null}">
            $(document).ready(function (e) {
                $("#showerror").modal('show');
            });
            </c:if>
        </script>
    </body>
</html>
