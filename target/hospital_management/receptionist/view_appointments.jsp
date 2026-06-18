<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Receptionist"%>
<%@ page import="com.hospital_management.model.Appointment"%>
<%@ page import="com.hospital_management.dao.AppointmentDAO"%>

<%
    Receptionist receptionist =
        (Receptionist) session.getAttribute("loggedInReceptionist");

    if (receptionist == null) {
        response.sendRedirect("receptionist_login.jsp");
        return;
    }

    AppointmentDAO appointmentDAO = new AppointmentDAO();
    List<Appointment> appointmentList =
            appointmentDAO.getAllAppointments();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Appointment Requests</title>
</head>
<body>

    <h1>📋 View Appointment Requests</h1>
    <hr>

    <h3>
        Welcome,
        <%= receptionist.getFullName() %>
    </h3>

    <br>

    <a href="dashboard.jsp">⬅ Back to Dashboard</a>

    <br><br>

    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>Appointment ID</th>
            <th>Patient Name</th>
            <th>Doctor Name</th>
            <th>Appointment Date</th>
            <th>Appointment Time</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            for (Appointment appointment : appointmentList) {
        %>

        <tr>
            <td><%= appointment.getAppointmentId() %></td>
            <td><%= appointment.getPatientName() %></td>
            <td><%= appointment.getDoctorName() %></td>
            <td><%= appointment.getAppointmentDate() == null ? "-" : appointment.getAppointmentDate() %></td>
            <td><%= appointment.getAppointmentTime() == null ? "-" : appointment.getAppointmentTime() %></td>
            <td><%= appointment.getStatus() %></td>

            <td>
                <a href="confirm_appointment.jsp?id=<%= appointment.getAppointmentId() %>">
                    Manage
                </a>
            </td>
        </tr>

        <%
            }
        %>

    </table>

    <br><br>

    <a href="dashboard.jsp">⬅ Back to Dashboard</a>

</body>
</html>