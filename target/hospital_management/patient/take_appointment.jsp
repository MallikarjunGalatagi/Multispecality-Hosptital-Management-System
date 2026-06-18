<%@ page import="java.util.List" %>
<%@ page import="com.hospital_management.dao.DoctorDAO" %>
<%@ page import="com.hospital_management.model.Doctor" %>

<%
    DoctorDAO doctorDAO = new DoctorDAO();
    List<Doctor> doctorList = doctorDAO.getAllDoctors();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Appointment</title>
</head>
<body>

    <h1>Book Appointment</h1>
    <hr>

    <form action="../BookAppointmentServlet" method="post">

        <label>Select Doctor:</label><br>
        <select name="doctorId" required>
            <option value="">--Select Doctor--</option>

            <%
                for (Doctor doctor : doctorList) {
            %>
                <option value="<%= doctor.getDoctorId() %>">
                    <%= doctor.getFullName() %> - <%= doctor.getDepartmentName() %>
                </option>
            <%
                }
            %>

        </select>
        <br><br>

        <label>Preferred Appointment Date:</label><br>
        <input type="date" name="appointmentDate" required>
        <br><br>

        <button type="submit">Book Appointment</button>

    </form>

    <br>

    <a href="patient_dashboard.jsp">Back to Dashboard</a>

</body>
</html>