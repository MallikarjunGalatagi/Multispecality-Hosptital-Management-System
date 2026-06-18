<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Admin"%>
<%@ page import="com.hospital_management.model.Notification"%>
<%@ page import="com.hospital_management.dao.NotificationDAO"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
    HttpSession currentSession = request.getSession(false);

    if (currentSession == null ||
        currentSession.getAttribute("loggedInAdmin") == null) {

        response.sendRedirect(request.getContextPath() + "/admin/admin_login.jsp");
        return;
    }

    Admin admin = (Admin) currentSession.getAttribute("loggedInAdmin");

    NotificationDAO notificationDAO = new NotificationDAO();
    List<Notification> notificationList =
            notificationDAO.getNotifications("ADMIN", 1);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Notifications</title>
</head>
<body>

    <h1>🔔 Admin Notifications</h1>
    <hr>

    <h3>
        Welcome,
        <%= admin.getFullName() %>
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

        <div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">
            <b><%= notification.getTitle() %></b>
            <br><br>
            <%= notification.getMessage() %>
            <br><br>
            <small><%= notification.getCreatedAt() %></small>
        </div>

    <%
            }
        }
    %>

    <hr>

    <a href="<%= request.getContextPath() %>/AdminLogoutServlet">
        🚪 Logout
    </a>

</body>
</html>