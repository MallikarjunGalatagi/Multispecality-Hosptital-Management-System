<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Patient"%>
<%@ page import="com.hospital_management.model.Prescription"%>
<%@ page import="com.hospital_management.dao.PrescriptionDAO"%>

<%
    Patient patient = (Patient) session.getAttribute("loggedInPatient");

    if (patient == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }

    PrescriptionDAO prescriptionDAO = new PrescriptionDAO();
    List<Prescription> prescriptionList =
            prescriptionDAO.getPrescriptionsByPatientId(patient.getPatientId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Prescriptions</title>
</head>
<body>

	<h1>My Prescriptions</h1>
	<hr>

	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<th>Prescription ID</th>
			<th>Doctor Name</th>
			<th>Diagnosis</th>
			<th>Medicines</th>
			<th>Dosage Instructions</th>
			<th>Remarks</th>
			<th>Action</th>
		</tr>

		<%
            for (Prescription prescription : prescriptionList) {
        %>
		<tr>
			<td><%= prescription.getPrescriptionId() %></td>
			<td><%= prescription.getDoctorName() %></td>
			<td><%= prescription.getDiagnosis() %></td>
			<td><%= prescription.getMedicines() %></td>
			<td><%= prescription.getDosageInstructions() %></td>
			<td><%= prescription.getRemarks() %></td>

			<td><a
				href="<%= request.getContextPath() %>/DownloadPrescriptionServlet?id=<%= prescription.getPrescriptionId() %>">
					📄 Download PDF </a></td>
		</tr>
		<%
            }
        %>

	</table>

	<br>
	<br>

	<a href="patient_dashboard.jsp">Back to Dashboard</a>

</body>
</html>