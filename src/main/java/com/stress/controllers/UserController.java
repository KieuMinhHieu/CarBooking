
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.stress.controllers;

import com.stress.dao.RouteDAO;
import com.stress.dao.UserDAO;
import com.stress.dto.City;
import com.stress.dto.Location;
import com.stress.dto.Role;
import com.stress.dto.Route;
import com.stress.dto.User;
import com.stress.service.CityDAOImpl;
import com.stress.service.LocationDAOImpl;
import com.stress.service.RouteDAOImpl;
import com.stress.service.UserDAOImpl;
import com.stress.utils.ContentIdGenerator;
import com.stress.utils.Email;
import com.stress.utils.Hash;
import com.stress.utils.VerifyRecaptcha;
import java.io.IOException;
import java.sql.Date;
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
@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        try {
            this.doPost(request, response);
        } catch (Exception e) {
            log("Error at UserController-doGet: " + e.toString());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        try {
            String action = request.getParameter("action");
            System.out.println("action:" + action);
            switch (action) {
                case "RegisterAccount":
//                    sendCode(request,response);
                    checkAccount(request, response);
                    break;
                case "Update":
                    updateUser(request, response);
                    break;
                case "Login":
                    loginUser(request, response);
                    break;
                case "viewUser":
                    viewUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "deleteHistory":
                    deleteHistory(request, response);
                    break;
                case "activeUser":
                    activeUser(request, response);
                    break;
                case "Search":
                    searchUser(request, response);
                    break;
                case "Get Password by Email":
                    updatePassword(request, response);
                    break;
                case "Confirm":
                    registerUser(request, response);
                    break;
            }
        } catch (Exception e) {

        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String url = "/home";
        try {
            HttpSession session = request.getSession();
            String userCode = request.getParameter("codeEmail");
            String code = (String) session.getAttribute("CODE");
            User userRegister = (User) session.getAttribute("USER_REGISTER");
            System.out.println("User : " + userRegister);
            UserDAO dao = new UserDAOImpl();
            boolean check = code.equals(userCode);
            System.out.println("check : " + check);
            if (code.equals(userCode) == true) {
                if (dao.activeUser(userRegister.getUserID())) {
                    request.setAttribute("ACTIVE_LOGINFORM", "demo-1");
                    session.removeAttribute("CODE");
                    session.removeAttribute("USER_REGISTER");
                    url = "/home";
                }
            } else {
                request.setAttribute("ERROR_CODE", "Your code is not correct!");
            }
        } catch (Exception e) {
            log("Error at UserController - Register:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void viewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String url = "./admin/404.jsp";
        try {
            UserDAO dao = new UserDAOImpl();
            List<User> list = dao.getAllUser();
            //if (!list.isEmpty()) {
            request.setAttribute("LIST_USER", list);
            url = "./admin/userTable.jsp";
            //}
        } catch (Exception e) {
            log("Error at UserController - ViewUser: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try {
            String userID = request.getParameter("userID");
            String userName = request.getParameter("userName");
            String birthday = request.getParameter("birthday");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNum = request.getParameter("phoneNum");
            String roleID = request.getParameter("roleID");
            String status = request.getParameter("status");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAOImpl();
            boolean checkUpdate = dao.updateUser(userID, userName, email, birthday, address, phoneNum, gender, roleID, status, password);
            if (checkUpdate) {
                request.setAttribute("SUCCESS", "UPDATE USER SUCCESSFULLY");
                request.setAttribute("userID", userID);
                viewUser(request, response);
            }
        } catch (Exception e) {
            log("Error at UserController - updateUser: " + e.toString());
        }

    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        try {
            String userID = request.getParameter("userID");
            UserDAO dao = new UserDAOImpl();
            boolean check = dao.deleteUser(userID);
            if (check) {
                request.setAttribute("SUCCESS", "DELETE USER SUCCESSFULLY");
                viewUser(request, response);
            }
        } catch (Exception e) {
            log("Error at UserController - deleteUser: " + e.toString());
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String url = "./client/index.jsp";
        try {
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String hashPassword = Hash.hash(password);
            String gRecaptcha = request.getParameter("g-recaptcha-response");
            UserDAO dao = new UserDAOImpl();
            User loginUser = dao.getUserByIDAndPassword(userID, hashPassword);
            System.out.println("hash: " + hashPassword);
            User userIDCheck = dao.getUserByID(userID);
            boolean verify = VerifyRecaptcha.verify(gRecaptcha);
            System.out.println(verify);
            if (verify) {
                if (userIDCheck != null && userIDCheck.getStatus() == 1) {
                    if (loginUser != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("LOGIN_USER", loginUser);
                        String tripID = (String) session.getAttribute("TRIP_ID");
                        String totalSeat = (String) session.getAttribute("TOTAL_SEAT");
                        if(tripID != null && totalSeat != null) {
                            session.removeAttribute("TRIP_ID");
                            session.removeAttribute("TRIP_ID");
                            url = "/book?action=choose-ticket&tripID=" + tripID + "&totalSeat=" + totalSeat;
                        }
                        else if (loginUser.getRole().getRoleID().equals("1")) {
                            url = "/home";
                        } else {
//                            url = "./admin/index.jsp";
                            viewRoute(request, response);
                        }
                    } else {
                        request.setAttribute("USERID", userID);
                        request.setAttribute("ACTIVE_LOGINFORM", "demo-1");
                        request.setAttribute("ERROR_LOGIN2", "Incorect Password. Please try again!");
                    }
                } else if (userIDCheck.getStatus() == 4) {
                    sendCode("?","ACTIVE_ACCOUNT", userIDCheck, userIDCheck, request, response);
                } else {
                    request.setAttribute("ACTIVE_LOGINFORM", "demo-1");
                    request.setAttribute("ERROR_LOGIN1", "Incorrect Account. Please try again!");
                }
            } else {
                request.setAttribute("USERID", userID);
                request.setAttribute("ACTIVE_LOGINFORM", "demo-1");
                request.setAttribute("ERROR_RECAPTCHA", "You missed the Captcha");
            }

        } catch (Exception e) {
            log("Error at UserController - Login: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    
    private void viewRoute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            String url = "./404.jsp";
            try {
                RouteDAO dao = new RouteDAOImpl();
                List<Route> list = dao.getAllRoute();
                List<Location> allLocation = new LocationDAOImpl().getAllLocation();
                List<City> cityList = new CityDAOImpl().getAllCity();

                request.setAttribute("ROUTE_LIST", list);
                request.setAttribute("CITY_LIST", cityList);

                request.setAttribute("LOCATION_LIST", allLocation);
                url = "./admin/routeTable.jsp";

            } catch (Exception e) {
                log("Error at RouteController - viewRoute: " + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
        }
    private void deleteHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String url = "./admin/404.jsp";
        try {
            UserDAO dao = new UserDAOImpl();
            List<User> list = dao.getAllUserDelete();
            if (!list.isEmpty()) {
                request.setAttribute("LIST_USER", list);
                request.setAttribute("DELETE_HISTORY", "Delete History");
                url = "./admin/userTable.jsp";
            } else {
                viewUser(request, response);
            }
        } catch (Exception e) {
            log("Error at UserController - ViewUser: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void activeUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        try {
            String userID = request.getParameter("userID");
            UserDAO dao = new UserDAOImpl();
            boolean check = dao.activeUser(userID);
            if (check) {
                viewUser(request, response);
            }
        } catch (Exception e) {
            log("Error at UserController - deleteUser: " + e.toString());
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String url = "./admin/404.jsp";
        try {
            String search = request.getParameter("search");
            UserDAO userDAO = new UserDAOImpl();
            List<User> user = userDAO.searchUser(search);
            if (!user.isEmpty()) {
                request.setAttribute("LIST_USER", user);
                request.setAttribute("SEARCH", search);
                url = "./admin/userTable.jsp";
            }

        } catch (Exception e) {
            log("Error at UserController - deleteUser: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String url = "/home";
        try {
            UserDAO dao = new UserDAOImpl();
            String userID = request.getParameter("userID");
            String password = ContentIdGenerator.getRandomWord(10);
            String hashPassword = Hash.hash(password);
            User user = dao.getUserByID(userID);
            request.setAttribute("RESET_PASSWORD", "reset");
            if (user != null) {
                boolean check = dao.updatePassword(userID, hashPassword, user.getEmail());
                if (check) {
                    boolean checkSend = Email.sendEmail(user.getEmail(), password, "New password is ", "Reset Password");
                    if (checkSend) {
                        request.setAttribute("SUCCESS", "New password have been sent!");
                    }
                }
            } else {
                request.setAttribute("ERROR_FORGOT", "Your account dose not exist!");
            }
        } catch (Exception e) {
            log("Error at UserController - updatePassword: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void sendCode(String content,String check, User userRegister, User userInfor, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String url = "/home";
        try {
            HttpSession session = request.getSession();
            request.setAttribute("USER_TMP", userInfor);
            String code = ContentIdGenerator.getRandomWord(7);
            boolean sendCode = Email.sendEmail(userRegister.getEmail(), code, "Verify code: ", "Verify Email");
            if (sendCode) {
                session.setAttribute("USER_REGISTER", userRegister);
                session.setAttribute("CODE", code);
                request.setAttribute(check, content);
                System.out.println("check " + check);
            }
        } catch (Exception e) {
            log("Error at UserController - Register:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void checkAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String url = "/home";
        try {
            String userName = request.getParameter("userName");
            String birthday = request.getParameter("birthday");
            Date date = Date.valueOf(birthday);
            String gender = request.getParameter("gender");
            boolean sex = false;
            if (gender.equals("1")) {
                sex = true;
            }
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNum = request.getParameter("phoneNum");
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String hashPassword = Hash.hash(password);
            Role role = new Role("1", "User");
            User userRegister = new User(userID, userName, hashPassword, email, date, address, phoneNum, sex, role, "0", 4);
            User userInfor = new User(userID, userName, password, email, date, address, phoneNum, sex, role, "0", 4);
            User userTmp = new User();
            UserDAO dao = new UserDAOImpl();
            User userIDCheck = dao.getUserByID(userID);
            request.setAttribute("USER_TMP", userInfor);
            if (userIDCheck == null) {
                if (dao.registerNewUSer(userRegister)) {
                    sendCode("?","CHECK_MAIL", userRegister, userInfor, request, response);
                }
            } else if (userIDCheck.getStatus() == 4) {
                if (dao.updateUser(userID, userName, email, birthday, address, phoneNum, gender, "1", "0", hashPassword)) {
                    sendCode(" with new information?","ACTIVE_ACCOUNT", userIDCheck, userTmp, request, response);
                }
            } else {
                request.setAttribute("ERROR_USERID", "Your account already existed. Try Again!");
            }
        } catch (Exception e) {
            log("Error at UserController - checkAccount:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }
}
