package com.hospital_management.controller;

import java.io.IOException;

import com.hospital_management.dao.NotificationDAO;
import com.hospital_management.model.Notification;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TestNotificationServlet")
public class TestNotificationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Notification notification = new Notification();
        notification.setUserType("PATIENT");
        notification.setUserId(1);
        notification.setTitle("Java Test");
        notification.setMessage("Notification inserted from Java Servlet.");

        NotificationDAO dao = new NotificationDAO();

        if (dao.addNotification(notification)) {
            response.getWriter().println("Notification Inserted Successfully!");
        } else {
            response.getWriter().println("Notification Insert Failed!");
        }
    }
}