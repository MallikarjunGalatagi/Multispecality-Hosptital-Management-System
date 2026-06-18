<%@ page import="com.hospital_management.model.Doctor"%>

<%
    Doctor doctor =
        (Doctor) session.getAttribute("loggedInDoctor");

    if (doctor == null) {
        response.sendRedirect("doctor_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Profile</title>
</head>
<body>

    <h1>👨‍⚕️ Doctor Profile</h1>
    <hr>

    <table border="1" cellpadding="10" cellspacing="0">

        <tr>
            <th>Doctor ID</th>
            <td><%= doctor.getDoctorId() %></td>
        </tr>

        <tr>
            <th>Full Name</th>
            <td><%= doctor.getFullName() %></td>
        </tr>

        <tr>
            <th>Username</th>
            <td><%= doctor.getUsername() %></td>
        </tr>

        <tr>
            <th>Email</th>
            <td><%= doctor.getEmail() %></td>
        </tr>

        <tr>
            <th>Mobile</th>
            <td><%= doctor.getMobile() %></td>
        </tr>

        <tr>
            <th>Gender</th>
            <td><%= doctor.getGender() %></td>
        </tr>

        <tr>
            <th>Qualification</th>
            <td><%= doctor.getQualification() %></td>
        </tr>

        <tr>
            <th>Department ID</th>
            <td><%= doctor.getDepartmentId() %></td>
        </tr>

       

    </table>

    <br><br>

    <a href="doctor_dashboard.jsp">
        ⬅ Back to Dashboard
    </a>

    <br><br>

    <a href="<%= request.getContextPath() %>/DoctorLogoutServlet">
        🚪 Logout
    </a>

</body>
</html>