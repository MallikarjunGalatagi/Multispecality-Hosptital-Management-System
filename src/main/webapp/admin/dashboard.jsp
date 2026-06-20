<%@ page import="com.hospital_management.model.Admin"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
HttpSession currentSession = request.getSession(false);

if(currentSession == null ||
currentSession.getAttribute("loggedInAdmin") == null){


response.sendRedirect(
    request.getContextPath()
    + "/admin/admin_login.jsp");
return;


}

Admin admin =
(Admin) currentSession.getAttribute("loggedInAdmin");

String selectedPage =
request.getParameter("page");

if(selectedPage == null){
selectedPage = "dashboard";
}
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link rel="stylesheet" href="../css/navbar.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/auth.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/style.css">


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body>

<div class="page-wrapper">


<%@ include file="../common/navbar.jsp"%>

<div class="dashboard-layout">

    <%@ include file="admin_sidebar.jsp"%>

    <div class="content-area">

    <%
    if("departments".equals(selectedPage)){
    %>

        <jsp:include page="../dept/view_dept.jsp"/>

    <%
    }
    else if("doctors".equals(selectedPage)){
    %>

        <jsp:include page="../doctor/view_doctor.jsp"/>

    <%
    }
    else if("receptionists".equals(selectedPage)){
    %>

        <jsp:include page="../receptionist/view_receptionist.jsp"/>

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
            Welcome, <%= admin.getFullName() %>
        </h1>

        <p class="welcome-text">
            Manage doctors, departments,
            receptionists and hospital operations.
        </p>

        <div class="stats-container">

            <div class="stats-card">

                <i class="fas fa-building"></i>

                <h3>Departments</h3>

                <p>
                    Manage hospital departments.
                </p>

            </div>

            <div class="stats-card">

                <i class="fas fa-user-doctor"></i>

                <h3>Doctors</h3>

                <p>
                    Add and manage doctors.
                </p>

            </div>

            <div class="stats-card">

                <i class="fas fa-user-tie"></i>

                <h3>Receptionists</h3>

                <p>
                    Manage receptionist accounts.
                </p>

            </div>

        </div>

        <div class="content-card">

            <h2>Quick Actions</h2>

            <div class="profile-details">

                <a href="<%= request.getContextPath() %>/dept/add_dept.jsp"
                   class="card-btn">

                    Add Department

                </a>

                <a href="<%= request.getContextPath() %>/doctor/add_doctor.jsp"
                   class="card-btn">

                    Add Doctor

                </a>

                <a href="<%= request.getContextPath() %>/receptionist/add_receptionist.jsp"
                   class="card-btn">

                    Add Receptionist

                </a>

                <a href="dashboard.jsp?page=departments"
                   class="card-btn">

                    View Departments

                </a>

                <a href="dashboard.jsp?page=doctors"
                   class="card-btn">

                    View Doctors

                </a>

                <a href="dashboard.jsp?page=receptionists"
                   class="card-btn">

                    View Receptionists

                </a>

            </div>

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
