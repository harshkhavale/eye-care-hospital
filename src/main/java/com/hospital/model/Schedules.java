package com.hospital.model;

public class Schedules {
	int appointmentId;
	int doctorId;
	int userId;
	String address;
	String date;
	String time;
	String payment;
	String DoctorName;
	String PatientName;
	String Category;
	String Profile;
	Double Charge;

	

	public String getPatientName() {
		return PatientName;
	}

	public void setPatientName(String patientName) {
		PatientName = patientName;
	}

	public Double getCharge() {
		return Charge;
	}

	public void setCharge(Double charge) {
		Charge = charge;
	}

	public String getProfile() {
		return Profile;
	}

	public void setProfile(String profile) {
		Profile = profile;
	}

	public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getDoctorName() {
		return DoctorName;
	}

	public void setDoctorName(String doctorName) {
		DoctorName = doctorName;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public Schedules(int appointmentId, int doctorId, int userId, String address, String date, String time,
			String payment, String doctorName, String category) {
		super();
		this.appointmentId = appointmentId;
		this.doctorId = doctorId;
		this.userId = userId;
		this.address = address;
		this.date = date;
		this.time = time;
		this.payment = payment;
		DoctorName = doctorName;
		Category = category;
	}

	public Schedules() {
		super();
	}

}
