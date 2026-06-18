<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Login - Hospital Management System</title>
</head>
<body>

    <div class="login-card">

        <h2 class="login-title">👨‍⚕️ Doctor Login</h2>

        <form action="<%=request.getContextPath()%>/DoctorLoginServlet"
              method="post">

            <div>
                <label>Username or Email</label><br>
                <input type="text"
                       name="usernameOrEmail"
                       placeholder="Enter Username or Email"
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

        <br><br>

        <%
            String error = request.getParameter("error");
            if ("invalid".equals(error)) {
        %>
            <p style="color:red;">
                Invalid Username/Email or Password!
            </p>
        <%
            }
        %>

    </div>

</body>
</html>