<%@ page import="com.hospital_management.model.Admin"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
    // Check Admin Session
    HttpSession currentSession = request.getSession(false);

    if (currentSession == null
            || currentSession.getAttribute("loggedInAdmin") == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/admin/admin_login.jsp");
        return;
    }

    Admin admin =
            (Admin) currentSession.getAttribute(
                    "loggedInAdmin");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body>

    <h1>👑 Admin Dashboard</h1>
    <hr>

    <h3>
        Welcome,
        <%= admin.getFullName() %>
    </h3>

    <p>You have successfully logged in.</p>

    <hr>

    <h4>🏢 Department Management</h4>

    <a href="<%= request.getContextPath() %>/dept/add_dept.jsp">
        ➕ Add Department
    </a>

    <br><br>

    <a href="<%= request.getContextPath() %>/dept/view_dept.jsp">
        📋 View Departments
    </a>

    <br><br>

    <hr>

    <h4>👨‍⚕️ Doctor Management</h4>

    <a href="<%= request.getContextPath() %>/doctor/add_doctor.jsp">
        ➕ Add Doctor
    </a>

    <br><br>

    <a href="<%= request.getContextPath() %>/doctor/view_doctor.jsp">
        📋 View Doctors
    </a>

    <br><br>

    <hr>

    <h4>👩‍💼 Receptionist Management</h4>

    <a href="<%= request.getContextPath() %>/receptionist/add_receptionist.jsp">
        ➕ Add Receptionist
    </a>

    <br><br>

    <a href="<%= request.getContextPath() %>/receptionist/view_receptionist.jsp">
        📋 View Receptionists
    </a>

    <br><br>

    <hr>

    <a href="<%= request.getContextPath() %>/AdminLogoutServlet">
        🚪 Logout
    </a>

</body>
</html>