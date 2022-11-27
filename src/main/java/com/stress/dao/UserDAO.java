/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.dao;

import com.stress.dto.GooglePojo;
import com.stress.dto.User;
import java.sql.SQLException;
import java.util.List;



public interface UserDAO {
    List<User> getAllUser() throws SQLException;
    User getUserByEmail(String email) throws SQLException;
    User getUserByIDAndPassword(String userID,String password) throws SQLException;
    boolean deleteUser(String userID) throws SQLException;
    boolean registerNewUSer(User user) throws SQLException;
    boolean checkDuplicateByID(String userID,String email) throws SQLException;
    User getUserByID(String userID) throws SQLException;
    boolean registerByEmail(GooglePojo googleUser) throws SQLException;
    boolean updateUser(String userID,String userName,String email,String DOB,String address,
        String phoneNumber,String sex,String roleID,String status,String password) throws SQLException;
    List<User> getAllUserDelete() throws SQLException;
    boolean activeUser(String userID) throws SQLException;
    List<User> searchUser(String search)throws SQLException;
    boolean updatePassword(String userID,String password,String email) throws SQLException;
    boolean updateUser(String userID, String accountBalance) throws SQLException;
}