<%@ page import="com.hospital_management.model.Doctor"%>
<%@ page import="com.hospital_management.model.Appointment"%>
<%@ page import="com.hospital_management.dao.AppointmentDAO"%>

<%
Doctor doctor = (Doctor) session.getAttribute("loggedInDoctor");

if (doctor == null) {
    response.sendRedirect("doctor_login.jsp");
    return;
}

String appointmentIdParam = request.getParameter("appointmentId");

if (appointmentIdParam == null || appointmentIdParam.trim().equals("")) {
    response.sendRedirect("doctor_dashboard.jsp?page=appointments");
    return;
}

int appointmentId = Integer.parseInt(appointmentIdParam);

AppointmentDAO appointmentDAO = new AppointmentDAO();
Appointment appointment = appointmentDAO.getAppointmentById(appointmentId);
%>

<style>

.form-card{
    max-width:900px;
    margin:auto;
}

.form-group{
    margin-bottom:22px;
}

.form-group label{
    display:block;
    margin-bottom:10px;
    font-size:16px;
    font-weight:600;
    color:#1e293b;
    font-family:'Poppins',sans-serif;
}

.form-control{

    width:100%;
    box-sizing:border-box;

    padding:14px 16px;

    border:1px solid #dbe3f0;
    border-radius:12px;

    font-size:16px;
    font-family:'Poppins',sans-serif;

    color:#334155;
    background:#fff;

    transition:.3s;
}

.form-control:hover{

    border-color:#16a34a;

    box-shadow:0 0 0 4px rgba(22,163,74,.10);

}

.form-control:focus{

    outline:none;

    border-color:#16a34a;

    box-shadow:0 0 0 4px rgba(22,163,74,.18);

}

textarea.form-control{

    resize:vertical;
    min-height:130px;

}

.button-group{

    margin-top:30px;

    display:flex;
    gap:15px;

}

.button-group .btn{

    width:auto;
    min-width:180px;
    text-align:center;

}

.info-box{

    background:#f8fafc;

    border:1px solid #dbe3f0;

    border-radius:12px;

    padding:14px 18px;

    margin-bottom:15px;

    font-size:16px;

}

.info-box b{

    display:inline-block;

    width:170px;

    color:#0f172a;

}

</style>

<%
if(appointment == null){
%>

<h2>Appointment Not Found</h2>

<%
}
else{
%>

<h2 class="page-title">
    <i class="fas fa-file-medical"></i>
    Add Prescription
</h2>

<p class="auth-subtitle">
    Create prescription for the selected appointment.
</p>

<div class="content-card form-card">

<div class="info-box">
    <b>Appointment ID</b> :
    <%= appointment.getAppointmentId() %>
</div>

<div class="info-box">
    <b>Patient Name</b> :
    <%= appointment.getPatientName() %>
</div>

<div class="info-box">
    <b>Doctor Name</b> :
    <%= appointment.getDoctorName() %>
</div>
<form action="<%=request.getContextPath()%>/AddPrescriptionServlet"
      method="post">

    <input
        type="hidden"
        name="appointmentId"
        value="<%= appointment.getAppointmentId() %>">

    <input
        type="hidden"
        name="patientId"
        value="<%= appointment.getPatientId() %>">

    <!-- Diagnosis -->

    <div class="form-group">

        <label for="diagnosis">
            Diagnosis
        </label>

        <textarea
            id="diagnosis"
            name="diagnosis"
            class="form-control"
            placeholder="Enter Diagnosis"
            required></textarea>

    </div>

    <!-- Medicines -->

    <div class="form-group">

        <label for="medicines">
            Medicines
        </label>

        <textarea
            id="medicines"
            name="medicines"
            class="form-control"
            placeholder="Enter Medicines"
            required></textarea>

    </div>

    <!-- Dosage -->

    <div class="form-group">

        <label for="dosageInstructions">
            Dosage Instructions
        </label>

        <textarea
            id="dosageInstructions"
            name="dosageInstructions"
            class="form-control"
            placeholder="Enter Dosage Instructions"
            required></textarea>

    </div>

    <!-- Remarks -->

    <div class="form-group">

        <label for="remarks">
            Remarks
        </label>

        <textarea
            id="remarks"
            name="remarks"
            class="form-control"
            placeholder="Enter Remarks (Optional)"></textarea>

    </div>
    
    <div class="button-group">

    <button
        type="submit"
        class="btn">

        Save Prescription

    </button>

    <a href="<%= request.getContextPath() %>/doctor/doctor_dashboard.jsp?page=appointments"
       class="btn">

        Back

    </a>

</div>

</form>

</div>

<%
}
%>