package com.health.dao;

import java.sql.*;
import java.util.*;

import com.health.model.Patient;

public class PatientDAO {

    public static boolean addPatient(Patient p) {
        boolean status = false;
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO patient(name,email,phone,age,gender,diagnosis,remarks) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, p.getName());
            stmt.setString(2, p.getEmail());
            stmt.setString(3, p.getPhone());
            stmt.setInt(4, p.getAge());
            stmt.setString(5, p.getGender());
            stmt.setString(6, p.getDiagnosis());
            stmt.setString(7, p.getRemarks());
            status = stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static List<Patient> getAllPatients() {
        List<Patient> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM patient";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Patient p = new Patient(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getInt("age"),
                    rs.getString("gender"),
                    rs.getString("diagnosis"),
                    rs.getString("remarks")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Patient> searchPatients(String keyword) {
        List<Patient> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM patient WHERE name LIKE ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Patient p = new Patient(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getInt("age"),
                    rs.getString("gender"),
                    rs.getString("diagnosis"),
                    rs.getString("remarks")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Patient getPatientById(int id) {
        Patient p = null;
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM patient WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                p = new Patient(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getInt("age"),
                    rs.getString("gender"),
                    rs.getString("diagnosis"),
                    rs.getString("remarks")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public static boolean updatePatient(Patient p) {
        boolean status = false;
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "UPDATE patient SET name=?, email=?, phone=?, age=?, gender=?, diagnosis=?, remarks=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, p.getName());
            stmt.setString(2, p.getEmail());
            stmt.setString(3, p.getPhone());
            stmt.setInt(4, p.getAge());
            stmt.setString(5, p.getGender());
            stmt.setString(6, p.getDiagnosis());
            stmt.setString(7, p.getRemarks());
            stmt.setInt(8, p.getId());
            status = stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    public boolean deletePatientById(int id) {
        String sql = "DELETE FROM patient WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    

}
