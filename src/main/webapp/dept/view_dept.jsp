<%@ page import="java.util.List"%>
<%@ page import="com.hospital_management.dao.DepartmentDAO"%>
<%@ page import="com.hospital_management.model.Department"%>

<%
DepartmentDAO departmentDAO = new DepartmentDAO();
List<Department> departmentList = departmentDAO.getAllDepartments();

String success = request.getParameter("success");
%>

<style>

/* ===========================
   DEPARTMENT TABLE
=========================== */
.table-container {
	background: #fff;
	border-radius: 20px;
	padding: 20px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, .08);
	overflow: hidden;
}

.data-table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0;
}

.data-table thead th {
	background: linear-gradient(135deg, #7c3aed, #8b5cf6);
	color: #fff;
	padding: 16px;
	font-size: 16px;
	font-weight: 600;
	text-align: center;
	vertical-align: middle;
}

/* Rounded Header */
.data-table thead th:first-child {
	border-top-left-radius: 18px;
	border-bottom-left-radius: 18px;
}

.data-table thead th:last-child {
	border-top-right-radius: 18px;
	border-bottom-right-radius: 18px;
}

/* Body */
.data-table td {
	padding: 16px;
	text-align: center;
	vertical-align: middle;
	border-bottom: 1px solid #e5e7eb;
}

/* Hover */
.data-table tbody tr:hover {
	background: #f5f3ff;
}

/* Column Width */
.id-col {
	width: 10%;
}

.dept-col {
	width: 30%;
}

.desc-col {
	width: 40%;
}

.action-col {
	width: 20%;
}

/* Delete Button */
.btn-delete {
	display: inline-block;
	min-width: 80px;
	padding: 8px 14px;
	border-radius: 10px;
	background: linear-gradient(135deg, #7c3aed, #8b5cf6);
	color: #fff !important;
	font-size: 14px;
	font-weight: 600;
	text-decoration: none;
	transition: .3s;
}

.btn-delete:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 18px rgba(124, 58, 237, .30);
}

/* Add Button */
.card-btn {
	display: inline-block;
	padding: 12px 22px;
	border-radius: 12px;
}
</style>

<h2 class="page-title">
	<i class="fas fa-building"></i> Departments
</h2>

<p class="auth-subtitle">Manage doctor departments.</p>

<%
if(success != null){
%>

<div id="successMessage"
	style="background: #dcfce7; color: #166534; padding: 12px 20px; border-radius: 8px; margin: 20px auto; font-weight: 600; text-align: center; width: fit-content; min-width: 250px; transition: opacity .5s;">

	<%= success %>

</div>

<script>

setTimeout(function(){

    const msg =
    document.getElementById("successMessage");

    if(msg){

        msg.style.opacity="0";

        setTimeout(function(){

            msg.style.display="none";

        },500);
    }

},2000);

</script>

<%
}
%>

<div class="table-container">

	<table class="data-table">

		<thead>

			<tr>

				<th class="id-col">ID</th>

				<th class="dept-col">Department Name</th>

				<th class="desc-col">Description</th>

				<th class="action-col">Action</th>

			</tr>

		</thead>

		<tbody>
		<tbody>

			<%
for(Department department : departmentList){
%>

			<tr>

				<td class="center"><%= department.getDepartmentId() %></td>

				<td class="center"><%= department.getDepartmentName() %></td>

				<td class="center"><%= department.getDescription() == null
                ? "-"
                : department.getDescription() %></td>

				<td class="center"><a
					href="<%= request.getContextPath() %>/DeleteDepartmentServlet?id=<%= department.getDepartmentId() %>"
					class="btn btn-delete"
					onclick="return confirm('Are you sure you want to delete this department?');">

						Delete </a></td>

			</tr>

			<%
}
%>

		</tbody>

	</table>

</div>

<div style="margin-top:30px;">

    <a href="<%= request.getContextPath() %>/admin/dashboard.jsp?page=addDepartment"
       class="card-btn"
       style="
            display:inline-block;
            width:auto;
            padding:12px 22px;
            min-width:unset;
       ">

        Add Department

    </a>

</div>