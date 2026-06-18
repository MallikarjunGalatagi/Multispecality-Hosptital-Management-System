<%@ page import="java.sql.*" %>
<%@ page import="com.hospital_management.util.DBConnection" %>

<%
    int doctorId = Integer.parseInt(request.getParameter("id"));

    Connection con = DBConnection.getConnection();

    String query = "SELECT * FROM doctors WHERE doctor_id = ?";

    PreparedStatement ps = con.prepareStatement(query);
    ps.setInt(1, doctorId);

    ResultSet rs = ps.executeQuery();

    String fullName = "";
    String username = "";
    String email = "";
    String mobile = "";
    String gender = "";
    String qualification = "";
    int departmentId = 0;
    String password = "";

    if (rs.next()) {
        fullName = rs.getString("full_name");
        username = rs.getString("username");
        email = rs.getString("email");
        mobile = rs.getString("mobile");
        gender = rs.getString("gender");
        qualification = rs.getString("qualification");
        departmentId = rs.getInt("department_id");
        password = rs.getString("password");
    }

    rs.close();
    ps.close();
    con.close();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Doctor</title>
</head>
<body>

    <h1>Edit Doctor</h1>
    <hr>

    <form action="../UpdateDoctorServlet" method="post">

        <input type="hidden" name="doctorId" value="<%= doctorId %>">

        <label>Full Name:</label><br>
        <input type="text" name="fullName" value="<%= fullName %>" required>
        <br><br>

        <label>Username:</label><br>
        <input type="text" name="username" value="<%= username %>" required>
        <br><br>

        <label>Email:</label><br>
        <input type="email" name="email" value="<%= email %>" required>
        <br><br>

        <label>Mobile:</label><br>
        <input type="text" name="mobile" value="<%= mobile %>" required>
        <br><br>

        <label>Gender:</label><br>
        <select name="gender" required>
            <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
            <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
        </select>
        <br><br>

        <label>Qualification:</label><br>
        <input type="text" name="qualification" value="<%= qualification %>" required>
        <br><br>

        <label>Department ID:</label><br>
        <input type="number" name="departmentId" value="<%= departmentId %>" required>
        <br><br>

        <label>Password:</label><br>
        <input type="text" name="password" value="<%= password %>" required>
        <br><br>

        <button type="submit">Update Doctor</button>

    </form>

    <br>
    <a href="view_doctor.jsp">Back to View Doctors</a>

</body>
</html>