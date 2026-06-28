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

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

    	String departmentName =
    	        request.getParameter("departmentName");

    	String description =
    	        request.getParameter("description");

    	// Validation
    	if (departmentName == null || departmentName.trim().isEmpty()
    	        || description == null || description.trim().isEmpty()) {

    	    response.sendRedirect(
    	        request.getContextPath()
    	        + "/admin/dashboard.jsp?page=addDepartment"
    	        + "&error=All Fields Are Required"
    	    );

    	    return;
    	}

        Department department = new Department();

        department.setDepartmentName(departmentName);
        department.setDescription(description);

        DepartmentDAO departmentDAO =
                new DepartmentDAO();

        boolean status =
                departmentDAO.addDepartment(department);

        if (status) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/dashboard.jsp?page=departments"
                + "&success=Department Added Successfully"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/dashboard.jsp?page=addDepartment"
                + "&error=Failed To Add Department"
            );

        }
    }
}