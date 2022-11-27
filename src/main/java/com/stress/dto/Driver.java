
package com.stress.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Driver {
    public static final int INACTIVE = 0;
    public static final int ACTIVE = 1;
    public static final int ONGOING = 2;
    
    private String driverID;
    private String driverName;	
    private Date DOB; 
    private boolean sex;
    private String driverPicture;
    private String phoneNumber;
    private int status;
    
}
