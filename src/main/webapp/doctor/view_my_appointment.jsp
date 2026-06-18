<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Doctor"%>
<%@ page import="com.hospital_management.model.Appointment"%>
<%@ page import="com.hospital_management.dao.AppointmentDAO"%>

<%
    // Check Doctor Session
    Doctor doctor = (Doctor) session.getAttribute("loggedInDoctor");

    if (doctor == null) {
        response.sendRedirect("doctor_login.jsp");
        return;
    }

    // Load Appointments for Logged-in Doctor
    AppointmentDAO appointmentDAO = new AppointmentDAO();

    List<Appointment> appointmentList =
            appointmentDAO.getAppointmentsByDoctorId(
                    doctor.getDoctorId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Appointments</title>
</head>
<body>

    <h1>📋 My Appointments</h1>
    <hr>

    <h3>
        Welcome, Dr. <%= doctor.getFullName() %>
    </h3>

    <br>

    <a href="doctor_dashboard.jsp">
        ⬅ Back to Dashboard
    </a>

    <br><br>

    <table border="1" cellpadding="10" cellspacing="0">

        <tr>
            <th>Appointment ID</th>
            <th>Patient Name</th>
            <th>Appointment Date</th>
            <th>Appointment Time</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            if (appointmentList.isEmpty()) {
        %>

        <tr>
            <td colspan="6" align="center">
                No appointments available.
            </td>
        </tr>

        <%
            } else {

                for (Appointment appointment : appointmentList) {
        %>

        <tr>

            <td>
                <%= appointment.getAppointmentId() %>
            </td>

            <td>
                <%= appointment.getPatientName() %>
            </td>

            <td>
                <%= appointment.getAppointmentDate() == null
                        ? "-"
                        : appointment.getAppointmentDate() %>
            </td>

            <td>
                <%= appointment.getAppointmentTime() == null
                        ? "-"
                        : appointment.getAppointmentTime() %>
            </td>

            <td>
                <%= appointment.getStatus() %>
            </td>

            <td>

                <%
                    if ("Confirmed".equalsIgnoreCase(
                            appointment.getStatus())) {
                %>

                    <a href="add_prescription.jsp?appointmentId=<%= appointment.getAppointmentId() %>">
                        💊 Add Prescription
                    </a>

                <%
                    } else if ("Pending".equalsIgnoreCase(
                            appointment.getStatus())) {
                %>

                    Pending Approval

                <%
                    } else if ("Rejected".equalsIgnoreCase(
                            appointment.getStatus())) {
                %>

                    Rejected

                <%
                    } else {
                %>

                    -

                <%
                    }
                %>

            </td>

        </tr>

        <%
                }
            }
        %>

    </table>

    <br><br>

    <a href="doctor_dashboard.jsp">
        ⬅ Back to Dashboard
    </a>

  

    <a href="<%= request.getContextPath() %>/DoctorLogoutServlet">
        🚪 Logout
    </a>

</body>
</html>