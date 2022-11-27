
package com.stress.dao;

import com.stress.dto.DriverLicense;
import java.sql.SQLException;
import java.util.List;


public interface DriverLicenseDAO {
    public List<DriverLicense> getAllDriverLicense() throws SQLException;
    public DriverLicense getDriverLicenseByID(String licenseID) throws SQLException;
    public boolean deleteDriverLicense(String driverLicenseID) throws SQLException;
    public boolean createDriverLicense(DriverLicense dl) throws SQLException;
    public boolean updateDriverLicense(DriverLicense dl) throws SQLException;
}
