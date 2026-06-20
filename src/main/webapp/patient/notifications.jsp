
<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Patient"%>
<%@ page import="com.hospital_management.model.Notification"%>
<%@ page import="com.hospital_management.dao.NotificationDAO"%>

<%
Patient patient =
        (Patient) session.getAttribute(
                "loggedInPatient");

if(patient == null){
    response.sendRedirect("patient_login.jsp");
    return;
}

NotificationDAO notificationDAO =
        new NotificationDAO();

List<Notification> notificationList =
        notificationDAO.getNotifications(
                "PATIENT",
                patient.getPatientId());
%>

<div class="appointment-page">


	<h2>
		<i class="fas fa-bell"></i> My Notifications
	</h2>

	<p class="auth-subtitle">
        Stay updated with hospital alerts and updates
    </p>

    <%
    if(notificationList.isEmpty()){
    %>

        <div class="notification-card">

            <h4>No notifications available.</h4>

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

           
        </div>

    <%
        }
    }
    %>

</div>

