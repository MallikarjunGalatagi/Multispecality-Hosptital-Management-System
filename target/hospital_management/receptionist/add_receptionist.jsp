<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Receptionist</title>
</head>
<body>

    <h1>➕ Add Receptionist</h1>
    <hr>

    <form action="<%=request.getContextPath()%>/AddReceptionistServlet"
          method="post">

        <label>Full Name:</label><br>
        <input type="text" name="fullName" required>
        <br><br>

        <label>Username:</label><br>
        <input type="text" name="username" required>
        <br><br>

        <label>Email:</label><br>
        <input type="email" name="email" required>
        <br><br>

        <label>Mobile:</label><br>
        <input type="text" name="mobile" required>
        <br><br>

        <label>Password:</label><br>
        <input type="password" name="password" required>
        <br><br>

        <button type="submit">Save Receptionist</button>

    </form>

    <br><br>

    <a href="dashboard.jsp">⬅ Back to Dashboard</a>

</body>
</html>