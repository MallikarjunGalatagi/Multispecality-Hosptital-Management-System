<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.model.Receptionist"%>
<%@ page import="com.hospital_management.model.Appointment"%>
<%@ page import="com.hospital_management.dao.AppointmentDAO"%>

<%
Receptionist receptionist =
        (Receptionist) session.getAttribute("loggedInReceptionist");

if(receptionist == null){
    response.sendRedirect("receptionist_login.jsp");
    return;
}

AppointmentDAO appointmentDAO =
        new AppointmentDAO();

List<Appointment> appointmentList =
        appointmentDAO.getAllAppointments();
%>

<div class="content-card">

    <h2 class="page-title">
        <i class="fas fa-calendar-check"></i>
        Appointment Requests
    </h2>

    <p class="auth-subtitle">
        Manage patient appointment requests and schedules.
    </p>

    <div class="table-container">

        <table class="appointment-table">

            <thead>

                <tr>
                    <th>ID</th>
                    <th>Patient</th>
                    <th>Doctor</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>

            </thead>

            <tbody>

            <%
            if(appointmentList.isEmpty()){
            %>

                <tr>

                    <td colspan="7"
                        style="text-align:center;padding:25px;">

                        No Appointment Requests Found

                    </td>

                </tr>

            <%
            }
            else{

                for(Appointment appointment
                        : appointmentList){
            %>

                <tr>

                    <td>
                        <%= appointment.getAppointmentId() %>
                    </td>

                    <td>
                        <%= appointment.getPatientName() %>
                    </td>

                    <td>
                        <%= appointment.getDoctorName() %>
                    </td>

                    <td>
                        <%= appointment.getAppointmentDate() == null
                        ? "-"
                        : appointment.getAppointmentDate() %>
                    </td>

                    <td>
                        <%= appointment.getAppointmentTime() == null
                        ? "-"
                        : appointment.getAppointmentTime() %>
                    </td>

                    <td>

                        <%
                        String status =
                                appointment.getStatus();

                        String statusClass =
                                "status-pending";

                        if("APPROVED".equalsIgnoreCase(status)){
                            statusClass =
                                    "status-approved";
                        }
                        else if("REJECTED".equalsIgnoreCase(status)){
                            statusClass =
                                    "status-cancelled";
                        }
                        %>

                        <span class="status-badge <%= statusClass %>">

                            <%= status %>

                        </span>

                    </td>

                    <td>

                        <a href="confirm_appointment.jsp?id=<%= appointment.getAppointmentId() %>"
                           class="card-btn">

                            Manage

                        </a>

                    </td>

                </tr>

            <%
                }
            }
            %>

            </tbody>

        </table>

    </div>

</div>