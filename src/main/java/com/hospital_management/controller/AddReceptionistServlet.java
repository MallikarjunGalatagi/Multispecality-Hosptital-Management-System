package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.ReceptionistDAO;
import com.hospital_management.model.Receptionist;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddReceptionistServlet")
public class AddReceptionistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddReceptionistServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");

        // Create Receptionist Object
        Receptionist receptionist = new Receptionist();
        receptionist.setFullName(fullName);
        receptionist.setUsername(username);
        receptionist.setEmail(email);
        receptionist.setMobile(mobile);
        receptionist.setPassword(password);

        // Save Receptionist
        ReceptionistDAO receptionistDAO = new ReceptionistDAO();
        boolean status =
                receptionistDAO.addReceptionist(receptionist);

        if (status) {
            response.sendRedirect(
                request.getContextPath()
                + "/admin/view_receptionist.jsp");
        } else {
            response.sendRedirect(
                request.getContextPath()
                + "/admin/add_receptionist.jsp");
        }
    }
}