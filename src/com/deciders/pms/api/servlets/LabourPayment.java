package com.deciders.pms.api.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deciders.pms.api.bean.LabourJob;
import com.deciders.pms.api.database.DBHandler;
import com.deciders.pms.api.database.DBManager;
import com.deciders.pms.api.json.LabourJobJSON;

/**
 * Servlet implementation class LabourPayment
 */
@WebServlet("/LabourPayment")
public class LabourPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LabourPayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("payment");
		
		String userId = request.getParameter("userId");
		String amount = request.getParameter("amount");
		
		DBManager dbManager = new DBManager();
		
		RequestDispatcher rd = null;
		
		if(DBHandler.paymentData(userId, amount, dbManager)) {
			
			//LabourJobJSON.assignedJobJSON(new LabourJob(), 200);
			System.out.println("PAYMENT = " + "PAYMENT SUCCESSFUL");
			request.setAttribute("msg", "PAYMENT SUCCESSFUL");
			rd = request.getRequestDispatcher("laboursalaryall.jsp");
			
		}
		else {

			//LabourJobJSON.assignedJobJSON(new LabourJob(), 203);
			System.out.println("PAYMENT = " + "PAYMENT FAILED");
			request.setAttribute("msg", "PAYMENT FAILED");
			rd = request.getRequestDispatcher("laboursalaryall.jsp");
			
		}
		
		dbManager.close();
		
		rd.forward(request, response);
		
	}

}
