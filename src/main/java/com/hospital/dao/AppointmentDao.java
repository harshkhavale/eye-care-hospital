package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hospital.model.Appointment;
import com.hospital.model.Doctor;
import com.hospital.model.Order;
import com.hospital.model.Product;
import com.hospital.model.Schedules;

public class AppointmentDao {

	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public AppointmentDao(Connection con) {
		this.con = con;
	}

	public boolean insertAppointment(Appointment appointment) {
		boolean result = false;
		try {
			query = "insert into appointment(patientname,doctorId,userId,address,date,time,payment) values(?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, appointment.getPatientName());

			pst.setInt(2, appointment.getDoctorId());
			pst.setInt(3, appointment.getUserId());
			pst.setString(4, appointment.getAddress());
			pst.setString(5, appointment.getDate());
			pst.setString(6, appointment.getTime());
			pst.setString(7, appointment.getPayment());

			pst.executeUpdate();
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public List<Schedules> getUserAppointments(int id) {
		List<Schedules> list = new ArrayList<>();
		try {
			query = "SELECT * FROM appointment WHERE userId=? ";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				Schedules schedule = new Schedules();
				DoctorDao ddao = new DoctorDao(con);
				int doctorId = rs.getInt("doctorId");
				Doctor doctor = ddao.getDoctor(doctorId);
				schedule.setAppointmentId(rs.getInt("id"));
				schedule.setAddress(rs.getString("address"));
				schedule.setDate(rs.getString("date"));
				schedule.setTime(rs.getString("time"));
				schedule.setPatientName(rs.getString("patientname"));

				schedule.setPayment(rs.getString("payment"));
				schedule.setProfile(doctor.getProfile());
				schedule.setDoctorName(doctor.getName());
				schedule.setCharge(doctor.getCharge());

				schedule.setCategory(doctor.getCategory());

				list.add(schedule);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Schedules> getAllAppointments() {
		List<Schedules> list = new ArrayList<>();
		try {
			query = "SELECT * FROM appointment ";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Schedules schedule = new Schedules();
				DoctorDao ddao = new DoctorDao(con);
				int doctorId = rs.getInt("doctorId");
				Doctor doctor = ddao.getDoctor(doctorId);
				schedule.setAppointmentId(rs.getInt("id"));
				schedule.setAddress(rs.getString("address"));
				schedule.setDate(rs.getString("date"));
				schedule.setTime(rs.getString("time"));
				schedule.setPayment(rs.getString("payment"));
				schedule.setPatientName(rs.getString("patientname"));

				schedule.setProfile(doctor.getProfile());
				schedule.setDoctorName(doctor.getName());
				schedule.setCharge(doctor.getCharge());

				schedule.setCategory(doctor.getCategory());

				list.add(schedule);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void cancleAppointment(int id) {
		try {
			query = "delete from appointment where id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
