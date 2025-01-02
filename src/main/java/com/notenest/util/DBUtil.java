package com.notenest.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String DB_SCHEMA = "NoteNest01";
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/" + DB_SCHEMA + "?useTimezone=true&serverTimezone=UTC";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "bismillah212";
    
    // Utility method to get a connection
    public static Connection getConnection() throws SQLException {
        try {
            // Load the database driver (optional with newer versions of JDBC)
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
        } catch (Exception e) {
            throw new SQLException("Database connection failed: " + e.getMessage(), e);
        }
    }

    // Main method to test the database connection
    public static void main(String[] args) {
        try (Connection connection = getConnection()) {
            if (connection != null) {
                System.out.println("Database connected successfully!");
            }
        } catch (SQLException e) {
            System.err.println("Database connection failed: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
