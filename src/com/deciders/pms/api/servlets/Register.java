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

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");

		System.out.println("Register");
		
		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phonenumber");
		String password = request.getParameter("password");
		String device = request.getParameter("device");
		
		device = "Web Application";
		
		DBManager dbManager = new DBManager();
		
		User user = new User(firstName, lastName, email, phone, password, device);
		
		user = DBHandler.registerData(user, dbManager);

		RequestDispatcher rd = null;
		
		if(user == null || user.getUserId()==null || Integer.parseInt(user.getUserId())==0) {
			user = new User();
			user.setUserId(String.valueOf(0));
			System.out.println("REGISTER = " + "INVALID EMAIL OR PASSWORD" +" : User = " + user);
			request.setAttribute("msg", "USER ALREADY EXIST, PLEASE TRY DIFFERENT EMAIL ID");
			rd = request.getRequestDispatcher("register.jsp");
		}
		else {

			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			System.out.println("REGISTER = " + "Register Successful" +" : User = " + session.getAttribute("user"));

			request.setAttribute("msg", "REGISTER SUCCESSFUL");
			
			if(user.getType().equals("LABOUR")) {
				rd = request.getRequestDispatcher("labourviewdetail.jsp");				
			}
			else {
				rd = request.getRequestDispatcher("managerviewdetail.jsp");	
			}
			
		}

		dbManager.close();
		
		rd.forward(request, response);
		
	}

}
