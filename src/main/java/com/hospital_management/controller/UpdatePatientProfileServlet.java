package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.PatientDAO;
import com.hospital_management.model.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdatePatientProfileServlet")
public class UpdatePatientProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int patientId =
                Integer.parseInt(
                        request.getParameter("patientId"));

        String fullName =
                request.getParameter("fullName");

        String username =
                request.getParameter("username");

        String email =
                request.getParameter("email");

        String mobile =
                request.getParameter("mobile");

        String gender =
                request.getParameter("gender");

        HttpSession session =
                request.getSession(false);

        Patient loggedInPatient =
                (Patient) session.getAttribute(
                        "loggedInPatient");

        Patient patient = new Patient();

        patient.setPatientId(patientId);
        patient.setFullName(fullName);
        patient.setUsername(username);
        patient.setEmail(email);
        patient.setMobile(mobile);
        patient.setGender(gender);

        // Keep existing password
        patient.setPassword(
                loggedInPatient.getPassword());

        PatientDAO patientDAO =
                new PatientDAO();

        boolean status =
                patientDAO.updatePatient(patient);

        if (status) {

            session.setAttribute(
                    "loggedInPatient",
                    patient);

            response.sendRedirect(
                    request.getContextPath()
                    + "/patient/patient_dashboard.jsp?page=myprofile&success=updated");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/patient/patient_dashboard.jsp?page=myprofile&error=failed");
        }
    }
}
