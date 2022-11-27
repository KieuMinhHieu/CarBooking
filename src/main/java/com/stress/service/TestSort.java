/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.service;

import com.stress.dto.Trip;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author KieuMinhHieu
 */
public class TestSort{
    public static List<Trip> getTripByTime(List<Trip> list,int from,int to){
        List<Trip> listTrip=new ArrayList<>();
        for (Trip trip : list) {
            if(trip.getStartTime().getHours()>=from &&trip.getStartTime().getHours()<=to){
                listTrip.add(trip);
            }
        }
        return listTrip;
    }
       public static void main(String[] args) {
        try {
            TripDAOImpl dao = new TripDAOImpl();
            List<Trip> trip = dao.getAllTripByRouteAndStartDay(1, "2022-10-18");
            
            int count2=0;
            List<Trip> listTripCar=getTripByTime(trip, 6, 12);
            for (Trip trip1 : listTripCar) {
                System.out.println("1-Trip "+count2+ " :"+ trip1.getStartTime().getHours());
                count2++;
            }
//            System.out.println("***********************************************************");
//            Collections.sort(trip,Collections.reverseOrder());
//            int count=0;
//            for (Trip trip1 : trip) {
//                System.out.println("Trip "+count+ " :"+ trip1.getStartDateTime()+" , "+trip1.getStartTime());
//                count++;
//            }
//            Collections.sort(trip, new Comparator<Trip>(){
//               @Override
//               public int compare(Trip t1, Trip t2) {
//                   int x=0;
//                if(t1.getStartDateTime().compareTo(t2.getStartDateTime())<0){
//                    return -1;
//                }
//                return x;
//            }
//            });
            
//            Collections.sort(trip, new Comparator<Trip>(){
//               @Override
//               public int compare(Trip t1, Trip t2) {
//                return t1.getVehicle().getVehicleType().getTotalSeat()-t2.getVehicle().getVehicleType().getTotalSeat();
//            }
//            });

//            System.out.println("************************************************************");
//            Collections.sort(trip, new Trip().reversed());
//            int count3=0;
//            for (Trip trip1 : trip) {
//                System.out.println("Trip "+count3+ " :"+ trip1.getStartDateTime()+" , "+trip1.getStartTime()+" , "+trip1.getVehicle().getVehicleType().getTotalSeat());
//                count3++;
//            }
        } catch (Exception e) {
        }
    }
    
}
