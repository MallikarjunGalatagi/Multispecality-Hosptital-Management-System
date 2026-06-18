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

@WebServlet("/PatientLoginServlet")
public class PatientLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PatientLoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usernameOrEmail = request.getParameter("usernameOrEmail");
        String password = request.getParameter("password");

        PatientDAO patientDAO = new PatientDAO();
        Patient patient = patientDAO.loginPatient(usernameOrEmail, password);

        if (patient != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInPatient", patient);

            response.sendRedirect("patient/patient_dashboard.jsp");
        } else {
            response.sendRedirect("patient/patient_login.jsp");
        }
    }
}