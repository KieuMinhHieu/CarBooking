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
                            <div class="row">
                                <h1 class="col-md-6 m-0 font-weight-bold text-primary" style="color: #00b3ee;" >User Table</h1>
                            <c:if test="${requestScope.DELETE_HISTORY!=null}">
                                <div class="col-md-6">
                                    <a href="${pageContext.request.contextPath}/user?action=viewUser" style="margin-right: 10px" class="btn btn-primary float-right">View All</a>                                    
                                </div>
                            </c:if>
                            <c:if test="${requestScope.DELETE_HISTORY==null}">
                                <div class="col-md-6">
                                    <a href="${pageContext.request.contextPath}/user?action=deleteHistory" style="margin-right: 10px" class="btn btn-primary float-right">Delete History</a>
                                </div>
                            </c:if>
                            </div>
                            
                            <!-- DataTales Example -->
                            <div class="card shadow mb-4">
                                <div class="card-body">
                                    <div class="table-responsive" >
<!--                                        <form class="float-right mb-4"action="${pageContext.request.contextPath}/user">
                        Search:  <input style="border-color: #D1D3E2"  type="text" name="search" id="gfg" value="${requestScope.SEARCH}">
                                              <input type="hidden" name="action" value="Search">
                                        </form>-->
                                        <table class="showall table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>UserID</th>
                                                    <th>Name</th>
                                                    <th>Gender</th>
                                                    <th>Birthday</th>
                                                    <th>Email</th>
                                                    <th>Phone Number</th>
                                                    <th>Address</th>
                                                    <th>Password</th>
                                                    <th>Role</th>
                                                    <th>Status</th>
                                                    <th>EDIT</th>
                                                </tr>
                                            </thead>
                                            <tbody id="geeks">
                                            <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
