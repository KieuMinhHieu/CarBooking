/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.ws;


import com.stress.dao.SeatDAO;
import com.stress.dto.Seat;
import com.stress.dto.Vehicle;
import com.stress.dto.VehicleType;
import com.stress.service.SeatDAOImpl;
import com.stress.service.VehicleDAOImpl;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author Huy
 */
@Path("/seat")
public class SeatResource extends HttpServlet{
//    
//    @GET
//    @Produces(MediaType.APPLICATION_JSON)
//    public Response hello(){
//        Response msg = null;
//        
//        List<Vehicle> ve = null;
//        try {
//            ve = new VehicleDAOImpl().getAllVehicle();
//        } catch (SQLException ex) {
//            Logger.getLogger(SeatResource.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        msg = Response.ok().entity(ve).build();
//        return msg;
//    }
    
    @GET
    @Path("{tripID}")
    @Produces(MediaType.APPLICATION_JSON) 
    public Response getUnavailableSeatByTrip(@PathParam("tripID") String tripID) throws SQLException {
        Response result = null;
        SeatDAO sDAO = new SeatDAOImpl(); 
        List<Seat> seList = sDAO.getAllUnAvailbeSeatByTripID(tripID );
        for (Seat seat : seList) {
            System.out.println(seat);
        }
        result = Response.ok().entity(seList).build();
        
        return result;
    } 
}
