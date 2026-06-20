<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.dao.DoctorDAO"%>
<%@ page import="com.hospital_management.model.Doctor"%>

<%
Object admin = session.getAttribute("loggedInAdmin");

if(admin == null){
response.sendRedirect("../admin/admin_login.jsp");
return;
}

DoctorDAO doctorDAO = new DoctorDAO();
List<Doctor> doctorList = doctorDAO.getAllDoctors();
%>

<div class="content-card">


<h2 class="page-title">
    <i class="fas fa-user-doctor"></i>
    Doctors
</h2>

<p class="auth-subtitle">
    View and manage all registered doctors.
</p>

<div class="table-container">

    <table class="appointment-table">

        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Gender</th>
                <th>Department</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>

        <%
        if(doctorList != null && !doctorList.isEmpty()){

            for(Doctor doctor : doctorList){
        %>

            <tr>

                <td><%= doctor.getDoctorId() %></td>

                <td><%= doctor.getFullName() %></td>

                <td><%= doctor.getUsername() %></td>

                <td><%= doctor.getEmail() %></td>

                <td><%= doctor.getMobile() %></td>

                <td><%= doctor.getGender() %></td>

                <td><%= doctor.getDepartmentName() %></td>

                <td>

                    <a href="<%= request.getContextPath() %>/DeleteDoctorServlet?id=<%= doctor.getDoctorId() %>"
                       class="card-btn"
                       onclick="return confirm('Are you sure you want to delete this doctor?');">

                        Delete

                    </a>

                </td>

            </tr>

        <%
            }
        }
        else{
        %>

            <tr>

                <td colspan="8"
                    style="text-align:center;padding:25px;">

                    No Doctors Found

                </td>

            </tr>

        <%
        }
        %>

        </tbody>

    </table>

</div>


</div>
