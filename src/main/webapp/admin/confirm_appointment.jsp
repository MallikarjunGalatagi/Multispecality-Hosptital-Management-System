
<%
    int appointmentId = Integer.parseInt(request.getParameter("id"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Appointment</title>
</head>
<body>

	<h1>Confirm Appointment</h1>
	<hr>

	<form
		action="<%= request.getContextPath() %>/UpdateAppointmentStatusServlet"
		method="post">

		<input type="hidden" name="appointmentId" value="<%= appointmentId %>">
		<input type="hidden" name="status" value="Confirmed"> <label>Appointment
			Date:</label><br> <input type="date" name="appointmentDate" required>
		<br>
		<br> <label>Appointment Time:</label><br> <input type="time"
			name="appointmentTime" required> <br>
		<br>

		<button type="submit">Confirm Appointment</button>

	</form>

	<br>
	<br>

	<a href="view_appointments.jsp">Back</a>

</body>
</html>