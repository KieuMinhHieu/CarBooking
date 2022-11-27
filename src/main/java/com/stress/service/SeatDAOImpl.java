
package com.stress.service;

import com.stress.dao.SeatDAO;
import com.stress.dao.TripDAO;
import com.stress.dto.Seat;
import com.stress.dto.Trip;
import com.stress.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Huy
 */
public class SeatDAOImpl implements SeatDAO{

    @Override
    public Seat getSeatByID(String string) throws SQLException {
        return null;
    }
    @Override
    public List<String> setMap(int number) throws SQLException{
        List<String> list = null;
        if(number==16) {
            String[] seatID = {
                "B_1","B_2","B_4",
                "C_1","C_2",
                "D_1","D_2","D_4",
                "E_1","E_2","E_4",
                "F_1","F_2","F_3","F_4"
            };
            list = new ArrayList<>(Arrays.asList(seatID));
        }
        if(number==29) {
            String[] seatID = {
                "B_1","B_2","B_4","B_5",
                "C_1","C_2","C_4","C_5",
                "D_1","D_2","D_4","D_5",
                "E_1","E_2","E_4","E_5",
                "F_1","F_2","F_4","F_5",
                "G_1","G_2","G_4","G_5",
                "H_1","H_2","H_3","H_4","H_5"
            };
            list = new ArrayList<>(Arrays.asList(seatID));
        }
        if(number==45) {
            String[] seatID = {
                "B_1","B_2","B_4","B_5",
                "C_1","C_2","C_4","C_5",
                "D_1","D_2","D_4","D_5",
                "E_1","E_2","E_4","E_5",
                "F_1","F_2","F_4","F_5",
                "G_1","G_2","G_4","G_5",
                "H_1","H_2","H_4","H_5",
                "I_1","I_2","I_4","I_5",
                "J_1","J_2","J_4","J_5",
                "K_1","K_2","K_4","K_5",
                "L_1","L_2","L_3","L_4","L_5",
            };
            list = new ArrayList<>(Arrays.asList(seatID));
        }
        return list;
    }

    @Override
    public boolean addSeat(String tripID, String seatID) throws SQLException {
        String sql = "INSERT INTO tblSeats(SeatID,TripID,Price,[Status]) VALUES(?,?,?,?)";
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, seatID);
                ptm.setString(2, tripID);
                ptm.setInt(3, 150000);  
                ptm.setBoolean(4, false);
                check = ptm.executeUpdate() > 0;
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
        }
        return check;
    }

    @Override
    public boolean updateSeat(String tripID, String seatID) throws SQLException {
        boolean check = false;
        String sql = "UPDATE tblSeats SET [Status] = ?, Price = ? WHERE SeatID = ? AND TRIPID = ?";
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(sql);
                ptm.setBoolean(1, false);
                ptm.setInt(2, 150000);
                ptm.setString(3, seatID);
                ptm.setString(4, tripID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
        }
        return check;
    }
    @Override
    public List<Seat> getAllSeat() throws SQLException {
        List<Seat> list = new ArrayList<>();
        return list;
    }

    @Override
    public List<Seat> getAllUnAvailbeSeatByTripID(String tripID) throws SQLException {
        TripDAO tripDAO = new TripDAOImpl();
        String sql = "SELECT SeatID, Price, [Status], TripID FROM tblSeats WHERE [Status] = 1 AND TripID = ?";
        List<Seat> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, tripID);
                rs = ptm.executeQuery();
                while(rs.next()){
                    list.add(new Seat(
                            rs.getString("SeatID"), 
                            rs.getInt("Price"), 
                            rs.getInt("Status"), 
                            tripDAO.getTripByID(rs.getString("TripID"))));
                }
            }
        } catch (Exception e) {
        } finally {
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
            if(rs!=null) rs.close();
        }
        return list;
    }

    @Override
    public Seat getSeatByID(String seatID, String tripID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [Price],[Status] FROM tblSeats WHERE [SeatID] = ? AND TripID = ?";
        Seat seat = null;
        try {
            conn = DBConnection.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, seatID);
            ptm.setString(2, tripID);
            rs = ptm.executeQuery();
            if(rs.next()) {
                int price = rs.getInt("Price");
//                boolean status = rs.getBoolean("Status");
                int status = rs.getInt("status");
                Trip trip = new TripDAOImpl().getTripByID(tripID);
                seat = new Seat(seatID, price, status, trip);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return seat;
    }

    @Override
    public boolean lockSeat(String seatID, String tripID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE tblSeats SET [Status] = 1 WHERE [SeatID] = ? AND [TripID] = ?";
        try {
            conn = DBConnection.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, seatID);
                ptm.setString(2, tripID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    public static void main(String[] args) throws SQLException {
        SeatDAOImpl s = new SeatDAOImpl();
        System.out.println(s.lockSeat("D_1", "T0001"));
    }
}
