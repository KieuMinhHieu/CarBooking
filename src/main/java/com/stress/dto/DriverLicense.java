
package com.stress.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DriverLicense {
    private String driverLicenseID;
    private String nationality;
    private String classes;
    private Date DateExpired;
    private Driver driver;
}
