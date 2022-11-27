
package com.stress.dto;

import java.sql.Date;
import java.sql.Time;
import java.util.Comparator;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Trip implements Comparable<Trip>,Comparator<Trip>{
    public static final int INACTIVE = 0;
    public static final int ACTIVE = 1;
    public static final int ONGOING = 2;
    public static final int COMPLETE = 3;
    
    private String tripID;
    private String tripName;
    private Date startDateTime;
    private Time startTime;
    private String policy;
    private Route route;
    private Vehicle vehicle;
    private Driver driver;
    private int seatRemain;
    private int status;	
    
    @Override
    public int compareTo(Trip o) {
        int x=-1;
        if(this.getStartDateTime().compareTo(o.getStartDateTime())>=0){
            x=1;
        }
        return x;
    }

    @Override
    public int compare(Trip t1, Trip t2) {
        return t1.getVehicle().getVehicleType().getTotalSeat()-t2.getVehicle().getVehicleType().getTotalSeat();
    }
}
