<%@ page import="com.hospital_management.model.Receptionist"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
    HttpSession currentSession = request.getSession(false);

    if (currentSession == null ||
        currentSession.getAttribute("loggedInReceptionist") == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/receptionist/receptionist_login.jsp");
        return;
    }

    Receptionist receptionist =
        (Receptionist) currentSession.getAttribute("loggedInReceptionist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receptionist Dashboard</title>
</head>
<body>

    <h1>👩‍💼 Receptionist Dashboard</h1>
    <hr>

    <h3>
        Welcome,
        <%= receptionist.getFullName() %>
    </h3>

    <p>You have successfully logged in.</p>

    <hr>

    <h4>👤 My Profile</h4>

    <a href="my_profile.jsp">👤 View My Profile</a>

    <br><br>

    <hr>

    <h4>📋 Appointment Management</h4>

    <a href="view_appointments.jsp">
        📋 View Appointment Requests
    </a>

    <br><br>

    <hr>

    <h4>🔔 Notifications</h4>

    <a href="notifications.jsp">
        🔔 View Notifications
    </a>

    <br><br>

    <hr>

    <a href="<%= request.getContextPath() %>/ReceptionistLogoutServlet">
        🚪 Logout
    </a>

</body>
</html>