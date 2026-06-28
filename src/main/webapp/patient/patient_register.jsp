
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Registration</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/auth.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/patient.css">
	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>

<%@ include file="../common/navbar.jsp"%>

<div class="auth-container">

    <div class="auth-card">

        <div class="auth-icon">
            <img src="../images/patient.png" alt="Patient">
        </div>

        <h2>Patient Registration</h2>

        <p class="auth-subtitle">
            Create your account to access hospital services.
        </p>

        <%
        String error = request.getParameter("error");
        %>

        <% if("password".equals(error)){ %>

        <div class="error-message">
            Password and Confirm Password do not match.
        </div>

        <% } %>

        <% if("failed".equals(error)){ %>

        <div class="error-message">
            Registration Failed. Please Try Again.
        </div>

        <% } %>

        <form action="../PatientRegistrationServlet"
              method="post"
              autocomplete="off">

            <div class="input-group">

                <input type="text"
                       name="fullName"
                       placeholder="Full Name"
                       required>

            </div>

            <div class="input-group">

                <input type="text"
                       name="username"
                       placeholder="Username"
                       autocomplete="off"
                       required>

            </div>

            <div class="input-group">

                <input type="email"
                       name="email"
                       placeholder="Email Address"
                       autocomplete="off"
                       required>

            </div>

            <div class="input-group">

                <input type="text"
                       name="mobile"
                       placeholder="Mobile Number"
                       required>

            </div>

            <div class="input-group">

                <select name="gender" required>

                    <option value="">
                        Select Gender
                    </option>

                    <option value="Male">
                        Male
                    </option>

                    <option value="Female">
                        Female
                    </option>

                    <option value="Other">
                        Other
                    </option>

                </select>

            </div>

            <div class="input-group">

                <div class="password-box">

                    <input type="password"
                           id="password"
                           name="password"
                           placeholder="Password"
                           autocomplete="new-password"
                           required>

                    <i class="fa-solid fa-eye"
                       id="togglePassword"></i>

                </div>

            </div>

            <div class="input-group">

                <div class="password-box">

                    <input type="password"
                           id="confirmPassword"
                           name="confirmPassword"
                           placeholder="Confirm Password"
                           autocomplete="new-password"
                           required>

                    <i class="fa-solid fa-eye"
                       id="toggleConfirmPassword"></i>

                </div>

            </div>

            <button type="submit" class="auth-btn">
                Register
            </button>

        </form>

        <div class="auth-links">

            <a href="patient_login.jsp">
                Already have an account? Login
            </a>

            <a href="../index.jsp">
                Back to Home
            </a>

        </div>

    </div>

</div>

<%@ include file="../common/footer.jsp"%>

<script>

const togglePassword =
document.getElementById("togglePassword");

const password =
document.getElementById("password");

togglePassword.addEventListener("click", function(){

    const type =
        password.getAttribute("type") === "password"
        ? "text"
        : "password";

    password.setAttribute("type", type);

    this.classList.toggle("fa-eye");
    this.classList.toggle("fa-eye-slash");
});

const toggleConfirmPassword =
document.getElementById("toggleConfirmPassword");

const confirmPassword =
document.getElementById("confirmPassword");

toggleConfirmPassword.addEventListener("click", function(){

    const type =
        confirmPassword.getAttribute("type") === "password"
        ? "text"
        : "password";

    confirmPassword.setAttribute("type", type);

    this.classList.toggle("fa-eye");
    this.classList.toggle("fa-eye-slash");
});

</script>

</body>
</html>

