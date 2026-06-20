<%@ page import="com.hospital_management.model.Receptionist"%>

<%
Receptionist receptionist =
(Receptionist) session.getAttribute("loggedInReceptionist");

if(receptionist == null){
response.sendRedirect("receptionist_login.jsp");
return;
}

String selectedPage = request.getParameter("page");

if(selectedPage == null){
selectedPage = "dashboard";
}
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Receptionist Dashboard</title>

<link rel="stylesheet" href="../css/navbar.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/receptionist.css">
<link rel="stylesheet" href="../css/auth.css">
<link rel="stylesheet" href="../css/style.css">


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body>

<div class="page-wrapper">

<%@ include file="../common/navbar.jsp"%>

<div class="dashboard-layout">

    <%@ include file="receptionist_sidebar.jsp"%>

    <div class="content-area">

        <%

        if("profile".equals(selectedPage)){
        %>

            <jsp:include page="my_profile.jsp"/>

        <%
        }

        else if("appointments".equals(selectedPage)){
        %>

            <jsp:include page="view_appointments.jsp"/>

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
                Welcome,
                <%= receptionist.getFullName() %>
            </h1>

            <p class="welcome-text">
                Manage appointment requests,
                patient scheduling and hospital
                communications efficiently.
            </p>

            <div class="stats-container">

                <div class="stats-card reception-card">

                    <i class="fas fa-calendar-check"></i>

                    <h3>
                        Appointments
                    </h3>

                    <p>
                        Manage patient appointment requests.
                    </p>

                </div>

                <div class="stats-card reception-card">

                    <i class="fas fa-users"></i>

                    <h3>
                        Patients
                    </h3>

                    <p>
                        Assist patients and coordinate visits.
                    </p>

                </div>

                <div class="stats-card reception-card">

                    <i class="fas fa-bell"></i>

                    <h3>
                        Notifications
                    </h3>

                    <p>
                        View important hospital updates.
                    </p>

                </div>

            </div>

            <div class="content-card">

                <h2>
                    Receptionist Services
                </h2>

                <p>
                    Use the menu on the left to manage
                    appointment requests, maintain your
                    profile and receive hospital
                    notifications.
                </p>

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
