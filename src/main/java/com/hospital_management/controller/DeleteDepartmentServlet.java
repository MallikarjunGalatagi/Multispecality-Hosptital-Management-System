package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.DepartmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteDepartmentServlet")
public class DeleteDepartmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteDepartmentServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int departmentId = Integer.parseInt(request.getParameter("id"));

        DepartmentDAO departmentDAO = new DepartmentDAO();
        departmentDAO.deleteDepartment(departmentId);

        response.sendRedirect("admin/view_dept.jsp");
    }
}