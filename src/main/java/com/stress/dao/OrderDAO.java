
package com.stress.dao;

import com.stress.dto.Order;
import java.sql.SQLException;
import java.util.List;


public interface OrderDAO {
    Order getOderByID(String orderID) throws SQLException;
    Order createOrder(Order order) throws SQLException;
    List<Order> getAllOrderByUserID(String userID) throws SQLException;
    boolean updateOrder(Order order) throws SQLException;
}
