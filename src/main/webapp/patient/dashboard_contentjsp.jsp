<%@ page import="com.hospital_management.model.Patient"%>

<%
Patient patient =
        (Patient) session.getAttribute("loggedInPatient");
%>

<h1 class="page-title">
    Welcome, <%= patient.getFullName() %>
</h1>

<p class="welcome-text">
    Stay connected with your healthcare services.
    Book appointments, view prescriptions and
    track your medical records with ease.
</p>