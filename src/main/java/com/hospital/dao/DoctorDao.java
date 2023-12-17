package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hospital.model.Doctor;
import com.hospital.model.Order;
import com.hospital.model.Product;

public class DoctorDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public DoctorDao(Connection con) {
		this.con = con;
	}

	public boolean insertDoctor(Doctor doc) {
		boolean result = false;
		try {
			query = "insert into doctors (name,category,description,contact,email,charge,profile) values(?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, doc.getName());
			pst.setString(2, doc.getCategory());
			pst.setString(3, doc.getDescription());
			pst.setString(4, doc.getContact());
			pst.setString(5, doc.getEmail());
			pst.setDouble(6, doc.getCharge());
			pst.setString(7, doc.getProfile());

			pst.executeUpdate();
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public Doctor getDoctor(int id) {
		Doctor row = null;
		try {
			query = "select * from doctors where id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				row = new Doctor();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setDescription(rs.getString("description"));
				row.setCategory(rs.getString("category"));

				row.setCharge(rs.getDouble("charge"));
				row.setProfile(rs.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}

	public List<Doctor> getAllDoctors() {
		List<Doctor> doctors = new ArrayList<Doctor>();
		try {
			query = "select * from doctors";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Doctor row = new Doctor();

				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setCharge(rs.getDouble("charge"));
				row.setProfile(rs.getString("profile"));
				row.setEmail(rs.getString("email"));
				row.setContact(rs.getString("contact"));
				row.setDescription(rs.getString("description"));

				doctors.add(row);
			}

		} catch (Exception e) {

		}
		return doctors;
	}

}
