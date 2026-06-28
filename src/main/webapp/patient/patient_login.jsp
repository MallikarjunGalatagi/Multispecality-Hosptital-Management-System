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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>


body,
input,
button,
select,
textarea,
label,
span,
div,
p,
h1,
h2,
h3,
h4,
h5,
h6,
a{

    font-family:'Poppins',sans-serif;
}

.fa,
.fas,
.fa-solid,
.far,
.fab{

    font-family:"Font Awesome 6 Free" !important;
    font-weight:900 !important;
}
/* Font */

/* Input */
.input-group input {
	width: 100%;
	padding: 15px 18px;
	padding-right: 50px;
	border: 1px solid #dbe3f0;
	border-radius: 12px;
	background: #fff;
	font-family: 'Poppins', sans-serif !important;
	font-size: 16px;
	font-weight: 500;
	/* Typed text */
	color: #1e293b !important;
	-webkit-text-fill-color: #1e293b !important;
	caret-color: #1e293b;
	transition: .3s;
}

/* Placeholder */
.input-group input::placeholder {
	color: #94a3b8 !important;
	opacity: 1;
	font-weight: 400;
}

/* Focus */
.input-group input:focus {
	border-color: #1565d8;
	box-shadow: 0 0 0 4px rgba(21, 101, 216, .18);
	outline: none;
}

/* Password */
.password-box {
	position: relative;
}

.password-box input {
	padding-right: 50px;
}

/* Eye Icon */
#togglePassword {
	position: absolute;
	top: 50%;
	right: 18px;
	transform: translateY(-50%);
	color: #94a3b8;
	font-size: 18px;
	cursor: pointer;
	z-index: 999;
}

#togglePassword:hover {
	color: #1565d8;
}
/* Placeholder */
input::placeholder{
    color:#94a3b8 !important;
    opacity:1 !important;
}

/* User typed text */
input{
    color:#1e293b !important;
    -webkit-text-fill-color:#1e293b !important;
}
</style>

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
String error=request.getParameter("error");
String success=request.getParameter("success");
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

						<i id="togglePassword" class="fa-solid fa-eye"></i>

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

    if(password.type === "password"){

        password.type = "text";

        this.classList.remove("fa-eye");

        this.classList.add("fa-eye-slash");

    }else{

        password.type = "password";

        this.classList.remove("fa-eye-slash");

        this.classList.add("fa-eye");

    }

});
const successMessage =
document.querySelector(".success-message");

if(successMessage){

    setTimeout(function(){

        successMessage.style.transition = "opacity .5s";

        successMessage.style.opacity = "0";

        setTimeout(function(){

            successMessage.style.display = "none";

        },500);

    },2000);

}

</script>

</body>

</html>