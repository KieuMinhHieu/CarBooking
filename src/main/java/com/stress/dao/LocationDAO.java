
package com.stress.dao;

import com.stress.dto.Location;
import java.sql.SQLException;
import java.util.List;


public interface LocationDAO {
    Location getLocationById(int locationId) throws SQLException;
    Location getLocationByName(String locationName) throws SQLException;
    List<Location> getAllLocation() throws SQLException;
    List<Location> searchLocation(String search) throws SQLException;
    boolean addLocation(String locationName,String address,int cityID,boolean status) throws SQLException;
    boolean checkDuplicateByName(String locationName) throws SQLException;
    boolean addLocation(Location location) throws SQLException;
    boolean deleteLocation(String locationID) throws SQLException;
    boolean updateLocation(Location location) throws SQLException;
}
