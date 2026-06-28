package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.ReceptionistDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteReceptionistServlet")
public class DeleteReceptionistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int receptionistId =
                Integer.parseInt(request.getParameter("id"));

        ReceptionistDAO receptionistDAO =
                new ReceptionistDAO();

        boolean status =
                receptionistDAO.deleteReceptionist(receptionistId);

        if(status) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/dashboard.jsp?page=receptionists"
                + "&success=Receptionist Deleted Successfully"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/dashboard.jsp?page=receptionists"
                + "&error=Failed To Delete Receptionist"
            );

        }
    }
}