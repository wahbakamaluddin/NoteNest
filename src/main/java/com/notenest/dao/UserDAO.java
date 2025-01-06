package com.notenest.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.notenest.util.HashUtil;
import com.notenest.bean.UserBean;
import com.notenest.util.DBUtil;


public class UserDAO {

//    // Check login credentials
//    public UserBean checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
//        String sql = "SELECT * FROM user WHERE LOWER(username) = LOWER(?) AND password = ?";
//        PreparedStatement statement = connection.prepareStatement(sql);
//        statement.setString(1, username);
//
//        // Hash the password
//        String hashedPassword = password;
//        HashUtil hasher = new HashUtil(); // Assuming Hash is your hashing utility class
//        try {
//            hashedPassword = hasher.getHashPass(password);
//        } catch (NoSuchAlgorithmException e) {
//            e.printStackTrace();
//        }
//        statement.setString(2, hashedPassword);
//
//        ResultSet result = statement.executeQuery();
//        UserBean user = null;
//
//        if (result.next()) {
//            user = new UserBean();
//            user.setUserId(result.getInt("user_id"));
//            user.setUsername(result.getString("username"));
//            user.setPassword(password); // Use only for in-memory validation
//            user.setEmail(result.getString("email"));
//            user.setFullName(result.getString("full_name"));
//        }
//        return user;
//    }
//
//    // Insert a new user
//    public UserBean insertUser(UserBean user) throws SQLException, ClassNotFoundException {
//        String sql = "INSERT INTO user (user_id, username, password, email, full_name) VALUES (?, ?, ?, ?, ?)";
//        PreparedStatement statement = connection.prepareStatement(sql);
//
//        statement.setInt(1, user.getUserId());
//        statement.setString(2, user.getUsername());
//
//        // Hash the password
//        String hashedPassword = user.getPassword();
//        HashUtil hasher = new HashUtil();
//        try {
//            hashedPassword = hasher.getHashPass(user.getPassword());
//        } catch (NoSuchAlgorithmException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        statement.setString(3, hashedPassword);
//        statement.setString(4, user.getEmail());
//        statement.setString(5, user.getFullName());
//
//        statement.executeUpdate();
//        return user;
//    }
//
//    // Get user ID by username
//    public int getUserIdByUsername(String username) throws SQLException {
//        int userId = -1; // Default to -1 if user not found
//        String query = "SELECT user_id FROM user WHERE LOWER(username) = LOWER(?)";
//        PreparedStatement stmt = connection.prepareStatement(query);
//        stmt.setString(1, username);
//        ResultSet rs = stmt.executeQuery();
//
//        if (rs.next()) {
//            userId = rs.getInt("user_id");
//        }
//        return userId;
//    }
//
//    // Get user by user ID
//    public UserBean getUserByUserId(int userId) throws SQLException {
//        UserBean user = null;
//        String query = "SELECT * FROM user WHERE user_id = ?";
//        PreparedStatement stmt = connection.prepareStatement(query);
//        stmt.setInt(1, userId);
//        ResultSet rs = stmt.executeQuery();
//
//        if (rs.next()) {
//            user = new UserBean();
//            user.setUserId(rs.getInt("user_id"));
//            user.setUsername(rs.getString("username"));
//            user.setEmail(rs.getString("email"));
//            user.setFullName(rs.getString("full_name"));
//        }
//        return user;
//    }
//    
//    
//    
// // Method to check user login credentials
    public UserBean checkLogin(String username, String password) throws SQLException {
        String query = "SELECT * FROM User WHERE LOWER(username) = LOWER(?) AND password = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, username);

            // Hash the password
            String hashedPassword = password;
            HashUtil hasher = new HashUtil();
            try {
                hashedPassword = hasher.getHashPass(password);
            } catch (Exception e) {
                e.printStackTrace();
            }
            stmt.setString(2, hashedPassword);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    UserBean user = new UserBean();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(password);  // Keep original password for in-memory validation
                    user.setEmail(rs.getString("email"));
                    user.setFullName(rs.getString("full_name"));
                    return user;
                }
            }
        }
        return null;
    }

//    // Method to insert a new user
    public UserBean insertUser(UserBean user) throws SQLException {
        String query = "INSERT INTO User (username, password, email, full_name) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, user.getUsername());

            // Hash the password before storing it
            String hashedPassword = user.getPassword();
            HashUtil hasher = new HashUtil();
            try {
                hashedPassword = hasher.getHashPass(user.getPassword());
            } catch (Exception ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            stmt.setString(2, hashedPassword);
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getFullName());

            stmt.executeUpdate();
        }
        return user;
    }

    // Method to get user ID by username
    public int getUserIdByUsername(String username) throws SQLException {
        String query = "SELECT user_id FROM User WHERE LOWER(username) = LOWER(?)";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("user_id");
                }
            }
        }
        return -1; // Return -1 if user not found
    }

//    // Method to get user by user ID
    public UserBean getUserByUserId(int userId) throws SQLException {
        String query = "SELECT * FROM User WHERE user_id = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    UserBean user = new UserBean();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setFullName(rs.getString("full_name"));
                    return user;
                }
            }
        }
        return null; // Return null if user not found
    }

    // Method to update user metadata (e.g., email, full name)
    
    public boolean editUser(int userId, String username, String email, String fullName) throws SQLException {
        StringBuilder queryBuilder = new StringBuilder("UPDATE User SET ");
        boolean isFirst = true;

        // Dynamically construct the query based on non-null parameters
        if (username != null) {
            queryBuilder.append("username = ?");
            isFirst = false;
        }
        if (email != null) {
            if (!isFirst) queryBuilder.append(", ");
            queryBuilder.append("email = ?");
            isFirst = false;
        }
        if (fullName != null) {
            if (!isFirst) queryBuilder.append(", ");
            queryBuilder.append("full_name = ?");
        }

        queryBuilder.append(" WHERE user_id = ?");

        // If no updates are required, return false
        if (isFirst) {
            return false; // No parameters to update
        }

        // Convert StringBuilder to String
        String query = queryBuilder.toString();

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            // Set parameters dynamically
            int paramIndex = 1;
            if (username != null) {
                stmt.setString(paramIndex++, username);  // Set username
            }
            if (email != null) {
                stmt.setString(paramIndex++, email);  // Set email
            }
            if (fullName != null) {
                stmt.setString(paramIndex++, fullName);  // Set full name
            }
            stmt.setInt(paramIndex, userId);  // Set user ID for the WHERE clause

            // Execute the update
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        }
    }
}
