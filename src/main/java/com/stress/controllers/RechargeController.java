/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.stress.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Huy
 */
@WebServlet(name = "RechargeController", urlPatterns = {"/recharge"})
public class RechargeController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "recharge":
                    ShowRechargePage(request,response);
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
    }

    private void ShowRechargePage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try {
            request.getRequestDispatcher("/client/recharge.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

}
