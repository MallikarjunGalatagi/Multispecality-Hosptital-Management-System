package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.DepartmentDAO;
import com.hospital_management.model.Department;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddDepartmentServlet")
public class AddDepartmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddDepartmentServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String departmentName = request.getParameter("departmentName");
        String description = request.getParameter("description");

        // Create Department object
        Department department = new Department();
        department.setDepartmentName(departmentName);
        department.setDescription(description);

        // Save to database
        DepartmentDAO departmentDAO = new DepartmentDAO();
        boolean status = departmentDAO.addDepartment(department);

        if (status) {
            response.sendRedirect("dept/add_dept.jsp?success=true");
        } else {
            response.sendRedirect("dept/add_dept.jsp?error=true");
        }
    }
}