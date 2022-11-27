<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-car"></i>
        </div>
        <div class="sidebar-brand-text mx-3">ETrans Staff </div>
    </a>
<!--     Divider 
    <hr class="sidebar-divider my-0">
     Nav Item - Dashboard 
    <li class="nav-item active">
        <a class="nav-link" href="index.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>
     Divider -->
    <hr class="sidebar-divider">
    <!-- Heading -->
    <div class="sidebar-heading">
        Tables
    </div>
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user?action=viewUser">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>User</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/route?action=show">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Route</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/Coupon?action=show">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Coupon</span></a>
    </li>
    <!--    <li class="nav-item">
            <a class="nav-link" href="orderTable.jsp">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Order</span></a>
        </li>
    -->        

    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/VehicleTypeController?action=show">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Vehicle Type</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/VehicleController?action=show">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Vehicle</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/driverlicense?action=show">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Driver License</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/driver?action=show">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Driver</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/location?action=view">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Location</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/trip?action=show">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Trip</span></a>
    </li>
    <!--    <li class="nav-item">
            <a class="nav-link" href="seatTable.jsp">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Seat</span></a>
        </li>-->
    <!--    <li class="nav-item">
            <a class="nav-link" href="ticketTable.jsp">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Ticket</span></a>
        </li>-->
    <!-- Nav Item - Charts -->
    <!--    <li class="nav-item">
            <a class="nav-link" href="routeTable.jsp">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Charts</span></a>
        </li>-->
    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>
</ul>

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
