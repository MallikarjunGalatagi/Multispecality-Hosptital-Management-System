<%@ page import="com.hospital_management.model.Doctor"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
    HttpSession currentSession = request.getSession(false);

    if (currentSession == null ||
        currentSession.getAttribute("loggedInDoctor") == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/doctor/doctor_login.jsp");
        return;
    }

    Doctor doctor =
        (Doctor) currentSession.getAttribute("loggedInDoctor");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>
</head>
<body>

	<h1>👨‍⚕️ Doctor Dashboard</h1>
	<hr>

	<h3>
		Welcome, Dr.
		<%= doctor.getFullName() %>
	</h3>

	<p>You have successfully logged in.</p>

	<hr>

	<h4>👤 My Profile</h4>

	<a href="my_profile.jsp"> 👤 View My Profile </a>

	<br>
	<br>

	<hr>

	<h4>📋 Appointment Management</h4>

	<a href="view_my_appointment.jsp"> 📋 View My Appointments </a>
	<br>
	<br>

	<hr>

	<h4>🔔 Notifications</h4>

	<a href="notifications.jsp"> 🔔 View Notifications </a>

	<br>
	<br>

	<hr>

	<a href="<%= request.getContextPath() %>/DoctorLogoutServlet"> 🚪
		Logout </a>

</body>
</html>