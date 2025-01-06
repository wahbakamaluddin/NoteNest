package com.notenest.dao;

import com.notenest.bean.UserBean;
import com.notenest.util.DBUtil;
import com.notenest.util.HashUtil;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO2 {

    // Method to check user login credentials
    public UserBean checkLogin(String username, String password) throws SQLException {
        String query = "SELECT * FROM user WHERE LOWER(username) = LOWER(?) AND password = ?";
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

    // Method to insert a new user
    public UserBean insertUser(UserBean user) throws SQLException {
        String query = "INSERT INTO user (username, password, email, full_name) VALUES (?, ?, ?, ?)";
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
        String query = "SELECT user_id FROM user WHERE LOWER(username) = LOWER(?)";
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

    // Method to get user by user ID
    public UserBean getUserByUserId(int userId) throws SQLException {
        String query = "SELECT * FROM user WHERE user_id = ?";
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
//    public boolean editUser(int userId, String username, String email, String fullName) throws SQLException {
//        StringBuilder queryBuilder = new StringBuilder("UPDATE user SET ");
//        boolean isFirst = true;
//
//        // Dynamically construct the query based on non-null parameters
//        if (username != null) {
//            queryBuilder.append("username = ?");
//            isFirst = false;
//        }
//        if (email != null) {
//            queryBuilder.append("email = ?");
//            isFirst = false;
//        }
//        if (fullName != null) {
//            if (!isFirst) queryBuilder.append(", ");
//            queryBuilder.append("full_name = ?");
//        }
//
//        queryBuilder.append(" WHERE user_id = ?");
//
//        // If no updates are required, return false
//        if (isFirst) {
//            return false; // No parameters to update
//        }
//
//        // Convert StringBuilder to String
//        String query = queryBuilder.toString();
//
//        try (Connection connection = DBUtil.getConnection();
//             PreparedStatement stmt = connection.prepareStatement(query)) {
//
//            // Set parameters dynamically
//            int paramIndex = 1;
//            if (email != null) {
//                stmt.setString(paramIndex++, email);
//            }
//            if (fullName != null) {
//                stmt.setString(paramIndex++, fullName);
//            }
//            stmt.setInt(paramIndex, userId);
//
//            // Execute the update
//            int rowsUpdated = stmt.executeUpdate();
//            return rowsUpdated > 0;
//        }
//    }
    
    public boolean editUser(int userId, String username, String email, String fullName) throws SQLException {
        StringBuilder queryBuilder = new StringBuilder("UPDATE user SET ");
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
