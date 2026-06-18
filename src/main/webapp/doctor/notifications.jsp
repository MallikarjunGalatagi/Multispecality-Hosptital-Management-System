<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Doctor"%>
<%@ page import="com.hospital_management.model.Notification"%>
<%@ page import="com.hospital_management.dao.NotificationDAO"%>

<%
    // Check Doctor Session
    Doctor doctor =
            (Doctor) session.getAttribute(
                    "loggedInDoctor");

    if (doctor == null) {
        response.sendRedirect(
                "doctor_login.jsp");
        return;
    }

    // Load Doctor Notifications
    NotificationDAO notificationDAO =
            new NotificationDAO();

    List<Notification> notificationList =
            notificationDAO.getNotifications(
                    "DOCTOR",
                    doctor.getDoctorId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Notifications</title>
</head>
<body>

    <h1>🔔 Doctor Notifications</h1>
    <hr>

    <h3>
        Welcome, Dr.
        <%= doctor.getFullName() %>
    </h3>

    <br>

    <a href="doctor_dashboard.jsp">
        ⬅ Back to Dashboard
    </a>

    <br><br>

    <%
        if (notificationList.isEmpty()) {
    %>

        <h4>No notifications available.</h4>

    <%
        } else {

            for (Notification notification
                    : notificationList) {
    %>

        <div style="
            border:1px solid #cccccc;
            padding:10px;
            margin-bottom:10px;">

            <h4>
                <%= notification.getTitle() %>
            </h4>

            <p>
                <%= notification.getMessage() %>
            </p>

            <small>
                <b>Date:</b>
                <%= notification.getCreatedAt() %>
            </small>

        </div>

    <%
            }
        }
    %>

    <hr>

    <a href="doctor_dashboard.jsp">
        ⬅ Back to Dashboard
    </a>

  

    <a href="<%= request.getContextPath() %>/DoctorLogoutServlet">
        🚪 Logout
    </a>

</body>
</html>