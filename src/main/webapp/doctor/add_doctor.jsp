<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.dao.DepartmentDAO"%>
<%@ page import="com.hospital_management.model.Department"%>

<%
DepartmentDAO departmentDAO = new DepartmentDAO();
List<Department> departmentList = departmentDAO.getAllDepartments();

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

.form-row:hover {
	border-color: #7c3aed;
	box-shadow: 0 0 0 4px rgba(124, 58, 237, .12);
}

.form-label {
	font-family: 'Poppins', sans-serif;
	font-size: 16px;
	font-weight: 600;
	color: #1e293b;
}

.form-colon {
	text-align: center;
	font-size: 18px;
	font-weight: 700;
	color: #1e293b;
}

.form-input, .form-select {
	width: 100%;
	height: 40px;
	border: none !important;
	outline: none !important;
	background: transparent !important;
	box-shadow: none !important;
	padding: 0;
	margin: 0;
	font-size: 16px;
	font-family: 'Poppins', sans-serif;
	color: #334155;
}

.form-select {
	cursor: pointer;
}

.form-input::placeholder {
	color: #94a3b8;
}

.button-group {
	margin-top: 30px;
	display: flex;
	gap: 15px;
}

.button-group .btn {
	min-width: 170px;
}
</style>

<h2 class="page-title">
	<i class="fas fa-user-plus"></i> Add Doctor
</h2>

<p class="auth-subtitle">Add a new doctor to the hospital.</p>

<%
if(error != null){
%>

<div class="error-message">

	❌
	<%= error %>

</div>

<%
}
%>

<div class="content-card form-card">

	<form action="<%= request.getContextPath() %>/AddDoctorServlet"
		method="post" autocomplete="off">


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

		<!-- Mobile -->

		<div class="form-row">

			<span class="form-label"> Mobile Number </span> <span
				class="form-colon">:</span> <input type="text" name="mobile"
				class="form-input" placeholder="Enter Mobile Number" required>

		</div>

		<!-- Gender -->

		<div class="form-row">

			<span class="form-label"> Gender </span> <span class="form-colon">:</span>

			<select name="gender" class="form-select" required>

				<option value="">Select Gender</option>

				<option value="Male">Male</option>

				<option value="Female">Female</option>

			</select>

		</div>

		<!-- Qualification -->

		<div class="form-row">

			<span class="form-label"> Qualification </span> <span
				class="form-colon">:</span> <input type="text" name="qualification"
				class="form-input" placeholder="Enter Qualification" required>

		</div>

		<!-- Department -->

		<div class="form-row">

			<span class="form-label"> Department </span> <span class="form-colon">:</span>

			<select name="departmentId" class="form-select" required>

				<option value="">Select Department</option>

				<%
        for(Department department : departmentList){
        %>

				<option value="<%= department.getDepartmentId() %>">
					<%= department.getDepartmentName() %>
				</option>

				<%
        }
        %>

			</select>

		</div>

		<!-- Password -->

		<div class="form-row">

			<span class="form-label"> Password </span> <span class="form-colon">:</span>

			<input type="password" name="password" class="form-input"
				placeholder="Enter Password" required>

		</div>

		<!-- Buttons -->

		<div class="button-group">

			<button type="submit" class="btn">Add Doctors</button>

			<a
				href="<%= request.getContextPath() %>/admin/dashboard.jsp?page=doctors"
				class="btn"> Back </a>

		</div>

	</form>

</div>