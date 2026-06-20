
<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Patient"%>
<%@ page import="com.hospital_management.model.Appointment"%>
<%@ page import="com.hospital_management.dao.AppointmentDAO"%>

<%

Patient patient =
        (Patient) session.getAttribute("loggedInPatient");

if(patient == null){
    response.sendRedirect("patient_login.jsp");
    return;
}

AppointmentDAO appointmentDAO =
        new AppointmentDAO();

List<Appointment> appointmentList =
        appointmentDAO.getAppointmentsByPatientId(
                patient.getPatientId());

%>

<div class="appointment-page">

    <h2>
        <i class="fas fa-calendar-check"></i>
        My Appointments
    </h2>

    <p class="auth-subtitle">
        View all your booked appointments
    </p>

    <table class="appointment-table appointment-full-table">
			<thead>

				<tr>
					<th>ID</th>
					<th>Doctor</th>
					<th>Date</th>
					<th>Time</th>
					<th>Status</th>
				</tr>

			</thead>

			<tbody>

				<%
                for(Appointment appointment : appointmentList){
                %>

				<tr>

					<td><%= appointment.getAppointmentId() %></td>

					<td><%= appointment.getDoctorName() %></td>

					<td><%= appointment.getAppointmentDate()==null
                                ? "-"
                                : appointment.getAppointmentDate() %></td>

					<td><%= appointment.getAppointmentTime()==null
                                ? "-"
                                : appointment.getAppointmentTime() %></td>

					<td><span class="status-badge"> <%= appointment.getStatus() %>

					</span></td>

				</tr>

				<%
                }
                %>

			</tbody>

		</table>

	</div>

</div>

