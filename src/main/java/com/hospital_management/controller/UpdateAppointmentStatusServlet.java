package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.AppointmentDAO;
import com.hospital_management.dao.NotificationDAO;
import com.hospital_management.model.Appointment;
import com.hospital_management.model.Notification;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateAppointmentStatusServlet")
public class UpdateAppointmentStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateAppointmentStatusServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Supports both GET and POST
        String appointmentIdParam =
                request.getParameter("appointmentId");

        if (appointmentIdParam == null
                || appointmentIdParam.trim().isEmpty()) {
            appointmentIdParam =
                    request.getParameter("id");
        }

        int appointmentId =
                Integer.parseInt(appointmentIdParam);

        String status =
                request.getParameter("status");

        // Appointment Date & Time from Receptionist
        String appointmentDate =
                request.getParameter("appointmentDate");

        String appointmentTime =
                request.getParameter("appointmentTime");

        System.out.println("======================================");
        System.out.println("Appointment ID : " + appointmentId);
        System.out.println("Status         : " + status);
        System.out.println("Date           : " + appointmentDate);
        System.out.println("Time           : " + appointmentTime);
        System.out.println("======================================");

        AppointmentDAO appointmentDAO =
                new AppointmentDAO();

        boolean updated = false;

        // ======================================
        // CONFIRM APPOINTMENT
        // ======================================
        if ("Confirmed".equalsIgnoreCase(status)) {

            updated =
                    appointmentDAO.updateAppointmentStatus(
                            appointmentId,
                            status,
                            appointmentDate,
                            appointmentTime);

        }
        // ======================================
        // REJECT APPOINTMENT
        // ======================================
        else if ("Rejected".equalsIgnoreCase(status)) {

            updated =
                    appointmentDAO.updateAppointmentStatus(
                            appointmentId,
                            status,
                            null,
                            null);
        }

        if (updated) {

            // Fetch Appointment Details
            Appointment appointment =
                    appointmentDAO.getAppointmentById(
                            appointmentId);

            if (appointment != null) {

                NotificationDAO notificationDAO =
                        new NotificationDAO();

                // ======================================
                // APPOINTMENT CONFIRMED
                // ======================================
                if ("Confirmed".equalsIgnoreCase(status)) {

                    // Patient Notification
                    Notification patientNotification =
                            new Notification();

                    patientNotification.setUserType(
                            "PATIENT");
                    patientNotification.setUserId(
                            appointment.getPatientId());

                    patientNotification.setTitle(
                            "Appointment Confirmed");

                    patientNotification.setMessage(
                            "Your appointment with "
                                    + appointment.getDoctorName()
                                    + " has been confirmed for "
                                    + appointmentDate
                                    + " at "
                                    + appointmentTime
                                    + ".");

                    notificationDAO.addNotification(
                            patientNotification);

                    // Doctor Notification
                    Notification doctorNotification =
                            new Notification();

                    doctorNotification.setUserType(
                            "DOCTOR");
                    doctorNotification.setUserId(
                            appointment.getDoctorId());

                    doctorNotification.setTitle(
                            "New Confirmed Appointment");

                    doctorNotification.setMessage(
                            "A new appointment has been confirmed and assigned to you.");

                    notificationDAO.addNotification(
                            doctorNotification);
                }

                // ======================================
                // APPOINTMENT REJECTED
                // ======================================
                else if ("Rejected".equalsIgnoreCase(status)) {

                    Notification patientNotification =
                            new Notification();

                    patientNotification.setUserType(
                            "PATIENT");
                    patientNotification.setUserId(
                            appointment.getPatientId());

                    patientNotification.setTitle(
                            "Appointment Rejected");

                    patientNotification.setMessage(
                            "Unfortunately, your appointment request has been rejected. Please book another appointment.");

                    notificationDAO.addNotification(
                            patientNotification);
                }
            }
        }

        // Redirect back to Receptionist Appointment Page
        response.sendRedirect(
                request.getContextPath()
                + "/receptionist/view_appointments.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}