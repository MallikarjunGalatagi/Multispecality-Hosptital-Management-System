<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Admin"%>
<%@ page import="com.hospital_management.model.Notification"%>
<%@ page import="com.hospital_management.dao.NotificationDAO"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
HttpSession currentSession = request.getSession(false);

if(currentSession == null ||
currentSession.getAttribute("loggedInAdmin") == null){

response.sendRedirect(
    request.getContextPath()
    + "/admin/admin_login.jsp");
return;

}

Admin admin =
(Admin) currentSession.getAttribute(
"loggedInAdmin");

NotificationDAO notificationDAO =
new NotificationDAO();

List<Notification> notificationList =
notificationDAO.getNotifications(
"ADMIN",
1);
%>

<div class="content-card">

```
<h2 class="page-title">

    <i class="fas fa-bell"></i>

    Notifications

</h2>

<p class="auth-subtitle">

    Stay updated with hospital notifications.

</p>

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
