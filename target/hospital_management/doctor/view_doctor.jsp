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
    <title>View Doctors</title>
</head>
<body>

    <h1>View Doctors</h1>
    <hr>

    <a href="dashboard.jsp">Dashboard</a> |
    <a href="add_doctor.jsp">Add Doctor</a>

    <br><br>

    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Username</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Gender</th>
            <th>Department</th>
            <th>Action</th>
        </tr>

        <%
            for (Doctor doctor : doctorList) {
        %>
        <tr>
            <td><%= doctor.getDoctorId() %></td>
            <td><%= doctor.getFullName() %></td>
            <td><%= doctor.getUsername() %></td>
            <td><%= doctor.getEmail() %></td>
            <td><%= doctor.getMobile() %></td>
            <td><%= doctor.getGender() %></td>
            <td><%= doctor.getDepartmentName() %></td>

            <td>
                <a href="<%= request.getContextPath() %>/DeleteDoctorServlet?id=<%= doctor.getDoctorId() %>"
                   onclick="return confirm('Are you sure you want to delete this doctor?');">
                    Delete
                </a>
            </td>
        </tr>
        <%
            }
        %>

    </table>

    <br><br>

    <a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>