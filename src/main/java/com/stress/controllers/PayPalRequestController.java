/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.stress.controllers;

import com.paypal.base.rest.PayPalRESTException;
import com.stress.dto.User;
import com.stress.service.PayPalService;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "PayPalRequestController", urlPatterns = {"/PayPalRequest"})
public class PayPalRequestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "sendPayPal":
                    pay(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "sendPayPal":
                    pay(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void pay(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            String priceInString = request.getParameter("amount");
            Double price = Math.round((Double.parseDouble(priceInString)/23000.0)*100.0)/100.0;
            
            PayPalService paypalService = new PayPalService();
            String approvalLink = paypalService.authorizePayment(String.valueOf(price), user, request);
            session.setAttribute("Paypal_recharge", priceInString);
            response.sendRedirect(approvalLink);
            
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
            request.getRequestDispatcher("/client/error.jsp").forward(request, response);
        }
    }
}
