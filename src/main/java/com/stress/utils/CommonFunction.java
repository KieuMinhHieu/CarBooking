/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Huy
 */
public class CommonFunction {

    public static String VehiclePrefix = "VE";
    public static String CityPrefix = "C";
    public static String DriverLicensePrefix = "D";
    public static String LocationPrefix = "L";
    public static String OrderPrefix = "O";
    public static String RoutePrefix = "R";
    public static String TicketPrefix = "TK";
    public static String TripPrefix = "T";
    public static String VehicleTypePrefix = "VT";

    public static String generateID(String tableName, String className) throws SQLException {
        String ID = "";
        String sql = "SELECT " + className + "ID" + " FROM " + tableName + " ORDER BY " + className + "ID DESC";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    ID = rs.getString(1);
                }
            }
            String tmp = "";
            if(ID.equals("")){
                tmp = "0000";
            }else{
                int n = ID.length();
                for (int i = n - 1; i >= 0; i--) {
                    char c = ID.charAt(i);
                    if (c >= '0' && c <= '9') {
                        tmp = ID.charAt(i) + tmp;
                    }
                }
            }
            int number = Integer.parseInt(tmp);
            number++;
            tmp = String.valueOf(number);
            if (className.equals("Vehicle")) {
                ID = generateHelper(VehiclePrefix,tmp);
            } else if (className.equals("City")) {
                ID = generateHelper(CityPrefix,tmp);
            } else if (className.equals("DriverLicense")) {
                ID = generateHelper(DriverLicensePrefix,tmp);
            } else if (className.equals("Location")) {
                ID = generateHelper(LocationPrefix,tmp);
            } else if (className.equals("Order")) {
                ID = generateHelper(OrderPrefix,tmp);
            } else if (className.equals("Route")) {
                ID = generateHelper(RoutePrefix,tmp);
            } else if (className.equals("Ticket")) {
                ID = generateHelper(TicketPrefix,tmp);
            } else if (className.equals("VehicleType")) {
                ID = generateHelper(VehicleTypePrefix,tmp);
            } else if (className.equals("Trip")) {
                ID = generateHelper(TripPrefix,tmp);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return ID;
    }

    public static String generateHelper(String prefix, String number) {
        String res = "";
        int pLength = prefix.length();
        int nLength = number.length();
        // VE001 V0001
        if (pLength == 1) {
            if (nLength == 1) {
                res = prefix + "000" + number;
            } else if (nLength == 2) {
                res = prefix + "00" + number;
            } else if (nLength == 3){
                res = prefix + "0" + number;
            } else {
                res = prefix +number;
            }
        } else {
            if (nLength == 1) {
                res = prefix + "00" + number;
            } else if (nLength == 2) {
                res = prefix + "0" + number;
            } else {
                res = prefix + number;
            }
        }
        return res;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(generateID("tblTrips", "Trip"));
    }
}
