package com.hospital_management.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import com.hospital_management.model.Doctor;
import com.hospital_management.util.DBConnection;

public class DoctorDAO {

	// Add Doctor
	public boolean addDoctor(Doctor doctor) {

		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			String query = "INSERT INTO doctors (full_name, username, email, mobile, gender, qualification, department_id, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, doctor.getFullName());
			ps.setString(2, doctor.getUsername());
			ps.setString(3, doctor.getEmail());
			ps.setString(4, doctor.getMobile());
			ps.setString(5, doctor.getGender());
			ps.setString(6, doctor.getQualification());
			ps.setInt(7, doctor.getDepartmentId());
			ps.setString(8, doctor.getPassword());

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

	// View All Doctors
	// View All Doctors
	public List<Doctor> getAllDoctors() {

		List<Doctor> doctorList = new ArrayList<>();

		try {
			Connection con = DBConnection.getConnection();

			String query = "SELECT d.*, dept.department_name " +
					"FROM doctors d " +
					"JOIN departments dept " +
					"ON d.department_id = dept.department_id " +
					"ORDER BY d.doctor_id";

			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Doctor doctor = new Doctor();

				doctor.setDoctorId(rs.getInt("doctor_id"));
				doctor.setFullName(rs.getString("full_name"));
				doctor.setUsername(rs.getString("username"));
				doctor.setEmail(rs.getString("email"));
				doctor.setMobile(rs.getString("mobile"));
				doctor.setGender(rs.getString("gender"));
				doctor.setQualification(rs.getString("qualification"));
				doctor.setDepartmentId(rs.getInt("department_id"));
				doctor.setDepartmentName(rs.getString("department_name"));
				doctor.setPassword(rs.getString("password"));

				doctorList.add(doctor);
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctorList;
	}

	// Delete Doctor
	public boolean deleteDoctor(int doctorId) {

		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			String query = "DELETE FROM doctors WHERE doctor_id = ?";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, doctorId);

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

	public boolean updateDoctor(Doctor doctor) {

		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			String query = "UPDATE doctors SET full_name=?, username=?, email=?, mobile=?, gender=?, qualification=?, department_id=?, password=? WHERE doctor_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, doctor.getFullName());
			ps.setString(2, doctor.getUsername());
			ps.setString(3, doctor.getEmail());
			ps.setString(4, doctor.getMobile());
			ps.setString(5, doctor.getGender());
			ps.setString(6, doctor.getQualification());
			ps.setInt(7, doctor.getDepartmentId());
			ps.setString(8, doctor.getPassword());
			ps.setInt(9, doctor.getDoctorId());

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

	// Doctor Login
	public Doctor loginDoctor(String usernameOrEmail, String password) 
	{

		Doctor doctor = null;

		try {
			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM doctors WHERE (username=? OR email=?) AND password=?";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, usernameOrEmail);
			ps.setString(2, usernameOrEmail);
			ps.setString(3, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				doctor = new Doctor();

				doctor.setDoctorId(rs.getInt("doctor_id"));
				doctor.setFullName(rs.getString("full_name"));
				doctor.setUsername(rs.getString("username"));
				doctor.setEmail(rs.getString("email"));
				doctor.setMobile(rs.getString("mobile"));
				doctor.setGender(rs.getString("gender"));
				doctor.setQualification(rs.getString("qualification"));
				doctor.setDepartmentId(rs.getInt("department_id"));
				doctor.setPassword(rs.getString("password"));
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctor;
	}

	// Update Doctor Profile
	public boolean updateDoctorProfile(Doctor doctor) {

		boolean status = false;

		try {
			Connection con = DBConnection.getConnection();

			String query = "UPDATE doctors SET full_name=?, email=?, mobile=?, qualification=?, password=? WHERE doctor_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, doctor.getFullName());
			ps.setString(2, doctor.getEmail());
			ps.setString(3, doctor.getMobile());
			ps.setString(4, doctor.getQualification());
			ps.setString(5, doctor.getPassword());
			ps.setInt(6, doctor.getDoctorId());

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