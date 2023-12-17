package com.hospital.model;

public class Doctor {

	int id;
	String name;
	String category;
	String description;
	String contact;
	String email;
	Double charge;
	String profile;

	public Doctor(int id, String name, String category, String description, String contact, String email, Double charge,
			String profile) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.description = description;
		this.contact = contact;
		this.email = email;
		this.charge = charge;
		this.profile = profile;
	}

	public Doctor() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Double getCharge() {
		return charge;
	}

	public void setCharge(Double charge) {
		this.charge = charge;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

}
