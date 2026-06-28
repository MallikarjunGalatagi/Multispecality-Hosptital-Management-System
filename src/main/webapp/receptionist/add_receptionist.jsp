<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%
String error = request.getParameter("error");
%>

<style>
.form-card {
	max-width: 900px;
	margin: auto;
}

.form-row {
	display: grid;
	grid-template-columns: 180px 20px 1fr;
	align-items: center;
	height: 62px;
	padding: 0 22px;
	margin-bottom: 18px;
	border: 1px solid #dbe3f0;
	border-radius: 16px;
	background: #fff;
	transition: .3s;
}

.form-row:hover {
	border-color: #7c3aed;
	box-shadow: 0 0 0 3px rgba(124, 58, 237, .12);
}

.form-label {
	font-family: 'Poppins', sans-serif;
	font-size: 16px;
	font-weight: 600;
	color: #0f172a;
}

.form-colon {
	text-align: center;
	font-size: 18px;
	font-weight: 700;
	color: #0f172a;
}

.form-input {
	width: 100%;
	height: 40px;
	border: none !important;
	outline: none !important;
	background: transparent !important;
	box-shadow: none !important;
	padding: 0;
	margin: 0;
	font-family: 'Poppins', sans-serif;
	font-size: 16px;
	color: #334155;
}

.form-input::placeholder {
	color: #94a3b8;
}

.button-group {
	display: flex;
	gap: 15px;
	margin-top: 30px;
}

.button-group .btn {
	min-width: 170px;
}
</style>

<h2 class="page-title">
	<i class="fas fa-user-plus"></i> Add Receptionist
</h2>

<p class="auth-subtitle">Add a new receptionist to the hospital.</p>

<%
if(error != null){
%>

<div id="errorMessage"
	style="background: #fee2e2; color: #b91c1c; padding: 12px 20px; border-radius: 10px; margin: 20px auto; font-weight: 600; text-align: center; width: fit-content; min-width: 320px;">

	❌
	<%= error %>

</div>

<%
}
%>

<div class="content-card form-card">

	<form action="<%=request.getContextPath()%>/AddReceptionistServlet"
		method="post">

		<!-- Full Name -->

		<div class="form-row">

			<span class="form-label"> Full Name </span> <span class="form-colon">:</span>

			<input type="text" name="fullName" class="form-input"
				placeholder="Enter Full Name" required>

		</div>

		<!-- Username -->

		<div class="form-row">

			<span class="form-label"> Username </span> <span class="form-colon">:</span>

			<input type="text" name="username" class="form-input"
				placeholder="Enter Username" required>

		</div>

		<!-- Email -->

		<div class="form-row">

			<span class="form-label"> Email </span> <span class="form-colon">:</span>

			<input type="email" name="email" class="form-input"
				placeholder="Enter Email" required>

		</div>

		<!-- Mobile Number -->

		<div class="form-row">

			<span class="form-label"> Mobile Number </span> <span
				class="form-colon">:</span> <input type="text" name="mobile"
				class="form-input" placeholder="Enter Mobile Number" required>

		</div>

		<!-- Password -->

		<div class="form-row">

			<span class="form-label"> Password </span> <span class="form-colon">:</span>

			<input type="password" name="password" class="form-input"
				placeholder="Enter Password" required>

		</div>

		<!-- Buttons -->

		<div class="button-group">

			<button type="submit" class="btn">Save Receptionist</button>

			<a
				href="<%= request.getContextPath() %>/admin/dashboard.jsp?page=receptionists"
				class="btn"> Back </a>

		</div>

	</form>

</div>