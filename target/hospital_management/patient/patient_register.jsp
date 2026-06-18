<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Registration</title>
</head>
<body>

    <h1>Patient Registration</h1>
    <hr>

    <form action="../PatientRegistrationServlet" method="post" autocomplete="off">

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
            <option value="Other">Other</option>
        </select>
        <br><br>

        <label>Password:</label><br>
        <input type="password" name="password" autocomplete="new-password" required>
        <br><br>

        <button type="submit">Register</button>

    </form>

    <br>

    <a href="../index.html">Back to Home</a>

</body>
</html>