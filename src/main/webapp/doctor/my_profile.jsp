<%@ page import="com.hospital_management.model.Doctor"%>

<%
Doctor doctor =
(Doctor) session.getAttribute("loggedInDoctor");

String success =
request.getParameter("success");
%>

<div class="auth-card profile-card">

	<h2>
		<i class="fas fa-user-doctor"></i> My Profile
	</h2>
	
		<p class="auth-subtitle">Manage your personal information</p>
	

	<% if("updated".equals(success)){ %>

	<div class="success-message">Profile Updated Successfully!</div>

	<% } %>

	<form action="../UpdateDoctorProfileServlet" method="post">

		<input type="hidden" name="doctorId"
			value="<%= doctor.getDoctorId() %>">

		<div class="profile-details">

			<div class="input-group">

				<label>Doctor ID</label> <input type="text"
					value="<%= doctor.getDoctorId() %>" readonly>

			</div>

			<div class="input-group">

				<label>Full Name</label> <input type="text" class="profile-input"
					name="fullName" placeholder="Enter Full Name"
					value="<%= doctor.getFullName() %>" readonly>

			</div>

			<div class="input-group">

				<label>Username</label> <input type="text" class="profile-input"
					name="username" placeholder="Enter Username"
					value="<%= doctor.getUsername() %>" readonly>

			</div>

			<div class="input-group">

				<label>Email</label> <input type="email" class="profile-input"
					name="email" placeholder="Enter Email"
					value="<%= doctor.getEmail() %>" readonly>

			</div>

			<div class="input-group">

				<label>Mobile</label> <input type="text" class="profile-input"
					name="mobile" placeholder="Enter Mobile Number"
					value="<%= doctor.getMobile() %>" readonly>

			</div>

			<div class="input-group">

				<label>Gender</label> <input type="text" class="profile-input"
					name="gender" placeholder="Enter Gender"
					value="<%= doctor.getGender() %>" readonly>

			</div>

			<div class="input-group">

				<label>Qualification</label> <input type="text"
					value="<%= doctor.getQualification() %>" readonly>

			</div>

			<div class="input-group">

				<label>Department ID</label> <input type="text"
					value="<%= doctor.getDepartmentId() %>" readonly>

			</div>

		</div>

		<br>

		<button type="button" id="editBtn" class="card-btn">Edit
			Profile</button>

		<button type="submit" id="updateBtn" class="card-btn"
			style="display: none;">Update Profile</button>

	</form>

</div>

<script>

document.getElementById("editBtn")
.addEventListener("click", function(){

    document
    .querySelectorAll(".profile-input")
    .forEach(function(input){

        input.removeAttribute("readonly");

    });

    document
    .getElementById("updateBtn")
    .style.display = "inline-block";

    this.style.display = "none";
});

</script>
