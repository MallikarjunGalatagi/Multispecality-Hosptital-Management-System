<%@ page contentType="text/html;charset=UTF-8" %>

<div class="sidebar">

    <div class="sidebar-header">

        <img src="../images/admin.png"
             alt="Admin">

        <h2 class="sidebar-title">
            Admin
        </h2>

    </div>

    <a href="dashboard.jsp?page=dashboard">

        <i class="fas fa-house"></i>

        Dashboard

    </a>

    <a href="dashboard.jsp?page=departments">

        <i class="fas fa-building"></i>

        Departments

    </a>

    <a href="dashboard.jsp?page=doctors">

        <i class="fas fa-user-doctor"></i>

        Doctors

    </a>

    <a href="dashboard.jsp?page=receptionists">

        <i class="fas fa-user-tie"></i>

        Receptionists

    </a>

    <a href="dashboard.jsp?page=notifications">

        <i class="fas fa-bell"></i>

        Notifications

    </a>

    <a href="<%= request.getContextPath() %>/AdminLogoutServlet"
       class="logout-link">

        <i class="fas fa-right-from-bracket"></i>

        Logout

    </a>

</div>