package com.deciders.pms.api.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.deciders.pms.api.bean.JobAllotmentDetail;
import com.deciders.pms.api.bean.LabourJobDetail2;
import com.deciders.pms.api.bean.LabourPaymentDetail;
import com.deciders.pms.api.bean.LabourSalary;
import com.deciders.pms.api.bean.User;

public class Report {
	
	public static int labourCountTotal(DBManager dbManager) {

		System.out.println("labourCountTotal");
		
		int count = 0;
		
		try {
			
			String query = "SELECT labourcounttotal() AS count";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			rs.next();
			
			count = rs.getInt("count");
			
			rs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	public static int labourCountCurrentMonth(DBManager dbManager) {

		System.out.println("labourCountCurrentMonth");
		
		int count = 0;
		
		try {
			
			String query = "SELECT labourcountcurrentmonth() AS count";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			rs.next();
			
			count = rs.getInt("count");
			
			rs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	public static ArrayList<LabourSalary> salaryHighestLabourTopFive(DBManager dbManager) {

		System.out.println("salaryHighestLabourTopFive");

		ArrayList<LabourSalary> users = new ArrayList<LabourSalary>();
			
		try {
			
			String query = "SELECT * FROM laboursalaryview WHERE totalSalary>0 ORDER BY totalSalary DESC LIMIT 5";
			
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
	
	public static ArrayList<LabourPaymentDetail> paymentHighestLabourTopFive(DBManager dbManager) {

		System.out.println("paymentHighestLabourTopFive");

		ArrayList<LabourPaymentDetail> users = new ArrayList<LabourPaymentDetail>();
			
		try {
			
			String query = "SELECT l.userId, SUM(l.paidAmount) AS amount, u.firstName, u.lastName, u.email, u.phone FROM labourpayment l, user u WHERE l.userId=u.userId GROUP BY l.userId HAVING amount>0 ORDER BY amount DESC";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			int i = 0;
			
			while(rs.next()) {
				
				LabourPaymentDetail user = new LabourPaymentDetail();
				
				user.setUserId(String.valueOf(rs.getInt("userId")));
				user.setAmount(String.valueOf(rs.getFloat("amount")));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				
				users.add(i, user);
				
				i++;
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
		
	}
	
	public static ArrayList<LabourJobDetail2> jobAssignedHighestLabourTopFive(DBManager dbManager) {

		System.out.println("jobAssignedHighestLabourTopFive");

		ArrayList<LabourJobDetail2> users = new ArrayList<LabourJobDetail2>();
			
		try {
			
			String query = "SELECT *, COUNT(*) AS jobCount FROM labourjobview WHERE job!='JOINING' GROUP BY userId ORDER BY jobCount DESC LIMIT 5";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			int i = 0;
			
			while(rs.next()) {
				
				LabourJobDetail2 labourJobDetail = new LabourJobDetail2();
				
				labourJobDetail.setLabourJobId(String.valueOf(rs.getInt("labourJobId")));
				labourJobDetail.setUserId(String.valueOf(rs.getInt("userId")));
				labourJobDetail.setFirstName(rs.getString("firstName"));
				labourJobDetail.setLastName(rs.getString("lastName"));
				labourJobDetail.setEmail(rs.getString("email"));
				labourJobDetail.setPhone(rs.getString("phone"));
				labourJobDetail.setJobCount(String.valueOf(rs.getInt("jobCount")));
				
				users.add(i, labourJobDetail);
				
				i++;
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
		
	}
	
	public static ArrayList<LabourJobDetail2> jobAssignedDoneHighestLabourTopFive(DBManager dbManager) {

		System.out.println("jobAssignedDoneHighestLabourTopFive");

		ArrayList<LabourJobDetail2> users = new ArrayList<LabourJobDetail2>();
			
		try {
			
			String query = "SELECT *, COUNT(*) AS jobCount FROM labourjobview WHERE remark='COMPLETE' AND job!='JOINING' GROUP BY userId ORDER BY jobCount DESC LIMIT 5";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			int i = 0;
			
			while(rs.next()) {
				
				LabourJobDetail2 labourJobDetail = new LabourJobDetail2();
				
				labourJobDetail.setLabourJobId(String.valueOf(rs.getInt("labourJobId")));
				labourJobDetail.setUserId(String.valueOf(rs.getInt("userId")));
				labourJobDetail.setFirstName(rs.getString("firstName"));
				labourJobDetail.setLastName(rs.getString("lastName"));
				labourJobDetail.setEmail(rs.getString("email"));
				labourJobDetail.setPhone(rs.getString("phone"));
				labourJobDetail.setJobCount(String.valueOf(rs.getInt("jobCount")));
				
				users.add(i, labourJobDetail);
				
				i++;
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
		
	}
	
	public static ArrayList<LabourJobDetail2> jobAssignedLowestLabourTopFive(DBManager dbManager) {

		System.out.println("jobAssignedLowestLabourTopFive");

		ArrayList<LabourJobDetail2> users = new ArrayList<LabourJobDetail2>();
			
		try {
			
			String query = "SELECT *, COUNT(*) AS jobCount FROM labourjobview WHERE job!='JOINING' GROUP BY userId ORDER BY jobCount ASC LIMIT 5";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			int i = 0;
			
			while(rs.next()) {
				
				LabourJobDetail2 labourJobDetail = new LabourJobDetail2();
				
				labourJobDetail.setLabourJobId(String.valueOf(rs.getInt("labourJobId")));
				labourJobDetail.setUserId(String.valueOf(rs.getInt("userId")));
				labourJobDetail.setFirstName(rs.getString("firstName"));
				labourJobDetail.setLastName(rs.getString("lastName"));
				labourJobDetail.setEmail(rs.getString("email"));
				labourJobDetail.setPhone(rs.getString("phone"));
				labourJobDetail.setJobCount(String.valueOf(rs.getInt("jobCount")));
				
				users.add(i, labourJobDetail);
				
				i++;
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
		
	}
	
	public static ArrayList<LabourJobDetail2> jobAssignedDoneLowestLabourTopFive(DBManager dbManager) {

		System.out.println("jobAssignedDoneLowestLabourTopFive");

		ArrayList<LabourJobDetail2> users = new ArrayList<LabourJobDetail2>();
			
		try {
			
			String query = "SELECT *, COUNT(*) AS jobCount FROM labourjobview WHERE remark='COMPLETE' AND job!='JOINING' GROUP BY userId ORDER BY jobCount ASC LIMIT 5";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			int i = 0;
			
			while(rs.next()) {
				
				LabourJobDetail2 labourJobDetail = new LabourJobDetail2();
				
				labourJobDetail.setLabourJobId(String.valueOf(rs.getInt("labourJobId")));
				labourJobDetail.setUserId(String.valueOf(rs.getInt("userId")));
				labourJobDetail.setFirstName(rs.getString("firstName"));
				labourJobDetail.setLastName(rs.getString("lastName"));
				labourJobDetail.setEmail(rs.getString("email"));
				labourJobDetail.setPhone(rs.getString("phone"));
				labourJobDetail.setJobCount(String.valueOf(rs.getInt("jobCount")));
				
				users.add(i, labourJobDetail);
				
				i++;
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
		
	}
	
	public static ArrayList<JobAllotmentDetail> jobAllotmentHighestTopFive(DBManager dbManager) {

		System.out.println("jobAllotmentHighestTopFive");

		ArrayList<JobAllotmentDetail> users = new ArrayList<JobAllotmentDetail>();
			
		try {
			
			String query = "SELECT jobId, job, COUNT(*) AS allotment FROM labourjobview WHERE job!='JOINING' GROUP BY jobId ORDER BY allotment DESC LIMIT 5";
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			int i = 0;
			
			while(rs.next()) {
				
				JobAllotmentDetail jobAllotmentDetail = new JobAllotmentDetail();
				
				jobAllotmentDetail.setJobId(String.valueOf(rs.getInt("jobId")));
				jobAllotmentDetail.setJob(rs.getString("job"));
				jobAllotmentDetail.setAllotment(String.valueOf(rs.getString("allotment")));
				
				users.add(i, jobAllotmentDetail);
				
				i++;
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return users;
		
	}

	public static ArrayList<User> laborerListBetweenDates(String dateFrom, String dateTo, DBManager dbManager) {

		System.out.println("laborerListBetweenDates");
		
		ArrayList<User> users = new ArrayList<User>();
			
		try {
			
			String query = "SELECT *, DATE_FORMAT(joinDate, '%d %b %Y') AS dateOfJoin FROM user WHERE type='LABOUR' AND DATE_FORMAT(joinDate, '%Y-%m-%d') BETWEEN '"+dateFrom+"' AND '"+dateTo+"'";
			System.out.println(query);
			
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
	
	public static int laborerCountBetweenDates(String dateFrom, String dateTo, DBManager dbManager) {

		System.out.println("laborerListBetweenDates");
		
		int count = 0;
			
		try {
			
			String query = "SELECT COUNT(*) AS userCount FROM user WHERE type='LABOUR' AND DATE_FORMAT(joinDate, '%Y-%m-%d') BETWEEN '"+dateFrom+"' AND '"+dateTo+"'";
			System.out.println(query);
			
			ResultSet rs = dbManager.getSt().executeQuery(query);
			
			while(rs.next()) {
				
				count = rs.getInt("userCount");
				
			}
									
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return count;
		
	}

}
