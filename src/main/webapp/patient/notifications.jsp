<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Patient"%>
<%@ page import="com.hospital_management.model.Notification"%>
<%@ page import="com.hospital_management.dao.NotificationDAO"%>

<%
    // Check Patient Session
    Patient patient =
            (Patient) session.getAttribute(
                    "loggedInPatient");

    if (patient == null) {
        response.sendRedirect(
                "patient_login.jsp");
        return;
    }

    // Load Patient Notifications
    NotificationDAO notificationDAO =
            new NotificationDAO();

    List<Notification> notificationList =
            notificationDAO.getNotifications(
                    "PATIENT",
                    patient.getPatientId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Notifications</title>
</head>
<body>

    <h1>🔔 My Notifications</h1>
    <hr>

    <h3>
        Welcome,
        <%= patient.getFullName() %>
    </h3>

    <br>

    <a href="patient_dashboard.jsp">
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

    <a href="patient_dashboard.jsp">
        ⬅ Back to Dashboard
    </a>


    <a href="<%= request.getContextPath() %>/PatientLogoutServlet">
        🚪 Logout
    </a>

</body>
</html>