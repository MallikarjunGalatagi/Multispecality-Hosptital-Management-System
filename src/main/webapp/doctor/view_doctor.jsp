<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.dao.DoctorDAO"%>
<%@ page import="com.hospital_management.model.Doctor"%>

<%
Object admin = session.getAttribute("loggedInAdmin");

if(admin == null){
    response.sendRedirect("../admin/admin_login.jsp");
    return;
}

DoctorDAO doctorDAO = new DoctorDAO();
List<Doctor> doctorList = doctorDAO.getAllDoctors();

String success = request.getParameter("success");
String error = request.getParameter("error");
%>
<style>
.btn-delete {
	display: inline-block;
	min-width: 60px;
	padding: 6px 12px;
	border-radius: 8px;
	background: linear-gradient(135deg, #7c3aed, #8b5cf6);
	color: #fff !important;
	font-size: 13px;
	font-weight: 600;
	text-decoration: none;
	text-align: center;
	transition: .3s;
}

.btn-delete:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 18px rgba(124, 58, 237, .30);
}
</style>

<h2 class="page-title">
	<i class="fas fa-user-doctor"></i> Doctors
</h2>

<p class="auth-subtitle">View and manage all registered doctors.</p>

<%
if(success != null){
%>

<div id="successMessage"
	style="background: #dcfce7; color: #166534; padding: 12px 20px; border-radius: 8px; margin: 20px auto; font-weight: 600; text-align: center; width: fit-content; min-width: 300px; transition: opacity 0.5s ease;">

	✅
	<%= success %>

</div>

<script>
setTimeout(function() {
    var msg = document.getElementById("successMessage");

    if(msg){
        msg.style.opacity = "0";

        setTimeout(function(){
            msg.style.display = "none";
        }, 500);
    }
}, 2000);
</script>

<%
}
%>

<%
if(error != null){
%>

<div id="errorMessage"
	style="background: #fee2e2; color: #b91c1c; padding: 12px 20px; border-radius: 8px; margin: 20px auto; font-weight: 600; text-align: center; width: fit-content; min-width: 300px; transition: opacity 0.5s ease;">

	❌
	<%= error %>

</div>

<script>
setTimeout(function() {
    var msg = document.getElementById("errorMessage");

    if(msg){
        msg.style.opacity = "0";

        setTimeout(function(){
            msg.style.display = "none";
        }, 500);
    }
}, 2000);
</script>

<%
}
%>

<div class="table-container">

	<table class="appointment-table">

		<thead>
			<tr>
				<th>ID</th>
				<th>Full Name</th>
				<th>Username</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Gender</th>
				<th>Department</th>
				<th>Action</th>
			</tr>
		</thead>

		<tbody>

			<%
        if(doctorList != null && !doctorList.isEmpty()){

            for(Doctor doctor : doctorList){
        %>

			<tr>

				<td><%= doctor.getDoctorId() %></td>

				<td><%= doctor.getFullName() %></td>

				<td><%= doctor.getUsername() %></td>

				<td><%= doctor.getEmail() %></td>

				<td><%= doctor.getMobile() %></td>

				<td><%= doctor.getGender() %></td>

				<td><%= doctor.getDepartmentName() %></td>

				<td><a
					href="<%= request.getContextPath() %>/DeleteDoctorServlet?id=<%= doctor.getDoctorId() %>"
					onclick="return confirm('Are you sure you want to delete this doctor?');"
					style="display: inline-block; min-width: 80px; padding: 8px 14px; border-radius: 10px; background: linear-gradient(135deg, #7c3aed, #8b5cf6); color: #fff; font-size: 14px; font-weight: 600; text-decoration: none; text-align: center; transition: .3s;">

						Delete </a></td>

			</tr>

			<%
            }
        }
        else{
        %>

			<tr>

				<td colspan="8" style="text-align: center; padding: 25px;">No
					Doctors Found</td>

			</tr>

			<%
        }
        %>

		</tbody>

	</table>

</div>

<div style="margin-top: 30px; text-align: left; margin-left: 5px;">

	<a
		href="<%= request.getContextPath() %>/admin/dashboard.jsp?page=addDoctor"
		class="card-btn" style="display: inline-block; width: auto;"> Add
		Doctor </a>

</div>