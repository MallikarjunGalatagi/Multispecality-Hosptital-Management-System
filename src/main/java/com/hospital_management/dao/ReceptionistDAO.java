package com.hospital_management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hospital_management.model.Receptionist;
import com.hospital_management.util.DBConnection;

public class ReceptionistDAO {

    // ==========================
    // Add Receptionist
    // ==========================
    public boolean addReceptionist(Receptionist receptionist) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO receptionists "
                    + "(full_name, username, email, mobile, password) "
                    + "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, receptionist.getFullName());
            ps.setString(2, receptionist.getUsername());
            ps.setString(3, receptionist.getEmail());
            ps.setString(4, receptionist.getMobile());
            ps.setString(5, receptionist.getPassword());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ==========================
    // Receptionist Login
    // ==========================
    public Receptionist validateReceptionist(String username, String password) {

        Receptionist receptionist = null;

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM receptionists "
                    + "WHERE username = ? AND password = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                receptionist = new Receptionist();
                receptionist.setReceptionistId(rs.getInt("receptionist_id"));
                receptionist.setFullName(rs.getString("full_name"));
                receptionist.setUsername(rs.getString("username"));
                receptionist.setEmail(rs.getString("email"));
                receptionist.setMobile(rs.getString("mobile"));
                receptionist.setPassword(rs.getString("password"));
                receptionist.setCreatedAt(rs.getString("created_at"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return receptionist;
    }

    // ==========================
    // View All Receptionists
    // ==========================
    public List<Receptionist> getAllReceptionists() {

        List<Receptionist> receptionistList =
                new ArrayList<Receptionist>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM receptionists "
                    + "ORDER BY receptionist_id DESC";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Receptionist receptionist = new Receptionist();

                receptionist.setReceptionistId(
                        rs.getInt("receptionist_id"));
                receptionist.setFullName(
                        rs.getString("full_name"));
                receptionist.setUsername(
                        rs.getString("username"));
                receptionist.setEmail(
                        rs.getString("email"));
                receptionist.setMobile(
                        rs.getString("mobile"));
                receptionist.setPassword(
                        rs.getString("password"));
                receptionist.setCreatedAt(
                        rs.getString("created_at"));

                receptionistList.add(receptionist);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return receptionistList;
    }
}