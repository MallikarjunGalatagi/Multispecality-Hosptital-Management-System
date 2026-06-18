package com.hospital_management.util;

import java.sql.Connection;

public class TestDBConnection {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null) {
            System.out.println("Connection Established Successfully!");
        } else {
            System.out.println("Failed to Connect to Database!");
        }
    }
}