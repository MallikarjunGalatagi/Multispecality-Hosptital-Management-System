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

@WebServlet("/UpdateDoctorProfileServlet")
public class UpdateDoctorProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int doctorId =
                Integer.parseInt(
                        request.getParameter("doctorId"));

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

        Doctor loggedInDoctor =
                (Doctor) session.getAttribute(
                        "loggedInDoctor");

        Doctor doctor = new Doctor();

        doctor.setDoctorId(doctorId);
        doctor.setFullName(fullName);
        doctor.setUsername(username);
        doctor.setEmail(email);
        doctor.setMobile(mobile);
        doctor.setGender(gender);

        // Keep existing values
        doctor.setQualification(
                loggedInDoctor.getQualification());

        doctor.setDepartmentId(
                loggedInDoctor.getDepartmentId());

        doctor.setDepartmentName(
                loggedInDoctor.getDepartmentName());

        doctor.setPassword(
                loggedInDoctor.getPassword());

        DoctorDAO doctorDAO =
                new DoctorDAO();

        boolean status =
                doctorDAO.updateDoctorProfile(
                        doctor);

        if (status) {

            session.setAttribute(
                    "loggedInDoctor",
                    doctor);

            response.sendRedirect(
                    request.getContextPath()
                    + "/doctor/doctor_dashboard.jsp?page=myprofile&success=updated");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/doctor/doctor_dashboard.jsp?page=myprofile&error=failed");
        }
    }
}
