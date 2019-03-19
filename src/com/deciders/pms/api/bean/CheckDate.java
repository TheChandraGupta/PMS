package com.deciders.pms.api.bean;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class CheckDate {
	
	String date = null;
	String formatDate = null;
	
	public String getFormatDate() {
		
		String day = "" + checkDate.get(Calendar.DAY_OF_MONTH);
		String month = "" + (int)(checkDate.get(Calendar.MONTH) + 1);
		String year = "" + checkDate.get(Calendar.YEAR);
		
		if(day.length() == 1) {
			
			day = "0" + day;
			
		}
		if(month.length() == 1) {
			
			month = "0" + month;
			
		}
		
		formatDate = day + "-" + month + "-" + year;
		
		return formatDate;
	}

	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	GregorianCalendar checkDate = new GregorianCalendar();
	
	public CheckDate() {
		
		String day = "" + checkDate.get(Calendar.DAY_OF_MONTH);
		String month = "" + (int)(checkDate.get(Calendar.MONTH) + 1);
		String year = "" + checkDate.get(Calendar.YEAR);
		
		if(day.length() == 1) {
			
			day = "0" + day;
			
		}
		if(month.length() == 1) {
			
			month = "0" + month;
			
		}
		
		date = year + "-" + month + "-" + day;
		
	}

}
