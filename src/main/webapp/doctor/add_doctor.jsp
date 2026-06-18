<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Add Doctor</title>
</head>
<body>

    <h1>Add Doctor</h1>
    <hr>

    <form action="../AddDoctorServlet" method="post" autocomplete="off">

        <label>Full Name:</label><br>
        <input type="text" name="fullName" required>
        <br><br>

        <label>Username:</label><br>
        <input type="text" name="username" autocomplete="off" required>
        <br><br>

        <label>Email:</label><br>
        <input type="email" name="email" autocomplete="off" required>
        <br><br>

        <label>Mobile:</label><br>
        <input type="text" name="mobile" required>
        <br><br>

        <label>Gender:</label><br>
        <select name="gender" required>
            <option value="">--Select Gender--</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select>
        <br><br>

        <label>Qualification:</label><br>
        <input type="text" name="qualification" required>
        <br><br>

        <label>Department:</label><br>
        <select name="departmentId" required>
            <option value="">--Select Department--</option>

            <%
                for (Department department : departmentList) {
            %>
                <option value="<%= department.getDepartmentId() %>">
                    <%= department.getDepartmentName() %>
                </option>
            <%
                }
            %>
        </select>
        <br><br>

        <label>Password:</label><br>
        <input type="password"
               name="password"
               autocomplete="new-password"
               required>
        <br><br>

        <button type="submit">Add Doctor</button>

    </form>

    <br>

   <a href="<%= request.getContextPath() %>/admin/dashboard.jsp">
        ⬅ Back to Dashboard
    </a>

</body>
</html>