<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Receptionist"%>
<%@ page import="com.hospital_management.model.Appointment"%>
<%@ page import="com.hospital_management.dao.AppointmentDAO"%>

<%
Receptionist receptionist =
(Receptionist) session.getAttribute(
"loggedInReceptionist");

if (receptionist == null) {
response.sendRedirect(
"receptionist_login.jsp");
return;
}

AppointmentDAO appointmentDAO =
new AppointmentDAO();

List<Appointment> appointmentList =
appointmentDAO.getAllAppointments();
%>

<h2 class="page-title">
    <i class="fas fa-calendar-check"></i>
    Appointment Requests
</h2>

<p class="auth-subtitle">
    Manage patient appointment requests and schedules.
</p>

<table class="appointment-table appointment-full-table">

<thead>

<tr>

<th>ID</th>

<th>Patient</th>

<th>Doctor</th>

<th>Status</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

if (appointmentList.isEmpty()) {

%>

<tr>

<td colspan="5"
style="text-align:center;padding:25px;">

No Appointment Requests Found

</td>

</tr>

<%

} else {

for (Appointment appointment : appointmentList) {

String status =
appointment.getStatus();

String statusClass =
"status-pending";

if ("Confirmed".equalsIgnoreCase(status)) {

statusClass =
"status-approved";

}

else if ("Rejected".equalsIgnoreCase(status)) {

statusClass =
"status-cancelled";

}

else if ("Rescheduled".equalsIgnoreCase(status)) {

statusClass =
"status-approved";

}

%>

<tr>

<td>
<%= appointment.getAppointmentId() %>
</td>

<td>
<%= appointment.getPatientName() %>
</td>

<td>
<%= appointment.getDoctorName() %>
</td>

<td>

<span class="status-badge <%= statusClass %>">

<%= status %>

</span>

</td>

<td>

<%

if ("Pending".equalsIgnoreCase(status)) {

%>

<a
href="dashboard.jsp?page=confirm&id=<%= appointment.getAppointmentId() %>"
style="
display:inline-block;
min-width:60px;
padding:6px 12px;
border-radius:8px;
background:linear-gradient(135deg,#f97316,#fb923c);
color:#fff;
font-size:13px;
font-weight:600;
text-decoration:none;
text-align:center;
transition:.3s;">

Manage

</a>

<%

}

else if ("Confirmed".equalsIgnoreCase(status)) {

%>

<%

            } else if ("Confirmed"
                    .equalsIgnoreCase(
                            status)) {

            %>

                <span style="
                    color:#000;
                    font-size:14px;
                    font-weight:600;">

                    Confirmed

                </span>

            <%

            }

            else if ("Rejected"
                    .equalsIgnoreCase(
                            status)) {

            %>

                <span style="
                    color:#000;
                    font-size:14px;
                    font-weight:600;">

                    Rejected

                </span>

            <%

            }

            else if ("Rescheduled"
                    .equalsIgnoreCase(
                            status)) {

            %>

                <span style="
                    color:#000;
                    font-size:14px;
                    font-weight:600;">

                    Rescheduled

                </span>

            <%

            }

            %>

        </td>

    </tr>

<%

    }
}

%>

</tbody>

</table>