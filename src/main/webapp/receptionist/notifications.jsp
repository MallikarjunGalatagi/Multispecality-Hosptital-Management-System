<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Receptionist"%>
<%@ page import="com.hospital_management.model.Notification"%>
<%@ page import="com.hospital_management.dao.NotificationDAO"%>

<%
    Receptionist receptionist =
        (Receptionist) session.getAttribute("loggedInReceptionist");

    if (receptionist == null) {
        response.sendRedirect("receptionist_login.jsp");
        return;
    }

    NotificationDAO notificationDAO = new NotificationDAO();

    List<Notification> notificationList =
            notificationDAO.getNotifications(
                    "RECEPTIONIST",
                    receptionist.getReceptionistId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receptionist Notifications</title>
</head>
<body>

    <h1>🔔 Receptionist Notifications</h1>
    <hr>

    <h3>
        Welcome,
        <%= receptionist.getFullName() %>
    </h3>

    <br>

    <a href="dashboard.jsp">⬅ Back to Dashboard</a>

    <br><br>

    <%
        if (notificationList.isEmpty()) {
    %>

        <p>No notifications available.</p>

    <%
        } else {

            for (Notification notification : notificationList) {
    %>

        <div style="border:1px solid #ccc;
                    padding:10px;
                    margin-bottom:10px;">

            <b><%= notification.getTitle() %></b>

            <br><br>

            <%= notification.getMessage() %>

            <br><br>

            <small>
                <%= notification.getCreatedAt() %>
            </small>

        </div>

    <%
            }
        }
    %>

    <hr>

    <a href="<%= request.getContextPath() %>/ReceptionistLogoutServlet">
        🚪 Logout
    </a>

</body>
</html>