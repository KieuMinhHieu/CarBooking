
package com.stress.service;
import com.stress.dao.RoleDAO;
import com.stress.dto.Role;
import com.stress.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author MinhQuang
 */
public class RoleDAOImpl implements RoleDAO {
    
    @Override 
    public Role getRoleByID(String roleID) throws SQLException {
        String sql = "SELECT [RoleID], [RoleName] FROM tblRoles WHERE [RoleID] = ?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, roleID);
            rs = ptm.executeQuery();
            while(rs.next()){
                return new Role(rs.getString("RoleID").trim(), rs.getString("RoleName"));
            }
        } catch (Exception e) {
            System.out.println("Error at RoleDAOImpl - getRoleByID"+ e.toString());
        } finally {
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
            if(rs!=null) rs.close();
        }
        return null;
    }
    public static void main(String[] args) {
        try {
            RoleDAOImpl dao = new RoleDAOImpl();
            System.out.println(dao.getRoleByID("1"));
        } catch (Exception e) {
        }
    }
}
