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
        response.sendRedirect("view_my_appointment.jsp");
        return;
    }

    int appointmentId = Integer.parseInt(appointmentIdParam);

    AppointmentDAO appointmentDAO = new AppointmentDAO();
    Appointment appointment = appointmentDAO.getAppointmentById(appointmentId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Prescription</title>
</head>
<body>

<%
    if (appointment == null) {
%>

    <h2>Appointment not found!</h2>

    <br>

    <a href="view_my_appointment.jsp">
        ⬅ Back to My Appointments
    </a>

<%
    } else {
%>

    <h1>💊 Add Prescription</h1>
    <hr>

    <h3>Welcome, Dr. <%= doctor.getFullName() %></h3>

    <p><b>Appointment ID:</b> <%= appointment.getAppointmentId() %></p>
    <p><b>Patient Name:</b> <%= appointment.getPatientName() %></p>
    <p><b>Doctor Name:</b> <%= appointment.getDoctorName() %></p>

    <hr>

    <form action="<%=request.getContextPath()%>/AddPrescriptionServlet"
          method="post">

        <input type="hidden"
               name="appointmentId"
               value="<%= appointment.getAppointmentId() %>">

        <input type="hidden"
               name="patientId"
               value="<%= appointment.getPatientId() %>">

        <label><b>Diagnosis:</b></label><br>
        <textarea name="diagnosis"
                  rows="4"
                  cols="60"
                  required></textarea>

        <br><br>

        <label><b>Medicines:</b></label><br>
        <textarea name="medicines"
                  rows="4"
                  cols="60"
                  required></textarea>

        <br><br>

        <label><b>Dosage Instructions:</b></label><br>
        <textarea name="dosageInstructions"
                  rows="3"
                  cols="60"
                  required></textarea>

        <br><br>

        <label><b>Remarks:</b></label><br>
        <textarea name="remarks"
                  rows="3"
                  cols="60"></textarea>

        <br><br>

        <button type="submit">
            💾 Save Prescription
        </button>

    </form>

    <br><br>

    <a href="view_my_appointment.jsp">
        ⬅ Back to My Appointments
    </a>

<%
    }
%>

</body>
</html>