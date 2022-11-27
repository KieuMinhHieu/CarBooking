
package com.stress.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DriverError {
    public static final int INACTIVE = 0;
    public static final int ACTIVE = 1;
    public static final int ONGOING = 2;
    
    private String driverID;
    private String driverName;	
    private String DOB; 
    private String sex;
    private String driverPicture;
    private String phoneNumber;
    private String status;
}
