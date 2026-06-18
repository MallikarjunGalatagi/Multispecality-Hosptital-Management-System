package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.ReceptionistDAO;
import com.hospital_management.model.Receptionist;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ReceptionistLoginServlet")
public class ReceptionistLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReceptionistLoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get login details
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate receptionist login
        ReceptionistDAO receptionistDAO = new ReceptionistDAO();
        Receptionist receptionist =
                receptionistDAO.validateReceptionist(username, password);

        if (receptionist != null) {

            // Create session
            HttpSession session = request.getSession(true);
            session.setAttribute(
                    "loggedInReceptionist",
                    receptionist);

            // Redirect to Receptionist Dashboard
            response.sendRedirect(
                    request.getContextPath()
                    + "/receptionist/dashboard.jsp");

        } else {

            // Invalid login
            response.sendRedirect(
                    request.getContextPath()
                    + "/receptionist/receptionist_login.jsp?error=invalid");
        }
    }
}