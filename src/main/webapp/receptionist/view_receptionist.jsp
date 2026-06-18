<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.dao.ReceptionistDAO"%>
<%@ page import="com.hospital_management.model.Receptionist"%>

<%
    // Admin session check
    Object admin = session.getAttribute("loggedInAdmin"); 
    // Change "loggedInAdmin" if you use a different session attribute

    if (admin == null) {
        response.sendRedirect("../admin/admin_login.jsp");
        return;
    }

    ReceptionistDAO receptionistDAO = new ReceptionistDAO();
    List<Receptionist> receptionistList = receptionistDAO.getAllReceptionists();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Receptionists</title>
</head>
<body>

    <h2>View Receptionists</h2>
    <hr><br>

    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>Receptionist ID</th>
            <th>Full Name</th>
            <th>Username</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Created At</th>
        </tr>

        <%
            if (receptionistList != null && !receptionistList.isEmpty()) {
                for (Receptionist receptionist : receptionistList) {
        %>

        <tr>
            <td><%= receptionist.getReceptionistId() %></td>
            <td><%= receptionist.getFullName() %></td>
            <td><%= receptionist.getUsername() %></td>
            <td><%= receptionist.getEmail() %></td>
            <td><%= receptionist.getMobile() %></td>
            <td><%= receptionist.getCreatedAt() %></td>
        </tr>

        <%
                }
            } else {
        %>

        <tr>
            <td colspan="6">No Receptionists Found.</td>
        </tr>

        <%
            }
        %>

    </table>

    <br><br>

    <a href="<%=request.getContextPath()%>/admin/dashboard.jsp">
        ⬅ Back to Admin Dashboard
    </a>

</body>
</html>