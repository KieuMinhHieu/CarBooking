
package com.stress.dao;

import com.stress.dto.Role;
import java.sql.SQLException;


public interface RoleDAO {
    Role getRoleByID(String roleID) throws SQLException;
}
