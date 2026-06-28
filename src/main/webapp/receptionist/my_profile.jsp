<%@ page import="com.hospital_management.model.Receptionist"%>

<%
Receptionist receptionist =
(Receptionist) session.getAttribute("loggedInReceptionist");

if(receptionist == null){
    response.sendRedirect("receptionist_login.jsp");
    return;
}

String success =
request.getParameter("success");
%>

<style>

.profile-card{
    max-width:900px;
    margin:auto;
}

.profile-row{
    display:grid;
    grid-template-columns:180px 20px 1fr;
    align-items:center;
    padding:15px 20px;
    margin-bottom:15px;
    border:1px solid #dbe3f0;
    border-radius:12px;
    background:#fff;
    transition:.3s;
}

.profile-row:hover{
    border-color:#f97316;
    box-shadow:0 0 0 4px rgba(249,115,22,.12);
}

.profile-label{
    font-family:'Poppins',sans-serif;
    font-size:16px;
    font-weight:600;
    color:#1e293b;
}

.profile-colon{
    text-align:center;
    font-size:18px;
    font-weight:700;
    color:#1e293b;
}

.profile-value,
.edit-input{

    display:none;

    width:100%;

    border:none !important;
    outline:none !important;
    background:transparent !important;
    box-shadow:none !important;

    padding:0 !important;
    margin:0 !important;

    font-family:'Poppins',sans-serif;
    font-size:16px;
    font-weight:500;
    color:#334155;
}

.edit-input:hover,
.edit-input:focus{

    border:none !important;
    outline:none !important;
    background:transparent !important;
    box-shadow:none !important;

}

.profile-value{
    display:block;
}

.edit-input{
    display:none;
}

</style>

<div class="auth-card profile-card">

<h2>
    <i class="fas fa-user-tie"></i>
    My Profile
</h2>

<p class="auth-subtitle">
    Manage your personal information
</p>

<% if("updated".equals(success)){ %>

<div class="success-message" id="successMsg">
    Profile Updated Successfully!
</div>

<% } %>

<form action="../UpdateReceptionistProfileServlet"
method="post">

<input
type="hidden"
name="receptionistId"
value="<%=receptionist.getReceptionistId()%>">

<!-- Receptionist ID -->

<div class="profile-row">

<span class="profile-label">
Receptionist ID
</span>

<span class="profile-colon">:</span>

<span class="profile-value">
<%=receptionist.getReceptionistId()%>
</span>

</div>

<!-- Full Name -->

<div class="profile-row">

<span class="profile-label">
Full Name
</span>

<span class="profile-colon">:</span>

<span class="profile-value editable">
<%=receptionist.getFullName()%>
</span>

<input
class="edit-input"
type="text"
name="fullName"
value="<%=receptionist.getFullName()%>">

</div>

<!-- Username -->

<div class="profile-row">

<span class="profile-label">
Username
</span>

<span class="profile-colon">:</span>

<span class="profile-value editable">
<%=receptionist.getUsername()%>
</span>

<input
class="edit-input"
type="text"
name="username"
value="<%=receptionist.getUsername()%>">

</div>

<!-- Email -->

<div class="profile-row">

<span class="profile-label">
Email
</span>

<span class="profile-colon">:</span>

<span class="profile-value editable">
<%=receptionist.getEmail()%>
</span>

<input
class="edit-input"
type="email"
name="email"
value="<%=receptionist.getEmail()%>">

</div>
<!-- Mobile Number -->

<div class="profile-row">

    <span class="profile-label">
        Mobile Number
    </span>

    <span class="profile-colon">:</span>

    <span class="profile-value editable">
        <%=receptionist.getMobile()%>
    </span>

    <input
        class="edit-input"
        type="text"
        name="mobile"
        value="<%=receptionist.getMobile()%>">

</div>

<!-- Password -->

<div class="profile-row">

    <span class="profile-label">
        Password
    </span>

    <span class="profile-colon">:</span>

    <span class="profile-value editable">
        <%=receptionist.getPassword()%>
    </span>

    <input
        class="edit-input"
        type="text"
        name="password"
        value="<%=receptionist.getPassword()%>">

</div>

<!-- Account Created -->

<div class="profile-row">

    <span class="profile-label">
        Account Created
    </span>

    <span class="profile-colon">:</span>

    <span class="profile-value">
        <%=receptionist.getCreatedAt()%>
    </span>

</div>

<!-- Buttons -->

<button
    type="button"
    id="editBtn"
    class="auth-btn">

    Edit Profile

</button>

<button
    type="submit"
    id="updateBtn"
    class="auth-btn"
    style="display:none;">

    Update Profile

</button>

</form>

</div>
<script>

// =====================================
// Edit Profile
// =====================================

const editBtn =
document.getElementById("editBtn");

const updateBtn =
document.getElementById("updateBtn");

editBtn.addEventListener("click", function(){

    // Hide all text values
    document.querySelectorAll(".editable")
    .forEach(function(span){

        span.style.display = "none";

    });

    // Show all input fields
    document.querySelectorAll(".edit-input")
    .forEach(function(input){

        input.style.display = "block";

    });

    // Hide Edit button
    editBtn.style.display = "none";

    // Show Update button
    updateBtn.style.display = "inline-block";

});


// =====================================
// Success Message (Auto Hide - 2 Sec)
// =====================================

const successMsg =
document.getElementById("successMsg");

if(successMsg){

    setTimeout(function(){

        successMsg.style.transition = "opacity .5s";
        successMsg.style.opacity = "0";

        setTimeout(function(){

            successMsg.style.display = "none";

        },500);

    },2000);

}

</script>