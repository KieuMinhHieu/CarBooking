/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.stress.controllers;

import com.stress.dao.DriverDAO;
import com.stress.dao.DriverLicenseDAO;
import com.stress.dto.Driver;
import com.stress.dto.DriverLicense;
import com.stress.service.DriverDAOImpl;
import com.stress.service.DriverLicenseDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MinhQuang
 */
@WebServlet(name = "DriverLicenseController", urlPatterns = {"/admin/driverlicense"})
public class DriverLicenseController extends HttpServlet {

    private static final String ERROR = "/admin/404.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

        }
    }

    private void showAllVehicleLicense(HttpServletRequest request, HttpServletResponse response, DriverLicenseDAO dlDAO)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            List<DriverLicense> dlList = dlDAO.getAllDriverLicense();
            List<Driver> driverList = getDriverList();
            if (dlList.size() > 0) {
                request.setAttribute("DRIVER_LICENSE_LIST", dlList);
                request.setAttribute("DRIVER_LIST", driverList);
                request.getRequestDispatcher("/admin/driverLicenseTable.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error at Show All Driver License " + e.toString());

        }
    }

    private void redirectError(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(ERROR).forward(request, response);
    }

    private List<Driver> getDriverList() {
        DriverDAO dDao = new DriverDAOImpl();
        DriverLicenseDAO dlDAO = new DriverLicenseDAOImpl();
        List<Driver> dList = null;
        try {
            dList = dDao.getAllDriver();
            List<Driver> dList_HaveDL = new ArrayList<>();
            List<DriverLicense> dlList = dlDAO.getAllDriverLicense();
            for (DriverLicense driverLicense : dlList) {
                dList_HaveDL.add(driverLicense.getDriver());
            }
            for (Driver driver : dList_HaveDL) {
                dList.remove(driver);
            }

        } catch (Exception e) {
            System.out.println("Error at get Driver List " + e.toString());
        }
        return dList;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        DriverLicenseDAO dlDAO = new DriverLicenseDAOImpl();
        String url = ERROR;
        String action = request.getParameter("action");
        switch (action) {
            case "show":
                showAllVehicleLicense(request, response, dlDAO);
                break;
            default:
                redirectError(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        DriverLicenseDAO dlDAO = new DriverLicenseDAOImpl();

        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createDriverLicense(request, response);
                break;
            case "update":
                updateDriverLicense(request, response, dlDAO);
                break;
            case "delete":
                deleteDriverLicense(request, response, dlDAO);
                break;
            default:
                redirectError(request, response);
                break;
        }
    }

    private void updateDriverLicense(HttpServletRequest request, HttpServletResponse response, DriverLicenseDAO dlDAO)
            throws ServletException, IOException {
        String driverLicenseID = request.getParameter("driverLicenseID").trim();
        String nationality = request.getParameter("nationality").trim();
        String classes = request.getParameter("classes");
        Date dateExpired = Date.valueOf(request.getParameter("dateExpired"));
        try {
            DriverLicense oldDL = dlDAO.getDriverLicenseByID(driverLicenseID);
            if (nationality.isBlank() || classes.isBlank()) {
                request.setAttribute("ERROR", "Some Field is blank! Can't Update! Try Again!");
                showOneDriverLicense(request, response, dlDAO, oldDL);

            } else if (dateExpired.before(oldDL.getDateExpired())) {
                request.setAttribute("ERROR", "The Date expired is before the Old Date Expired! Please Try Again!");
                showOneDriverLicense(request, response, dlDAO, oldDL);
            }else {
                oldDL.setClasses(classes);
                oldDL.setDateExpired(dateExpired);
                oldDL.setNationality(nationality);
                if(dlDAO.updateDriverLicense(oldDL)) {
                    request.setAttribute("SUCCESS", "Update Driver License " + oldDL.getDriverLicenseID() + " Successfully!" );
                    request.setAttribute("DRIVER_LICENSE_ID", oldDL.getDriverLicenseID());
                    showAllVehicleLicense(request, response, dlDAO);
                }
            }

        } catch (Exception e) {
            System.out.println("Error at Update Driver License " + e.toString());
        }

    }

    private void createDriverLicense(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            DriverLicenseDAO dlDao = new DriverLicenseDAOImpl();
            String driverLicenseID = request.getParameter("driverLicenseID").trim();
            String nationality = request.getParameter("nationality").trim();
            String classes = request.getParameter("classes").trim();
            String driverID = request.getParameter("driverID").trim();
            Date dateExpired = Date.valueOf(request.getParameter("dateExpired"));
            if (driverLicenseID.isBlank() || nationality.isBlank() || classes.isBlank()) {
                request.setAttribute("ERROR", "Some Field is empty! Can't Create! Please Try Again!");
                showAllVehicleLicense(request, response, dlDao);
            } else if (dlDao.getDriverLicenseByID(driverLicenseID) != null) {
                request.setAttribute("ERROR", "Duplicate ID! Can't Create! Please Try Again!");
                showAllVehicleLicense(request, response, dlDao);
            } else {
                Driver driver = new DriverDAOImpl().getDriverByID(driverID);
                DriverLicense createDL = new DriverLicense(driverLicenseID, nationality, classes, dateExpired, driver);
                if (dlDao.createDriverLicense(createDL)) {
                    request.setAttribute("SUCCESS", "Create Driver License Success");
                    request.setAttribute("DRIVER_LICENSE_ID", createDL.getDriverLicenseID());
                    showAllVehicleLicense(request, response, dlDao);
                } else {
                    request.setAttribute("ERROR", "Created Failed! Something Went Wrong! Please Try Again!");
                    showAllVehicleLicense(request, response, dlDao);
                }
            }
        } catch (Exception e) {
            System.out.println("Error at Create Driver License " + e.toString());
        }
    }

    private void deleteDriverLicense(HttpServletRequest request, HttpServletResponse response, DriverLicenseDAO dlDAO)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String driverLicenseID = request.getParameter("driverLicenseID").trim();
        try {
            DriverLicense dl = dlDAO.getDriverLicenseByID(driverLicenseID);
            if (dl != null) {
                if (dl.getDriver().getStatus() == Driver.ONGOING) {
                    request.setAttribute("ERROR", "Driver is on going a trip, can not Delete Driver License");
                    showOneDriverLicense(request, response, dlDAO, dl);
                } else {
                    if (dlDAO.deleteDriverLicense(driverLicenseID)) {
                        request.setAttribute("SUCCESS", "Delete DriverLicense " + driverLicenseID + " Successfully!");
                        showAllVehicleLicense(request, response, dlDAO);
                    }
                }

            }
        } catch (Exception e) {
            System.out.println("Error at Delete DriverLicense " + e.toString());
        }
    }

    private void showOneDriverLicense(HttpServletRequest request, HttpServletResponse response, DriverLicenseDAO dlDAO, DriverLicense item)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            List<DriverLicense> dlList = new ArrayList<>();
            dlList.add(item);
            request.setAttribute("DRIVER_LICENSE_LIST", dlList);
            request.getRequestDispatcher("/admin/driverLicenseTable.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error at Show One Driver License " + e.toString());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
