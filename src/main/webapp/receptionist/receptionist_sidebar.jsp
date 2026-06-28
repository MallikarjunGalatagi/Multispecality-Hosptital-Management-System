<div class="sidebar">

<div class="sidebar-header">

    <img src="../images/receptionist.png" alt="Receptionist">

    <h2 class="sidebar-title">
        Receptionist
    </h2>

</div>

<a href="<%= request.getContextPath() %>/receptionist/dashboard.jsp?page=dashboard">

    <i class="fas fa-house"></i>
    Dashboard

</a>
<a href="dashboard.jsp?page=profile">

    <i class="fas fa-user"></i>
    My Profile

</a>

<a href="dashboard.jsp?page=appointments">

    <i class="fas fa-calendar-check"></i>
    Appointments

</a>

<a href="dashboard.jsp?page=notifications">

    <i class="fas fa-bell"></i>
    Notifications

</a>

<a href="<%=request.getContextPath()%>/ReceptionistLogoutServlet"
   class="logout-link">

    <i class="fas fa-right-from-bracket"></i>
    Logout

</a>

</div>
