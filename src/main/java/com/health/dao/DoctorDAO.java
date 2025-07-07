package com.health.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.health.model.Doctor;

public class DoctorDAO {

    public static Doctor login(String email, String password) {
        Doctor doc = null;
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM doctor WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                doc = new Doctor(
                    rs.getInt("id"),
                    rs.getString("email"),
                    rs.getString("password")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return doc;
    }
}
