package com.deciders.pms.api.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deciders.pms.api.bean.User;
import com.deciders.pms.api.database.DBHandler;
import com.deciders.pms.api.database.DBManager;
import com.deciders.pms.api.mail.EmailSendingServlet;
import com.deciders.pms.api.mail.MailThread;

/**
 * Servlet implementation class Forget
 */
@WebServlet("/Forget")
public class Forget extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forget() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");

		System.out.println("Forget");
		
		String email = request.getParameter("email");
		
		DBManager dbManager = new DBManager();
		
		User user = DBHandler.forgetData(email, dbManager);
		
		RequestDispatcher rd = null;
		
		if(user == null || user.getUserId()==null || Integer.parseInt(user.getUserId())==0) {
			user = new User();
			user.setUserId(String.valueOf(0));
			System.out.println("LOGIN = " + "INVALID EMAIL" +" : User = " + user);
			request.setAttribute("msg", "INVALID EMAIL, PLEASE ENTER VALID EMAIL");
			rd = request.getRequestDispatcher("forgotpassword.jsp");
		}
		else {

			EmailSendingServlet mail =new EmailSendingServlet();
			
			String recipient = email;
			String subject = "Password Recovered";
			String content = "Dear "+ user.getFirstName() +",\n\n"
					+ "Your password has been recovered\n"
					+ "Email : "+email+"\n"
							+ "Password : "+user.getPassword();
			
			mail.setRecipient(recipient);
			mail.setSubject(subject);
			mail.setContent(content);
			
			MailThread sendMail = new MailThread(mail);
			sendMail.start();
			
			System.out.println("FORGET = " + "VALID EMAIL" +" : User = " + user);
			request.setAttribute("msg", "Check Mail for Password Recovery, Else Please try After 15 Minutes.");
			rd = request.getRequestDispatcher("index.jsp");
			
		}

		dbManager.close();
		
		rd.forward(request, response);
		
	}

}
