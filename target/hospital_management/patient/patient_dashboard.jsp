<%@ page import="com.hospital_management.model.Patient"%>

<%
Patient patient = (Patient) session.getAttribute("loggedInPatient");

if (patient == null) {
	response.sendRedirect("patient_login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Dashboard</title>
</head>
<body>

	<h1>Patient Dashboard</h1>
	<hr>

	<h3>
		Welcome,
		<%=patient.getFullName()%>
	</h3>

	<br>

	<h4>Patient Services</h4>

	<a href="my_profile.jsp">👤 My Profile</a>
	<br>
	<br>

	<a href="take_appointment.jsp">📅 Take Appointment</a>
	<br>
	<br>

	<a href="my_appointment.jsp">📋 My Appointments</a>
	<br>
	<br>

	<a href="view_prescription.jsp">💊 Prescriptions</a>
	<br>
	<br>

	<a href="notifications.jsp">🔔 Notifications</a>
	<br>
	<br>

	<hr>

	<a href="<%=request.getContextPath()%>/PatientLogoutServlet"> 🚪
		Logout </a>

</body>
</html>