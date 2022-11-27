package com.stress.controllers;

import com.stress.dao.UserDAO;
import com.stress.dto.GooglePojo;

import com.stress.utils.GoogleUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.stress.dto.User;
import com.stress.service.UserDAOImpl;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginGoogleController extends HttpServlet {

    private static final String ERROR = "client/login.jsp";
    private static final String USER_ROLE = "1";
    private static final String ADMIN_ROLE = "2";
    private static final String ADMIN = "admin/index.jsp";
    private static final String USER = "home";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            if (code != null && !code.isEmpty()) {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                if (googlePojo != null) {
                    UserDAO userDao = new UserDAOImpl();
                    User loginUser = userDao.getUserByEmail(googlePojo.getEmail());
                    if (loginUser != null) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        String tripID = (String) session.getAttribute("TRIP_ID");
                        String totalSeat = (String) session.getAttribute("TOTAL_SEAT");
                        if (tripID != null && totalSeat != null) {
                            session.removeAttribute("TRIP_ID");
                            session.removeAttribute("TOTAL_SEAT");

                            url = "/book?action=choose-ticket&tripID=" + tripID + "&totalSeat=" + totalSeat;
                        } else {
                            if (loginUser.getRole().getRoleID().trim().equals(ADMIN_ROLE)) {
                                url = ADMIN;
                            }
                            if (loginUser.getRole().getRoleID().trim().equals(USER_ROLE)) {
                                url = USER;
                            }
                        }
                    } else {
                        if (userDao.registerByEmail(googlePojo)) {
                            User user = userDao.getUserByID(googlePojo.getId());
                            session.setAttribute("LOGIN_USER", user);
                            url = USER;
                        }
                    }

                }
            }
        } catch (Exception e) {
            System.out.println("Error at Login Google Controller " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
