package com.hospital_management.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    // Database Credentials
    private static final String URL = "jdbc:mysql://localhost:3306/hospital_mgmt";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    // Method to get database connection
    public static Connection getConnection() {
        Connection connection = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Connection
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            System.out.println("✅ Database Connected Successfully!");
        } catch (Exception e) {
            System.out.println("❌ Database Connection Failed!");
            e.printStackTrace();
        }

        return connection;
    }
}