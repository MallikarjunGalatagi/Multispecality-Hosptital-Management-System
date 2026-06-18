package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.DoctorDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteDoctorServlet")
public class DeleteDoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int doctorId = Integer.parseInt(request.getParameter("id"));

        DoctorDAO doctorDAO = new DoctorDAO();
        doctorDAO.deleteDoctor(doctorId);

        response.sendRedirect(request.getContextPath() + "/admin/view_doctor.jsp");
    }
}