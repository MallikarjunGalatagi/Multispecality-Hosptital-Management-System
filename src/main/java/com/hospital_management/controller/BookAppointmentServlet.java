package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.AppointmentDAO;
import com.hospital_management.dao.NotificationDAO;
import com.hospital_management.model.Appointment;
import com.hospital_management.model.Notification;
import com.hospital_management.model.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BookAppointmentServlet")
public class BookAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BookAppointmentServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("patient/patient_login.jsp");
            return;
        }

        Patient patient = (Patient) session.getAttribute("loggedInPatient");

        if (patient == null) {
            response.sendRedirect("patient/patient_login.jsp");
            return;
        }

        int patientId = patient.getPatientId();
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        String appointmentDate = request.getParameter("appointmentDate");

        // Create Appointment Object
        Appointment appointment = new Appointment();
        appointment.setPatientId(patientId);
        appointment.setDoctorId(doctorId);

        // This is currently stored in preferred_date column
        appointment.setAppointmentDate(appointmentDate);

        appointment.setStatus("Pending");

        // Save Appointment
        AppointmentDAO appointmentDAO = new AppointmentDAO();
        boolean status = appointmentDAO.bookAppointment(appointment);

        if (status) {

            NotificationDAO notificationDAO = new NotificationDAO();

            // =====================================
            // Patient Notification
            // =====================================
            Notification patientNotification = new Notification();
            patientNotification.setUserType("PATIENT");
            patientNotification.setUserId(patientId);
            patientNotification.setTitle("Appointment Request Submitted");
            patientNotification.setMessage(
                    "Your appointment request has been submitted successfully and is waiting for approval.");

            notificationDAO.addNotification(patientNotification);

            // =====================================
            // Receptionist Notification
            // =====================================
            Notification receptionistNotification = new Notification();
            receptionistNotification.setUserType("RECEPTIONIST");
            receptionistNotification.setUserId(1); // Default Receptionist account

            receptionistNotification.setTitle("New Appointment Request");
            receptionistNotification.setMessage(
                    "A new patient appointment request is waiting for approval.");

            notificationDAO.addNotification(receptionistNotification);

            // Redirect to My Appointments page
            response.sendRedirect("patient/my_appointment.jsp");

        } else {
            response.sendRedirect("patient/take_appointment.jsp");
        }
    }
}