
package com.stress.dao;

import com.stress.dto.Ticket;
import java.sql.SQLException;
import java.util.List;


public interface TicketDAO {
    List<Ticket> getAllTicket() throws SQLException;
    boolean addNewTicket(Ticket ticket) throws SQLException;
    boolean updateTicket(Ticket ticket) throws SQLException;
    List<Ticket> getTicketByOrderID(String orderID) throws SQLException;
}
