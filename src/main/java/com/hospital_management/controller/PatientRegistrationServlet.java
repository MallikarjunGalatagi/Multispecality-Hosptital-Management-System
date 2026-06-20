
package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.PatientDAO;
import com.hospital_management.model.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PatientRegistrationServlet")
public class PatientRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PatientRegistrationServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        String confirmPassword =
                request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {

            response.sendRedirect(
                "patient/patient_register.jsp?error=password"
            );

            return;
        }

        Patient patient = new Patient();

        patient.setFullName(fullName);
        patient.setUsername(username);
        patient.setEmail(email);
        patient.setMobile(mobile);
        patient.setGender(gender);
        patient.setPassword(password);

        PatientDAO patientDAO = new PatientDAO();

        boolean status =
                patientDAO.registerPatient(patient);

        if (status) {

            response.sendRedirect(
                "patient/patient_login.jsp?success=registered"
            );

        } else {

            response.sendRedirect(
                "patient/patient_register.jsp?error=failed"
            );
        }
    }
}

