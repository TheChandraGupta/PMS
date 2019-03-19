package com.deciders.pms.api.bean;

public class LabourSalary {
	
	private String labourSalaryId;
	private String userId;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String device;
	private String type = "LABOUR";
	private String totalSalary;
	
	public LabourSalary() {
		super();
	}
	
	public LabourSalary(String labourSalaryId, String userId, String firstName,
			String lastName, String email, String phone, String device,
			String type, String totalSalary) {
		super();
		this.labourSalaryId = labourSalaryId;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.device = device;
		this.type = type;
		this.totalSalary = totalSalary;
	}
	
	public String getLabourSalaryId() {
		return labourSalaryId;
	}
	public void setLabourSalaryId(String labourSalaryId) {
		this.labourSalaryId = labourSalaryId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTotalSalary() {
		return totalSalary;
	}
	public void setTotalSalary(String totalSalary) {
		this.totalSalary = totalSalary;
	}
	
}
