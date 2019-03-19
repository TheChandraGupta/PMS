package com.deciders.pms.api.bean;

public class LabourPaymentDetail {
	
	private String userId;
	private String amount;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	
	public LabourPaymentDetail() {
		super();
	}

	public LabourPaymentDetail(String userId, String amount, String firstName,
			String lastName, String email, String phone) {
		super();
		this.userId = userId;
		this.amount = amount;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
