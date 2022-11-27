package com.stress.service;

import com.stress.dao.RoleDAO;
import com.stress.dao.UserDAO;
import com.stress.dto.GooglePojo;
import com.stress.dto.Role;
import com.stress.dto.User;
import com.stress.utils.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    private RoleDAO roleDAO = new RoleDAOImpl(); // DONT REMOVE this is use for get User by ID 

    private static final String LOGIN_BY_EMAIL = "SELECT [UserID], [Username], [RoleID],[AccountBalance] "
            + " FROM tblUsers WHERE [Email] = ? AND [Status] = ?";

    @Override
    public List<User> getAllUser() throws SQLException {
        String getAllUser = "SELECT [UserID],[UserName],[Password], [Email], [DOB], [Address], [PhoneNumber],"
                + " [Sex],[RoleID], [AccountBalance], [Status] FROM tblUsers WHERE [status] = 1 OR [Status] = 2";
        List<User> userList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(getAllUser);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String username = rs.getString("Username");
                    String password = rs.getString("Password");
                    Date dob = rs.getDate("DOB");
                    String address = rs.getString("Address");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String email = rs.getString("Email");
                    boolean sex = rs.getBoolean("Sex");
                    String roleID = rs.getString("RoleID");
                    String AccountBalance = rs.getString("AccountBalance");
                    int status = rs.getInt("Status");

                    Role role = new RoleDAOImpl().getRoleByID(roleID);
                    if (role != null) {
                        userList.add(new User(userID, username, password, email, dob, address, phoneNumber, sex, role, AccountBalance, status));
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("Error at getAllUser:" + e.toString());
        } finally {
            if (rs1 != null) {
                rs.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return userList;
    }

    @Override
    public User getUserByEmail(String email) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN_BY_EMAIL);
                ptm.setString(1, email);
                ptm.setInt(2, User.ACTIVE_GOOGLE);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("UserID");
                    String username = rs.getString("Username");
                    String accountBalance = rs.getString("AccountBalance");
                    String roleID = rs.getString("RoleID");

                    Role role = new RoleDAOImpl().getRoleByID(roleID);
                    if (role != null) {
                        user = new User(userID, username, null, email, null, null, null, true, role, accountBalance, User.ACTIVE_GOOGLE);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    @Override
    public User getUserByIDAndPassword(String userID, String password) throws SQLException {
        User user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String login = "SELECT [Username], [Email],[DOB], [Address], [PhoneNumber], [Sex], [RoleID], [AccountBalance], [Status] "
                + "FROM tblUsers WHERE [UserID]=? AND [Password]=?";
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(login);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    java.sql.Date dob = rs.getDate("dob");
                    String address = rs.getString("address");
                    String phoneNumber = rs.getString("phoneNumber");
                    boolean sex = rs.getBoolean("sex");
                    Role role = roleDAO.getRoleByID(rs.getString("roleID").trim());
                    Float AccountBalance = rs.getFloat("AccountBalance");
                    String tmpAccountBalance = Float.toString(AccountBalance);
                    int status = rs.getInt("status");
                    user = new User(userID, username, password, email, dob, address, phoneNumber, sex, role, tmpAccountBalance, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    @Override
    public boolean deleteUser(String userID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String delete = "UPDATE tblUsers SET [status]=0  WHERE UserID=?";
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(delete);
                ptm.setString(1, userID);
                result = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    @Override
    public boolean registerNewUSer(User user) throws SQLException {
        String register = "INSERT INTO tblUsers(UserID,Username,[Password]"
                + ",Email,DOB,[Address],PhoneNumber,Sex,RoleID,AccountBalance,[Status]) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(register);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getUsername());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, user.getEmail());
                ptm.setDate(5, user.getDob());
                ptm.setString(6, user.getAddress());
                ptm.setString(7, user.getPhoneNumber());
                ptm.setBoolean(8, user.isSex());
                ptm.setString(9, "1");
                ptm.setDouble(10, 0);
                ptm.setInt(11, user.getStatus());
                check = ptm.executeUpdate() > 0 ? true : false;

            }
        } catch (Exception e) {
            System.out.println("Error at registerNewUSer:" + e.toString());
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    @Override
    public boolean checkDuplicateByID(String userID, String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String checkDuplicate = "SELECT userID,username, DOB, address, phoneNumber, sex, roleID, AccountBalance, status FROM tblUsers WHERE userID=? AND Email=?";

        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(checkDuplicate);
                ptm.setString(1, userID);
                ptm.setString(2, email);
                rs = ptm.executeQuery();
                if (rs != null) {
                    check = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Error at checkDuplicateByID:" + e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    @Override
    public User getUserByID(String userID) throws SQLException {
        String sql = "SELECT [UserID],[UserName],[Password], [Email], [DOB], [Address], [PhoneNumber],"
                + " [Sex],[RoleID], [AccountBalance], [Status] FROM tblUsers WHERE [UserID] = ?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        RoleDAO roleDAO = new RoleDAOImpl();
        try {
            conn = DBConnection.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, userID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                return new User(rs.getString("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getDate("DOB"),
                        rs.getString("DOB"),
                        rs.getString("PhoneNumber"),
                        rs.getBoolean("Sex"),
                        roleDAO.getRoleByID(rs.getString("RoleID")),
                        rs.getString("AccountBalance"),
                        rs.getInt("Status")
                );

            }
        } catch (Exception e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return null;
    }

    @Override
    public boolean registerByEmail(GooglePojo googleUser) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("INSERT INTO tblUsers([UserID], [Username], [Email], [Status],[RoleID], [Password]) VALUES (?,?,?,?,?,?)");
                ptm.setString(1, googleUser.getId());
                ptm.setString(2, googleUser.getName());
                ptm.setString(3, googleUser.getEmail());
                ptm.setInt(4, User.ACTIVE_GOOGLE);
                ptm.setInt(5, 1);
                ptm.setString(6, "123");
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    @Override

    public boolean updateUser(String userID, String userName, String email, String DOB, String address,
            String phoneNumber, String sex, String roleID, String status, String password) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;

        PreparedStatement ptm = null;
        String updateUser = "UPDATE tblUsers SET UserName=?,Email=?,DOB=?,Address=?,"
                + "PhoneNumber=?,Sex=?,[RoleID]=?  WHERE UserID=?";
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(updateUser);
                ptm.setString(1, userName);
                ptm.setString(2, email);
                ptm.setString(3, DOB);
                ptm.setString(4, address);
                ptm.setString(5, phoneNumber);
                ptm.setString(6, sex);
                ptm.setString(7, roleID);
                ptm.setString(8, userID);
                checkUpdate = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            System.out.println("Eror at UserDAOImpl - updateUser: " + e.toString());
        } finally {
            return checkUpdate;
        }

    }
    
    private String getAccountBalanceByUserID(String userID) throws SQLException {
        String sql = "SELECT AccountBalance FROM tblUsers WHERE UserID = ?";
        String accountBalance = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    accountBalance = rs.getString("AccountBalance");
                }
            }

        } catch (Exception e) {
            System.out.println("Error at getAccountBalanceByUserID:" + e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return accountBalance;
    }

    @Override
    public boolean updateUser(String userID, String accountBalance) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String updateUser = "UPDATE tblUsers SET [AccountBalance] = ?  WHERE [UserID] = ?";
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(updateUser);
                ptm.setString(1, accountBalance);
                ptm.setString(2, userID);
                checkUpdate = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("Eror at UserDAOImpl - updateUser: " + e.toString());
        } finally {
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return checkUpdate;
    }

    @Override
    public List<User> getAllUserDelete() throws SQLException {
        String getAllUser = "SELECT [UserID],[UserName],[Password], [Email], [DOB], [Address], [PhoneNumber],"
                + " [Sex],[RoleID], [AccountBalance], [Status] FROM tblUsers WHERE [status] = 0";
        List<User> userList = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(getAllUser);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String username = rs.getString("Username");
                    String password = rs.getString("Password");
                    Date dob = rs.getDate("DOB");
                    String address = rs.getString("Address");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String email = rs.getString("Email");
                    boolean sex = rs.getBoolean("Sex");
                    String roleID = rs.getString("RoleID");
                    String AccountBalance = rs.getString("AccountBalance");
                    int status = rs.getInt("Status");

                    Role role = new RoleDAOImpl().getRoleByID(roleID);
                    if (role != null) {
                        userList.add(new User(userID, username, password, email, dob, address, phoneNumber, sex, role, AccountBalance, status));
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("Error at getAllUser:" + e.toString());
        } finally {
            if (rs1 != null) {
                rs.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return userList;
    }

    @Override
    public boolean activeUser(String userID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String active = "UPDATE tblUsers SET [status]=1  WHERE UserID=?";
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(active);
                ptm.setString(1, userID);
                result = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return result;

    }

    @Override
    public List<User> searchUser(String search) throws SQLException {
        String getAllUser = "SELECT [UserID],[UserName],[Password], [Email], [DOB], [Address], [PhoneNumber],"
                + " [Sex],[RoleID], [AccountBalance], [Status] FROM tblUsers WHERE UserName like ?";
        List<User> user = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(getAllUser);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String username = rs.getString("Username");
                    String password = rs.getString("Password");
                    Date dob = rs.getDate("DOB");
                    String address = rs.getString("Address");
                    String phoneNumber = rs.getString("PhoneNumber");
                    String email = rs.getString("Email");
                    boolean sex = rs.getBoolean("Sex");
                    String roleID = rs.getString("RoleID");
                    String AccountBalance = rs.getString("AccountBalance");
                    int status = rs.getInt("Status");

                    Role role = new RoleDAOImpl().getRoleByID(roleID);
                    if (role != null) {
                        user.add(new User(userID, username, password, email, dob, address, phoneNumber, sex, role, AccountBalance, status));
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("Error at getAllUser:" + e.toString());
        } finally {
            if (rs1 != null) {
                rs.close();
            }
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    @Override
    public boolean updatePassword(String userID, String password, String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String updatePassword = "UPDATE tblUsers SET [Password]=? WHERE userID=? AND [Email]=?";

        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(updatePassword);
                ptm.setString(1, password);
                ptm.setString(2, userID);
                ptm.setString(3, email);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            System.out.println("Error at updatePassword:" + e.toString());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
