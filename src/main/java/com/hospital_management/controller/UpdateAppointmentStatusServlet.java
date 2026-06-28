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

    String appointmentDate =
            request.getParameter("appointmentDate");

    String appointmentTime =
            request.getParameter("appointmentTime");

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
                        "Confirmed",
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
                        "Rejected",
                        null,
                        null);
    }

    // ======================================
    // RESCHEDULE APPOINTMENT
    // ======================================

    else if ("Rescheduled".equalsIgnoreCase(status)) {

        updated =
                appointmentDAO.updateAppointmentStatus(
                        appointmentId,
                        "Rescheduled",
                        appointmentDate,
                        appointmentTime);
    }

    // ======================================
    // NOTIFICATIONS
    // ======================================

    if (updated) {

        Appointment appointment =
                appointmentDAO.getAppointmentById(
                        appointmentId);

        if (appointment != null) {

            NotificationDAO notificationDAO =
                    new NotificationDAO();

            if ("Confirmed".equalsIgnoreCase(status)) {

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
                        + " has been confirmed.");

                notificationDAO.addNotification(
                        patientNotification);
            }

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
                        "Your appointment request has been rejected.");

                notificationDAO.addNotification(
                        patientNotification);
            }

            else if ("Rescheduled".equalsIgnoreCase(status)) {

                Notification patientNotification =
                        new Notification();

                patientNotification.setUserType(
                        "PATIENT");

                patientNotification.setUserId(
                        appointment.getPatientId());

                patientNotification.setTitle(
                        "Appointment Rescheduled");

                patientNotification.setMessage(
                        "Your appointment has been rescheduled to "
                        + appointmentDate
                        + " at "
                        + appointmentTime);

                notificationDAO.addNotification(
                        patientNotification);
            }
        }
    }

    // ======================================
    // REDIRECT WITH SUCCESS MESSAGE
    // ======================================

    if ("Confirmed".equalsIgnoreCase(status)) {

        response.sendRedirect(
                request.getContextPath()
                + "/receptionist/dashboard.jsp?page=confirm&id="
                + appointmentId
                + "&success=confirmed");

        return;
    }

    if ("Rejected".equalsIgnoreCase(status)) {

        response.sendRedirect(
                request.getContextPath()
                + "/receptionist/dashboard.jsp?page=confirm&id="
                + appointmentId
                + "&success=rejected");

        return;
    }

    if ("Rescheduled".equalsIgnoreCase(status)) {

        response.sendRedirect(
                request.getContextPath()
                + "/receptionist/dashboard.jsp?page=confirm&id="
                + appointmentId
                + "&success=rescheduled");

        return;
    }
    

    }

    @Override
    protected void doPost(HttpServletRequest request,
    HttpServletResponse response)
    throws ServletException, IOException {

    
    doGet(request, response);

    }
}