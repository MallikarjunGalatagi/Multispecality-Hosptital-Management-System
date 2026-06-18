package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.NotificationDAO;
import com.hospital_management.dao.PrescriptionDAO;
import com.hospital_management.model.Doctor;
import com.hospital_management.model.Notification;
import com.hospital_management.model.Prescription;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddPrescriptionServlet")
public class AddPrescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddPrescriptionServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null) {
            response.sendRedirect(
                    "doctor/doctor_login.jsp");
            return;
        }

        Doctor doctor =
                (Doctor) session.getAttribute(
                        "loggedInDoctor");

        if (doctor == null) {
            response.sendRedirect(
                    "doctor/doctor_login.jsp");
            return;
        }

        // Get Form Data
        int appointmentId =
                Integer.parseInt(
                        request.getParameter(
                                "appointmentId"));

        int patientId =
                Integer.parseInt(
                        request.getParameter(
                                "patientId"));

        String diagnosis =
                request.getParameter(
                        "diagnosis");

        String medicines =
                request.getParameter(
                        "medicines");

        String dosageInstructions =
                request.getParameter(
                        "dosageInstructions");

        String remarks =
                request.getParameter(
                        "remarks");

        // Create Prescription Object
        Prescription prescription =
                new Prescription();

        prescription.setAppointmentId(
                appointmentId);

        prescription.setPatientId(
                patientId);

        prescription.setDoctorId(
                doctor.getDoctorId());

        prescription.setDiagnosis(
                diagnosis);

        prescription.setMedicines(
                medicines);

        prescription.setDosageInstructions(
                dosageInstructions);

        prescription.setRemarks(
                remarks);

        // Save Prescription
        PrescriptionDAO prescriptionDAO =
                new PrescriptionDAO();

        boolean status =
                prescriptionDAO.addPrescription(
                        prescription);

        if (status) {

            // ==========================
            // Send Notifications
            // ==========================
            NotificationDAO notificationDAO =
                    new NotificationDAO();

            // Patient Notification
            Notification patientNotification =
                    new Notification();

            patientNotification.setUserType(
                    "PATIENT");

            patientNotification.setUserId(
                    patientId);

            patientNotification.setTitle(
                    "Prescription Available");

            patientNotification.setMessage(
                    "Your doctor has uploaded a prescription. Please check your dashboard.");

            notificationDAO.addNotification(
                    patientNotification);

            // Doctor Notification
            Notification doctorNotification =
                    new Notification();

            doctorNotification.setUserType(
                    "DOCTOR");

            doctorNotification.setUserId(
                    doctor.getDoctorId());

            doctorNotification.setTitle(
                    "Prescription Saved");

            doctorNotification.setMessage(
                    "The prescription has been saved successfully.");

            notificationDAO.addNotification(
                    doctorNotification);

            // Redirect to Doctor Dashboard
            response.sendRedirect(
                    request.getContextPath()
                    + "/doctor/doctor_dashboard.jsp");

        } else {

            // Redirect Back if Save Failed
            response.sendRedirect(
                    request.getContextPath()
                    + "/doctor/add_prescription.jsp?appointmentId="
                    + appointmentId);
        }
    }
}