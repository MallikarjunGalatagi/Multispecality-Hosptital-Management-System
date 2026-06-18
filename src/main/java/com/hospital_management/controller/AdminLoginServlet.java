package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.AdminDAO;
import com.hospital_management.model.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminLoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get login details
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate admin login
        AdminDAO adminDAO = new AdminDAO();
        Admin admin = adminDAO.validateAdmin(username, password);

        if (admin != null) {

            // Create session
            HttpSession session = request.getSession(true);
            session.setAttribute("loggedInAdmin", admin);

            // Redirect to dashboard
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");

        } else {

            // Invalid login
            response.sendRedirect(request.getContextPath() + "/admin/admin_login.jsp?error=invalid");
        }
    }
}