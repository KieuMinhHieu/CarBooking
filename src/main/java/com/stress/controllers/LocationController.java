package com.stress.controllers;

import com.stress.dao.CityDAO;
import com.stress.dto.Location;
import com.stress.dao.LocationDAO;
import com.stress.dto.City;
import com.stress.service.CityDAOImpl;
import com.stress.service.LocationDAOImpl;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LocationController", urlPatterns = {"/admin/location"})
public class LocationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try {
            String action = request.getParameter("action");
            System.out.println("action:" + action);
            switch (action) {
                case "view":
                    viewLocation(request, response);
                    break;
                case "add":
                    addLocation(request, response);
                    break;
                case "update":
                    updateLocation(request, response);
                    break;
                case "delete":
                    deleteLocation(request, response);
                    break;
            }
        } catch (Exception e) {

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try {
            String action = request.getParameter("action");
            System.out.println("action:" + action);
            switch (action) {
                case "view":
                    viewLocation(request, response);
                    break;
                case "add":
                    addLocation(request, response);
                    break;
                case "update":
                    updateLocation(request, response);
                    break;
                case "delete":
                    deleteLocation(request, response);
                    break;
            }
        } catch (Exception e) {

        }
    }

    private void viewLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "./admin/404.jsp";
        try {
            LocationDAO LDAO = new LocationDAOImpl();
            List<Location> listLocation = LDAO.getAllLocation();
            CityDAO CDAO = new CityDAOImpl();
            List<City> listCity = CDAO.getAllCity();
            if (!listLocation.isEmpty() && !listCity.isEmpty()) {
                request.setAttribute("LIST_LOCATION", listLocation);
                request.setAttribute("LIST_CITY", listCity);
                url = "./locationTable.jsp";
            }
        } catch (Exception e) {
            log("Error at LocationController - viewLocation: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void addLocation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String locationName = request.getParameter("LocationName");
            String address = request.getParameter("Address");
            String tmpCity = request.getParameter("City");
            String tmpStatus = request.getParameter("Status");
            //conversion
            int cityID=Integer.parseInt(tmpCity);
            boolean status=Boolean.parseBoolean(tmpStatus);
            LocationDAO dao = new LocationDAOImpl();
            boolean checkDuplicate = dao.checkDuplicateByName(locationName);
            Location tmp = new Location(0, locationName,address,new CityDAOImpl().getCityByID(cityID),status);
            boolean check = dao.addLocation(tmp);
            if (checkDuplicate == false) {
                if (check == true) {
                    viewLocation(request, response);
                }
            }
        } catch (Exception e) {
            log("Error at LocationController - addLocation:" + e.toString());
        }
    }
    private void updateLocation(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try {
            String tmpLocationID = request.getParameter("LocationID");
            String locationName = request.getParameter("LocationName");
            String address = request.getParameter("Address");
            String tmpCityID = request.getParameter("CityID");
            String tmpStatus = request.getParameter("Status");
            //conversion
            int locationID=Integer.parseInt(tmpLocationID);
            int cityID=Integer.parseInt(tmpCityID);
            boolean status=Boolean.parseBoolean(tmpStatus);
            LocationDAO dao=new LocationDAOImpl();
            boolean checkUpdate=dao.updateLocation(new Location(locationID, locationName,address,new CityDAOImpl().getCityByID(cityID),status));
            System.out.println("check"+checkUpdate);
            if(checkUpdate){
                viewLocation(request, response);
            }
        } catch (Exception e) {
            log("Error at RouteController - updateRoute: "+ e.toString());
        }
    }
    private void deleteLocation(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        try {
            String locationID=request.getParameter("LocationID");
            LocationDAO dao=new LocationDAOImpl();
            boolean check=dao.deleteLocation(locationID);
            if(check){
                viewLocation(request, response);
            }
        } catch (Exception e) {
            log("Error at LocationController - deleteLocation: " + e.toString());
        }
    }
}
