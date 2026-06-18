package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.DepartmentDAO;
import com.hospital_management.model.Department;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateDepartmentServlet")
public class UpdateDepartmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateDepartmentServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int departmentId = Integer.parseInt(request.getParameter("departmentId"));
        String departmentName = request.getParameter("departmentName");
        String description = request.getParameter("description");

        Department department = new Department();
        department.setDepartmentId(departmentId);
        department.setDepartmentName(departmentName);
        department.setDescription(description);

        DepartmentDAO departmentDAO = new DepartmentDAO();
        departmentDAO.updateDepartment(department);

        response.sendRedirect(request.getContextPath() + "/admin/view_dept.jsp");
    }
}