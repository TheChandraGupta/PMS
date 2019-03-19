package com.deciders.pms.api.bean;

public class LabourJobDetail2 {
	
	private String labourJobId;
	private String userId;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String jobCount;
	
	public LabourJobDetail2() {
		super();
	}

	public LabourJobDetail2(String labourJobId, String userId,
			String firstName, String lastName, String email, String phone,
			String jobCount) {
		super();
		this.labourJobId = labourJobId;
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.jobCount = jobCount;
	}

	public String getLabourJobId() {
		return labourJobId;
	}

	public void setLabourJobId(String labourJobId) {
		this.labourJobId = labourJobId;
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

	public String getJobCount() {
		return jobCount;
	}

	public void setJobCount(String jobCount) {
		this.jobCount = jobCount;
	}
	
}
