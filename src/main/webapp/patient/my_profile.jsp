<%@ page import="com.hospital_management.model.Patient"%>

<%
Patient patient =
    (Patient) request.getAttribute("patient");

if(patient == null){
    patient =
        (Patient) session.getAttribute("loggedInPatient");
}

String success =
request.getParameter("success");
%>

<div class="auth-card profile-card">

	<h2>
		<i class="fas fa-user"></i> My Profile
	</h2>

	<p class="auth-subtitle">Manage your personal information</p>

	<% if("updated".equals(success)){ %>

	<div class="success-message">Profile Updated Successfully!</div>

	<% } %>

	<form action="../UpdatePatientProfileServlet" method="post">

		<input type="hidden" name="patientId"
			value="<%= patient.getPatientId() %>">

		<div class="input-group">

			<input type="text" value="<%= patient.getPatientId() %>" readonly>

		</div>

		<div class="input-group">

			<input type="text" class="profile-input" name="fullName"
				value="<%= patient.getFullName() %>" placeholder="Enter Full Name"
				readonly>

		</div>

		<div class="input-group">

			<input type="text" class="profile-input" name="username"
				value="<%= patient.getUsername() %>" placeholder="Enter Username"
				readonly>

		</div>

		<div class="input-group">

			<input type="email" class="profile-input" name="email"
				value="<%= patient.getEmail() %>" placeholder="Enter Email" readonly>

		</div>

		<div class="input-group">

			<input type="text" class="profile-input" name="mobile"
				value="<%= patient.getMobile() %>" placeholder="Enter Mobile Number"
				readonly>

		</div>

		<div class="input-group">

			<input type="text" class="profile-input" name="gender"
				value="<%= patient.getGender() %>" placeholder="Enter Gender"
				readonly>

		</div>

		<button type="button" id="editBtn" class="auth-btn">Edit
			Profile</button>

		<button type="submit" id="updateBtn" class="auth-btn"
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