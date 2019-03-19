package com.deciders.pms.api.bean;

public class JobAllotmentDetail {
	
	private String jobId;
	private String job;
	private String allotment;
	
	public JobAllotmentDetail() {
		super();
	}

	public JobAllotmentDetail(String jobId, String job, String allotment) {
		super();
		this.jobId = jobId;
		this.job = job;
		this.allotment = allotment;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getAllotment() {
		return allotment;
	}

	public void setAllotment(String allotment) {
		this.allotment = allotment;
	}
	
}
