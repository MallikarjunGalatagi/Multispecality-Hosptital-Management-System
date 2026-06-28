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

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int departmentId =
                Integer.parseInt(request.getParameter("id"));

        DepartmentDAO departmentDAO =
                new DepartmentDAO();

        boolean status =
                departmentDAO.deleteDepartment(departmentId);

        if (status) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/dashboard.jsp?page=departments"
                + "&success=Department Deleted Successfully"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/dashboard.jsp?page=departments"
                + "&error=Failed To Delete Department"
            );

        }
    }
}