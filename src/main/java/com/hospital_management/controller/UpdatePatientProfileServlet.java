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

    public UpdatePatientProfileServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int patientId = Integer.parseInt(request.getParameter("patientId"));
        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");

        Patient patient = new Patient();
        patient.setPatientId(patientId);
        patient.setFullName(fullName);
        patient.setUsername(username);
        patient.setEmail(email);
        patient.setMobile(mobile);
        patient.setGender(gender);
        patient.setPassword(password);

        PatientDAO patientDAO = new PatientDAO();
        boolean status = patientDAO.updatePatient(patient);

        if (status) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInPatient", patient);

            response.sendRedirect("patient/my_profile.jsp");
        } else {
            response.sendRedirect("patient/my_profile.jsp");
        }
    }
}