
package com.stress.dao;

import com.stress.dto.Driver;
import java.sql.SQLException;
import java.util.List;


public interface DriverDAO{
    List<Driver> getAllDriver() throws SQLException;
    boolean addNewDriver(Driver driver) throws SQLException;
    boolean deleteDriver(String DriverID) throws SQLException;
    boolean updateDriver(Driver driver) throws SQLException;
    Driver getDriverByID(String driverID) throws SQLException;
    List<Driver> getDriverByName(String driverName) throws SQLException;
    List<Driver> getAllActiveDriver() throws SQLException;
    List<Driver> getDriverWithLicense() throws SQLException;
    List<Driver> getAllInActiveDriver() throws SQLException;
    List<Driver> getAvailableDriverWithDate(String date) throws SQLException;
    List<Driver> getAvailableDriverWithTime(String time) throws SQLException;
}
