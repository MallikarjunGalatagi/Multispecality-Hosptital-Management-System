
<%@ page import="com.hospital_management.model.Doctor"%>

<%
Doctor doctor = (Doctor) session.getAttribute("loggedInDoctor");

if (doctor == null) {
    response.sendRedirect("doctor_login.jsp");
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
<title>Doctor Dashboard</title>

<link rel="stylesheet" href="../css/navbar.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/auth.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/doctor.css">



<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body class="doctor-theme">

<div class="page-wrapper">

    <%@ include file="../common/navbar.jsp"%>

    <div class="dashboard-layout">

        <%@ include file="doctor_sidebar.jsp"%>

        <div class="content-area">

            <%

            if("profile".equals(selectedPage)
                    || "myprofile".equals(selectedPage)){

                request.setAttribute("doctor", doctor);

            %>

                <jsp:include page="my_profile.jsp"/>

            <%
            }
            
            else if("myprofile".equals(page)){
            	%>
            	    <jsp:include page="my_profile.jsp"/>
            	<%
            	}

            else if("appointments".equals(selectedPage)){
            	%>

            	    <jsp:include page="view_my_appointment.jsp"/>

            	<%
            	}

            	else if("addPrescription".equals(selectedPage)){
            	%>

            	    <jsp:include page="add_prescription.jsp"/>

            	<%
            	}

            	else if("notifications".equals(selectedPage)){
            	%>

            	    <jsp:include page="notifications.jsp"/>

            	<%
            	}

            else{
            %>

                <h1 class="page-title">
                    Welcome, Dr. <%= doctor.getFullName() %>
                </h1>

                <p class="welcome-text">
                    Manage appointments, prescriptions and patient records
                    efficiently from one place.
                </p>

                <div class="stats-container">

                    <div class="stats-card">

                        <i class="fas fa-calendar-check"></i>

                        <h3>Appointments</h3>

                        <p>
                            View and manage patient appointments.
                        </p>

                    </div>

                    <div class="stats-card" >

                        <i class="fas fa-file-medical"></i>

                        <h3>Prescriptions</h3>

                        <p>
                            Add prescriptions for confirmed appointments.
                        </p>

                    </div>

                    <div class="stats-card">

                        <i class="fas fa-bell"></i>

                        <h3>Notifications</h3>

                        <p>
                            Stay updated with hospital alerts.
                        </p>

                    </div>

                </div>

                <div class="content-card">

                    <h2>Doctor Services</h2>

                    <p>
                        Use the menu on the left to
                    </p>

                    <ul style="margin-left:20px; line-height:2;">

                        <li>View Your Profile</li>

                        <li>Manage Patient Appointments</li>

                        <li>Add Prescriptions</li>

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

