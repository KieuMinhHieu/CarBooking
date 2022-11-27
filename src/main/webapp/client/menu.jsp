<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="header-top">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-sm-6 col-6 header-top-left">
                <ul>
                    <li><a href="tel:123-456-7890">Contact: 123-456-7890</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container main-menu">
    <div class="row align-items-center justify-content-between d-flex">
        <div id="logo">
            <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/client/img/logo.png" alt="" title="" /></a>
        </div>
        <nav id="nav-menu-container">
            <ul class="nav-menu d-flex align-items-center justify-content-center">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>




                <c:if test="${sessionScope.LOGIN_USER==null}">
                    
                    <li>
                        <button type="button" class="login text-light" data-toggle="modal" data-target="#loginForm">LOGIN</button>
                    </li>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER!=null}">
                    <li><a href="${pageContext.request.contextPath}/order?action=showHistory">Booking History</a></li>
                    <li class="text-light" style="font-size: 12px">
                        <i class="fa fa-wallet text-light">
                        </i> ${sessionScope.LOGIN_USER.accountBalance} VND</li>
                    <a href="${pageContext.request.contextPath}/recharge?action=recharge">
                        <span>Recharge</span>
                        <i class="fa fa-credit-card" aria-hidden="true"></i>
                    </a>
                    <li><a href="${pageContext.request.contextPath}/Logout">Logout</a></li>
                    </c:if>
            </ul>
        </nav><!-- #nav-menu-container -->
    </div>
</div>

<style>
    .login{
        background: none;
        border: none;
        font-size: 13px;
        margin-top: -2px;
    }
    .login:focus{
        background: none;
        border: none;
        font-size: 13px;
        margin-top: -2px;
        box-shadow: none;
    }
    .login:hover{
        background: none;
        border: none;
        text-decoration: underline #f8b600;
        color: #b88d1b;
    }
</style>