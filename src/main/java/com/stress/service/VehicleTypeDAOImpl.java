/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.service;

import com.stress.dao.VehicleTypeDAO;
import com.stress.dto.VehicleType;
import com.stress.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MinhQuang
 */
public class VehicleTypeDAOImpl implements VehicleTypeDAO {

    
    @Override
    public List<VehicleType> getAllVehicleType() throws SQLException {
        List<VehicleType> vehicleTypeList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement("SELECT [VehicleTypeID], [VehicleTypeName],[TotalSeat] FROM tblVehicleTypes");
                rs = ptm.executeQuery();
                while(rs.next()) {
                    int vehicleTypeID = rs.getInt("vehicleTypeID");
                    String vehicleTypeName = rs.getString("VehicleTypeName");
                    int totalSeat = rs.getInt("totalSeat");
                    vehicleTypeList.add(new VehicleType(vehicleTypeID, vehicleTypeName, totalSeat));
                }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return vehicleTypeList;
    }

    @Override
    public int createVehicleType(VehicleType newVehicleType) throws SQLException {
        int vehicleTypeID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement("INSERT INTO tblVehicleTypes(VehicleTypeName, TotalSeat) VALUES(?, ?)");
                ptm.setString(1, newVehicleType.getVehicleTypeName());
                ptm.setInt(2, newVehicleType.getTotalSeat());
                if(ptm.executeUpdate() > 0) {
                    vehicleTypeID = getMaxVehicleType();
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
            
        }
        return vehicleTypeID;
    }
    @Override
    public int getMaxVehicleType() throws SQLException {
        int result = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement("SELECT MAX(VehicleTypeID) AS [VehicleTypeID] FROM tblVehicleTypes");
                rs = ptm.executeQuery();
                if(rs.next()) {
                    result = rs.getInt("vehicleTypeID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return result;
    }

    @Override
    public boolean updateVehicleType(VehicleType updateVehicleType) throws SQLException {
                 boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement("UPDATE tblVehicleTypes SET VehicleTypeName = ?, TotalSeat = ? WHERE [VehicleTypeID] = ?");
                ptm.setString(1, updateVehicleType.getVehicleTypeName());
                ptm.setInt(2, updateVehicleType.getTotalSeat());
                ptm.setInt(3, updateVehicleType.getVehicleTypeID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check;
    }

    @Override
    public boolean deleteVehicleType(String deleteVehicleType) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement("DELETE FROM tblVehicleTypes WHERE [VehicleTypeID] = ?");
                ptm.setString(1, deleteVehicleType);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    @Override
    public VehicleType getVehicleTypeByID(int vehicleTypeID) throws SQLException {
        VehicleType vType = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement("SELECT [VehicleTypeName],[TotalSeat] FROM tblVehicleTypes WHERE [VehicleTypeID] = ?");
                ptm.setInt(1, vehicleTypeID);
                rs = ptm.executeQuery();
                if(rs.next()) {
                    String vehicleTypeName = rs.getString("vehicleTypeName");
                    int totalSeat = rs.getInt("totalSeat");
                    vType = new VehicleType(vehicleTypeID, vehicleTypeName, totalSeat);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return vType;
    }
}
