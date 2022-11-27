/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.stress.dao;

import com.stress.dto.Feedback;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author MinhQuang
 */
public interface FeedbackDAO {
    boolean sendFeedback(Feedback feedback) throws SQLException;
    List<Feedback> getFeedbackByTripID(String tripID) throws SQLException;
    Feedback getFeedbackByOrderID (String orderID) throws SQLException;
}
