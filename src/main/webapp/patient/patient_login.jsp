<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Login</title>
</head>
<body>

    <h1>Patient Login</h1>
    <hr>

    <form action="../PatientLoginServlet" method="post" autocomplete="off">

        <label>Username or Email:</label><br>
        <input type="text" name="usernameOrEmail" autocomplete="off" required>
        <br><br>

        <label>Password:</label><br>
        <input type="password" name="password" autocomplete="new-password" required>
        <br><br>

        <button type="submit">Login</button>

    </form>

    <br>

    <a href="patient_register.jsp">New User? Register Here</a>
    <br><br>

    <a href="../index.jsp">Back to Home</a>

</body>
</html>