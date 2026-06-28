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
    <i class="fas fa-user-edit"></i> Edit Profile
</h2>

<p class="auth-subtitle">
    Update your account information
</p>

<form action="../UpdateReceptionistProfileServlet"
      method="post"
      onsubmit="return cleanValues();">

    <input type="hidden"
           name="receptionistId"
           value="<%= receptionist.getReceptionistId() %>">

    <div class="profile-details">

        <div class="input-group">
            <input type="text"
                   value="Receptionist ID : <%= receptionist.getReceptionistId() %>"
                   readonly>
        </div>

        <div class="input-group">
            <input type="text"
                   id="fullName"
                   name="fullName"
                   value="Full Name : <%= receptionist.getFullName() %>"
                   required>
        </div>

        <div class="input-group">
            <input type="text"
                   id="username"
                   name="username"
                   value="Username : <%= receptionist.getUsername() %>"
                   required>
        </div>

        <div class="input-group">
            <input type="text"
                   id="email"
                   name="email"
                   value="Email : <%= receptionist.getEmail() %>"
                   required>
        </div>

        <div class="input-group">
            <input type="text"
                   id="mobile"
                   name="mobile"
                   value="Mobile : <%= receptionist.getMobile() %>"
                   required>
        </div>

        <div class="input-group">
            <input type="text"
                   id="password"
                   name="password"
                   value="Password : <%= receptionist.getPassword() %>"
                   required>
        </div>

        <div class="input-group">
            <input type="text"
                   value="Account Created : <%= receptionist.getCreatedAt() %>"
                   readonly>
        </div>

    </div>

   <div class="profile-actions">
    <button type="submit"
            class="btn-update-profile">
        Update Profile
    </button>
</div>

</form>

</div>

<script>

function cleanValues(){

    document.getElementById("fullName").value =
        document.getElementById("fullName").value
        .replace("Full Name : ","");

    document.getElementById("username").value =
        document.getElementById("username").value
        .replace("Username : ","");

    document.getElementById("email").value =
        document.getElementById("email").value
        .replace("Email : ","");

    document.getElementById("mobile").value =
        document.getElementById("mobile").value
        .replace("Mobile : ","");

    document.getElementById("password").value =
        document.getElementById("password").value
        .replace("Password : ","");

    return true;
}

</script>
