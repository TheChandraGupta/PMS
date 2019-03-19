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

/**
 * Servlet implementation class EditJob
 */
@WebServlet("/EditJob")
public class EditJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditJob() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String jobId = request.getParameter("jobId");
		String job = request.getParameter("addjob");
		String jobDetail = request.getParameter("jobdetail");
		String basicRate = request.getParameter("basicrate");
		String dARate = request.getParameter("darate");
		
		System.out.println(jobId + " " + job + " " + jobDetail + " " + basicRate + " " + dARate);
		
		Job job1 = new Job(jobId, job, jobDetail, basicRate, dARate);
		
		DBManager dbManager = new DBManager();
		
		job1 = DBHandler.editJob(job1, dbManager);
		
		RequestDispatcher rd = null;
		
		if(job1==null || job1.getJobId()==null || "".equals(job1.getJobId()) || "0".equals(job1.getJobId())) {

			System.out.println("EDIT JOB = " + "UNABLE TO UPDATE JOB");
			request.setAttribute("msg", "UNABLE TO UPDATE JOB");
			rd = request.getRequestDispatcher("addjob.jsp");
			
		}
		else {

			System.out.println("EDIT JOB = " + "JOB UPDATED SUCCESSFULLY");
			request.setAttribute("msg", "JOB UPDATED SUCCESSFULLY");
			rd = request.getRequestDispatcher("addjob.jsp");
			
		}
		
		dbManager.close();
		
		rd.forward(request, response);
		
	}

}
