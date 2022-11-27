package com.stress.controllers;

import com.stress.dao.VehicleTypeDAO;
import com.stress.dto.VehicleType;
import com.stress.service.VehicleTypeDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "VehicleTypeController", urlPatterns = {"/admin/VehicleTypeController"})
public class VehicleTypeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        VehicleTypeDAO vDao = new VehicleTypeDAOImpl();
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "show":
                    showAllVehicleType(request, response, vDao);
                    break;
                case "update":
                    updateVehicleType(request, response, vDao);
                    break;
                case "delete":
                    deleteVehicleType(request, response, vDao);
                    break;
                default:
                    throw new AssertionError();
            }
        }
    }

    private void showAllVehicleType(HttpServletRequest request, HttpServletResponse response, VehicleTypeDAO vDAO)
            throws ServletException, IOException {
        try {
            List<VehicleType> vehicleTypeList = vDAO.getAllVehicleType();
            if (!vehicleTypeList.isEmpty()) {
                request.setAttribute("VEHICLE_TYPE_LIST", vehicleTypeList);
            }
        } catch (Exception e) {
            System.out.println("Error at ShowAllVehicleType " + e.toString());
        }
        request.getRequestDispatcher("/admin/vehicleTypeTable.jsp").forward(request, response);
    }

    private void deleteVehicleType(HttpServletRequest request, HttpServletResponse response, VehicleTypeDAO vDAO)
            throws ServletException, IOException {
        String vehicleTypeID = request.getParameter("vehicleTypeID");
        try {
            if (vDAO.deleteVehicleType(vehicleTypeID)) {
                request.setAttribute("SUCCESS", "Delete " + vehicleTypeID + "Success");
                showAllVehicleType(request, response, vDAO);
            }
        } catch (Exception e) {
            System.out.println("Error at Delete VehicleType " + e.toString());
        }
    }

    private void updateVehicleType(HttpServletRequest request, HttpServletResponse response, VehicleTypeDAO vDAO)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int vehicleTypeID = Integer.parseInt(request.getParameter("vehicleTypeID"));
        String vehicleTypeName = request.getParameter("vehicleTypeName").trim();
        int totalSeat = Integer.parseInt(request.getParameter("totalSeat").trim());
        VehicleType updateVehicleTypeItem = new VehicleType(vehicleTypeID, vehicleTypeName, totalSeat);
        if (vehicleTypeName.isBlank()) {
            request.setAttribute("ERROR", "VehicleTypeName is Blank! Try Again!");
            try {
                showOneVehicleType(request, response, vDAO, vDAO.getVehicleTypeByID(vehicleTypeID));
            } catch (Exception e) {

            }
        } else {
            try {
                if (vDAO.updateVehicleType(updateVehicleTypeItem)) {
                    request.setAttribute("SUCCESS", "Update Success");
                    request.setAttribute("VEHICLE_TYPE_ID", updateVehicleTypeItem.getVehicleTypeID());
                    showAllVehicleType(request, response, vDAO);
                }
            } catch (Exception e) {
                System.out.println("Error at Update Vehicle Type " + e.toString());
            }
        }

    }

    private void showOneVehicleType(HttpServletRequest request, HttpServletResponse response, VehicleTypeDAO vDAO, VehicleType vt)
            throws ServletException, IOException {
        List<VehicleType> vList = new ArrayList<>();
        vList.add(vt);
        try {
            request.setAttribute("VEHICLE_TYPE_LIST", vList);
            request.getRequestDispatcher("/admin/vehicleTypeTable.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error at Show One VehicleType " + e.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        VehicleTypeDAO vtDao = new VehicleTypeDAOImpl();
        String vehicleName = request.getParameter("vehicleTypeName").trim();
        int totalSeat = Integer.parseInt(request.getParameter("totalSeat").trim());
        VehicleType newVehicleType = new VehicleType(0, vehicleName, totalSeat);
        if (vehicleName.isBlank()) {
            request.setAttribute("ERROR", "VehicleName is Empty! Please Try Again!");
            showAllVehicleType(request, response, vtDao);
        } else {
            try {
                newVehicleType.setVehicleTypeID(vtDao.createVehicleType(newVehicleType));
                if (newVehicleType.getVehicleTypeID() > 0) {
                    request.setAttribute("SUCCESS", "Create Success");
                    request.setAttribute("VEHICLE_TYPE_ID", newVehicleType.getVehicleTypeID());
                    showAllVehicleType(request, response, vtDao);
                }

            } catch (Exception e) {
                System.out.println("Error at Create Vehicle Type " + e.toString());
            }
        }

    }

}
