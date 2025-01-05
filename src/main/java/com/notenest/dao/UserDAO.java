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

    private Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    // Check login credentials
    public UserBean checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM user WHERE LOWER(username) = LOWER(?) AND password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);

        // Hash the password
        String hashedPassword = password;
        HashUtil hasher = new HashUtil(); // Assuming Hash is your hashing utility class
        try {
            hashedPassword = hasher.getHashPass(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        statement.setString(2, hashedPassword);

        ResultSet result = statement.executeQuery();
        UserBean user = null;

        if (result.next()) {
            user = new UserBean();
            user.setUserId(result.getInt("user_id"));
            user.setUsername(result.getString("username"));
            user.setPassword(password); // Use only for in-memory validation
            user.setEmail(result.getString("email"));
            user.setFullName(result.getString("full_name"));
        }
        return user;
    }

    // Insert a new user
    public UserBean insertUser(UserBean user) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO user (user_id, username, password, email, full_name) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);

        statement.setInt(1, user.getUserId());
        statement.setString(2, user.getUsername());

        // Hash the password
        String hashedPassword = user.getPassword();
        HashUtil hasher = new HashUtil();
        try {
            hashedPassword = hasher.getHashPass(user.getPassword());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        statement.setString(3, hashedPassword);
        statement.setString(4, user.getEmail());
        statement.setString(5, user.getFullName());

        statement.executeUpdate();
        return user;
    }

    // Get user ID by username
    public int getUserIdByUsername(String username) throws SQLException {
        int userId = -1; // Default to -1 if user not found
        String query = "SELECT user_id FROM user WHERE LOWER(username) = LOWER(?)";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            userId = rs.getInt("user_id");
        }
        return userId;
    }

    // Get user by user ID
    public UserBean getUserByUserId(int userId) throws SQLException {
        UserBean user = null;
        String query = "SELECT * FROM user WHERE user_id = ?";
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setInt(1, userId);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            user = new UserBean();
            user.setUserId(rs.getInt("user_id"));
            user.setUsername(rs.getString("username"));
            user.setEmail(rs.getString("email"));
            user.setFullName(rs.getString("full_name"));
        }
        return user;
    }
}
