
<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Doctor"%>
<%@ page import="com.hospital_management.model.Notification"%>
<%@ page import="com.hospital_management.dao.NotificationDAO"%>

<%
Doctor doctor =
        (Doctor) session.getAttribute("loggedInDoctor");

NotificationDAO notificationDAO =
        new NotificationDAO();

List<Notification> notificationList =
        notificationDAO.getNotifications(
                "DOCTOR",
                doctor.getDoctorId());
%>

<div class="notifications-page">

    <h2 class="page-title">
        <i class="fas fa-bell"></i> Notifications
    </h2>

    <%
    if (notificationList.isEmpty()) {
    %>

        <div class="notification-card">

            <h4>No Notifications</h4>

            <p>
                You currently have no notifications.
            </p>

        </div>

    <%
    }
    else {

        for (Notification notification : notificationList) {
    %>

        <div class="notification-card">

            <h4>
                <%= notification.getTitle() %>
            </h4>

            <p>
                <%= notification.getMessage() %>
            </p>

            <small>
                <strong>Date:</strong>
                <%= notification.getCreatedAt() %>
            </small>

        </div>

    <%
        }
    }
    %>

</div>

