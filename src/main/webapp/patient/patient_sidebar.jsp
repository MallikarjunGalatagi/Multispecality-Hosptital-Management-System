
<div class="sidebar">

    <div class="sidebar-header">

        <img src="../images/patient.png" alt="Patient">

        <h2 class="sidebar-title">Patient</h2>

    </div>

    <a href="patient_dashboard.jsp?page=dashboard">
    <i class="fas fa-house"></i>
    Dashboard
</a>

<a href="patient_dashboard.jsp?page=profile">
    <i class="fas fa-user"></i>
    My Profile
</a>

<a href="patient_dashboard.jsp?page=take_appointment">
	<i class="fas fa-calendar-plus"></i>
	Take Appointments
</a>

<a href="patient_dashboard.jsp?page=appointments">
    <i class="fas fa-calendar-check"></i>
    My Appointments
</a>

<a href="patient_dashboard.jsp?page=prescriptions">
    <i class="fas fa-file-medical"></i>
    Prescriptions
</a>

<a href="patient_dashboard.jsp?page=notifications">
    <i class="fas fa-bell"></i>
    Notifications
</a>

<a href="<%=request.getContextPath()%>/PatientLogoutServlet"
   class="logout-link">

    <i class="fas fa-right-from-bracket"></i>
    Logout

</a>

</div>
