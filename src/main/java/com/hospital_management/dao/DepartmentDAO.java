package com.hospital_management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hospital_management.model.Department;
import com.hospital_management.util.DBConnection;

public class DepartmentDAO {

    // Add Department
    public boolean addDepartment(Department department) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO departments (department_name, description) VALUES (?, ?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, department.getDepartmentName());
            ps.setString(2, department.getDescription());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // View All Departments
    public List<Department> getAllDepartments() {

        List<Department> departmentList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM departments ORDER BY department_id";

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Department department = new Department();

                department.setDepartmentId(rs.getInt("department_id"));
                department.setDepartmentName(rs.getString("department_name"));
                department.setDescription(rs.getString("description"));

                departmentList.add(department);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return departmentList;
    }
 // Delete Department
    public boolean deleteDepartment(int departmentId) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "DELETE FROM departments WHERE department_id = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, departmentId);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
 
 // Update Department
    public boolean updateDepartment(Department department) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "UPDATE departments SET department_name = ?, description = ? WHERE department_id = ?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, department.getDepartmentName());
            ps.setString(2, department.getDescription());
            ps.setInt(3, department.getDepartmentId());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    
    }
    }
