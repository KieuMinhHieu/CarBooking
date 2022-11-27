/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.service;

import com.stress.dao.FeedbackDAO;
import com.stress.dto.Feedback;
import com.stress.dto.Order;
import com.stress.dto.Trip;
import com.stress.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author MinhQuang
 */
public class FeedbackDAOImpl implements FeedbackDAO {

    @Override
    public boolean sendFeedback(Feedback feedback) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check = false;
        String sql = "INSERT INTO tblFeedbacks([Rating],[Comment],[OrderID],[TripID]) VALUES (?,?,?,?)";
        try {
            conn = DBConnection.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setInt(1, feedback.getRating());
            ptm.setString(2, feedback.getComment());
            ptm.setString(3, feedback.getOrder().getOrderID());
            ptm.setString(4, feedback.getTrip().getTripID());
            check = ptm.executeUpdate() > 0;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check; 
    }

    @Override
    public List<Feedback> getFeedbackByTripID(String tripID) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Feedback getFeedbackByOrderID(String orderID) throws SQLException {
      Connection conn = null;
      PreparedStatement ptm = null; 
      Feedback fb = null;
      ResultSet rs = null;
      String sql = "SELECT [FeedbackID], [Rating],[Comment],[TripID] FROM tblFeedbacks WHERE [OrderID] = ?";
        try {
            conn = DBConnection.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, orderID);
            rs = ptm.executeQuery();
            if(rs.next()) {
                int feedbackID = rs.getInt("FeedbackID");
                int rating = rs.getInt("Rating");
                String comment = rs.getString("Comment");
                String tripID = rs.getString("TripID");
                
                // Get Trip and Order;
                Trip trip = new TripDAOImpl().getTripByID(tripID);
                Order order = new OrderDAOImpl().getOderByID(orderID);
                fb = new Feedback(feedbackID, rating, comment, order, trip);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return fb;
        
    }
    
}
