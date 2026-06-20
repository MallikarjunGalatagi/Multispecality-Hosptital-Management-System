<%@ page import="java.util.List" %>
<%@ page import="com.hospital_management.dao.DoctorDAO" %>
<%@ page import="com.hospital_management.model.Doctor" %>

<%
DoctorDAO doctorDAO = new DoctorDAO();
List<Doctor> doctorList = doctorDAO.getAllDoctors();

String appointmentSuccess =
(String) session.getAttribute(
        "appointmentSuccess");
%>

<div class="appointment-page">

    <h2>
        <i class="fas fa-calendar-plus"></i>
        Book Appointment
    </h2>

    <p class="auth-subtitle">
        Schedule an appointment with your preferred doctor
    </p>
    
    <%
if(appointmentSuccess != null){
%>

<div class="success-message">

    <%= appointmentSuccess %>

</div>

<%
session.removeAttribute(
        "appointmentSuccess");
}
%>


   

    <form action="../BookAppointmentServlet"
          method="post">

        <div class="input-group">

            <select name="doctorId" required>

                <option value="">
                    -- Select Doctor --
                </option>

                <%
                for(Doctor doctor : doctorList){
                %>

                <option value="<%= doctor.getDoctorId() %>">

                    <%= doctor.getFullName() %>
                    -
                    <%= doctor.getDepartmentName() %>

                </option>

                <%
                }
                %>

            </select>

        </div>

        <div class="input-group">

            <input type="date"
                   name="appointmentDate"
                   required>

        </div>

        <button type="submit"
                class="auth-btn">

            Book Appointment

        </button>

    </form>

</div>