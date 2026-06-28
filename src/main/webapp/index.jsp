<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Hospital Management System</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/footer.css">

</head>

<body>

	<%@ include file="common/navbar.jsp"%>

	<div class="header">

		<h1>Multispeciality Hospital Management System</h1>

	</div>

	<div class="card-container">

		<!-- PATIENT -->

		<div class="role-card patient-card">

			<div class="icon-circle">

				<img src="images/patient.png" alt="Patient">

			</div>

			<h3>Patient</h3>

			<p>
				Register<br> Book Appointments<br> View Prescriptions<br>
				Medical Records
			</p>

			<a href="patient/patient_login.jsp">

				<button class="card-btn">Enter</button>

			</a>

		</div>

		<!-- DOCTOR -->

		<div class="role-card doctor-card">

			<div class="icon-circle">

				<img src="images/doctor.png" alt="Doctor">

			</div>

			<h3>Doctor</h3>

			<p>
				View Patients<br> Manage Appointments<br> Add Diagnosis<br>
				Prescribe Medicines
			</p>

			<a href="doctor/doctor_login.jsp">

				<button class="card-btn">Enter</button>

			</a>

		</div>

		<!-- RECEPTIONIST -->

		<div class="role-card reception-card">

			<div class="icon-circle">

				<img src="images/receptionist.png" alt="Receptionist">

			</div>

			<h3>Receptionist</h3>

			<p>
				Queue Management<br> Schedule Appointments<br>Confirm/Reject Appointments<br> Manage
				Patient Records
			</p>

			<a href="receptionist/receptionist_login.jsp">

				<button class="card-btn">Enter</button>

			</a>

		</div>

		<!-- ADMIN -->

		<div class="role-card admin-card">

			<div class="icon-circle">

				<img src="images/admin.png" alt="Admin">

			</div>

			<h3>Admin</h3>

			<p>
				Manage Departments<br> Manage Doctors<br> Manage
				Receptionists<br> Manage Hospital Operations
			</p>

			<a href="admin/admin_login.jsp">

				<button class="card-btn">Enter</button>

			</a>

		</div>

	</div>

	<%@ include file="common/footer.jsp"%>

	

</body>
</html>