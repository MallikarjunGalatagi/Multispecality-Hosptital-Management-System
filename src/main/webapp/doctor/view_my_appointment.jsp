
<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Doctor"%>
<%@ page import="com.hospital_management.model.Appointment"%>
<%@ page import="com.hospital_management.dao.AppointmentDAO"%>

<%
Doctor doctor =
        (Doctor) session.getAttribute("loggedInDoctor");

AppointmentDAO appointmentDAO = new AppointmentDAO();

List<Appointment> appointmentList =
        appointmentDAO.getAppointmentsByDoctorId(
                doctor.getDoctorId());
%>

<div class="appointment-page">

	<h2 class="page-title">
		<i class="fas fa-calendar-check"></i> My Appointments
	</h2>

	<div class="table-container">

		<table class="appointment-table">

			<thead>
				<tr>
					<th>Appointment ID</th>
					<th>Patient Name</th>
					<th>Date</th>
					<th>Time</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>

				<%
            if (appointmentList.isEmpty()) {
            %>

				<tr>
					<td colspan="6" style="text-align: center;">No appointments
						available.</td>
				</tr>

				<%
            } else {

                for (Appointment appointment : appointmentList) {
            %>

				<tr>

					<td><%= appointment.getAppointmentId() %></td>

					<td><%= appointment.getPatientName() %></td>

					<td><%= appointment.getAppointmentDate() == null
                                ? "-"
                                : appointment.getAppointmentDate() %></td>

					<td><%= appointment.getAppointmentTime() == null
                                ? "-"
                                : appointment.getAppointmentTime() %></td>

					<td>
						<%
                        String status =
                                appointment.getStatus();

                        if ("Confirmed".equalsIgnoreCase(status)) {
                        %> <span class="status-badge status-approved">
							Confirmed </span> <%
                        } else if ("Pending".equalsIgnoreCase(status)) {
                        %> <span class="status-badge status-pending">
							Pending </span> <%
                        } else {
                        %> <span class="status-badge status-cancelled">
							Rejected </span> <%
                        }
                        %>

					</td>

					<td>
						<%
                        if ("Confirmed".equalsIgnoreCase(status)) {
                        %> <a
						href="<%= request.getContextPath() %>/doctor/doctor_dashboard.jsp?page=addPrescription&appointmentId=<%= appointment.getAppointmentId() %>"
						style="display: inline-block; min-width: 60px; padding: 6px 12px; border-radius: 8px; background: linear-gradient(135deg, #16a34a, #22c55e); color: #fff; font-size: 13px; font-weight: 600; text-decoration: none; text-align: center;">

							Add Prescription </a> <%
                        } else if ("Pending".equalsIgnoreCase(status)) {
                        %> Pending Approval <%
                        } else {
                        %> - <%
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

	</div>

</div>

