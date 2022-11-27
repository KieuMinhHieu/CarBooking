
package com.stress.service;

import com.stress.dao.OrderDAO;
import com.stress.dao.SeatDAO;
import com.stress.dao.TicketDAO;
import com.stress.dao.TripDAO;
import com.stress.dto.Seat;
import com.stress.dto.Ticket;
import com.stress.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Huy
 */
public class TicketDAOImpl implements TicketDAO{
    
    private SeatDAO seatDAO = new SeatDAOImpl();
    private TripDAO tripDAO = new TripDAOImpl();
    private OrderDAO orderDAO = new OrderDAOImpl();

    @Override
    public List<Ticket> getAllTicket() throws SQLException {
        String sql = "SELECT TicketID,SeatID,TripID,OrderID FROM tblTickets";
        List<Ticket> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while(rs.next()){
                    list.add(new Ticket(rs.getInt("TicketID"), 
                            seatDAO.getSeatByID(rs.getString("SeatID")), 
                            tripDAO.getTripByID(rs.getString("TripID")), 
                            orderDAO.getOderByID("OrderID")));
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
    public boolean addNewTicket(Ticket ticket) throws SQLException {
        String sql = "INSERT INTO tblTickets(SeatID,TripID,OrderID) VALUES (?,?,?)";
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, ticket.getSeat().getSeatID());
                ptm.setString(2, ticket.getTrip().getTripID());
                ptm.setString(3, ticket.getOrder().getOrderID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
        }
        return check;
    }

    @Override
    public boolean updateTicket(Ticket ticket) throws SQLException {
        String sql = "UPDATE tblTickets "
                    + "SET SeatID = ?, TripID = ?,OrderID = ? "
                    + "WHERE TicketID = ?";
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, ticket.getSeat().getSeatID());
                ptm.setString(2, ticket.getTrip().getTripID());
                ptm.setString(3, ticket.getOrder().getOrderID());
                ptm.setInt(4, ticket.getTicketID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
        }
        return check;
    }

    @Override
    public List<Ticket> getTicketByOrderID(String orderID) throws SQLException {
        String sql = "SELECT TicketID,SeatID,TripID,OrderID FROM tblTickets WHERE OrderID = ?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<Ticket> ticketList = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, orderID);
                rs = ptm.executeQuery();
                while(rs.next()){
                    ticketList.add(new Ticket(rs.getInt("TicketID"), 
                            seatDAO.getSeatByID(rs.getString("SeatID"), rs.getString("TripID")), 
                            tripDAO.getTripByID(rs.getString("TripID")), 
                            orderDAO.getOderByID(rs.getString("OrderID"))));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
            if(rs!=null) rs.close();
        }
        return ticketList;
    }
    public static void main(String[] args) throws SQLException {
        TicketDAO tDAO = new TicketDAOImpl();
        List<Ticket> tList = tDAO.getTicketByOrderID("O0004");
        for (Ticket ticket : tList) {
            System.out.println(ticket);
        }
    }
}
