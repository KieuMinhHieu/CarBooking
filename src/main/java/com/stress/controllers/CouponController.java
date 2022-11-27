/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.stress.controllers;

import com.stress.dao.CouponDAO;
import com.stress.dto.Coupon;
import com.stress.dto.User;
import com.stress.dto.UserCoupon;
import com.stress.service.CouponDaoImpl;
import com.stress.utils.ContentIdGenerator;
import com.stress.utils.Email;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KieuMinhHieu
 */
@WebServlet(name = "CouponController", urlPatterns = {"/Coupon"})
public class CouponController extends HttpServlet {
     private final CouponDAO couponDAO = new CouponDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            this.doPost(request, response);
        } catch (Exception e) {
            log("Error at CouponController-doGet: " + e.toString());
        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
             String action = request.getParameter("action");
             switch (action) {
                case "show":
                    showCoupon(request,response);
                    break;
                case "delete":
                    deleteCoupon(request,response);
                    break;
                case "Update":
                    updateCoupon(request,response);
                    break;
                case "Add":
                    addCoupon(request,response);
                    break;
                case "getCoupon":
                    getCoupon(request,response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
        }
    }

    private void showCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        String url="Error";
        try {
            String test = java.time.LocalDate.now().toString();
            List<Coupon> list=couponDAO.getAllCoupon(test);
            request.setAttribute("LIST_COUPON", list);
            System.out.println(list);
            url="./admin/coupon.jsp";

        } catch (Exception e) {
            log("Error at showCoupon- Controller:"+e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void deleteCoupon(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            String couponID=request.getParameter("couponID");
            if(couponDAO.setNumOfCoupon(couponID,0)){
                request.setAttribute("SUCCESS", "Delete Successfully!");
                request.setAttribute("COUPONID", couponID);
                showCoupon(request, response);
            }
        } catch (Exception e) {
            log("Error at showCoupon- Controller:"+e.toString());
        }
    }

    private void updateCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try {
            String couponID=request.getParameter("couponID");
            int percent=Integer.parseInt(request.getParameter("percent"));
            Date exDate=Date.valueOf(request.getParameter("exDate"));
            Time exTime=Time.valueOf(request.getParameter("exTime"));
            int count=Integer.parseInt(request.getParameter("count"));
            Coupon coupon=new Coupon(couponID, percent, count, exDate, exTime);
            if(couponDAO.updateCoupon(coupon)){
                request.setAttribute("SUCCESS", "Update Successfully!");
                request.setAttribute("COUPONID", couponID);
                showCoupon(request, response);
            }
        } catch (Exception e) {
            log("Error at showCoupon- Controller:"+e.toString());
        } 
    }

    private void addCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try {
            int percent=Integer.parseInt(request.getParameter("percent"));
            String exDate=request.getParameter("exDate");
            String exTime=request.getParameter("exTime");
            int count=Integer.parseInt(request.getParameter("count"));
            String couponID = ContentIdGenerator.getRandomWord(7);
            Coupon check=couponDAO.getCouponByPercentOrID(percent,couponID);
            if (check == null) {
                if (couponDAO.addCoupon(couponID,count, percent, exDate, exTime)) {
                    
                    request.setAttribute("SUCCESS", "Adding Successfully!");
                    request.setAttribute("COUPONID", couponID);
                    showCoupon(request, response);
                }
            }else{
                check = couponDAO.getNewCoupon();
                request.setAttribute("COUPONID", check.getCouponID());
                request.setAttribute("FAIL", "Coupon has already existed!");
                showCoupon(request, response);
            }
            
        } catch (Exception e) {
            log("Error at addCoupon- Controller:"+e.toString());
        } 
    }

    private void getCoupon(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            String couponID=request.getParameter("couponID");
            HttpSession session=request.getSession();
            User loginUser=(User)session.getAttribute("LOGIN_USER");
            int count=Integer.parseInt(request.getParameter("numOfCoupon"));
            UserCoupon userCoupon=couponDAO.getUserCoupon(loginUser.getUserID(), couponID);
            Coupon coupon=couponDAO.getCouponByID(couponID);
            if (userCoupon == null) {
                if (couponDAO.insertUserCoupon(loginUser.getUserID(), couponID)) {
                    if (couponDAO.setNumOfCoupon(couponID, count-1)) {
                        boolean sendCode = Email.sendEmail(loginUser.getEmail(),"" , "Your coupon code:"
                        + couponID + "\n" + "Validate to: " + coupon.getExpiryDate()+" at"+coupon.getExpiryTime() + "\n\tDon't forget to use! For further information"
                        + ", Please Contact: 079_809_1101\n\t\t\tGROUP STRESS", "Coupon for you");
                        if(sendCode){
                            request.setAttribute("CHECK_OUT_SUCCESS", "Coupon is ready!");
                        }
                    } else {
                        request.setAttribute("FAIL", "The number of coupons is sold out!");
                    }
                }
            }else if(userCoupon.getStatus()==0){
                if(couponDAO.setStatusUserCoupon(loginUser.getUserID(), couponID, 1)){
                    if (couponDAO.setNumOfCoupon(couponID, count-1)) {
                        boolean sendCode = Email.sendEmail(loginUser.getEmail(),"" , "Your coupon code:"
                        + couponID + "\n" + "Validate to: " + coupon.getExpiryDate()+" at "+coupon.getExpiryTime() + "\n\tDon't forget to use! For further information"
                        + ", Please Contact: 079_809_1101\n\t\t\tGROUP STRESS", "Coupon for you");
                        if(sendCode){
                            request.setAttribute("CHECK_OUT_SUCCESS", "Coupon is ready!");
                        }
                    } else {
                        request.setAttribute("FAIL", "The number of coupons is sold out!");
                    }
                }
            }              
            else{
                 request.setAttribute("FAIL", "You had already get coupon!");
            }
            
            
        } catch (Exception e) {
            log("Error at getCoupon- Controller:"+e.toString());
        } finally {
            request.getRequestDispatcher("/home").forward(request, response);
        }
    }

}
