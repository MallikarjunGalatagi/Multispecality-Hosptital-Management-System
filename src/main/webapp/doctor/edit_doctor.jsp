<%@ page import="com.hospital_management.model.Receptionist"%>

<%
Receptionist receptionist =
(Receptionist) session.getAttribute("loggedInReceptionist");

if(receptionist == null){
response.sendRedirect("receptionist_login.jsp");
return;
}
%>

<div class="auth-card profile-card">



<h2>
		<i class="fas fa-user"></i> My Profile
	</h2>
<p class="auth-subtitle">
    View your receptionist account information
</p>

<div class="profile-details">

    <div class="input-group">

        <label>Receptionist ID</label>

        <input type="text"
               value="<%= receptionist.getReceptionistId() %>"
               readonly>

    </div>

    <div class="input-group">

        <label>Full Name</label>

        <input type="text"
               value="<%= receptionist.getFullName() %>"
               readonly>

    </div>

    <div class="input-group">

        <label>Username</label>

        <input type="text"
               value="<%= receptionist.getUsername() %>"
               readonly>

    </div>

    <div class="input-group">

        <label>Email</label>

        <input type="email"
               value="<%= receptionist.getEmail() %>"
               readonly>

    </div>

    <div class="input-group">

        <label>Mobile</label>

        <input type="text"
               value="<%= receptionist.getMobile() %>"
               readonly>

    </div>

    <div class="input-group">

        <label>Account Created</label>

        <input type="text"
               value="<%= receptionist.getCreatedAt() %>"
               readonly>

    </div>

</div>

</div>
