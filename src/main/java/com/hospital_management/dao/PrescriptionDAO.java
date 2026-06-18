package com.hospital_management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hospital_management.model.Prescription;
import com.hospital_management.util.DBConnection;

public class PrescriptionDAO {

    // Add Prescription
    public boolean addPrescription(Prescription prescription) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO prescriptions "
                    + "(appointment_id, patient_id, doctor_id, diagnosis, medicines, dosage_instructions, remarks) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, prescription.getAppointmentId());
            ps.setInt(2, prescription.getPatientId());
            ps.setInt(3, prescription.getDoctorId());
            ps.setString(4, prescription.getDiagnosis());
            ps.setString(5, prescription.getMedicines());
            ps.setString(6, prescription.getDosageInstructions());
            ps.setString(7, prescription.getRemarks());

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

    // View Prescriptions by Patient ID
    public List<Prescription> getPrescriptionsByPatientId(int patientId) {

        List<Prescription> prescriptionList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT p.prescription_id, p.appointment_id, p.patient_id, " +
                    "p.doctor_id, d.full_name AS doctor_name, " +
                    "p.diagnosis, p.medicines, " +
                    "p.dosage_instructions, p.remarks " +
                    "FROM prescriptions p " +
                    "JOIN doctors d ON p.doctor_id = d.doctor_id " +
                    "WHERE p.patient_id = ? " +
                    "ORDER BY p.prescription_id DESC";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, patientId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Prescription prescription = new Prescription();

                prescription.setPrescriptionId(rs.getInt("prescription_id"));
                prescription.setAppointmentId(rs.getInt("appointment_id"));
                prescription.setPatientId(rs.getInt("patient_id"));
                prescription.setDoctorId(rs.getInt("doctor_id"));
                prescription.setDoctorName(rs.getString("doctor_name"));
                prescription.setDiagnosis(rs.getString("diagnosis"));
                prescription.setMedicines(rs.getString("medicines"));
                prescription.setDosageInstructions(rs.getString("dosage_instructions"));
                prescription.setRemarks(rs.getString("remarks"));

                prescriptionList.add(prescription);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return prescriptionList;
    }

    // Get Prescription By ID (For PDF Download)
    public Prescription getPrescriptionById(int prescriptionId) {

        Prescription prescription = null;

        try {
            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT p.prescription_id, p.appointment_id, " +
                    "p.patient_id, pt.full_name AS patient_name, " +
                    "p.doctor_id, d.full_name AS doctor_name, " +
                    "p.diagnosis, p.medicines, " +
                    "p.dosage_instructions, p.remarks " +
                    "FROM prescriptions p " +
                    "JOIN patients pt ON p.patient_id = pt.patient_id " +
                    "JOIN doctors d ON p.doctor_id = d.doctor_id " +
                    "WHERE p.prescription_id = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, prescriptionId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                prescription = new Prescription();

                prescription.setPrescriptionId(rs.getInt("prescription_id"));
                prescription.setAppointmentId(rs.getInt("appointment_id"));
                prescription.setPatientId(rs.getInt("patient_id"));
                prescription.setPatientName(rs.getString("patient_name"));

                prescription.setDoctorId(rs.getInt("doctor_id"));
                prescription.setDoctorName(rs.getString("doctor_name"));

                prescription.setDiagnosis(rs.getString("diagnosis"));
                prescription.setMedicines(rs.getString("medicines"));
                prescription.setDosageInstructions(rs.getString("dosage_instructions"));
                prescription.setRemarks(rs.getString("remarks"));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return prescription;
    }
}