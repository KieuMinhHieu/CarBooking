
package com.stress.controllers;

import com.stress.dao.SeatDAO;
import com.stress.dto.Seat;
import com.stress.service.SeatDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SeatController", urlPatterns = {"/seat"})
public class SeatController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "showUnavailable":
                showUnavailable(request,response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void showUnavailable(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        try {
            String tripID = request.getParameter("tripID");
            SeatDAO seatDAO = new SeatDAOImpl();
            PrintWriter out = response.getWriter();
            
            List<Seat> list = seatDAO.getAllUnAvailbeSeatByTripID(tripID);
            if(!list.isEmpty()){
                for (Seat seat : list) {
                    out.print(seat.getSeatID().trim()+",");
                }
            }
            else{
                out.print("");
            }
        } catch (Exception e) {
        }
    }


}
