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

NotificationDAO notificationDAO =
        new NotificationDAO();

List<Notification> notificationList =
        notificationDAO.getNotifications(
                "RECEPTIONIST",
                receptionist.getReceptionistId());
%>


    <h2 class="page-title">
        <i class="fas fa-bell"></i>
        Notifications
    </h2>

    <%
    if(notificationList.isEmpty()){
    %>

        <div class="notification-card">

            <h4>No Notifications</h4>

            <p>
                You currently have no notifications.
            </p>

        </div>

    <%
    }
    else{

        for(Notification notification
                : notificationList){
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