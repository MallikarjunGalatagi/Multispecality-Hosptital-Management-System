package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.DoctorDAO;
import com.hospital_management.model.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateDoctorServlet")
public class UpdateDoctorServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int doctorId =
                Integer.parseInt(request.getParameter("doctorId"));

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

        String qualification =
                request.getParameter("qualification");

        int departmentId =
                Integer.parseInt(request.getParameter("departmentId"));

        String password =
                request.getParameter("password");

        Doctor doctor = new Doctor();

        doctor.setDoctorId(doctorId);
        doctor.setFullName(fullName);
        doctor.setUsername(username);
        doctor.setEmail(email);
        doctor.setMobile(mobile);
        doctor.setGender(gender);
        doctor.setQualification(qualification);
        doctor.setDepartmentId(departmentId);
        doctor.setPassword(password);

        DoctorDAO doctorDAO = new DoctorDAO();

        boolean status =
                doctorDAO.updateDoctor(doctor);

        if(status){

            response.sendRedirect(
                request.getContextPath()
                + "/admin/dashboard.jsp?page=doctors"
                + "&success=Doctor Updated Successfully"
            );

        }else{

            response.sendRedirect(
                request.getContextPath()
                + "/admin/dashboard.jsp?page=doctors"
                + "&error=Failed To Update Doctor"
            );

        }
    }
}