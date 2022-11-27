package com.stress.controllers;

import com.stress.dao.CityDAO;
import com.stress.dao.DriverDAO;
import com.stress.dao.RouteDAO;
import com.stress.dao.SeatDAO;
import com.stress.dao.TripDAO;
import com.stress.dao.VehicleDAO;
import com.stress.dto.Driver;
import com.stress.dto.Route;
import com.stress.dto.Trip;
import com.stress.dto.Vehicle;
import com.stress.service.CityDAOImpl;
import com.stress.service.DriverDAOImpl;
import com.stress.service.RouteDAOImpl;
import com.stress.service.SeatDAOImpl;
import com.stress.service.TripDAOImpl;
import com.stress.service.VehicleDAOImpl;
import com.stress.utils.CommonFunction;
import com.stress.utils.ExcelUtils;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TripController", urlPatterns = {"/trip"})
public class TripController extends HttpServlet {

    private final TripDAO tripDAO = new TripDAOImpl();
    private final RouteDAO routeDAO = new RouteDAOImpl();
    private final VehicleDAO vehicleDAO = new VehicleDAOImpl();
    private final DriverDAO driverDAO = new DriverDAOImpl();
    private final SeatDAO seatDAO = new SeatDAOImpl();
    private final CityDAO cityDAO = new CityDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "show":
                    showTripTable(request, response);
                    break;
                case "showTrip":
                    showTripView(request, response);
                    break;
                case "report":
                    report(request, response);
                    break;
            }
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "Add":
                    addTrip(request, response);
                    break;
                case "Assign":
                    addTripContinue(request, response);
                    break;
                case "delete":
                    deleteTrip(request, response);
                    break;
                case "update":
                    updateTrip(request, response);
                    break;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    private void report(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/vnd.ms-excel");

        ExcelUtils reporter = new ExcelUtils();
        try {
            String fileName = reporter.getFileName("tblTrips".concat("_Export"));
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            reporter.exportFeedBack("tblTrips", response.getOutputStream(), fileName);
        } catch (Exception ex) {
            System.out.println("Error at Reporter Controller");
        }

    }

    private void showTripTable(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Trip> list = tripDAO.getAllTrip();
            List<Route> activeRoute = routeDAO.getAllActiveRoute();
            List<Vehicle> activeVehicle = vehicleDAO.getAllActiveVehicle();
            List<Driver> activeDriver = driverDAO.getDriverWithLicense();
            request.setAttribute("LIST_ALL_TRIP", list);
            request.setAttribute("LIST_ACTIVE_ROUTE", activeRoute);
            request.setAttribute("LIST_ACTIVE_VEHICLE", activeVehicle);
            request.setAttribute("LIST_ACTIVE_DRIVER", activeDriver);
            request.getRequestDispatcher("./admin/tripTable.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }
    private void addTrip(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String tripID = CommonFunction.generateID("tblTrips", "Trip");
            String tripName = request.getParameter("tripName").trim();
            String startdate = request.getParameter("startdate");
            String startTime = request.getParameter("startTime")+":00";
            String policy = request.getParameter("policy").trim();
            String routeID = request.getParameter("routeID").trim();
            
            if(tripID!=null && tripName!=null && startdate!=null && startTime!=null && policy!=null && routeID!=null){
                request.setAttribute("tripID", tripID);
                request.setAttribute("tripName", tripName);
                request.setAttribute("startdate", startdate);
                request.setAttribute("startTime", startTime);
                request.setAttribute("policy", policy);
                request.setAttribute("routeID", routeID);
                
                request.setAttribute("ADD_TRIP_CONTINUE", "add_trip_continue");
                
                request.getRequestDispatcher("/admin/route?action=show").forward(request, response);
//                request.getRequestDispatcher("/admin/routeTable.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    private void deleteTrip(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String tripID = request.getParameter("tripID");

            Trip trip = tripDAO.getTripByID(tripID);

            if (tripDAO.checkBookedTicket(tripID)) {
                request.setAttribute("ERROR", "Cant Delete! This Trip Has Booked Ticket Already!");
                showTripTable(request, response);
            } else {
                if (tripDAO.deleteTrip(tripID)) {
                    Vehicle v = trip.getVehicle();
                    v.setStatus(1);
                    vehicleDAO.updateVehicle(v);
                    Driver d = trip.getDriver();
                    d.setStatus(1);
                    driverDAO.updateDriver(d);
                    request.setAttribute("SUCCESS", "DELETE TRIP SUCCESSFULLY");
                    showTripTable(request, response);
                } else {
                    request.setAttribute("ERROR", "DELETE TRIP SUCCESSFULLY");
                    showTripTable(request, response);
                }
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    private void updateTrip(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String tripID = request.getParameter("tripID").trim();
            String tripName = request.getParameter("tripName").trim();
            String startdate = request.getParameter("startdate").trim();
            String startTime = request.getParameter("startTime")+":00";
            String policy = request.getParameter("policy").trim();
            String routeID = request.getParameter("routeID").trim();
            String vehicleID = request.getParameter("vehicleID").trim();
            String driverID = request.getParameter("driverID").trim();
            String seatRemain = request.getParameter("seatRemain");
            String status = request.getParameter("status");

            Trip oldTrip = tripDAO.getTripByID(tripID);
            Vehicle v = vehicleDAO.getVehicleByID(vehicleID);
            v.setStatus(2);
            Route r = routeDAO.getRouteByID(Integer.parseInt(routeID));
            Driver d = driverDAO.getDriverByID(driverID);
            d.setStatus(2);

            boolean check = tripDAO.updateTrip(
                    new Trip(tripID, tripName, Date.valueOf(startdate), Time.valueOf(startTime),
                            policy, r, v, d, Integer.parseInt(seatRemain), Integer.parseInt(status)));
            if (check) {
                request.setAttribute("SUCCESS", "UPDATE TRIP SUCCESSFULLY");
                if (!oldTrip.getVehicle().getVehicleID().equals(v.getVehicleID())) {
                    Vehicle oldVehicle = oldTrip.getVehicle();
                    oldVehicle.setStatus(1);
                    vehicleDAO.updateVehicle(oldVehicle);
                }
                if (!oldTrip.getDriver().getDriverID().equals(d.getDriverID())) {
                    Driver oldDriver = oldTrip.getDriver();
                    oldDriver.setStatus(1);
                    driverDAO.updateDriver(oldDriver);
                }
                vehicleDAO.updateVehicle(v);
                driverDAO.updateDriver(d);
                showTripTable(request, response);
            } else {
                request.setAttribute("ERROR", "UPDATE TRIP ERROR");
                showTripTable(request, response);
            }
        } catch(Exception e){
            
        }
    }


    private void showTripView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        try {
            String from = request.getParameter("from");
            String to = request.getParameter("to");

            String startDay = request.getParameter("start");
            Route route = routeDAO.getRouteByStartLocationAndEndLocation(cityDAO.getCityIDByName(from), cityDAO.getCityIDByName(to));
            List<Trip> listTrip = tripDAO.getAllTripByRouteAndStartDay(route.getRouteID(), startDay);
            request.setAttribute("LIST_ALL_TRIP_BY_LOCATION", listTrip); 
            request.getRequestDispatcher("./client/route.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        //trip?from=1&to=3&start=10%2F04%2F2022&action=showTrip
    }

    private void addTripContinue(HttpServletRequest request, HttpServletResponse response) {
        try {
            String tripID = CommonFunction.generateID("tblTrips", "Trip");
            String tripName = request.getParameter("tripName").trim();
            String startdate = request.getParameter("startdate");
            String startTime = request.getParameter("startTime")+":00";
            String policy = request.getParameter("policy").trim();
            String routeID = request.getParameter("routeID").trim();
            String vehicleID = request.getParameter("vehicleID").trim();
            String driverID = request.getParameter("driverID").trim();

            Vehicle v = vehicleDAO.getVehicleByID(vehicleID);
            v.setStatus(2);
            Route r = routeDAO.getRouteByID(Integer.parseInt(routeID));
            Driver d = driverDAO.getDriverByID(driverID);
            d.setStatus(2);

            Trip trip = new Trip(tripID, tripName, Date.valueOf(startdate), Time.valueOf(startTime),
                    policy, r, v, d, v.getVehicleType().getTotalSeat(), 1);

            boolean check = tripDAO.addTrip(trip);

            if (check) {
                List<String> setMap = seatDAO.setMap(v.getVehicleType().getTotalSeat());
                boolean checkAddSeat = false;
                for (String s : setMap) {
                    checkAddSeat = seatDAO.addSeat(tripID, s);
                }
                if (checkAddSeat) {
                    vehicleDAO.updateVehicle(v);
                    driverDAO.updateDriver(d);
                    request.setAttribute("SUCCESS", "ADD TRIP SUCCESSFULLY");
                    request.setAttribute("tripID", tripID.trim());
                    showTripTable(request, response);
                } else {
                    request.setAttribute("ADD_ERROR", "ADD TRIP ERROR");
                    showTripTable(request, response);
                }
            } else {
                request.setAttribute("ID_EXIST", "create-" + tripID);
                request.setAttribute("action", "show");
                request.getRequestDispatcher("/admin/route?action=show").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
}
