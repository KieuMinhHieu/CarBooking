
package com.stress.dao;

import com.stress.dto.Seat;
import java.sql.SQLException;
import java.util.List;


public interface SeatDAO {
    Seat getSeatByID(String seatID) throws SQLException;
    boolean addSeat(String tripID, String seatID) throws SQLException;
    boolean updateSeat(String tripID, String seatID) throws SQLException;
    List<String> setMap(int number) throws SQLException;
    List<Seat> getAllSeat() throws SQLException;
    List<Seat> getAllUnAvailbeSeatByTripID(String tripID) throws SQLException;
    Seat getSeatByID(String seatID, String tripID) throws SQLException;
    public boolean lockSeat(String seatID, String tripID) throws SQLException;
}
