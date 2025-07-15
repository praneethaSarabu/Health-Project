package com.health.dao;

import java.sql.*;
import java.util.*;

import com.health.model.Vitals;

public class VitalsDAO {

	public static boolean addVitals(Vitals v) {
		boolean status = false;
		try (Connection conn = DBUtil.getConnection()) {
			String sql = "INSERT INTO vitals(patient_id, bp_high, bp_low, spo2) VALUES (?, ?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, v.getPatientId());
			stmt.setInt(2, v.getBpHigh());
			stmt.setInt(3, v.getBpLow());
			stmt.setInt(4, v.getSpo2());
			status = stmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public static List<Vitals> getVitalsByPatientId(int patientId) {
		List<Vitals> list = new ArrayList<>();
		try (Connection conn = DBUtil.getConnection()) {
			String sql = "SELECT v.*, p.name, p.phone FROM vitals v JOIN patients p ON v.patient_id = p.id WHERE v.patient_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, patientId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Vitals v = new Vitals();
				v.setId(rs.getInt("id"));
				v.setPatientId(rs.getInt("patient_id"));
				v.setBpHigh(rs.getInt("bp_high"));
				v.setBpLow(rs.getInt("bp_low"));
				v.setSpo2(rs.getInt("spo2"));
				v.setRecordedOn(rs.getTimestamp("recorded_on"));
				v.setPatientName(rs.getString("name"));
				v.setPhone(rs.getString("phone"));
				list.add(v);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Vitals> getAllVitals() {
		List<Vitals> list = new ArrayList<>();

		String sql = "SELECT v.id, v.bp_low, v.bp_high, v.spo2, v.recorded_on, " + "p.name AS patient_name, p.phone "
				+ "FROM vitals v " + "JOIN patient p ON v.patient_id = p.id " + "ORDER BY v.recorded_on DESC";

		try (Connection con = DBUtil.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Vitals v = new Vitals();
				v.setId(rs.getInt("id"));
				v.setBpLow(rs.getInt("bp_low"));
				v.setBpHigh(rs.getInt("bp_high"));
				v.setSpo2(rs.getInt("spo2"));
				v.setRecordedOn(rs.getTimestamp("recorded_on"));
				v.setPatientName(rs.getString("patient_name"));
				v.setPhone(rs.getString("phone"));

				list.add(v);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static boolean deleteVitalById(int id) {
		boolean rowDeleted = false;

		try (Connection con = DBUtil.getConnection();
				PreparedStatement stmt = con.prepareStatement("DELETE FROM vitals WHERE id = ?")) {

			stmt.setInt(1, id);
			rowDeleted = stmt.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return rowDeleted;
	}

	public static List<Vitals> getAbnormalVitals() {
		// System.out.println("getAbnormalVitals called");

		List<Vitals> alertVitals = new ArrayList<>();

		String sql = "SELECT v.id, v.patient_id, v.bp_low, v.bp_high, v.spo2, v.recorded_on, " + "p.name, p.phone "
				+ "FROM vitals v " + "JOIN patient p ON v.patient_id = p.id "
				+ "WHERE v.bp_low < 60 OR v.bp_high > 140 OR v.spo2 < 90 " + "ORDER BY v.recorded_on DESC";

		try (Connection conn = DBUtil.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Vitals v = new Vitals();
				v.setId(rs.getInt("id"));
				v.setPatientId(rs.getInt("patient_id"));
				v.setBpLow(rs.getInt("bp_low"));
				v.setBpHigh(rs.getInt("bp_high"));
				v.setSpo2(rs.getInt("spo2"));
				v.setRecordedOn(rs.getTimestamp("recorded_on"));
				v.setPatientName(rs.getString("name"));
				v.setPhone(rs.getString("phone"));

				alertVitals.add(v);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return alertVitals;
	}
	
	public static boolean addVitalsViaProcedure(Vitals v) {
	    boolean status = false;
	    try (Connection conn = DBUtil.getConnection()) {
	    	
	    	System.out.println("JDBC user = " + conn.getMetaData().getUserName());
	        String sql = "{ call log_vitals(?, ?, ?, ?) }";
	        CallableStatement cs = conn.prepareCall(sql);

	        cs.setInt(1, v.getPatientId());
	        cs.setInt(2, v.getBpHigh());
	        cs.setInt(3, v.getBpLow());
	        cs.setInt(4, v.getSpo2());

	        cs.execute();
	        status = true;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}


}
