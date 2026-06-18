<%@ page import="com.hospital_management.model.Receptionist"%>

<%
    Receptionist receptionist =
        (Receptionist) session.getAttribute("loggedInReceptionist");

    if (receptionist == null) {
        response.sendRedirect("receptionist_login.jsp");
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

    <h1>👩‍💼 Receptionist Profile</h1>
    <hr>

    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>Receptionist ID</th>
            <td><%= receptionist.getReceptionistId() %></td>
        </tr>

        <tr>
            <th>Full Name</th>
            <td><%= receptionist.getFullName() %></td>
        </tr>

        <tr>
            <th>Username</th>
            <td><%= receptionist.getUsername() %></td>
        </tr>

        <tr>
            <th>Email</th>
            <td><%= receptionist.getEmail() %></td>
        </tr>

        <tr>
            <th>Mobile</th>
            <td><%= receptionist.getMobile() %></td>
        </tr>

        <tr>
            <th>Account Created</th>
            <td><%= receptionist.getCreatedAt() %></td>
        </tr>
    </table>

    <br><br>

    <a href="dashboard.jsp">⬅ Back to Dashboard</a>

    <br><br>

    <a href="<%= request.getContextPath() %>/ReceptionistLogoutServlet">
        🚪 Logout
    </a>

</body>
</html>