<!--                                                <form action="MainController">-->
                                                    <tr>
                                                        <td>${counter.count}</td>
                                                        <td>${user.userID}</td>
                                                        <td>${user.username}</td>
                                                        <c:if test="${user.sex==true}">
                                                            <td>Male</td>
                                                        </c:if>
                                                        <c:if test="${user.sex==false}">
                                                            <td>Female</td>
                                                        </c:if>
                                                        <td>${user.dob}</td>
                                                        <td>${user.email}</td>
                                                        <td>${user.phoneNumber}</td>
                                                        <td>${user.address}</td>
                                                        
                                                        <td>*****</td>
                                                        <td>${user.role.roleName}</td>
                                                        <td><c:choose>
                                                            <c:when test="${user.status eq 2}">
                                                                GOOGLE
                                                            </c:when>
                                                            <c:when test="${user.status eq 1}">
                                                                NORMAL
                                                            </c:when>
                                                            <c:when test="${user.status eq 0}">
                                                                DELETE
                                                            </c:when>
                                                        </c:choose>
                                                        </td>
                                                        <c:if test="${requestScope.DELETE_HISTORY!=null}">
                                                            <td>
                                                                <a href="${pageContext.request.contextPath}/user?action=activeUser&userID=${user.userID}">ACTIVE</a>
                                                            </td>
                                                        </c:if>
                                                            
                                                        <c:if test="${requestScope.DELETE_HISTORY==null}">
                                                            <td>
                                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Edit-${user.userID.trim()}">EDIT</button>
                                                            </td>
                                                        </c:if>
                                                    </tr>
                                            <!--Start-Modal Update-->
                                            
                                            <div class="modal fade" id="Edit-${user.userID.trim()}" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <button type="button" class="close" data-dismiss="modal"><i class="icon-xs-o-md"></i></button>
                                                        <div class="modal-header">
                                                            <h4 class="modal-title caps"><strong>USER</strong></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="${pageContext.request.contextPath}/user" method="POST" id="formUpdate">
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">UserID</label>
                                                                    <input type="text" class="form-control" name="userID" readonly=""  value="${user.userID}">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">Name</label>
                                                                    <input type="text" class="form-control" id="nameInput" name="userName"  value="${user.username}" readonly="">
                                                                </div>

                                                                <div class="row" style="display: inline-flex">
                                                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                                                        <label for="recipient-name" class="col-form-label">Gender</label>
                                                                        <select class="form-select" style="width: 100%;height: 38px;border-radius: 5px; padding-left: 10px;border-color: #D1D3E2; color: #000"
                                                                                name="gender" aria-label="Default select example" disabled="">
                                                                            <option value="1"${user.sex eq true?"selected":""}>Male</option>
                                                                            <option value="0"${user.sex eq false?"selected":""}>Female</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group col-sm-6 mb-3 mb-sm-0">
                                                                        <label for="recipient-name" class="col-form-label">Birthday</label>
                                                                        <input type="date" class="form-control" name="birthday"  value="${user.dob}" readonly="">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">Email</label>
                                                                    <input type="email" class="form-control" name="email"  value="${user.email}" id="InputEmail" readonly="">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">Phone Number</label> <br/>
                                                                    <input type="text" class="form-control" name="phoneNum" id="InputPhoneNum"  value="${user.phoneNumber}" readonly="">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="recipient-name" class="col-form-label">Address</label>
                                                                    <input type="text" class="form-control" name="address"  value="${user.address}" readonly="">
                                                                </div>
                                                                <div class="form-group row" style="display: inline-flex">
                                                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                                                        <label for="recipient-name" class="col-form-label">Role</label><br/> 

                                                                        <select class="form-select" style="width: 100%;height: 38px;border-radius: 5px; padding-left: 10px;border-color: #D1D3E2; color: #000"
                                                                                name="roleID" >
                                                                            <option  value="1" ${user.role.roleID eq "1"?"selected":""}>USER</option>
                                                                            <option  value="2" ${user.role.roleID eq "2"?"selected":""}>STAFF</option>
                                                                        </select>
                                                                    </div>

                                                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                                                        <label for="recipient-name" class="col-form-label">Status</label>      
                                                                        <select class="form-select" style="width: 100%;height: 38px;border-radius: 5px; padding-left: 10px;border-color: #D1D3E2; color: #000"
                                                                                name="status" aria-label="Default select example" disabled="">
                                                                            <option value="2" ${user.status eq 2?"selected":""}>GOOGLE</option>
                                                                            <option value="1" ${user.status eq 1?"selected":""}>NORMAL</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <input type="password" name="password" value="${user.password}" style="display: none" />
                                                                    <input style="background-color: #28fe09;border-radius: 5px; padding: 5px 10px; border-color: grey" type="submit" name="action" value="Update" >
                                                                    <button type="button" class="btn btn-info" style="background-color:  #ff253a" data-toggle="modal" data-target="#delete-${user.userID.trim()}" data-dismiss="modal">Delete</button>
                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           
                                            <!-- End- Modal Update-->
                                            
                                            <!--Start-Modal Delete-->
                                            <div class="modal fade" id="delete-${user.userID.trim()}" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <button type="button" class="close" data-dismiss="modal"><i class="icon-xs-o-md"></i></button>
                                                        <div class="modal-header">
                                                            <h4 class="modal-title caps"><strong>Delete USER ${user.username}</strong></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="${pageContext.request.contextPath}/user" method="GET">
                                                                <div class="float-right">
                                                                    <input type="hidden" name="userID" value="${user.userID.trim()}">
                                                                    <button type="submit" style="background-color: #ff253a" name="action" value="delete" class="btn btn-primary">
                                                                        Delete
                                                                    </button>
                                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Edit-${user.userID.trim()}" data-dismiss="modal">Close</button>
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
        <script type="text/javascript">
            <c:if test="${requestScope.SUCCESS != null}">
                $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
                    var idField = parseInt($('input[type="search"]').val(), 10);
                    var id = parseFloat(data[1]) || 1; // use data for the age column
                    if ((isNaN(idField)) || (isNaN(idField)) ||
                            (idField <= id) || (idField <= id) ) {
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
                    $('input[type="search"]').val('${userID}').keyup();
                });
            </c:if>
        </script>
    </body>
</html>
