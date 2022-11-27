
package com.stress.dto;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VehicleType implements Serializable {
    private int PRICE_16 = 300000;
    private int PRICE_29 = 250000;
    private int PRICE_45 = 200000;
    
    private int vehicleTypeID;
    private String vehicleTypeName;
    private int totalSeat;

    public VehicleType(int vehicleTypeID, String vehicleTypeName, int totalSeat) {
        this.vehicleTypeID = vehicleTypeID;
        this.vehicleTypeName = vehicleTypeName;
        this.totalSeat = totalSeat;
    }
}
