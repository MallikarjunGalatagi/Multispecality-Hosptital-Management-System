<%
int appointmentId =
Integer.parseInt(
request.getParameter("id"));
%>

<div class="content-card">

<h2 class="page-title">

    <i class="fas fa-calendar-check"></i>

    Confirm Appointment

</h2>

<p class="auth-subtitle">

    Schedule and confirm the patient's appointment.

</p>

<div class="form-card">

    <form action="<%= request.getContextPath() %>/UpdateAppointmentStatusServlet"
          method="post">

        <input type="hidden"
               name="appointmentId"
               value="<%= appointmentId %>">

        <input type="hidden"
               name="status"
               value="Confirmed">

        <div class="input-group">

            <label>
                Appointment Date
            </label>

            <input type="date"
                   name="appointmentDate"
                   required>

        </div>

        <br>

        <div class="input-group">

            <label>
                Appointment Time
            </label>

            <input type="time"
                   name="appointmentTime"
                   required>

        </div>

        <br>

        <button type="submit"
                class="card-btn">

            Confirm Appointment

        </button>

    </form>

    <br>

    <a href="view_appointments.jsp"
       class="card-btn">

        Back

    </a>

</div>


</div>
