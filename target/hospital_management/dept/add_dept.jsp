<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Department</title>
</head>
<body>

    <h1>➕ Add Department</h1>
    <hr>

    <form action="<%= request.getContextPath() %>/AddDepartmentServlet"
          method="post">

        <label>Department Name:</label>
        <br>
        <input type="text"
               name="departmentName"
               required>

        <br><br>

        <label>Description:</label>
        <br>
        <textarea name="description"
                  rows="4"
                  cols="40"></textarea>

        <br><br>

        <button type="submit">
            Add Department
        </button>

    </form>

    <br><br>

    <a href="<%= request.getContextPath() %>/admin/dashboard.jsp">
        ⬅ Back to Dashboard
    </a>

</body>
</html>