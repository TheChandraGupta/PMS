package com.deciders.pms.api.database;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import com.deciders.pms.api.bean.Job;
import com.deciders.pms.api.bean.LabourJob;
import com.deciders.pms.api.bean.LabourJobDetail;
import com.deciders.pms.api.bean.LabourPayment;
import com.deciders.pms.api.bean.LabourSalary;
import com.deciders.pms.api.bean.User;

public class DBHandler {
	
	public static User loginData(String email, String password, DBManager dbManager) {

		System.out.println("loginData");
		
		User user = new User();
		
		try {
			
			CallableStatement pstm = dbManager.getCon().prepareCall("call login(?,?,?,?,?,?,?,?)");
			
			pstm.registerOutParameter(1, Types.VARCHAR);
			pstm.registerOutParameter(2, Types.VARCHAR);
			pstm.setString(3, email);
			pstm.setString(4, password);
			pstm.registerOutParameter(5, Types.VARCHAR);
			pstm.registerOutParameter(6, Types.VARCHAR);
			pstm.registerOutParameter(7, Types.VARCHAR);
			pstm.registerOutParameter(8, Types.INTEGER);
			
			pstm.executeQuery();

			user.setFirstName(pstm.getString(1));
			user.setLastName(pstm.getString(2));
			user.setEmail(email);
			user.setPassword(password);
			user.setPhone(pstm.getString(5));
			user.setDevice(pstm.getString(6));
			user.setType(pstm.getString(7));
			user.setUserId(String.valueOf(pstm.getInt(8)));
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return user;
		
	}

	public static User registerData(User user, DBManager dbManager) {

		System.out.println("registerData");
		
		try {
			
			CallableStatement pstm1 = dbManager.getCon().prepareCall("call findlabour(?,?)");
			
			pstm1.setString(1, user.getEmail());
			pstm1.registerOutParameter(2, Types.INTEGER);

			pstm1.executeQuery();
			
			if(pstm1.getInt(2)>0) {
				user.setUserId(String.valueOf(0));
			}
			else {
				
				CallableStatement pstm = dbManager.getCon().prepareCall("call register(?,?,?,?,?,?,?,?)");
				
				pstm.setString(1, user.getFirstName());
				pstm.setString(2, user.getLastName());
				pstm.setString(3, user.getEmail());
				pstm.setString(4, user.getPassword());
				pstm.setString(5, user.getPhone());
				pstm.setString(6, user.getDevice());
				pstm.setString(7, user.getType());
				pstm.registerOutParameter(8, Types.INTEGER);
				
				pstm.executeQuery();

				user.setUserId(String.valueOf(pstm.getInt(8)));
				
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return user;
		
	}

	public static User forgetData(String email, DBManager dbManager) {

		System.out.println("forgetData");
		
		User user = new User();
		
		try {
			
			String query = "SELECT * FROM user WHERE email='"+email+"'";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(email);
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setDevice(rs.getString("device"));
				user.setType(rs.getString("type"));
				user.setUserId(String.valueOf(rs.getInt("userId")));
				
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return user;
		
	}

	public static boolean changePasswordData(String userId, String oldPassword, String newPassword, DBManager dbManager) {

		System.out.println("changePasswordData");
		
		boolean flag = false;
		
		try {
			
			String query = "SELECT * FROM user WHERE userId="+userId+" AND password='"+oldPassword+"'";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				flag = true;
				
				query = "UPDATE user SET password='"+newPassword+"' WHERE userId="+userId;
				
				dbManager.getSt().executeUpdate(query);
				
			}
			
			rs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	public static ArrayList<LabourJobDetail> allLaborerJobsData(DBManager dbManager) {

		System.out.println("allLaborerJobsData");
		
		ArrayList<LabourJobDetail> ljd = new ArrayList<LabourJobDetail>();
		
		int i = 0;
		
		try {
			
			String query = "SELECT * FROM labourjobview WHERE jobDate=DATE_FORMAT(NOW(),'%d %b %Y') ORDER BY firstName ASC";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				LabourJobDetail labourJobDetail = new LabourJobDetail();
				
				labourJobDetail.setLabourJobId(String.valueOf(rs.getInt("labourJobId")));
				labourJobDetail.setUserId(String.valueOf(rs.getInt("userId")));
				labourJobDetail.setFirstName(rs.getString("firstName"));
				labourJobDetail.setLastName(rs.getString("lastName"));
				labourJobDetail.setEmail(rs.getString("email"));
				labourJobDetail.setPhone(rs.getString("phone"));
				labourJobDetail.setDevice(rs.getString("device"));
				labourJobDetail.setType(rs.getString("type"));
				labourJobDetail.setJobId(String.valueOf(rs.getInt("jobId")));
				labourJobDetail.setJob(rs.getString("job"));
				labourJobDetail.setJobDetail(rs.getString("jobDetail"));
				labourJobDetail.setBasicRate(String.valueOf(rs.getInt("basicRate")));
				labourJobDetail.setdARate(String.valueOf(rs.getInt("dARate")));
				labourJobDetail.setJobDate(rs.getString("jobDate"));
				labourJobDetail.setRemark(rs.getString("remark"));
				
				ljd.add(i, labourJobDetail);
				
				i++;
				
			}
			
			rs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return ljd;
		
	}

	public static LabourJobDetail myJobsData(String userId, DBManager dbManager) {

		System.out.println("myJobsData");
		
		LabourJobDetail labourJobDetail = new LabourJobDetail();
		
		try {
			
			String query = "SELECT * FROM labourjobview WHERE userId="+userId+" AND jobDate=DATE_FORMAT(NOW(),'%d %b %y')";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				labourJobDetail.setLabourJobId(String.valueOf(rs.getInt("labourJobId")));
				labourJobDetail.setUserId(String.valueOf(rs.getInt("userId")));
				labourJobDetail.setFirstName(rs.getString("firstName"));
				labourJobDetail.setLastName(rs.getString("lastName"));
				labourJobDetail.setEmail(rs.getString("email"));
				labourJobDetail.setPhone(rs.getString("phone"));
				labourJobDetail.setDevice(rs.getString("device"));
				labourJobDetail.setType(rs.getString("type"));
				labourJobDetail.setJobId(String.valueOf(rs.getInt("jobId")));
				labourJobDetail.setJob(rs.getString("job"));
				labourJobDetail.setJobDetail(rs.getString("jobDetail"));
				labourJobDetail.setBasicRate(String.valueOf(rs.getInt("basicRate")));
				labourJobDetail.setdARate(String.valueOf(rs.getInt("dARate")));
				labourJobDetail.setJobDate(rs.getString("jobDate"));
				labourJobDetail.setRemark(rs.getString("remark"));
								
			}
			
			rs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return labourJobDetail;
		
	}

	public static Job addJobData(Job job, DBManager dbManager) {

		System.out.println("addJobData");
		
		try {
			
			CallableStatement pstm = dbManager.getCon().prepareCall("call addnewjob(?,?,?,?,?)");
			
			pstm.setString(1, job.getJob());
			pstm.setString(2, job.getJobDetail());
			pstm.setFloat(3, Float.parseFloat(job.getBasicRate()));
			pstm.setFloat(4, Float.parseFloat(job.getdARate()));
			pstm.registerOutParameter(5, Types.INTEGER);
			
			pstm.executeQuery();

			job.setJobId(String.valueOf(pstm.getInt(5)));
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return job;
		
	}
	
	public static ArrayList<Job> allJobsData(DBManager dbManager) {

		System.out.println("allJobsData");
		
		ArrayList<Job> j = new ArrayList<Job>();
		
		int i = 0;
		
		try {
			
			String query = "SELECT * FROM job ORDER BY job.job";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				Job job = new Job();
				
				job.setJobId(String.valueOf(rs.getInt("jobId")));
				job.setJob(rs.getString("job"));
				job.setJobDetail(rs.getString("jobDetail"));
				job.setBasicRate(String.valueOf(rs.getFloat("basicRate")));
				job.setdARate(String.valueOf(rs.getFloat("dARate")));
				
				j.add(i, job);

				i++;
				
			}
			
			rs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return j;
		
	}
	
	public static ArrayList<User> allLaborersData(String jobDate, DBManager dbManager) {

		System.out.println("allLaborersData");
		
		ArrayList<User> u = new ArrayList<User>();
		
		int i = 0;
		
		try {
			
			String query = "SELECT * FROM labourjobview WHERE checklabourschedule(userId, "+jobDate+")=0 GROUP BY userId  ORDER BY firstName ASC";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				User user = new User();
				
				user.setUserId(String.valueOf(rs.getInt("userId")));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setDevice(rs.getString("device"));
				user.setType(rs.getString("type"));
				
				u.add(i, user);
				
				i++;
				
			}
			
			rs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return u;
		
	}
	
	public static LabourJob assignLabourJobData(LabourJob labourJob, DBManager dbManager) {

		System.out.println("assignLabourJobData");
		
		try {
			
			CallableStatement pstm = dbManager.getCon().prepareCall("call assignlabourjob(?,?,?,?)");
			
			pstm.setInt(1, Integer.parseInt(labourJob.getUserId()));
			pstm.setInt(2, Integer.parseInt(labourJob.getJobId()));
			pstm.setInt(3, Integer.parseInt(labourJob.getJobDate()));
			pstm.registerOutParameter(4, Types.INTEGER);
			
			pstm.executeQuery();
			
			labourJob.setLabourJobId(String.valueOf(pstm.getInt(4)));
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return labourJob;
		
	}
	
	public static LabourJob jobRemarkData(LabourJob labourJob, DBManager dbManager) {

		System.out.println("jobRemarkData");
		
		try {
			
			CallableStatement pstm = dbManager.getCon().prepareCall("call labourjobremark(?,?)");
			
			pstm.setInt(1, Integer.parseInt(labourJob.getLabourJobId()));
			pstm.setString(2, labourJob.getRemark());
			
			pstm.executeQuery();
						
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return labourJob;
		
	}

	public static boolean paymentData(String userId, String amount, DBManager dbManager) {

		System.out.println("paymentData");
		
		boolean flag = false;
		
		try {
			
			CallableStatement pstm = dbManager.getCon().prepareCall("call laboursalarypayment(?,?)");
			
			pstm.setInt(1, Integer.parseInt(userId));
			pstm.setFloat(2, Float.parseFloat(amount));
			
			pstm.executeQuery();
			
			flag = true;
						
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	public static ArrayList<LabourJobDetail> myWeeklyJobsData(String userId, DBManager dbManager) {

		System.out.println("myWeeklyJobsData");
		
		ArrayList<LabourJobDetail> ljd = new ArrayList<LabourJobDetail>();
		
		int i = 0;
		
		try {
			
			String query = "SELECT *, DATE_FORMAT(jobDate, '%d %b %Y') AS jobDate2 FROM labourjobview2 WHERE userId="+userId+" AND jobDate<=DATE_ADD(NOW(), INTERVAL 7 DAY) AND jobDate>=DATE_SUB(NOW(), INTERVAL 7 DAY) ORDER BY labourJobId desc";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				LabourJobDetail labourJobDetail = new LabourJobDetail();
				
				labourJobDetail.setLabourJobId(String.valueOf(rs.getInt("labourJobId")));
				labourJobDetail.setUserId(String.valueOf(rs.getInt("userId")));
				labourJobDetail.setFirstName(rs.getString("firstName"));
				labourJobDetail.setLastName(rs.getString("lastName"));
				labourJobDetail.setEmail(rs.getString("email"));
				labourJobDetail.setPhone(rs.getString("phone"));
				labourJobDetail.setDevice(rs.getString("device"));
				labourJobDetail.setType(rs.getString("type"));
				labourJobDetail.setJobId(String.valueOf(rs.getInt("jobId")));
				labourJobDetail.setJob(rs.getString("job"));
				labourJobDetail.setJobDetail(rs.getString("jobDetail"));
				labourJobDetail.setBasicRate(String.valueOf(rs.getInt("basicRate")));
				labourJobDetail.setdARate(String.valueOf(rs.getInt("dARate")));
				labourJobDetail.setJobDate(rs.getString("jobDate2"));
				labourJobDetail.setRemark(rs.getString("remark"));
				
				ljd.add(i, labourJobDetail);
				
				i++;
								
			}
			
			rs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return ljd;
		
	}
	
	public static LabourJobDetail assignedJobDetail(String labourJobId, DBManager dbManager) {

		System.out.println("assignedJobDetail");
		
		LabourJobDetail labourJobDetail = new LabourJobDetail();
		
		try {
			
			CallableStatement pstm = dbManager.getCon().prepareCall("call assignedjobdetail(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			pstm.setInt(1, Integer.parseInt(labourJobId));
			pstm.registerOutParameter(2, Types.INTEGER);
			pstm.registerOutParameter(3, Types.VARCHAR);
			pstm.registerOutParameter(4, Types.VARCHAR);
			pstm.registerOutParameter(5, Types.VARCHAR);
			pstm.registerOutParameter(6, Types.VARCHAR);
			pstm.registerOutParameter(7, Types.VARCHAR);
			pstm.registerOutParameter(8, Types.VARCHAR);
			pstm.registerOutParameter(9, Types.INTEGER);
			pstm.registerOutParameter(10, Types.VARCHAR);
			pstm.registerOutParameter(11, Types.VARCHAR);
			pstm.registerOutParameter(12, Types.FLOAT);
			pstm.registerOutParameter(13, Types.FLOAT);
			pstm.registerOutParameter(14, Types.VARCHAR);
			pstm.registerOutParameter(15, Types.VARCHAR);
			
			pstm.executeQuery();
			
			labourJobDetail.setLabourJobId(labourJobId);
			labourJobDetail.setUserId(String.valueOf(pstm.getInt(2)));
			labourJobDetail.setFirstName(pstm.getString(3));
			labourJobDetail.setLastName(pstm.getString(4));
			labourJobDetail.setEmail(pstm.getString(5));
			labourJobDetail.setPhone(pstm.getString(6));
			labourJobDetail.setDevice(pstm.getString(7));
			labourJobDetail.setType(pstm.getString(8));
			labourJobDetail.setJobId(String.valueOf(pstm.getInt(9)));
			labourJobDetail.setJob(pstm.getString(10));
			labourJobDetail.setJobDetail(pstm.getString(11));
			labourJobDetail.setBasicRate(String.valueOf(pstm.getFloat(12)));
			labourJobDetail.setdARate(String.valueOf(pstm.getFloat(13)));
			labourJobDetail.setJobDate(pstm.getString(14));
			labourJobDetail.setRemark(pstm.getString(15));
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return labourJobDetail;
		
	}
	
	public static Job editJob(Job job, DBManager dbManager) {

		System.out.println("editJob");
			
		try {
			
			String query = "UPDATE job j "
					+ "SET j.job='"+job.getJob()+"', "
							+ "j.jobDetail='"+job.getJobDetail()+"', "
									+ "j.basicRate="+job.getBasicRate()+", "
											+ "j.dARate="+job.getdARate()+" "
													+ "WHERE j.jobId="+job.getJobId();
			
			dbManager.getSt().executeUpdate(query);
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return job;
		
	}
	
	public static ArrayList<User> laborerListAll(DBManager dbManager) {

		System.out.println("laborerListAll");
		
		ArrayList<User> users = new ArrayList<User>();
			
		try {
			
			String query = "SELECT *, DATE_FORMAT(joinDate, '%d %b %Y') AS dateOfJoin FROM user WHERE type='LABOUR' ORDER BY firstName ASC";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			int i = 0;
			
			while(rs.next()) {
				
				User user = new User();
				
				user.setUserId(String.valueOf(rs.getInt("userId")));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setJoinDate("" + rs.getString("dateOfJoin"));
				
				users.add(i, user);
				
				i++;
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
		
	}
	
	public static ArrayList<LabourSalary> laborerSalaryAll(DBManager dbManager) {

		System.out.println("laborerSalaryAll");
		
		ArrayList<LabourSalary> users = new ArrayList<LabourSalary>();
			
		try {
			
			String query = "SELECT * FROM laboursalaryview ORDER BY totalSalary DESC";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			int i = 0;
			
			while(rs.next()) {
				
				LabourSalary user = new LabourSalary();
				
				user.setUserId(String.valueOf(rs.getInt("userId")));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setLabourSalaryId(String.valueOf(rs.getInt("labourSalaryId")));
				user.setTotalSalary(String.valueOf(rs.getFloat("totalSalary")));
				
				users.add(i, user);
				
				i++;
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
		
	}
	
	public static ArrayList<LabourPayment> labourPaymentDetail(String userId,DBManager dbManager) {

		System.out.println("labourPaymentDetail");
		
		ArrayList<LabourPayment> users = new ArrayList<LabourPayment>();
			
		try {
			
			String query = "SELECT *, DATE_FORMAT(paidDate, '%d %b %Y') AS dateOfPaid FROM labourpayment WHERE userId="+ userId +" ORDER BY labourPaymentId DESC";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			int i = 0;
			
			while(rs.next()) {
				
				LabourPayment user = new LabourPayment();
				
				user.setLabourPaymentId(String.valueOf(rs.getInt("labourPaymentId")));
				user.setUserId(String.valueOf(rs.getInt("userId")));
				user.setAmountBefore(String.valueOf(rs.getFloat("amountBefore")));
				user.setPaidAmount(String.valueOf(rs.getFloat("paidAmount")));
				user.setPaidDate(rs.getString("dateOfPaid"));
				
				users.add(i, user);
				
				i++;
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
		
	}
	
	public static LabourSalary laborerSalary(String userId, DBManager dbManager) {

		System.out.println("laborerSalary");
		
		LabourSalary user = new LabourSalary();
			
		try {
			
			String query = "SELECT * FROM laboursalaryview WHERE userId="+ userId +" ORDER BY totalSalary DESC";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				user.setUserId(String.valueOf(rs.getInt("userId")));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setLabourSalaryId(String.valueOf(rs.getInt("labourSalaryId")));
				user.setTotalSalary(String.valueOf(rs.getFloat("totalSalary")));
								
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	public static ArrayList<LabourJobDetail> labourJobAllDay(DBManager dbManager) {

		System.out.println("labourJobAllDay");
		
		ArrayList<LabourJobDetail> ljd = new ArrayList<LabourJobDetail>();
		
		int i = 0;
		
		try {
			
			String query = "SELECT * FROM labourjobview WHERE job!='JOINING' ORDER BY firstName ASC";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				LabourJobDetail labourJobDetail = new LabourJobDetail();
				
				labourJobDetail.setLabourJobId(String.valueOf(rs.getInt("labourJobId")));
				labourJobDetail.setUserId(String.valueOf(rs.getInt("userId")));
				labourJobDetail.setFirstName(rs.getString("firstName"));
				labourJobDetail.setLastName(rs.getString("lastName"));
				labourJobDetail.setEmail(rs.getString("email"));
				labourJobDetail.setPhone(rs.getString("phone"));
				labourJobDetail.setDevice(rs.getString("device"));
				labourJobDetail.setType(rs.getString("type"));
				labourJobDetail.setJobId(String.valueOf(rs.getInt("jobId")));
				labourJobDetail.setJob(rs.getString("job"));
				labourJobDetail.setJobDetail(rs.getString("jobDetail"));
				labourJobDetail.setBasicRate(String.valueOf(rs.getInt("basicRate")));
				labourJobDetail.setdARate(String.valueOf(rs.getInt("dARate")));
				labourJobDetail.setJobDate(rs.getString("jobDate"));
				labourJobDetail.setRemark(rs.getString("remark"));
				
				ljd.add(i, labourJobDetail);
				
				i++;
				
			}
			
			rs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return ljd;
		
	}
	
}
