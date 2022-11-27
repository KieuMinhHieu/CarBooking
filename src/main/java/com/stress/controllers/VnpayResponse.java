/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.stress.controllers;

import com.stress.dao.UserDAO;
import com.stress.dto.Order;
import com.stress.dto.User;
import com.stress.service.PayPalService;
import com.stress.service.UserDAOImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Huy
 */
@WebServlet(name = "VnpayResponse", urlPatterns = {"/VnpayResponse"})
public class VnpayResponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/client/error.jsp";
        try {
            UserDAO userDAO = new UserDAOImpl();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            String curMoney = user.getAccountBalance();
            String vnp_Amount = request.getParameter("vnp_Amount");

            double totalMoney = Double.parseDouble(curMoney) + Double.parseDouble(vnp_Amount);

            String total = String.valueOf(totalMoney);
            total = total.substring(0, total.length() - 2);

            if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                user.setAccountBalance(total);
                Order order = (Order) session.getAttribute("ORDER");
                if (order != null) {
                    url = "./client/order.jsp";
                }
                else{
                    url = PayPalService.getBaseURL(request)+"/";
                }
                userDAO.updateUser(user.getUserID(), total);
                request.setAttribute("MONEY_RECHARGE_SUCCESS", "RECHARGE MOMNEY SUCCESSFULLY");
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                request.setAttribute("MONEY_RECHARGE_FAIL", "RECHARGE MOMNEY SUCCESSFULLY");
                if(url.equals(PayPalService.getBaseURL(request)+"/")) response.sendRedirect(url);
                request.getRequestDispatcher(url).forward(request, response);
            }

        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
