<%@ page import="com.hospital_management.dao.AppointmentDAO"%>
<%@ page import="com.hospital_management.model.Appointment"%>

<%
String idParam = request.getParameter("id");

if(idParam == null){
%>

<div class="content-card">

<h2 class="page-title">
    Appointment Not Found
</h2>

<p>
    Invalid appointment request.
</p>

</div>

<%
return;
}

int appointmentId = Integer.parseInt(idParam);

AppointmentDAO appointmentDAO =
new AppointmentDAO();

Appointment appointment =
appointmentDAO.getAppointmentById(
appointmentId);

if(appointment == null){
%>

<div class="content-card">

<h2 class="page-title">
    Appointment Not Found
</h2>

<p>
    No appointment record found.
</p>

</div>

<%
return;
}

String success =
request.getParameter("success");
%>


<h2 class="page-title">
    <i class="fas fa-calendar-check"></i>
    Manage Appointment
</h2>

<p class="auth-subtitle">
    Manage appointment actions and scheduling.
</p>

<% if("confirmed".equals(success)){ %>

    <div id="successMessage"
         class="success-message">

        Appointment Confirmed Successfully!

    </div>

<% } %>

<% if("rejected".equals(success)){ %>

    <div id="successMessage"
         class="error-message">

        Appointment Rejected Successfully!

    </div>

<% } %>

<% if("rescheduled".equals(success)){ %>

    <div id="successMessage"
         class="success-message">

        Appointment Rescheduled Successfully!

    </div>

<% } %>

<div class="profile-details">

    <div>
        <label>Appointment ID</label>

        <input type="text"
               value="<%= appointment.getAppointmentId() %>"
               readonly>
    </div>

    <div>
        <label>Patient Name</label>

        <input type="text"
               value="<%= appointment.getPatientName() %>"
               readonly>
    </div>

    <div>
        <label>Doctor Name</label>

        <input type="text"
               value="<%= appointment.getDoctorName() %>"
               readonly>
    </div>

    <div>
        <label>Status</label>

        <input type="text"
               value="<%= appointment.getStatus() %>"
               readonly>
    </div>

</div>

<br><br>

<h3 class="page-title">
    <i class="fas fa-cogs"></i>
    Appointment Actions
</h3>

<div class="action-buttons">

    <a href="<%= request.getContextPath() %>/UpdateAppointmentStatusServlet?appointmentId=<%= appointmentId %>&status=Confirmed"
       class="confirm-btn">

        <i class="fas fa-check"></i>
        Confirm Appointment

    </a>

    <a href="<%= request.getContextPath() %>/UpdateAppointmentStatusServlet?appointmentId=<%= appointmentId %>&status=Rejected"
       class="reject-btn">

        <i class="fas fa-times"></i>
        Reject Appointment

    </a>

</div>

<br><br>

<h3 class="page-title">
    <i class="fas fa-calendar-alt"></i>
    Reschedule Appointment
</h3>

<form action="<%= request.getContextPath() %>/UpdateAppointmentStatusServlet"
      method="post">

    <input type="hidden"
           name="appointmentId"
           value="<%= appointmentId %>">

    <input type="hidden"
           name="status"
           value="Rescheduled">

    <div class="profile-details">

        <div>

            <label>
                New Appointment Date
            </label>

            <input type="date"
                   name="appointmentDate"
                   required>

        </div>

        <div>

            <label>
                New Appointment Time
            </label>

            <input type="time"
                   name="appointmentTime"
                   required>

        </div>

    </div>

    <br>

    <button type="submit"
            class="card-btn">

        <i class="fas fa-calendar-plus"></i>
        Reschedule Appointment

    </button>

</form>

<br><br>

<div style="text-align:center;">

    <a href="dashboard.jsp?page=appointments"
       class="card-btn">

        <i class="fas fa-arrow-left"></i>
        Back to Appointment Requests

    </a>

</div>


</div>

<script>

setTimeout(function(){

    var msg =
        document.getElementById(
            "successMessage");

    if(msg){
        msg.style.display = "none";
    }

},2000);

</script>
