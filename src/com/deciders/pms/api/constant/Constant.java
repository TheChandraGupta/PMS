package com.deciders.pms.api.constant;

public class Constant {
	
	/*
	 * Constant for Java Email Connection via SMTP
	 */
	public static final String EMAIL_HOST = "smtp.gmail.com";
	public static final String EMAIL_PORT = "587";
	public static final String EMAIL_USER = "pms.cit2016@gmail.com";
	public static final String EMAIL_PASS = "deciders";
	//public static final String EMAIL_USER = "cbcs.cit@gmail.com";
	//public static final String EMAIL_PASS = "thedeciders";
	
	/*
	 * Constants for Database Connection
	 */
	public static final String DRIVER = "com.mysql.jdbc.Driver";
	public static final String URL = "jdbc:mysql://localhost:3306/pms";
	public static final String USER = "root";
	public static final String PASS = "root";
	
	/*
	 * Constants for Web Services
	 */
	public static final String REST_RESPONSE_TYPE = "application/x-www-form-urlencoded;charset=UTF-8";
	public static final String REST_REQUEST_TYPE = "MediaType.APPLICATION_JSON";
	
	/*
	 * Constant for Database Queries
	 */
	public static final String LOGIN_QUERY = "";
	
	/*
	 * Constant for Random Users
	 */
	public static final String RANDOM = "";

}
