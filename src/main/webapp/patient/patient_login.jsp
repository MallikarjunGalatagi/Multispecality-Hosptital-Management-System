
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Login</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/navbar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/auth.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/patient.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body>

	<%@ include file="../common/navbar.jsp"%>

	<div class="auth-container">

		<div class="auth-card">

			<div class="auth-icon">
				<img src="${pageContext.request.contextPath}/images/patient.png"
					alt="Patient">
			</div>

			<h2>Patient Login</h2>

			

			<%
        String error =
                request.getParameter("error");

        String success =
                request.getParameter("success");
        %>

			<% if("invalid".equals(error)){ %>

			<div class="error-message">Wrong Username or Password</div>

			<% } %>

			<% if("registered".equals(success)){ %>

			<div class="success-message">Registration Successful. Please
				Login.</div>

			<% } %>

			<form action="../PatientLoginServlet" method="post"
				autocomplete="off">

				<div class="input-group">

					<input type="text" name="usernameOrEmail"
						placeholder="Username or Email" autocomplete="off" required>

				</div>

				<div class="input-group">

					<div class="password-box">

						<input type="password" id="password" name="password"
							placeholder="Password" autocomplete="new-password" required>

						<i class="fa-solid fa-eye" id="togglePassword"></i>

					</div>

				</div>

				<button type="submit" class="auth-btn">Login</button>

			</form>

			<div class="auth-links">

				<a href="patient_register.jsp"> New User? Register Here </a> <a
					href="${pageContext.request.contextPath}/index.jsp"> Back to
					Home </a>

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

</script>



</body>
</html>
