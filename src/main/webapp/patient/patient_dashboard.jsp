
<%@ page import="com.hospital_management.model.Patient"%>

<%
Patient patient = (Patient) session.getAttribute("loggedInPatient");

if (patient == null) {
    response.sendRedirect("patient_login.jsp");
    return;
}

String selectedPage = request.getParameter("page");

if (selectedPage == null) {
    selectedPage = "dashboard";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Dashboard</title>

<link rel="stylesheet" href="../css/navbar.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/patient.css">
<link rel="stylesheet" href="../css/auth.css">
<link rel="stylesheet" href="../css/style.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body>

	<div class="page-wrapper">

		<%@ include file="../common/navbar.jsp"%>

		<div class="dashboard-layout">

			<%@ include file="patient_sidebar.jsp"%>

			<div class="content-area">

				<%

            if("profile".equals(selectedPage)
                    || "myprofile".equals(selectedPage)){

                request.setAttribute("patient", patient);
            %>

				<jsp:include page="my_profile.jsp" />

				<%
            }

            

            else if("appointment".equals(selectedPage)
                    || "take_appointment".equals(selectedPage)){
            %>

				<jsp:include page="take_appointment.jsp" />

				<%
            }
            
            else if("appointments".equals(selectedPage)){
            	%>

				<jsp:include page="my_appointment.jsp" />

				<%
            	}
            
            else if("prescriptions".equals(selectedPage)){
            	%>

				<jsp:include page="view_prescription.jsp" />

				<%
            	}
            
            
            else if("notifications".equals(selectedPage)){
            %>

				<jsp:include page="notifications.jsp" />

				<%
            }
            


            else{
            %>

				<h1 class="page-title">
					Welcome,
					<%= patient.getFullName() %>
				</h1>

				<p class="welcome-text">Stay connected with your healthcare
					services. Book appointments, view prescriptions and track your
					medical records with ease.</p>

				<div class="stats-container">

					<div class="stats-card">

						<i class="fas fa-calendar-check"></i>

						<h3>Appointments</h3>

						<p>Manage and track your appointments.</p>

					</div>

					<div class="stats-card">

						<i class="fas fa-file-medical"></i>

						<h3>Prescriptions</h3>

						<p>Access your prescriptions anytime.</p>

					</div>

					<div class="stats-card">

						<i class="fas fa-bell"></i>

						<h3>Notifications</h3>

						<p>Stay updated with hospital alerts.</p>

					</div>

				</div>

				<div class="content-card" >

					<h2>Patient Services</h2>

					<p>Use the menu on the left to  ,  and receive notifications from
						the hospital.</p>
						 <ul style="margin-left:20px; line-height:2;">

                        <li>Manage Your Profile</li>
                        <li>Book Appointments</li>
                        <li>View Appointments</li>
                        
						<li>View Prescriptions</li>
						
                        <li>Check Notifications</li>

                    </ul>

				</div>

				<%
            }
            %>

			</div>

		</div>

		<%@ include file="../common/footer.jsp"%>

	</div>

</body>
</html>

