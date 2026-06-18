package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.DoctorDAO;
import com.hospital_management.model.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DoctorLoginServlet")
public class DoctorLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoctorLoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get login details
        String usernameOrEmail =
                request.getParameter("usernameOrEmail");
        String password =
                request.getParameter("password");

        // Validate doctor login
        DoctorDAO doctorDAO = new DoctorDAO();
        Doctor doctor =
                doctorDAO.loginDoctor(
                        usernameOrEmail,
                        password);

        if (doctor != null) {

            // Create session
            HttpSession session =
                    request.getSession(true);

            session.setAttribute(
                    "loggedInDoctor",
                    doctor);

            // Redirect to Doctor Dashboard
            response.sendRedirect(
                    request.getContextPath()
                    + "/doctor/doctor_dashboard.jsp");

        } else {

            // Invalid login
            response.sendRedirect(
                    request.getContextPath()
                    + "/doctor/doctor_login.jsp?error=invalid");
        }
    }
}