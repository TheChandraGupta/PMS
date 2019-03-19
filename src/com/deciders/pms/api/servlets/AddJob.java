package com.deciders.pms.api.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deciders.pms.api.bean.Job;
import com.deciders.pms.api.database.DBHandler;
import com.deciders.pms.api.database.DBManager;
import com.deciders.pms.api.json.JobJSON;

/**
 * Servlet implementation class AddJob
 */
@WebServlet("/AddJob")
public class AddJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddJob() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Job job = new Job();
		
		job.setJob(request.getParameter("addjob"));
		job.setJobDetail(request.getParameter("jobdetail"));
		job.setBasicRate(request.getParameter("basicrate"));
		job.setdARate(request.getParameter("darate"));
		
		DBManager dbManager = new DBManager();
				
		job = DBHandler.addJobData(job, dbManager);
		
		RequestDispatcher rd = null;
		
		if(job.getJobId().equals("0") || job==null || job.getJobId()==null) {

			//send = JobJSON.addJobJSON(j, 203);
			System.out.println("ADD JOB = " + "PROBLEM IN ADDING NEW JOB");
			request.setAttribute("msg", "PROBLEM IN ADDING NEW JOB");
			rd = request.getRequestDispatcher("addjob.jsp");
			
		}
		else {

			//send = JobJSON.addJobJSON(j, 200);
			System.out.println("ADD JOB = " + "SUCCESSFULL ADDED NEW JOB");
			request.setAttribute("msg", "SUCCESSFULL ADDED NEW JOB");
			rd = request.getRequestDispatcher("addjob.jsp");
			
		}
		
		dbManager.close();
		
		rd.forward(request, response);
		
		
		
	}

}
