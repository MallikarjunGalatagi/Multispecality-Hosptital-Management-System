<%@ page import="java.util.List" %>
<%@ page import="com.hospital_management.model.Patient" %>
<%@ page import="com.hospital_management.model.Appointment" %>
<%@ page import="com.hospital_management.dao.AppointmentDAO" %>

<%
    Patient patient = (Patient) session.getAttribute("loggedInPatient");

    if (patient == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }

    AppointmentDAO appointmentDAO = new AppointmentDAO();
    List<Appointment> appointmentList =
            appointmentDAO.getAppointmentsByPatientId(patient.getPatientId());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Appointments</title>
</head>
<body>

    <h1>My Appointments</h1>
    <hr>

    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>Appointment ID</th>
            <th>Doctor Name</th>
            <th>Appointment Date</th>
            <th>Status</th>
        </tr>

        <%
            for (Appointment appointment : appointmentList) {
        %>
        <tr>
            <td><%= appointment.getAppointmentId() %></td>
            <td><%= appointment.getDoctorName() %></td>
            <td><%= appointment.getAppointmentDate() %></td>
            <td><%= appointment.getStatus() %></td>
        </tr>
        <%
            }
        %>

    </table>

    <br><br>

    <a href="patient_dashboard.jsp">Back to Dashboard</a>

</body>
</html>