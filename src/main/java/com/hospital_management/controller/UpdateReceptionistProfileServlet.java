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

@WebServlet("/UpdateReceptionistProfileServlet")
public class UpdateReceptionistProfileServlet
extends HttpServlet {


protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    Receptionist receptionist =
            new Receptionist();

    receptionist.setReceptionistId(
            Integer.parseInt(
                    request.getParameter(
                            "receptionistId")));

    receptionist.setFullName(
            request.getParameter(
                    "fullName"));

    receptionist.setUsername(
            request.getParameter(
                    "username"));

    receptionist.setEmail(
            request.getParameter(
                    "email"));

    receptionist.setMobile(
            request.getParameter(
                    "mobile"));

    receptionist.setPassword(
            request.getParameter(
                    "password"));

    ReceptionistDAO dao =
            new ReceptionistDAO();

    boolean status =
            dao.updateReceptionist(
                    receptionist);

    if(status){

    	HttpSession session = request.getSession();

    	Receptionist loggedReceptionist =
    	        (Receptionist) session.getAttribute(
    	                "loggedInReceptionist");

    	loggedReceptionist.setFullName(
    	        receptionist.getFullName());

    	loggedReceptionist.setUsername(
    	        receptionist.getUsername());

    	loggedReceptionist.setEmail(
    	        receptionist.getEmail());

    	loggedReceptionist.setMobile(
    	        receptionist.getMobile());

    	loggedReceptionist.setPassword(
    	        receptionist.getPassword());

    	session.setAttribute(
    	        "loggedInReceptionist",
    	        loggedReceptionist);

        response.sendRedirect(
            request.getContextPath()
          + "/receptionist/dashboard.jsp?page=profile&success=updated");

    } else {

        response.sendRedirect(
            request.getContextPath()
          + "/receptionist/dashboard.jsp?page=editprofile");

    }
}


}
