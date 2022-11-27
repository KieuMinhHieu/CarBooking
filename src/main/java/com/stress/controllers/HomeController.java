/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.stress.controllers;

import com.stress.dao.CouponDAO;
import com.stress.dao.RouteDAO;
import com.stress.dto.City;
import com.stress.dto.Coupon;
import com.stress.dto.Route;
import com.stress.service.CouponDaoImpl;
import com.stress.service.RouteDAOImpl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MinhQuang
 */
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RouteDAO dao = new RouteDAOImpl();
            List<Route> listRoute = dao.getAllRoute();
            request.setAttribute("LIST_ROUTE", listRoute);
            CouponDAO couponDAO = new CouponDaoImpl();
            HttpSession session = request.getSession();
            List<Coupon> listCoupon=couponDAO.getAllCoupon(java.time.LocalDate.now().toString());
            if (session.getAttribute("LOGIN_USER") == null) {
                //System.out.println("All: \n" +listCoupon);
                if (!listCoupon.isEmpty()) {
                    request.setAttribute("LIST_COUPON", listCoupon);
                }
            }else{
                List<Coupon> userCoupon = couponDAO.getAllCouponOfUser(java.time.LocalDate.now().toString());
                List<Coupon> listTmp=getCouponUserNot(userCoupon, listCoupon);
                if (!listTmp.isEmpty()) {
                    request.setAttribute("LIST_COUPON", listTmp);
                }
                else{
                    request.setAttribute("LIST_COUPON", listCoupon);
                }
                System.out.println("User coupon:"+couponDAO.getAllCouponOfUser(java.time.LocalDate.now().toString()));
                session.setAttribute("LIST_COUPON_USER", userCoupon);
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher("./client/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
        }
    
    private List<Coupon> getCouponUserNot(List<Coupon> userCoupon,List<Coupon> listCoupon){
         List<Coupon> listTmp=new ArrayList<>();
         for (Coupon coupon : listCoupon) {
             for (Coupon coupUser : userCoupon) {
                 if(!coupon.getCouponID().equals(coupUser.getCouponID())){
                     listTmp.add(coupon);
                 }
             }
        }
         return listTmp;
    }
}
