<%@ page import="com.hospital_management.dao.AppointmentDAO"%>
<%@ page import="com.hospital_management.model.Appointment"%>

<%
    int appointmentId =
            Integer.parseInt(request.getParameter("id"));

    AppointmentDAO appointmentDAO =
            new AppointmentDAO();

    Appointment appointment =
            appointmentDAO.getAppointmentById(
                    appointmentId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Appointment</title>
</head>
<body>

    <h1>📋 Manage Appointment</h1>
    <hr>

    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>Appointment ID</th>
            <td><%= appointment.getAppointmentId() %></td>
        </tr>

        <tr>
            <th>Patient Name</th>
            <td><%= appointment.getPatientName() %></td>
        </tr>

        <tr>
            <th>Doctor Name</th>
            <td><%= appointment.getDoctorName() %></td>
        </tr>

        <tr>
            <th>Status</th>
            <td><%= appointment.getStatus() %></td>
        </tr>
    </table>

    <br>
    <hr>

    <h3>✅ Confirm Appointment</h3>

    <form action="<%= request.getContextPath() %>/UpdateAppointmentStatusServlet"
          method="post">

        <input type="hidden"
               name="appointmentId"
               value="<%= appointmentId %>">

        <input type="hidden"
               name="status"
               value="Confirmed">

        <label>Appointment Date:</label><br>
        <input type="date"
               name="appointmentDate"
               required>

        <br><br>

        <label>Appointment Time:</label><br>
        <input type="time"
               name="appointmentTime"
               required>

        <br><br>

        <button type="submit">
            ✅ Confirm Appointment
        </button>

    </form>

    <br>
    <hr>

    <h3>❌ Reject Appointment</h3>

    <a href="<%= request.getContextPath() %>/UpdateAppointmentStatusServlet?appointmentId=<%= appointmentId %>&status=Rejected">
        Reject Appointment
    </a>

    <br><br>
    <hr>

    <a href="view_appointments.jsp">
        ⬅ Back to Appointment Requests
    </a>

</body>
</html>