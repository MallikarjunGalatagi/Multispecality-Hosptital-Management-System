<%@ page import="com.hospital_management.model.Doctor"%>

<%
Doctor doctor = (Doctor) session.getAttribute("loggedInDoctor");

String success = request.getParameter("success");
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
    border-color:#16a34a;
    box-shadow:0 0 0 4px rgba(22,163,74,.12);
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
    background:transparent !important;
    outline:none !important;
    box-shadow:none !important;

    padding:0 !important;
    margin:0 !important;

    font-family:'Poppins',sans-serif;
    font-size:16px;
    font-weight:500;
    color:#334155;
}

.profile-value{
    display:block;
}

.edit-input{

    display:none;
    width:100%;
    padding:8px 10px;
    border:1px solid #dbe3f0;
    border-radius:8px;
    outline:none;
    transition:.3s;
}

.edit-input:hover,
.edit-input:focus{

    border:none !important;
    background:transparent !important;
    outline:none !important;
    box-shadow:none !important;
}

</style>

<div class="auth-card profile-card">

<h2>
    <i class="fas fa-user-doctor"></i> My Profile
</h2>

<p class="auth-subtitle">
    Manage your personal information
</p>

<% if("updated".equals(success)){ %>

<div class="success-message" id="successMsg">
    Profile Updated Successfully!
</div>

<% } %>

<form action="../UpdateDoctorProfileServlet" method="post">

<input type="hidden"
       name="doctorId"
       value="<%=doctor.getDoctorId()%>">

<!-- Doctor ID -->

<div class="profile-row">

<span class="profile-label">
Doctor ID
</span>

<span class="profile-colon">:</span>

<span class="profile-value">
<%=doctor.getDoctorId()%>
</span>

</div>

<!-- Full Name -->

<div class="profile-row">

<span class="profile-label">
Full Name
</span>

<span class="profile-colon">:</span>

<span class="profile-value editable">
<%=doctor.getFullName()%>
</span>

<input
class="edit-input"
type="text"
name="fullName"
value="<%=doctor.getFullName()%>">

</div>

<!-- Username -->

<div class="profile-row">

<span class="profile-label">
Username
</span>

<span class="profile-colon">:</span>

<span class="profile-value editable">
<%=doctor.getUsername()%>
</span>

<input
class="edit-input"
type="text"
name="username"
value="<%=doctor.getUsername()%>">

</div>

<!-- Email -->

<div class="profile-row">

<span class="profile-label">
Email
</span>

<span class="profile-colon">:</span>

<span class="profile-value editable">
<%=doctor.getEmail()%>
</span>

<input
class="edit-input"
type="email"
name="email"
value="<%=doctor.getEmail()%>">
</div>
<!-- Mobile Number -->

<div class="profile-row">

    <span class="profile-label">
        Mobile Number
    </span>

    <span class="profile-colon">:</span>

    <span class="profile-value editable">
        <%=doctor.getMobile()%>
    </span>

    <input
        class="edit-input"
        type="text"
        name="mobile"
        value="<%=doctor.getMobile()%>">

</div>

<!-- Gender -->

<div class="profile-row">

    <span class="profile-label">
        Gender
    </span>

    <span class="profile-colon">:</span>

    <span class="profile-value editable">
        <%=doctor.getGender()%>
    </span>

    <input
        class="edit-input"
        type="text"
        name="gender"
        value="<%=doctor.getGender()%>">

</div>

<!-- Qualification -->

<div class="profile-row">

    <span class="profile-label">
        Qualification
    </span>

    <span class="profile-colon">:</span>

    <span class="profile-value">
        <%=doctor.getQualification()%>
    </span>

</div>

<!-- Department ID -->

<div class="profile-row">

    <span class="profile-label">
        Department ID
    </span>

    <span class="profile-colon">:</span>

    <span class="profile-value">
        <%=doctor.getDepartmentId()%>
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

// Edit Profile

const editBtn = document.getElementById("editBtn");
const updateBtn = document.getElementById("updateBtn");

editBtn.addEventListener("click", function(){

    document.querySelectorAll(".editable").forEach(function(span){

        span.style.display = "none";

    });

    document.querySelectorAll(".edit-input").forEach(function(input){

        input.style.display = "block";

    });

    editBtn.style.display = "none";
    updateBtn.style.display = "inline-block";

});

// Success Message (2 Seconds)

const successMsg = document.getElementById("successMsg");

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
