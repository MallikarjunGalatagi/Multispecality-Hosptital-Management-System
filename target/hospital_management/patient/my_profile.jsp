<%@ page import="com.hospital_management.model.Patient" %>

<%
    Patient patient = (Patient) session.getAttribute("loggedInPatient");

    if (patient == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
</head>
<body>

    <h1>My Profile</h1>
    <hr>

    <form action="../UpdatePatientProfileServlet" method="post">

        <input type="hidden" name="patientId"
               value="<%= patient.getPatientId() %>">

        <label>Full Name:</label><br>
        <input type="text" name="fullName"
               value="<%= patient.getFullName() %>" required>
        <br><br>

        <label>Username:</label><br>
        <input type="text" name="username"
               value="<%= patient.getUsername() %>" readonly>
        <br><br>

        <label>Email:</label><br>
        <input type="email" name="email"
               value="<%= patient.getEmail() %>" required>
        <br><br>

        <label>Mobile:</label><br>
        <input type="text" name="mobile"
               value="<%= patient.getMobile() %>" required>
        <br><br>

        <label>Gender:</label><br>
        <input type="text" name="gender"
               value="<%= patient.getGender() %>" readonly>
        <br><br>

        <label>Password:</label><br>
        <input type="password" name="password"
               value="<%= patient.getPassword() %>" required>
        <br><br>

        <button type="submit">Update Profile</button>

    </form>

    <br><br>

    <a href="patient_dashboard.jsp">Back to Dashboard</a>

</body>
</html>