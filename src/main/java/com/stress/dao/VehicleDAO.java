
package com.stress.dao;


import java.sql.SQLException;
import java.util.List;
import com.stress.dto.Vehicle;


public interface VehicleDAO {
    boolean deleteVehicle(String VehicleID) throws SQLException;
    Vehicle getVehicleByID(String vehicleID) throws SQLException;
    boolean createVehicle(Vehicle vehicle) throws SQLException;
    boolean updateVehicle(Vehicle vehicle) throws SQLException;
    boolean duplicateVehicle(String ID)throws SQLException;
    List<Vehicle> searchVehicle(String search) throws SQLException;
    List<Vehicle> getAllVehicle() throws SQLException;
    List<Vehicle> getAllActiveVehicle() throws SQLException;
    List<Vehicle> getDeleteVehicleHistory() throws SQLException;
    
}
