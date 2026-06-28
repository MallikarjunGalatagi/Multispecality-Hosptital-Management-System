<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.dao.ReceptionistDAO"%>
<%@ page import="com.hospital_management.model.Receptionist"%>

<%
Object admin = session.getAttribute("loggedInAdmin");

if(admin == null){
    response.sendRedirect("../admin/admin_login.jsp");
    return;
}

ReceptionistDAO receptionistDAO =
        new ReceptionistDAO();

List<Receptionist> receptionistList =
        receptionistDAO.getAllReceptionists();

String success = request.getParameter("success");
String error = request.getParameter("error");
%>

<h2 class="page-title">
	<i class="fas fa-user-tie"></i> Receptionists
</h2>

<p class="auth-subtitle">View and manage all registered
	receptionists.</p>

<%
if(success != null){
%>

<div id="successMessage"
	style="background: #dcfce7; color: #166534; padding: 12px 20px; border-radius: 8px; margin: 20px auto; font-weight: 600; text-align: center; width: fit-content; min-width: 320px; transition: opacity 0.5s ease;">

	<%= success %>

</div>

<script>
setTimeout(function() {

    var msg =
        document.getElementById("successMessage");

    if(msg){

        msg.style.opacity = "0";

        setTimeout(function(){
            msg.style.display = "none";
        },500);
    }

},2000);
</script>

<%
}
%>

<%
if(error != null){
%>

<div id="errorMessage"
	style="background: #fee2e2; color: #b91c1c; padding: 12px 20px; border-radius: 8px; margin: 20px auto; font-weight: 600; text-align: center; width: fit-content; min-width: 320px; transition: opacity 0.5s ease;">

	❌
	<%= error %>

</div>

<script>
setTimeout(function() {

    var msg =
        document.getElementById("errorMessage");

    if(msg){

        msg.style.opacity = "0";

        setTimeout(function(){
            msg.style.display = "none";
        },500);
    }

},2000);
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
				<th>Created At</th>
				<th>Action</th>
			</tr>

		</thead>

		<tbody>

			<%
        if(receptionistList != null &&
           !receptionistList.isEmpty()){

            for(Receptionist receptionist
                    : receptionistList){
        %>

			<tr>

				<td><%= receptionist.getReceptionistId() %></td>

				<td><%= receptionist.getFullName() %></td>

				<td><%= receptionist.getUsername() %></td>

				<td><%= receptionist.getEmail() %></td>

				<td><%= receptionist.getMobile() %></td>

				<td><%= receptionist.getCreatedAt() %></td>

				<td><a
					href="<%= request.getContextPath() %>/DeleteReceptionistServlet?id=<%= receptionist.getReceptionistId() %>"
					onclick="return confirm('Are you sure you want to delete this receptionist?');"
					style="display: inline-block; min-width: 60px; padding: 6px 12px; border-radius: 8px; background: linear-gradient(135deg, #7c3aed, #8b5cf6); color: #fff; font-size: 13px; font-weight: 600; text-decoration: none; text-align: center; transition: .3s;">

						Delete </a></td>

			</tr>

			<%
            }
        }
        else{
        %>

			<tr>

				<td colspan="7" style="text-align: center; padding: 25px;">No
					Receptionists Found</td>

			</tr>

			<%
        }
        %>

		</tbody>

	</table>

</div>

<div style="margin-top: 30px; text-align: left; margin-left: 5px;">

	<a
		href="<%= request.getContextPath() %>/admin/dashboard.jsp?page=addReceptionist"
		class="card-btn" style="display: inline-block; width: auto;"> Add
		Receptionist </a>

</div>