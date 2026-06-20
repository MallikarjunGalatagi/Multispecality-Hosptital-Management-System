<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.dao.ReceptionistDAO"%>
<%@ page import="com.hospital_management.model.Receptionist"%>

<%
Object admin = session.getAttribute("loggedInAdmin");

if(admin == null){
response.sendRedirect("../admin/admin_login.jsp");
return;
}

ReceptionistDAO receptionistDAO =
new ReceptionistDAO();

List<Receptionist> receptionistList =
receptionistDAO.getAllReceptionists();
%>

<div class="content-card">

<h2 class="page-title">
    <i class="fas fa-user-tie"></i>
    Receptionists
</h2>

<p class="auth-subtitle">
    View all registered receptionists.
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
                <th>Created At</th>
            </tr>

        </thead>

        <tbody>

        <%
        if(receptionistList != null &&
           !receptionistList.isEmpty()){

            for(Receptionist receptionist
                    : receptionistList){
        %>

            <tr>

                <td>
                    <%= receptionist.getReceptionistId() %>
                </td>

                <td>
                    <%= receptionist.getFullName() %>
                </td>

                <td>
                    <%= receptionist.getUsername() %>
                </td>

                <td>
                    <%= receptionist.getEmail() %>
                </td>

                <td>
                    <%= receptionist.getMobile() %>
                </td>

                <td>
                    <%= receptionist.getCreatedAt() %>
                </td>

            </tr>

        <%
            }
        }
        else{
        %>

            <tr>

                <td colspan="6"
                    style="text-align:center;padding:25px;">

                    No Receptionists Found

                </td>

            </tr>

        <%
        }
        %>

        </tbody>

    </table>

</div>

</div>
