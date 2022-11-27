package com.stress.controllers;

import com.stress.dao.DriverDAO;
import com.stress.dto.Driver;
import com.stress.dto.DriverError;
import com.stress.service.DriverDAOImpl;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Huy
 */
@WebServlet(name = "DriverController", urlPatterns = {"/driver"})
public class DriverController extends HttpServlet {

//    private Driver driver = null;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                addNewDriver(request, response);
                break;
            case "delete":
                deleteDriver(request, response);
                break;
            case "update":
                updateDriver(request, response);
                break;
            case "activeDriver":
                activeDriver(request, response);
                break;

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "show":
                showDriverTable(request, response);
                break;
            case "deleteHistory":
                showDeletedDriverTable(request, response);
                break;
            case "showAvailableDriver":
                showAvailableDriver(request, response);
                break;
        }
    }

    private void showDriverTable(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            DriverDAO dao = new DriverDAOImpl();
            List<Driver> list = dao.getAllDriver();
            if (list != null) {
                request.setAttribute("LIST_ALL_DRIVER", list);
                request.getRequestDispatcher("/admin/driverTable.jsp").forward(request, response);
            } else {
                showErrorPage(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void addNewDriver(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String driverID = request.getParameter("driverID").trim();
            String driverName = request.getParameter("driverName").trim();
            String dob = request.getParameter("DOB").trim();
            String sex = request.getParameter("sex").trim();
            String driverPic = request.getParameter("driverPic").trim();
            String phoneNumber = request.getParameter("phoneNumber").trim();
            String status = request.getParameter("status").trim();

            DriverDAO dao = new DriverDAOImpl();
            Driver driverTmp = dao.getDriverByID(driverID);

            boolean driverIDError = false, driverNameError = false, dobError = false, picError = false, phoneError = false;
            DriverError de = new DriverError();
            if (driverTmp != null) {
                driverIDError = true;
                de.setDriverID("ID is existed");
            }
            if (driverName.length() < 2 || driverName.length() > 100) {
                driverNameError = true;
                de.setDriverName("Name must >5 & <100");
            }
            if (LocalDate.parse(dob).compareTo(LocalDate.now()) > 0) {
                driverIDError = true;
                de.setDOB("Must be less than today");
            }
            if (!driverPic.matches("https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)")) {
                picError = true;
                de.setDriverPicture("Not url");
            }
            if (!phoneNumber.matches("(84|0[3|5|7|8|9])+([0-9]{8})\\b")) {
                phoneError = true;
                de.setPhoneNumber("Must have +84 and 9 number");
            }

            if (driverIDError || driverIDError || driverNameError || dobError || picError || phoneError) {
                request.setAttribute("ADD_ERROR", de);
                showDriverTable(request, response);
            } else {
                Driver driver = new Driver(driverID, driverName, Date.valueOf(dob), Boolean.parseBoolean(sex),
                        driverPic, phoneNumber, Integer.parseInt(status));
                boolean check = dao.addNewDriver(driver);
                if (check) {
                    request.setAttribute("SUCCESS", "ADD DRIVER SUCCESSFULLY");
//                    showOneDriver(request,response,driver);
                    request.setAttribute("driverID", driverID);
                    showDriverTable(request, response);
                } else {
                    request.setAttribute("ERROR", "CAN NOT ADD DRIVER");
                    showDriverTable(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String driverID = request.getParameter("driverID").trim();
            DriverDAO dao = new DriverDAOImpl();
            Driver d = dao.getDriverByID(driverID);
            if (d.getStatus() == 2) {
                request.setAttribute("ERROR", "DRIVER IS ONGOING");
                showDriverTable(request, response);
            } else {
                boolean check = dao.deleteDriver(driverID);
                if (check) {
                    request.setAttribute("SUCCESS", "DELETE DRIVER SUCCESSFULLY");
                    showDriverTable(request, response);
                } else {
                    request.setAttribute("ERROR", "CAN NOT DELETE DRIVER");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateDriver(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String driverID = request.getParameter("driverID").trim();
            String driverName = request.getParameter("driverName").trim();
            String dob = request.getParameter("DOB").trim();
            String sex = request.getParameter("sex").trim();
            String driverPic = request.getParameter("driverPic").trim();
            String phoneNumber = request.getParameter("phoneNumber").trim();
            String status = request.getParameter("status").trim();

            Driver driver = new Driver(driverID, driverName, Date.valueOf(dob), Boolean.parseBoolean(sex),
                    driverPic, phoneNumber, Integer.parseInt(status));

            DriverDAO dao = new DriverDAOImpl();
            boolean check = dao.updateDriver(driver);

            if (check) {
                request.setAttribute("SUCCESS", "UPDATE DRIVER SUCCESSFULLY");
//                showOneDriver(request,response,driver);
                request.setAttribute("driverID", driverID);
                showDriverTable(request, response);
            } else {
                request.setAttribute("ERROR", "CAN NOT UPDATE DRIVER");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showErrorPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("/client/404.jsp").forward(request, response);
    }

    private void showOneDriver(HttpServletRequest request, HttpServletResponse response, Driver driver)
            throws ServletException, IOException {
        try {
            List<Driver> list = new ArrayList<>();
            list.add(driver);
            request.setAttribute("LIST_ALL_DRIVER", list);
            request.getRequestDispatcher("admin/driverTable.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    private void showDeletedDriverTable(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            DriverDAO dao = new DriverDAOImpl();
            List<Driver> list = dao.getAllInActiveDriver();
            if (list != null) {
                request.setAttribute("LIST_ALL_DRIVER", list);
                request.getRequestDispatcher("/admin/driverTable.jsp").forward(request, response);
            } else {
                showErrorPage(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void activeDriver(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String driverID = request.getParameter("driverID");
            DriverDAO dao = new DriverDAOImpl();
            Driver d = dao.getDriverByID(driverID);
            d.setStatus(1);
            boolean check = dao.updateDriver(d);
            if (check) {
                showDriverTable(request, response);
            } else {
                showErrorPage(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showAvailableDriver(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            
        } catch (Exception e) {
        }
    }
}
