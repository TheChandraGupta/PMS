package com.deciders.pms.api.bean;

public class LabourPayment {
	
	private String labourPaymentId;
	private String userId;
	private String amountBefore;
	private String paidAmount;
	private String paidDate;
	
	public LabourPayment() {
		super();
	}

	public LabourPayment(String labourPaymentId, String userId,
			String amountBefore, String paidAmount, String paidDate) {
		super();
		this.labourPaymentId = labourPaymentId;
		this.userId = userId;
		this.amountBefore = amountBefore;
		this.paidAmount = paidAmount;
		this.paidDate = paidDate;
	}

	public String getLabourPaymentId() {
		return labourPaymentId;
	}

	public void setLabourPaymentId(String labourPaymentId) {
		this.labourPaymentId = labourPaymentId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAmountBefore() {
		return amountBefore;
	}

	public void setAmountBefore(String amountBefore) {
		this.amountBefore = amountBefore;
	}

	public String getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(String paidAmount) {
		this.paidAmount = paidAmount;
	}

	public String getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(String paidDate) {
		this.paidDate = paidDate;
	}
	
}
