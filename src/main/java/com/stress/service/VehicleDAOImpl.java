package com.stress.service;

import com.stress.dao.VehicleDAO;
import com.stress.dto.Vehicle;
import com.stress.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.stress.dto.VehicleType;

public class VehicleDAOImpl implements VehicleDAO {

    private static final String DELETE = "UPDATE tblVehicles SET [Status] = ? WHERE VehicleID=?";

    @Override
    public List<Vehicle> searchVehicle(String search) throws SQLException {
        List<Vehicle> vList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT [VehicleID], [VehicleName],[LicensePlate],[VehicleTypeID],[Status] FROM tblVehicles"
                        + " WHERE VehicleName LIKE ?");
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String vehicleID = rs.getString("VehicleID");
                    String vehicleName = rs.getString("VehicleName");
                    String licensePlate = rs.getString("LicensePlate");
                    int VehicleTypeID = rs.getInt("VehicleTypeID");
                    int status = rs.getInt("status");
                    VehicleType vType = new VehicleTypeDAOImpl().getVehicleTypeByID(VehicleTypeID);
                    if (vType != null) {
                        vList.add(new Vehicle(vehicleID, vehicleName, licensePlate, vType, status));
                    } else {
                        throw new Exception();
                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return vList;

    }

    @Override
    public boolean deleteVehicle(String VehicleID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, Vehicle.INACTIVE);
                ptm.setString(2, VehicleID);

                result = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    @Override
    public Vehicle getVehicleByID(String vehicleID) throws SQLException {
        Vehicle vehicle = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT [VehicleName],[LicensePlate],[VehicleTypeID],[Status] FROM tblVehicles WHERE [vehicleID] = ?");
                ptm.setString(1, vehicleID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String vehicleName = rs.getString("vehicleName");
                    String licensePlate = rs.getString("licensePlate");
                    int vehicleTypeID = rs.getInt("vehicleTypeID");
                    int status = rs.getInt("status");
                    VehicleType vType = new VehicleTypeDAOImpl().getVehicleTypeByID(vehicleTypeID);
                    if (vType != null) {
                        vehicle = new Vehicle(vehicleID, vehicleName, licensePlate, vType, status);
                    } else {
                        throw new Exception();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return vehicle;
    }

    @Override
    public boolean createVehicle(Vehicle vehicle) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("INSERT INTO tblVehicles([VehicleID],[VehicleName],[LicensePlate],[VehicleTypeID],[Status]) VALUES (?,?,?,?,?)");
                ptm.setString(1, vehicle.getVehicleID());
                ptm.setString(2, vehicle.getVehicleName());
                ptm.setString(3, vehicle.getLicensePlate());
                ptm.setInt(4, vehicle.getVehicleType().getVehicleTypeID());
                ptm.setInt(5, vehicle.getStatus());

                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    @Override
    public boolean updateVehicle(Vehicle vehicle) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("UPDATE tblVehicles SET [VehicleName] = ?, [LicensePlate] = ?, [VehicleTypeID] = ?, [Status] = ? WHERE [VehicleID] = ?");
                ptm.setString(1, vehicle.getVehicleName());
                ptm.setString(2, vehicle.getLicensePlate());
                ptm.setInt(3, vehicle.getVehicleType().getVehicleTypeID());
                ptm.setInt(4, vehicle.getStatus());
                ptm.setString(5, vehicle.getVehicleID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    @Override
    public List<Vehicle> getDeleteVehicleHistory() throws SQLException {
        List<Vehicle> vList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT [VehicleID], [VehicleName],[LicensePlate],[VehicleTypeID],[Status] FROM tblVehicles WHERE [Status] = 0");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String vehicleID = rs.getString("VehicleID");
                    String vehicleName = rs.getString("VehicleName");
                    String licensePlate = rs.getString("LicensePlate");
                    int VehicleTypeID = rs.getInt("VehicleTypeID");
                    int status = rs.getInt("status");
                    VehicleType vType = new VehicleTypeDAOImpl().getVehicleTypeByID(VehicleTypeID);
                    if (vType != null) {
                        vList.add(new Vehicle(vehicleID, vehicleName, licensePlate, vType, status));
                    } else {
                        throw new Exception();
                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return vList;
    }

    @Override
    public List<Vehicle> getAllVehicle() throws SQLException {
        List<Vehicle> vList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT [VehicleID], [VehicleName],[LicensePlate],[VehicleTypeID],[Status] FROM tblVehicles WHERE [Status] != 0");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String vehicleID = rs.getString("VehicleID");
                    String vehicleName = rs.getString("VehicleName");
                    String licensePlate = rs.getString("LicensePlate");
                    int VehicleTypeID = rs.getInt("VehicleTypeID");
                    int status = rs.getInt("status");
                    VehicleType vType = new VehicleTypeDAOImpl().getVehicleTypeByID(VehicleTypeID);
                    if (vType != null) {
                        vList.add(new Vehicle(vehicleID, vehicleName, licensePlate, vType, status));
                    } 

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return vList;
    }

    @Override
    public boolean duplicateVehicle(String vehicleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT [VehicleName] FROM tblVehicles WHERE [VehicleID] = ?");
                ptm.setString(1, vehicleID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }


    @Override
    public List<Vehicle> getAllActiveVehicle() throws SQLException {
        List<Vehicle> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT [VehicleID], [VehicleName],[LicensePlate],[VehicleTypeID],[Status] FROM tblVehicles WHERE [Status] = 1");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String vehicleID = rs.getString("VehicleID");
                    String vehicleName = rs.getString("VehicleName");
                    String licensePlate = rs.getString("LicensePlate");
                    int VehicleTypeID = rs.getInt("VehicleTypeID");
                    int status = rs.getInt("status");
                    VehicleType vType = new VehicleTypeDAOImpl().getVehicleTypeByID(VehicleTypeID);
                    if (vType != null) {
                        list.add(new Vehicle(vehicleID, vehicleName, licensePlate, vType, status));
                    } else {
                        throw new Exception();
                    }

                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public static void main(String[] args) throws SQLException {
        VehicleDAO vDAO = new VehicleDAOImpl();
        List<Vehicle> vList = vDAO.getAllVehicle();
        for (Vehicle vehicle : vList) {
            System.out.println(vehicle);
        }
    }
}
