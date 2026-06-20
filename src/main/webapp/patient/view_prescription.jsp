
<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Patient"%>
<%@ page import="com.hospital_management.model.Prescription"%>
<%@ page import="com.hospital_management.dao.PrescriptionDAO"%>

<%
Patient patient =
        (Patient) session.getAttribute("loggedInPatient");

if(patient == null){
    response.sendRedirect("patient_login.jsp");
    return;
}

PrescriptionDAO prescriptionDAO =
        new PrescriptionDAO();

List<Prescription> prescriptionList =
        prescriptionDAO.getPrescriptionsByPatientId(
                patient.getPatientId());
%>

<div class="prescription-page">

	<h2>
		<i class="fas fa-file-medical"></i> My Prescriptions
	</h2>

	<p class="auth-subtitle">
        View and download your prescriptions
    </p>

   <table class="appointment-table prescription-table">

            <thead>

                <tr>
                    <th>ID</th>
                    <th>Doctor</th>
                    <th>Diagnosis</th>
                    <th>Medicines</th>
                    <th>Dosage</th>
                    <th>Remarks</th>
                    <th>Download</th>
                </tr>

            </thead>

            <tbody>

                <%
                for(Prescription prescription : prescriptionList){
                %>

                <tr>

                    <td>
                        <%= prescription.getPrescriptionId() %>
                    </td>

                    <td>
                        <%= prescription.getDoctorName() %>
                    </td>

                    <td>
                        <%= prescription.getDiagnosis() %>
                    </td>

                    <td>
                        <%= prescription.getMedicines() %>
                    </td>

                    <td>
                        <%= prescription.getDosageInstructions() %>
                    </td>

                    <td>
                        <%= prescription.getRemarks() %>
                    </td>

                    <td>

                        <a class="download-btn"
                           href="<%= request.getContextPath() %>/DownloadPrescriptionServlet?id=<%= prescription.getPrescriptionId() %>">

                            Download PDF

                        </a>

                    </td>

                </tr>

                <%
                }
                %>

            </tbody>

        </table>

    </div>

</div>

