package com.hospital_management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hospital_management.model.Patient;
import com.hospital_management.util.DBConnection;

public class PatientDAO {

    // Register Patient
    public boolean registerPatient(Patient patient) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO patients (full_name, username, email, mobile, gender, password) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, patient.getFullName());
            ps.setString(2, patient.getUsername());
            ps.setString(3, patient.getEmail());
            ps.setString(4, patient.getMobile());
            ps.setString(5, patient.getGender());
            ps.setString(6, patient.getPassword());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
 // Patient Login
    public Patient loginPatient(String usernameOrEmail, String password) {

        Patient patient = null;

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM patients WHERE (username=? OR email=?) AND password=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, usernameOrEmail);
            ps.setString(2, usernameOrEmail);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                patient = new Patient();

                patient.setPatientId(rs.getInt("patient_id"));
                patient.setFullName(rs.getString("full_name"));
                patient.setUsername(rs.getString("username"));
                patient.setEmail(rs.getString("email"));
                patient.setMobile(rs.getString("mobile"));
                patient.setGender(rs.getString("gender"));
                patient.setPassword(rs.getString("password"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return patient;
    }
    
 // Update Patient Profile
    public boolean updatePatient(Patient patient) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "UPDATE patients SET full_name=?, email=?, mobile=?, password=? WHERE patient_id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, patient.getFullName());
            ps.setString(2, patient.getEmail());
            ps.setString(3, patient.getMobile());
            ps.setString(4, patient.getPassword());
            ps.setInt(5, patient.getPatientId());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}