
package com.stress.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TicketController", urlPatterns = {"/ticket"})
public class TicketController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "show":
                showTicket(request,response);
                break;
            case "add":
                addNewTicket(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
    }

    private void showTicket(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        try {
            
        } catch (Exception e) {
        }
    }

    private void addNewTicket(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        try {
            
        } catch (Exception e) {
        }
    }

}
