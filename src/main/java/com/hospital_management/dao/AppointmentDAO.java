package com.hospital_management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hospital_management.model.Appointment;
import com.hospital_management.util.DBConnection;

public class AppointmentDAO {

    // Book Appointment
    public boolean bookAppointment(Appointment appointment) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO appointments "
                    + "(patient_id, doctor_id, preferred_date, status) "
                    + "VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, appointment.getPatientId());
            ps.setInt(2, appointment.getDoctorId());
            ps.setString(3, appointment.getAppointmentDate());
            ps.setString(4, appointment.getStatus());

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

    // View Patient Appointments
    public List<Appointment> getAppointmentsByPatientId(int patientId) {

        List<Appointment> appointmentList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT a.appointment_id, " +
                    "a.patient_id, " +
                    "a.doctor_id, " +
                    "d.full_name AS doctor_name, " +
                    "a.preferred_date, " +
                    "a.appointment_date, " +
                    "a.appointment_time, " +
                    "a.status " +
                    "FROM appointments a " +
                    "JOIN doctors d ON a.doctor_id = d.doctor_id " +
                    "WHERE a.patient_id = ? " +
                    "ORDER BY a.appointment_id DESC";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, patientId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Appointment appointment = new Appointment();

                appointment.setAppointmentId(
                        rs.getInt("appointment_id"));
                appointment.setPatientId(
                        rs.getInt("patient_id"));
                appointment.setDoctorId(
                        rs.getInt("doctor_id"));

                appointment.setDoctorName(
                        rs.getString("doctor_name"));

                // Actual Appointment Date/Time
                appointment.setAppointmentDate(
                        rs.getString("appointment_date"));

                appointment.setAppointmentTime(
                        rs.getString("appointment_time"));

                appointment.setStatus(
                        rs.getString("status"));

                appointmentList.add(appointment);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointmentList;
    }

    // View All Appointments (Receptionist)
    public List<Appointment> getAllAppointments() {

        List<Appointment> appointmentList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT a.appointment_id, " +
                    "a.patient_id, " +
                    "a.doctor_id, " +
                    "p.full_name AS patient_name, " +
                    "d.full_name AS doctor_name, " +
                    "a.preferred_date, " +
                    "a.appointment_date, " +
                    "a.appointment_time, " +
                    "a.status " +
                    "FROM appointments a " +
                    "JOIN patients p ON a.patient_id = p.patient_id " +
                    "JOIN doctors d ON a.doctor_id = d.doctor_id " +
                    "ORDER BY a.appointment_id DESC";

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Appointment appointment = new Appointment();

                appointment.setAppointmentId(
                        rs.getInt("appointment_id"));

                appointment.setPatientId(
                        rs.getInt("patient_id"));

                appointment.setDoctorId(
                        rs.getInt("doctor_id"));

                appointment.setPatientName(
                        rs.getString("patient_name"));

                appointment.setDoctorName(
                        rs.getString("doctor_name"));

                appointment.setAppointmentDate(
                        rs.getString("appointment_date"));

                appointment.setAppointmentTime(
                        rs.getString("appointment_time"));

                appointment.setStatus(
                        rs.getString("status"));

                appointmentList.add(appointment);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointmentList;
    }

    // View Appointments by Doctor ID
    public List<Appointment> getAppointmentsByDoctorId(int doctorId) {

        List<Appointment> appointmentList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT a.appointment_id, " +
                    "a.patient_id, " +
                    "a.doctor_id, " +
                    "p.full_name AS patient_name, " +
                    "a.preferred_date, " +
                    "a.appointment_date, " +
                    "a.appointment_time, " +
                    "a.status " +
                    "FROM appointments a " +
                    "JOIN patients p ON a.patient_id = p.patient_id " +
                    "WHERE a.doctor_id = ? " +
                    "ORDER BY a.appointment_id DESC";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, doctorId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Appointment appointment = new Appointment();

                appointment.setAppointmentId(
                        rs.getInt("appointment_id"));

                appointment.setPatientId(
                        rs.getInt("patient_id"));

                appointment.setDoctorId(
                        rs.getInt("doctor_id"));

                appointment.setPatientName(
                        rs.getString("patient_name"));

                appointment.setAppointmentDate(
                        rs.getString("appointment_date"));

                appointment.setAppointmentTime(
                        rs.getString("appointment_time"));

                appointment.setStatus(
                        rs.getString("status"));

                appointmentList.add(appointment);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointmentList;
    }

    // Update Appointment Status
 // Update Appointment Status, Date and Time
    public boolean updateAppointmentStatus(
            int appointmentId,
            String status,
            String appointmentDate,
            String appointmentTime) {

        boolean result = false;

        try {
            Connection con = DBConnection.getConnection();

            String query =
                    "UPDATE appointments "
                    + "SET status = ?, "
                    + "appointment_date = ?, "
                    + "appointment_time = ? "
                    + "WHERE appointment_id = ?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, status);
            ps.setString(2, appointmentDate);
            ps.setString(3, appointmentTime);
            ps.setInt(4, appointmentId);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                result = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // Get Appointment By ID
    public Appointment getAppointmentById(
            int appointmentId) {

        Appointment appointment = null;

        try {
            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT a.appointment_id, " +
                    "a.patient_id, " +
                    "a.doctor_id, " +
                    "p.full_name AS patient_name, " +
                    "d.full_name AS doctor_name, " +
                    "a.preferred_date, " +
                    "a.appointment_date, " +
                    "a.appointment_time, " +
                    "a.status " +
                    "FROM appointments a " +
                    "JOIN patients p ON a.patient_id = p.patient_id " +
                    "JOIN doctors d ON a.doctor_id = d.doctor_id " +
                    "WHERE a.appointment_id = ?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, appointmentId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                appointment = new Appointment();

                appointment.setAppointmentId(
                        rs.getInt("appointment_id"));

                appointment.setPatientId(
                        rs.getInt("patient_id"));

                appointment.setDoctorId(
                        rs.getInt("doctor_id"));

                appointment.setPatientName(
                        rs.getString("patient_name"));

                appointment.setDoctorName(
                        rs.getString("doctor_name"));

                appointment.setAppointmentDate(
                        rs.getString("appointment_date"));

                appointment.setAppointmentTime(
                        rs.getString("appointment_time"));

                appointment.setStatus(
                        rs.getString("status"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointment;
    }
}