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
 * Servlet implementation class AssignJob
 */
@WebServlet("/AssignJob")
public class AssignJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignJob() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userId = request.getParameter("userId");
		String jobId = request.getParameter("jobId");
		String jobDate = request.getParameter("jobDate");

		DBManager dbManager = new DBManager();
		
		LabourJob labourJob = new LabourJob(userId, jobId, jobDate);
		
		labourJob = DBHandler.assignLabourJobData(labourJob, dbManager);
		
		RequestDispatcher rd = null;
		
		if(labourJob == null || labourJob.getLabourJobId()==null || Integer.parseInt(labourJob.getLabourJobId())==0) {

			//send = LabourJobJSON.assignedJobJSON(labourJob, 203);
			System.out.println("ASSIGN JOB = " + "UNABLE TO ASSIGN JOB");
			request.setAttribute("msg", "UNABLE TO ASSIGN JOB");
			rd = request.getRequestDispatcher("managerviewdetail.jsp");
			
		}
		else {
			
			LabourJobDetail labourJobDetail = DBHandler.assignedJobDetail( labourJob.getLabourJobId(), dbManager);
			
			EmailSendingServlet mail =new EmailSendingServlet();
			
			String recipient = labourJobDetail.getEmail();
			String subject = "New Job Assigned : " + labourJobDetail.getJob();
			String content = "Dear "+ labourJobDetail.getFirstName() +",\n\n"
					+ "You had been assigned with a new job.\n\n"
					+ "Job : "+ labourJobDetail.getJob() +"\n"
					+ "Date : " + labourJobDetail.getJobDate()+ "\n"
							+ "Detail : "+ labourJobDetail.getJobDetail() + "\n"
									+ "Basic Rate : " + labourJobDetail.getBasicRate() + "\n"
											+ "DA Rate : " + labourJobDetail.getdARate() + "\n"
													+ "Status : " + labourJobDetail.getRemark();
			
			mail.setRecipient(recipient);
			mail.setSubject(subject);
			mail.setContent(content);
			
			MailThread sendMail = new MailThread(mail);
			sendMail.start();
			

			//send = LabourJobJSON.assignedJobJSON(labourJob, 200);
			System.out.println("ASSIGN JOB = " + "ASSIGN JOB SUCCESSFUL");
			request.setAttribute("msg", "ASSIGN JOB SUCCESSFUL");
			rd = request.getRequestDispatcher("managerviewdetail.jsp");
			
		}
		
		dbManager.close();
		
		rd.forward(request, response);
		
	}

}
