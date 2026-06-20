package com.hospital_management.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ReceptionistLogoutServlet")
public class ReceptionistLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReceptionistLogoutServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();   // Destroy session
        }

        // Redirect to Home Page
        response.sendRedirect(
                request.getContextPath() + "/index.jsp");
    }
}