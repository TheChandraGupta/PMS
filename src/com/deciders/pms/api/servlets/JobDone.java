package com.deciders.pms.api.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deciders.pms.api.bean.LabourJob;
import com.deciders.pms.api.bean.LabourJobDetail;
import com.deciders.pms.api.database.DBHandler;
import com.deciders.pms.api.database.DBManager;
import com.deciders.pms.api.json.LabourJobJSON;
import com.deciders.pms.api.mail.EmailSendingServlet;
import com.deciders.pms.api.mail.MailThread;

/**
 * Servlet implementation class JobDone
 */
@WebServlet("/JobDone")
public class JobDone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobDone() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String labourJobId = request.getParameter("labourJobId");
		
		DBManager dbManager = new DBManager();
		
		LabourJob labourJob = new LabourJob(labourJobId, "0", "0", "0", "COMPLETE");
		
		labourJob = DBHandler.jobRemarkData(labourJob, dbManager);
		
		RequestDispatcher rd = null;
		
		if(labourJob == null || labourJob.getLabourJobId()==null || Integer.parseInt(labourJob.getLabourJobId())==0) {

			//send = LabourJobJSON.assignedJobJSON(labourJob, 203);

			System.out.println("JOB DONE = " + "ERROR WHILE PROCESSING, PLEASE TRY AGAIN AFTER SOME TIME");
			request.setAttribute("msg", "ERROR WHILE PROCESSING, PLEASE TRY AGAIN AFTER SOME TIME");
			rd = request.getRequestDispatcher("managerviewdetail.jsp");
			
		}
		else {
			
			LabourJobDetail labourJobDetail = DBHandler.assignedJobDetail(labourJobId, dbManager);
			
			EmailSendingServlet mail =new EmailSendingServlet();
			
			String recipient = labourJobDetail.getEmail();
			String subject = "Job Completed : " + labourJobDetail.getJob();
			String content = "Dear "+ labourJobDetail.getFirstName() +",\n\n"
					+ "The job you had been assigned with is completed.\n\n"
					+ "Job : "+ labourJobDetail.getJob() +"\n"
					+ "Date : " + labourJobDetail.getJobDate()+ "\n"
							+ "Detail : "+ labourJobDetail.getJobDetail() + "\n"
									+ "Basic Rate : " + labourJobDetail.getBasicRate() + "\n"
											+ "DA Rate : " + labourJobDetail.getdARate() + "\n"
													+ "Status : " + labourJobDetail.getRemark() + "\n\n"
															+ "Please collect your payment from the Manager.";
			
			mail.setRecipient(recipient);
			mail.setSubject(subject);
			mail.setContent(content);
			
			MailThread sendMail = new MailThread(mail);
			sendMail.start();
			

			//send = LabourJobJSON.assignedJobJSON(labourJob, 200);

			System.out.println("JOB DONE = " + "LABOUR JOB COMPLETED");
			request.setAttribute("msg", "LABOUR JOB COMPLETED");
			rd = request.getRequestDispatcher("managerviewdetail.jsp");
			
		}
		
		dbManager.close();	
		
		rd.forward(request, response);
		
	}

}
