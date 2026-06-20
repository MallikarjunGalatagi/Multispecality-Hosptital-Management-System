<%@ page import="com.hospital_management.dao.AppointmentDAO"%>
<%@ page import="com.hospital_management.model.Appointment"%>

<%
int appointmentId =
Integer.parseInt(request.getParameter("id"));

AppointmentDAO appointmentDAO =
new AppointmentDAO();

Appointment appointment =
appointmentDAO.getAppointmentById(
appointmentId);
%>

<div class="content-card">

```
<h2 class="page-title">
    <i class="fas fa-calendar-check"></i>
    Manage Appointment
</h2>

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
```

</div>

<br>

<div class="content-card">

```
<h2>
    <i class="fas fa-check-circle"></i>
    Confirm Appointment
</h2>

<form action="<%= request.getContextPath() %>/UpdateAppointmentStatusServlet"
      method="post">

    <input type="hidden"
           name="appointmentId"
           value="<%= appointmentId %>">

    <input type="hidden"
           name="status"
           value="Confirmed">

    <div class="profile-details">

        <div>
            <label>Appointment Date</label>
            <input type="date"
                   name="appointmentDate"
                   required>
        </div>

        <div>
            <label>Appointment Time</label>
            <input type="time"
                   name="appointmentTime"
                   required>
        </div>

    </div>

    <br>

    <button type="submit"
            class="card-btn">

        Confirm Appointment

    </button>

</form>
```

</div>

<br>

<div class="content-card">

```
<h2>
    <i class="fas fa-times-circle"></i>
    Reject Appointment
</h2>

<a href="<%= request.getContextPath() %>/UpdateAppointmentStatusServlet?appointmentId=<%= appointmentId %>&status=Rejected"
   class="card-btn">

   Reject Appointment

</a>
```

</div>

<br>

<a href="receptionist_dashboard.jsp?page=appointments"
class="card-btn">

```
Back to Appointment Requests
```

</a>
