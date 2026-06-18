<%@ page import="java.sql.*" %>
<%@ page import="com.hospital_management.util.DBConnection" %>

<%
    int departmentId = Integer.parseInt(request.getParameter("id"));

    Connection con = DBConnection.getConnection();

    String query = "SELECT * FROM departments WHERE department_id = ?";

    PreparedStatement ps = con.prepareStatement(query);
    ps.setInt(1, departmentId);

    ResultSet rs = ps.executeQuery();

    String departmentName = "";
    String description = "";

    if (rs.next()) {
        departmentName = rs.getString("department_name");
        description = rs.getString("description");
    }

    rs.close();
    ps.close();
    con.close();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Department</title>
</head>
<body>

    <h1>Edit Department</h1>
    <hr>

    <form action="../UpdateDepartmentServlet" method="post">

        <input type="hidden" name="departmentId"
               value="<%= departmentId %>">

        <label>Department Name:</label><br>
        <input type="text"
               name="departmentName"
               value="<%= departmentName %>"
               required>
        <br><br>

        <label>Description:</label><br>
        <textarea name="description"
                  rows="4"
                  cols="40"><%= description %></textarea>
        <br><br>

        <button type="submit">Update Department</button>

    </form>

    <br>
    <a href="view_dept.jsp">Back to View Departments</a>

</body>
</html>