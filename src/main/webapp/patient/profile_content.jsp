
<%@ page import="com.hospital_management.model.Patient" %>

<%
Patient patient =
        (Patient) session.getAttribute("loggedInPatient");
%>

<h1 class="page-title">
    My Profile
</h1>

<div class="form-card">

    <form action="../UpdatePatientProfileServlet"
          method="post">

        <input type="hidden"
               name="patientId"
               value="<%= patient.getPatientId() %>">

        <label>Full Name</label>

        <input type="text"
               name="fullName"
               value="<%= patient.getFullName() %>"
               required>

        <label>Username</label>

        <input type="text"
               name="username"
               value="<%= patient.getUsername() %>"
               readonly>

        <label>Email</label>

        <input type="email"
               name="email"
               value="<%= patient.getEmail() %>"
               required>

        <label>Mobile</label>

        <input type="text"
               name="mobile"
               value="<%= patient.getMobile() %>"
               required>

        <label>Gender</label>

        <input type="text"
               name="gender"
               value="<%= patient.getGender() %>"
               readonly>

        <label>Password</label>

        <input type="password"
               name="password"
               value="<%= patient.getPassword() %>"
               required>

        <button type="submit"
                class="patient-btn">

            Update Profile

        </button>

    </form>

</div>
