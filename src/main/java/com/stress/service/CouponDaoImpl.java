package com.stress.service;

import com.stress.dao.CouponDAO;
import com.stress.dao.UserDAO;
import com.stress.dto.Coupon;
import com.stress.dto.UserCoupon;
import com.stress.utils.DBConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class CouponDaoImpl implements CouponDAO {

    UserDAO userDAO = new UserDAOImpl();

    @Override
    public List<Coupon> getAllCoupon(String day) throws SQLException {
        List<Coupon> list = new ArrayList<>();
        String sql = "DECLARE @timeFrom time(7) = convert(varchar(10), GETDATE(), 108);"
                + "SELECT [CouponID],[Count],[Percent],[expiryDate],[expiryTime]FROM [ETransportationManagement].[dbo].[tblCoupon]"
                + "WHERE expiryDate= ? AND expiryTime >= @timeFrom AND [Count]>0";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, day);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new Coupon(rs.getString("CouponID"),
                            rs.getInt("Percent"),
                            rs.getInt("Count"),
                            rs.getDate("expiryDate"),
                            rs.getTime("expiryTime")));
                }
            }
            list.addAll(getAllCouponAtHigerDate(day));
        } catch (Exception e) {
            System.out.println("Error at getAllCoupon:" + e.toString());
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
        return list;
    }

    private List<Coupon> getAllCouponAtHigerDate(String day) throws SQLException {
        List<Coupon> list = new ArrayList<>();
        String sql = "SELECT [CouponID],[Count],[Percent],[expiryDate],[expiryTime]"
                + "FROM [ETransportationManagement].[dbo].[tblCoupon]"
                + "WHERE expiryDate> ? AND [Count]>0 ";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, day);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new Coupon(rs.getString("CouponID"),
                            rs.getInt("Percent"),
                            rs.getInt("Count"),
                            rs.getDate("expiryDate"),
                            rs.getTime("expiryTime")));
                }
            }
        } catch (Exception e) {
            System.out.println("Error at getAllCoupon:" + e.toString());
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
        return list;
    }

    @Override
    public boolean updateCoupon(Coupon coupon) throws SQLException {
        boolean check = false;
        String sql = "UPDATE  [tblCoupon]\n"
                + "SET [Count]=?,[Percent]=?, [expiryDate]=?, [expiryTime]=? \n"
                + "WHERE [CouponID]=?";
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, coupon.getCount());
                ptm.setInt(2, coupon.getPercent());
                ptm.setDate(3, coupon.getExpiryDate());
                ptm.setTime(4, coupon.getExpiryTime());
                ptm.setString(5, coupon.getCouponID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("Error at deleteCoupon:" + e.toString());
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
    public boolean addCoupon(String coupondID,int count, int percent, String exDate, String exTime) throws SQLException {
        boolean check = false;
        String sql = "INSERT INTO tblCoupon ([CouponID],[Count],[Percent],expiryDate,expiryTime)VALUES (?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, coupondID);
                ptm.setInt(2, count);
                ptm.setInt(3, percent);
                ptm.setString(4, exDate);
                ptm.setString(5 , exTime);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("Error at addCoupon:" + e.toString());
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
    public Coupon getNewCoupon() throws SQLException {
        Coupon coupon = null;
        String sql = "SELECT TOP (1) [CouponID],[Count],[Percent],[expiryDate],[expiryTime]FROM [ETransportationManagement].[dbo].[tblCoupon] ORDER BY [CouponID] DESC";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    coupon = new Coupon(rs.getString("CouponID"),
                            rs.getInt("Percent"),
                            rs.getInt("Count"),
                            rs.getDate("expiryDate"),
                            rs.getTime("expiryTime"));
                }
            }

        } catch (Exception e) {
            System.out.println("Error at getAllCoupon:" + e.toString());
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
        return coupon;
    }

    public static void main(String[] args) {
        try {
            CouponDaoImpl dao = new CouponDaoImpl();
//            boolean check=dao.addCoupon(new Coupon(0, 20, 20, Date.valueOf("10/30/2022"), Time.valueOf(java.time.LocalDate.now().toString())));
            //System.out.println("Check: " + dao.updateCoupon(new Coupon("tIcVgvg", 20, 40, Date.valueOf("2022-12-02"), Time.valueOf("01:27:00"))));
            System.out.println("Check: " + dao.getCouponUserNot(java.time.LocalDate.now().toString()));
        } catch (Exception e) {
        }
    }

    @Override
    public Coupon getCouponByPercentOrID(int percent,String couponID) throws SQLException {
        Coupon coupon = null;
        String sql = "SELECT [CouponID],[Count],[Percent],[expiryDate],[expiryTime]"
                + "FROM [ETransportationManagement].[dbo].[tblCoupon] "
                + "WHERE [Percent]=? OR [CouponID]=?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, percent);
                ptm.setString(2, couponID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    coupon = new Coupon(rs.getString("CouponID"),
                            rs.getInt("Percent"),
                            rs.getInt("Count"),
                            rs.getDate("expiryDate"),
                            rs.getTime("expiryTime"));
                }
            }

        } catch (Exception e) {
            System.out.println("Error at getAllCoupon:" + e.toString());
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
        return coupon;
    }

    @Override
    public boolean insertUserCoupon(String userID, String couponID) throws SQLException {
        boolean check = false;
        String sql = " INSERT INTO [tblUser_Coupon] ([UserID],[CouponID],[Status]) VALUES (?,?,1)";
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, userID);
                ptm.setString(2, couponID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("Error at addCoupon:" + e.toString());
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
    public boolean setNumOfCoupon(String couponID, int count) throws SQLException {
        boolean check = false;
        String sql = "UPDATE  [tblCoupon]\n"
                + "SET [Count]=? \n"
                + "WHERE [CouponID]=?";
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, count);
                ptm.setString(2, couponID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            System.out.println("Error at setNumOfCoupon:" + e.toString());
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
    public UserCoupon getUserCoupon(String userID, String couponID) throws SQLException {
        UserCoupon userCoupon = null;
        String sql = "SELECT [UserID]\n"
                + "      ,[CouponID]\n"
                + "      ,[Status]\n"
                + "  FROM [ETransportationManagement].[dbo].[tblUser_Coupon]\n"
                + "  WHERE [UserID]=? AND [CouponID]=?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, userID);
                ptm.setString(2, couponID);
                rs = ptm.executeQuery();
                System.out.println("Rs: " + rs);
                if (rs.next()) {
                    userCoupon = new UserCoupon(userDAO.getUserByID(userID), getCouponByID(couponID), rs.getInt("Status"));
                }
            }
        } catch (Exception e) {
            System.out.println("Error at getUserCoupon:" + e.toString());
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
        return userCoupon;
    }

    @Override
    public Coupon getCouponByID(String couponID) throws SQLException {
        Coupon coupon = null;
        String sql = "SELECT [CouponID],[Count],[Percent],[expiryDate],[expiryTime]"
                + "FROM [ETransportationManagement].[dbo].[tblCoupon] "
                + "WHERE [CouponID]=?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, couponID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    coupon = new Coupon(rs.getString("CouponID"),
                            rs.getInt("Percent"),
                            rs.getInt("Count"),
                            rs.getDate("expiryDate"),
                            rs.getTime("expiryTime"));
                }
            }

        } catch (Exception e) {
            System.out.println("Error at getAllCoupon:" + e.toString());
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
        return coupon;
    }

    @Override
    public boolean setStatusUserCoupon(String userID, String couponID, int status) throws SQLException {
        boolean check = false;
        String sql = "UPDATE [tblUser_Coupon] SET [Status]=? WHERE [UserID]=? AND [CouponID]=?";
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, status);
                ptm.setString(2, userID);
                ptm.setString(3, couponID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("Error at setStatusUserCoupon:" + e.toString());
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
    public List<Coupon> getCouponUserNot(String day) throws SQLException {
        List<Coupon> list = new ArrayList<>();
        String sql = "DECLARE @timeFrom time(7) = convert(varchar(10), GETDATE(), 108)\n"
                + "SELECT C.[CouponID] as CouponIDs , C.[Count] as Counts , C.[Percent] as Percents , C.[expiryDate] as expiryDates , C.[expiryTime] as  expiryTimes \n"
                + "FROM [tblCoupon] as C INNER JOIN [tblUser_Coupon] ON C.[CouponID]!=[tblUser_Coupon].[CouponID] \n"
                + "WHERE C.[expiryDate] = ? AND C.[expiryTime] >= @timeFrom AND C.[Count]>0 AND [tblUser_Coupon].[Status]=1 ";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, day);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new Coupon(rs.getString("CouponIDs"),
                            rs.getInt("Percents"),
                            rs.getInt("Counts"),
                            rs.getDate("expiryDates"),
                            rs.getTime("expiryTimes")));
                }
            }
            list.addAll(getCouponUserNotAtHigerDate(day));
        } catch (Exception e) {
            System.out.println("Error at getCouponUserNot:" + e.toString());
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
        return list;
    }

    private List<Coupon> getCouponUserNotAtHigerDate(String day) throws SQLException {
        List<Coupon> list = new ArrayList<>();
        String sql = "SELECT C.[CouponID] as CouponIDs , C.[Count] as Counts , C.[Percent] as Percents , C.[expiryDate] as expiryDates , C.[expiryTime] as  expiryTimes \n"
                + "FROM [tblCoupon] as C INNER JOIN [tblUser_Coupon] ON C.[CouponID]!=[tblUser_Coupon].[CouponID] \n"
                + "WHERE C.[expiryDate] > ? AND C.[Count]>0 AND [tblUser_Coupon].[Status]=1 ";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, day);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new Coupon(rs.getString("CouponIDs"),
                            rs.getInt("Percents"),
                            rs.getInt("Counts"),
                            rs.getDate("expiryDates"),
                            rs.getTime("expiryTimes")));
                }
            }
        } catch (Exception e) {
            System.out.println("Error at getCouponUserNotAtHigerDate:" + e.toString());
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
        return list;
    }

    @Override
    public List<Coupon> getAllCouponOfUser(String day) throws SQLException {
       List<Coupon> list = new ArrayList<>();
        String sql = "DECLARE @timeFrom time(7) = convert(varchar(10), GETDATE(), 108)\n"
                + "SELECT C.[CouponID] as CouponIDs , C.[Count] as Counts , C.[Percent] as Percents , C.[expiryDate] as expiryDates , C.[expiryTime] as  expiryTimes \n"
                + "FROM [tblCoupon] as C INNER JOIN [tblUser_Coupon] ON C.[CouponID]=[tblUser_Coupon].[CouponID] \n"
                + "WHERE C.[expiryDate] = ? AND C.[expiryTime] >= @timeFrom AND [tblUser_Coupon].[Status]=1";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, day);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new Coupon(rs.getString("CouponIDs"),
                            rs.getInt("Percents"),
                            rs.getInt("Counts"),
                            rs.getDate("expiryDates"),
                            rs.getTime("expiryTimes")));
                }
            }
            list.addAll(getAllCouponOfUserAtHigerDate(day));
        } catch (Exception e) {
            System.out.println("Error at getCouponUserNot:" + e.toString());
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
        return list; 
    }
    
    private List<Coupon> getAllCouponOfUserAtHigerDate(String day) throws SQLException {
        List<Coupon> list = new ArrayList<>();
        String sql = "SELECT C.[CouponID] as CouponIDs , C.[Count] as Counts , C.[Percent] as Percents , C.[expiryDate] as expiryDates , C.[expiryTime] as  expiryTimes \n"
                + "FROM [tblCoupon] as C INNER JOIN [tblUser_Coupon] ON C.[CouponID]=[tblUser_Coupon].[CouponID] \n"
                + "WHERE C.[expiryDate] > ? AND [tblUser_Coupon].[Status]=1";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, day);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    list.add(new Coupon(rs.getString("CouponIDs"),
                            rs.getInt("Percents"),
                            rs.getInt("Counts"),
                            rs.getDate("expiryDates"),
                            rs.getTime("expiryTimes")));
                }
            }
        } catch (Exception e) {
            System.out.println("Error at getCouponUserNotAtHigerDate:" + e.toString());
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
        return list;
    }
}
