<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<style>

.form-card{
    max-width:900px;
    margin:auto;
}

.form-group{
    margin-bottom:22px;
}

.form-group label{
    display:block;
    margin-bottom:10px;
    font-size:16px;
    font-weight:600;
    color:#1e293b;
    font-family:'Poppins',sans-serif;
}

.form-control{

    width:100%;
    box-sizing:border-box;

    padding:14px 16px;

    border:1px solid #dbe3f0;
    border-radius:12px;

    font-size:16px;
    font-family:'Poppins',sans-serif;

    color:#334155;
    background:#fff;

    transition:.3s;
}

.form-control:hover{

    border-color:#7c3aed;

    box-shadow:
    0 0 0 4px rgba(124,58,237,.10);

}

.form-control:focus{

    outline:none;

    border-color:#7c3aed;

    box-shadow:
    0 0 0 4px rgba(124,58,237,.18);

}

textarea.form-control{

    resize:vertical;
    min-height:130px;

}

.button-group{

    margin-top:30px;

    display:flex;
    gap:15px;

}

.button-group .btn{

    width:auto;
    min-width:170px;
    text-align:center;

}

</style>

<h2 class="page-title">
    <i class="fas fa-plus-circle"></i>
    Add Department
</h2>

<p class="auth-subtitle">
    Add a new department to the hospital.
</p>

<div class="content-card form-card">

    <form action="<%= request.getContextPath() %>/AddDepartmentServlet"
          method="post">

        <!-- Department Name -->

        <div class="form-group">

            <label for="departmentName">
                Department Name
            </label>

            <input
                type="text"
                id="departmentName"
                name="departmentName"
                class="form-control"
                placeholder="Enter Department Name"
                required>

        </div>

        <!-- Description -->

        <div class="form-group">

            <label for="description">
                Department Description
            </label>

            <textarea
                id="description"
                name="description"
                class="form-control"
                placeholder="Enter Department Description"
                required></textarea>

        </div>

        <!-- Buttons -->

        <div class="button-group">

            <button
                type="submit"
                class="btn">

                Add Department

            </button>

            <a href="<%= request.getContextPath() %>/admin/dashboard.jsp?page=departments"
               class="btn">

                Back

            </a>

        </div>

    </form>

</div>