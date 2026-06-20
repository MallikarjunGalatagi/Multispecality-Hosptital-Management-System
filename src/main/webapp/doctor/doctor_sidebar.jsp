<div class="sidebar">

    <div class="sidebar-header">

        <img src="../images/doctor.png" alt="Doctor">

        <h2 class="sidebar-title">Doctor</h2>

    </div>

    <a href="doctor_dashboard.jsp?page=dashboard">

        <i class="fas fa-house"></i>
        Dashboard

    </a>

    <a href="doctor_dashboard.jsp?page=profile">

        <i class="fas fa-user-doctor"></i>
        My Profile

    </a>

    <a href="doctor_dashboard.jsp?page=appointments">

        <i class="fas fa-calendar-check"></i>
        My Appointments

    </a>

    <a href="doctor_dashboard.jsp?page=notifications">

        <i class="fas fa-bell"></i>
        Notifications

    </a>

    <a href="<%=request.getContextPath()%>/DoctorLogoutServlet"
       class="logout-link">

        <i class="fas fa-right-from-bracket"></i>
        Logout

    </a>

</div>
