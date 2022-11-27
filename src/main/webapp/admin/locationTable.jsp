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
        <title>Location Tables</title>
        <link href="${pageContext.request.contextPath}/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/admin/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <div id="wrapper">
            <jsp:include page="sidebar.jsp"></jsp:include>
                <div id="content-wrapper" class="d-flex flex-column">
                    <div id="content">
                    <jsp:include page="topbar.jsp"></jsp:include>
                        <div class="container-fluid">
                            <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Add a Location</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="${pageContext.request.contextPath}/admin/location?action=add" method="POST">
                                            <div class="form-group">
                                                <label for="LocationName">Location Name</label>
                                                <input type="text" name="LocationName" class="form-control" value="${location.locationName}" id="LocationName" placeholder="Enter Location Name">
                                            </div>
                                            <div class="form-group">
                                                <label for="Address">Address</label>
                                                <input type="text" name="Address" class="form-control" value="${location.address}" id="Address" placeholder="Enter Address">
                                            </div>
                                            <div class="form-group">
                                                <label for="City">City</label>
                                                <select name="City" class="form-control">
                                                    <c:forEach items="${LIST_CITY}" var="city">
                                                        <option value="${city.cityID}">${city.cityName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="Status">Status</label>
                                                <select name="Status" class="form-control">
                                                    <option value="true" selected>ACTIVE</option>
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
                            <h1 class="h3 mb-2 text-gray-800 text-center font-weight-bold">Location Table</h1>
                            
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex justify-content-center align-items-center">

                                        <div>
                                            <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#add">
                                                Add a Location
                                            </button>
                                            <a href="${pageContext.request.contextPath}/admin/location?action=view" style="margin-right: 10px" class="btn btn-primary float-right">Show All</a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Location ID</th>
                                                    <th>Location Name</th>
                                                    <th>Address</th>
                                                    <th>CityID - CityName</th>
                                                    <th>Status</th>
                                                    <th>EDIT</th>
                                                    <th>DELETE</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="location" items="${requestScope.LIST_LOCATION}">

                                                <tr>
                                                    <td>${location.locationID}</td>
                                                    <td>${location.locationName}</td>
                                                    <td>${location.address}</td>
                                                    <td>${location.city}</td>
                                                    <c:if test="${location.status==true}">
                                                        <td>Active</td>
                                                    </c:if>
                                                    <c:if test="${location.status==false}">
                                                        <td>Inactive</td>
                                                    </c:if>
                                                    <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Edit-${location.locationID}">EDIT</button>
                                                        <!--Start-Modal-->
                                                        <div class="modal fade" id="Edit-${location.locationID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">LOCATION</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="${pageContext.request.contextPath}/admin/location?action=update" method="POST" accept-charset="utf-8">
                                                                        <div class="modal-body">
                                                                            <div class="modal-body">
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Location ID</label>
                                                                                    <input type="text" name="LocationID" class="form-control" value="${location.locationID}" id="exampleInputEmail1" readonly>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Location Name</label>
                                                                                    <input type="text" name="LocationName" class="form-control" value="${location.locationName}" id="exampleInputEmail1" placeholder="Enter Location Name">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Address</label>
                                                                                    <input type="text" name="Address" class="form-control" value="${location.address}" id="exampleInputEmail1" placeholder="Enter Address">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">City</label>
                                                                                    <select name="CityID" class="form-control">
                                                                                        <c:forEach items="${LIST_CITY}" var="city">
                                                                                            <option value="${city.cityID}">${city.cityName}</option>
                                                                                        </c:forEach>
                                                                                    </select>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="exampleInputEmail1">Status</label>
                                                                                    <select name="Status" class="form-control">
                                                                                        <option value="true" ${location.status eq "1"?"selected":""}>Active</option>
                                                                                        <option value="false" ${location.status eq "0"?"selected":""}>Inactive</option>
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
                                                        <!-- End- Modal-->
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#delete-${location.locationID}">
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </button>
                                                        <div class="modal fade" id="delete-${location.locationID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Delete Location : ${location.locationName} ?</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="${pageContext.request.contextPath}/admin/location?action=delete" method="POST" accept-charset="utf-8">
                                                                        <div class="modal-footer">
                                                                            <input type="hidden" name="LocationID" value="${location.locationID}">
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
                </div>
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
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
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/admin/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/sb-admin-2.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/demo/datatables-demo.js"></script>
    </body>
</html>
