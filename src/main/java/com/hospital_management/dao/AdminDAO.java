package com.hospital_management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hospital_management.model.Admin;
import com.hospital_management.util.DBConnection;

public class AdminDAO {

    public Admin validateAdmin(String username, String password) {

        Admin admin = null;

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM admins WHERE username = ? AND password = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                admin = new Admin();
                admin.setAdminId(rs.getInt("admin_id"));
                admin.setFullName(rs.getString("full_name"));
                admin.setUsername(rs.getString("username"));
                admin.setEmail(rs.getString("email"));
                admin.setMobile(rs.getString("mobile"));
                admin.setPassword(rs.getString("password"));
                admin.setCreatedAt(rs.getString("created_at"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}