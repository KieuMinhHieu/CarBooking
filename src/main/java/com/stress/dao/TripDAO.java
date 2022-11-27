
package com.stress.dao;

import com.stress.dto.Trip;
import java.sql.SQLException;
import java.util.List;


public interface TripDAO {
    boolean deleteTrip(String tripID) throws SQLException;
    Trip getTripByID(String tripID) throws SQLException;
    boolean addTrip(Trip trip) throws SQLException;
    List<Trip> getAllTrip() throws SQLException;
    boolean updateTrip(Trip trip) throws SQLException;
    List<Trip> getAllTripByRouteAndStartDay(int routeID, String date) throws SQLException;
    List<Trip> getAllTripByRouteAndSameStartDay(int routeID, String date) throws SQLException;

    //Check that Trip has any BookedTicket or not
    boolean checkBookedTicket(String tripID) throws SQLException;
    
    
    // getTrip On Going
    Trip getOngoingTripByDriver (String driverID) throws SQLException;
    Trip getOnGoingTripByVehicle (String vehicleID) throws SQLException;
    boolean hasTripByRoute(int routeID) throws SQLException;
}
