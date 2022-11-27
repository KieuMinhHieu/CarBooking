package com.stress.dto;

import com.google.gson.Gson;
import com.stress.dao.SeatDAO;
import com.stress.service.SeatDAOImpl;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Huy
 */
public class DataStore {

    private Map<String, Seat> seatMap = new HashMap<>();
    
    public DataStore(String tripID) {
        SeatDAO dao = new SeatDAOImpl();
        try {
            List<Seat> list = dao.getAllUnAvailbeSeatByTripID(tripID);
            for (Seat s : list) {
                seatMap.put(s.getTrip().getTripID(), s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataStore.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String findAllSeatWithTripID(String tripID){
        List<Seat> list = new ArrayList<>(new DataStore(tripID).seatMap.values());
        return toJson(list);
    }
    
    public String toJson(Object list){
        if(list!=null) return null;
        Gson gson = new Gson();
        String json = null;
        try {
            json = gson.toJson(list);
        } catch (Exception e) {
        }
        return json;
    }

    public Seat getSeat(String tripID) {
        return seatMap.get(tripID);
    }

    public void putSeat(Seat seat) {
        seatMap.put(seat.getTrip().getTripID(), seat);
    }
    
    public static void main(String[] args) {
        System.out.println(new DataStore("T2000").seatMap.values());
        System.out.println(new DataStore("T2000").findAllSeatWithTripID("T2000"));
    }
}
