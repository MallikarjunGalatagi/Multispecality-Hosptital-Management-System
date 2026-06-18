<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Hospital Management System</title>

    <!-- Bootstrap 5 CDN -->
</head>
<body>

<div class="login-card">
    <h2 class="login-title">Admin Login</h2>

<form action="<%=request.getContextPath()%>/AdminLoginServlet"
      method="post">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control"
                   placeholder="Enter Username" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control"
                   placeholder="Enter Password" required>
        </div>

        <button type="submit" class="btn btn-login">
            Login
        </button>

    </form>

</div>

</body>
</html>