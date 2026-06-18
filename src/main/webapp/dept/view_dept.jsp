<%@ page import="java.util.List" %>
<%@ page import="com.hospital_management.dao.DepartmentDAO" %>
<%@ page import="com.hospital_management.model.Department" %>

<%
    DepartmentDAO departmentDAO = new DepartmentDAO();
    List<Department> departmentList = departmentDAO.getAllDepartments();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Departments</title>
</head>
<body>

    <h1>View Departments</h1>
    <hr>

 

    <br><br>

    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Department Name</th>
            <th>Description</th>
            <th colspan=2>Action</th>
        </tr>

        <%
            for (Department department : departmentList) {
        %>
        <tr>
            <td><%= department.getDepartmentId() %></td>
            <td><%= department.getDepartmentName() %></td>
            <td><%= department.getDescription() %></td>
            
             <td>
        <a href="edit_dept.jsp?id=<%= department.getDepartmentId() %>">
            Edit
        </a>
    </td>
            <td>
                <a href="<%= request.getContextPath() %>/DeleteDepartmentServlet?id=<%= department.getDepartmentId() %>"
                   onclick="return confirm('Are you sure you want to delete this department?');">
                    Delete
                </a>
            </td>
        </tr>
        <%
            }
        %>

    </table>

    <br><br>
    <a href="<%= request.getContextPath() %>/admin/dashboard.jsp">
        ⬅ Back to Dashboard
    </a>
</body>
</html>