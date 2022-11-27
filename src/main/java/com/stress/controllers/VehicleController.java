package com.stress.controllers;

import com.stress.dao.VehicleDAO;
import com.stress.dto.Vehicle;
import com.stress.dto.VehicleType;
import com.stress.service.VehicleDAOImpl;
import com.stress.service.VehicleTypeDAOImpl;
import java.io.IOException;
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
@WebServlet(name = "VehicleController", urlPatterns = {"/admin/VehicleController"})
public class VehicleController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private Vehicle vehicle = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        VehicleDAO vDAO = new VehicleDAOImpl();
        if (action != null) {
            switch (action) {
                case "show":
                    showAllVehice(request, response, vDAO);
                    break;
                case "update":
                    updateVehicle(request, response, vDAO);
                    break;
                case "delete":
                    deleteVehicle(request, response, vDAO);
                    break;

                case "showDelete":
                    deleteHistory(request, response, vDAO);
                    break;
                default:
                    request.getRequestDispatcher("admin/404.jsp").forward(request, response);
            }
        }
    }

    private void deleteVehicle(HttpServletRequest request, HttpServletResponse response, VehicleDAO vDAO)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String vehicleID = request.getParameter("vehicleID");
        try {
            if (vDAO.deleteVehicle(vehicleID)) {
                request.setAttribute("SUCCESS", "Delete Vehicle " + vehicleID + " Success");
                showAllVehice(request, response, vDAO);
            }
        } catch (Exception e) {
            System.out.println("Error at Delete Vehicle Controller " + e.toString());
        }

    }

    private void deleteHistory(HttpServletRequest request, HttpServletResponse response, VehicleDAO vDAO)
            throws ServletException, IOException {
        response.setContentType("text/html;charsetUTF-8");
        String url = "/admin/404.jsp";
        try {
            List<Vehicle> vList = vDAO.getDeleteVehicleHistory();
            List<VehicleType> vType = new VehicleTypeDAOImpl().getAllVehicleType();
            if (vList != null && !vType.isEmpty()) {
                request.setAttribute("DELETE_HISTORY", true);
                request.setAttribute("VEHICLE_LIST", vList);
                request.setAttribute("VEHICLE_TYPE_LIST", vType);
                url = "/admin/vehicleTable.jsp";
            } else {
                request.setAttribute("ERROR", "Nothing to Shown");
            }
        } catch (Exception e) {
            System.out.println("Error at Delete History Controller");
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void recoverVehicle(HttpServletRequest request, HttpServletResponse response, VehicleDAO vDAO)
            throws ServletException, IOException {
        String vehicleID = request.getParameter("vehicleID");
        try {
            Vehicle recoverVehicle = vDAO.getVehicleByID(vehicleID);
            if (recoverVehicle != null) {
                recoverVehicle.setStatus(Vehicle.ACTIVE);
                if (vDAO.updateVehicle(recoverVehicle)) {
                    request.setAttribute("SUCCESS", "Recover " + recoverVehicle.getVehicleName() + " Success");
                    request.setAttribute("VEHICLE_ID", recoverVehicle.getVehicleID());
                    request.removeAttribute("DELETE_HISTORY");
                    showAllVehice(request, response, vDAO);
                }
            } else {
                request.setAttribute("ERROR", "Can't Found Vehicle! Try Again!");
                deleteHistory(request, response, vDAO);
            }
        } catch (Exception e) {
            System.out.println("Error at Recover Vehicle Controller " + e.toString());
        }
    }

    private void updateVehicle(HttpServletRequest request, HttpServletResponse response, VehicleDAO vDAO)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String vehicleID = request.getParameter("vehicleID");
        String vehicleName = request.getParameter("vehicleName");
        String licensePlate = request.getParameter("licensePlate");
        int vehicleTypeID = Integer.parseInt(request.getParameter("vehicleTypeID"));
        int status = Integer.parseInt(request.getParameter("status"));
        try {
            VehicleType vType = new VehicleTypeDAOImpl().getVehicleTypeByID(vehicleTypeID);
            if (vType != null) {
                Vehicle v = new Vehicle(vehicleID, vehicleName, licensePlate, vType, status);
                Vehicle vOld = vDAO.getVehicleByID(v.getVehicleID());
                if (vOld.getStatus() == Vehicle.ONGOING && v.getStatus() == Vehicle.INACTIVE) {
                    request.setAttribute("ERROR", "The Vehicle is OnGoing a Trip, can't not Update to INACTIVE");
                    request.setAttribute("VEHICLE_ID", vehicleID);
                    showAllVehice(request, response, vDAO);
                } else {
                    if (vDAO.updateVehicle(v)) {
                        request.setAttribute("SUCCESS", "Update Vehicle " + v.getVehicleID() + " Successfully");
                        request.setAttribute("VEHICLE_ID", vehicleID);
                        showAllVehice(request, response, vDAO);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Eror at Update Vehicle " + e.toString());
        }

    }

    private void showAllVehice(HttpServletRequest request, HttpServletResponse response, VehicleDAO vDAO)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            List<Vehicle> vList = vDAO.getAllVehicle();
            List<VehicleType> vType = new VehicleTypeDAOImpl().getAllVehicleType();
            if (!vList.isEmpty() && !vType.isEmpty()) {
                request.removeAttribute("DELETE_HISTORY");
                request.setAttribute("VEHICLE_LIST", vList);
                request.setAttribute("VEHICLE_TYPE_LIST", vType);
                url = "/admin/vehicleTable.jsp";
            } else {
                request.setAttribute("ERROR", "Nothing to Shown");
            }
        } catch (Exception e) {
            System.out.println("Error at Show All Vehicle " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        VehicleDAO vDAO = new VehicleDAOImpl();
        System.out.println(action);
        if (action != null) {
            switch (action) {
                case "create":
                    createVehicle(request, response);
                    break;
                case "update":
                    updateVehicle(request, response, vDAO);
                    break;
                case "delete":
                    deleteVehicle(request, response, vDAO);
                    break;
                case "showDelete":
                    deleteHistory(request, response, vDAO);
                    break;
                case "recover":
                    recoverVehicle(request, response, vDAO);
                    break;
                default:
                    request.getRequestDispatcher("/admin/404.jsp").forward(request, response);
            }
        }
    }

    private void createVehicle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vehicleID = request.getParameter("vehicleID").trim();
        String vehicleName = request.getParameter("vehicleName").trim();
        String licensePlate = request.getParameter("licensePlate").trim();
        int vehicleTypeID = Integer.parseInt(request.getParameter("vehicleTypeID"));
        int status = Integer.parseInt(request.getParameter("status"));
        VehicleDAO vDAO = new VehicleDAOImpl();

        try {
            if (vDAO.duplicateVehicle(vehicleID)) {
                request.setAttribute("ERROR", "Duplicate ID");
                showAllVehice(request, response, vDAO);
            } else if (vehicleID.isEmpty() || vehicleName.isEmpty() || licensePlate.isEmpty()) {
                request.setAttribute("ERROR", "All Fields has to be filled! Try Again!");
                showAllVehice(request, response, vDAO);

            } else {
                VehicleType vType = new VehicleTypeDAOImpl().getVehicleTypeByID(vehicleTypeID);

                if (vType != null) {
                    System.out.println(vType.getVehicleTypeID());

                    Vehicle createItem = new Vehicle(vehicleID, vehicleName, licensePlate, vType, status);

                    if (vDAO.createVehicle(createItem)) {
                        request.setAttribute("SUCCESS", "Create Vehicle " + vehicleID + " Success!");
                        request.setAttribute("VEHICLE_ID", vehicleID);
                        showAllVehice(request, response, vDAO);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Eror at Create Vehicle " + e.toString());
        }
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
