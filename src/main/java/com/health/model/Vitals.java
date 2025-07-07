package com.health.model;

import java.sql.Timestamp;

public class Vitals {
	private int patientId;
	private String patientName;
	private String phone;
	private int bpLow;
	private int bpHigh;
	private int spo2;
	private Timestamp recordedOn;
	private int id;
	public Vitals() {
		
	}
	public Vitals(int patientId, String patientName, String phone, int bpLow, int bpHigh, int spo2,
			Timestamp recordedOn, int id) {
		super();
		this.patientId = patientId;
		this.patientName = patientName;
		this.phone = phone;
		this.bpLow = bpLow;
		this.bpHigh = bpHigh;
		this.spo2 = spo2;
		this.recordedOn = recordedOn;
		this.id = id;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getBpLow() {
		return bpLow;
	}
	public void setBpLow(int bpLow) {
		this.bpLow = bpLow;
	}
	public int getBpHigh() {
		return bpHigh;
	}
	public void setBpHigh(int bpHigh) {
		this.bpHigh = bpHigh;
	}
	public int getSpo2() {
		return spo2;
	}
	public void setSpo2(int spo2) {
		this.spo2 = spo2;
	}
	public Timestamp getRecordedOn() {
		return recordedOn;
	}
	public void setRecordedOn(Timestamp recordedOn) {
		this.recordedOn = recordedOn;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
  
}
