<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receptionist Login - Hospital Management System</title>
</head>
<body>

    <div class="login-card">

        <h2 class="login-title">👩‍💼 Receptionist Login</h2>

        <form action="<%=request.getContextPath()%>/ReceptionistLoginServlet"
              method="post">

            <div>
                <label>Username</label><br>
                <input type="text"
                       name="username"
                       placeholder="Enter Username"
                       required>
            </div>

            <br>

            <div>
                <label>Password</label><br>
                <input type="password"
                       name="password"
                       placeholder="Enter Password"
                       required>
            </div>

            <br>

            <button type="submit">
                Login
            </button>

        </form>

        <br>

        <a href="<%=request.getContextPath()%>/index.html">
            ⬅ Back to Home
        </a>

    </div>

</body>
</html>