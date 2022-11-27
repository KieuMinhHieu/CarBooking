
package com.stress.dao;

import com.stress.dto.Location;
import com.stress.dto.Route;
import java.sql.SQLException;
import java.util.List;


public interface RouteDAO {
    int addRoute(Route route) throws SQLException;
    boolean updateRoute(int RouteID, String RouteName, Location StartLocation, Location EndLocation, String Description, boolean Status) throws SQLException;
    boolean deleteRoute(String routeID) throws SQLException;
//    List<Route> searchServiceByStartLocation(int startLocation) throws SQLException;
//    List<Route> searchServiceByEndLocation(int endLocation) throws SQLException;
    Route getRouteByID(int routeID) throws SQLException;
    boolean checkDuplicateByID(int routeID) throws SQLException;
    List<Route> getAllRoute() throws SQLException;
    List<Route> getAllActiveRoute() throws SQLException;
    Route getRouteByStartLocationAndEndLocation(int startLocation, int endLocation) throws SQLException;
    int getMaxRoute() throws SQLException;
    boolean checkDuplicate(Route route) throws SQLException;
    List<Route> getDeleteHistory() throws SQLException;
    boolean recoverRoute(String routeID) throws SQLException;
}
