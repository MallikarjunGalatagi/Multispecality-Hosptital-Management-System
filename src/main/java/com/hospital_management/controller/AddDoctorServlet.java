package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.DoctorDAO;
import com.hospital_management.model.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddDoctorServlet")
public class AddDoctorServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String qualification = request.getParameter("qualification");
        String password = request.getParameter("password");

        int departmentId =
                Integer.parseInt(request.getParameter("departmentId"));

        // Validation
        if (fullName == null || fullName.trim().isEmpty()
                || username == null || username.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || mobile == null || mobile.trim().isEmpty()
                || gender == null || gender.trim().isEmpty()
                || qualification == null || qualification.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/dashboard.jsp?page=addDoctor"
                    + "&error=All Fields Are Required");

            return;
        }

        Doctor doctor = new Doctor();

        doctor.setFullName(fullName);
        doctor.setUsername(username);
        doctor.setEmail(email);
        doctor.setMobile(mobile);
        doctor.setGender(gender);
        doctor.setQualification(qualification);
        doctor.setDepartmentId(departmentId);
        doctor.setPassword(password);

        DoctorDAO doctorDAO = new DoctorDAO();

        boolean status = doctorDAO.addDoctor(doctor);

        if (status) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/dashboard.jsp?page=doctors"
                    + "&success=Doctor Added Successfully");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/dashboard.jsp?page=addDoctor"
                    + "&error=Failed To Add Doctor");
        }
    }
}