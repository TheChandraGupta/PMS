package com.deciders.pms.api.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deciders.pms.api.bean.User;
import com.deciders.pms.api.database.DBHandler;
import com.deciders.pms.api.database.DBManager;
import com.deciders.pms.api.json.UserJSON;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String oldPassword = request.getParameter("oldpassword");
		String newPassword = request.getParameter("password");
		int userType = Integer.parseInt(request.getParameter("userType"));
		String userId = request.getParameter("userId");
		String url = "";
		
		if(userType == 1) {
			url = "managerpassword.jsp";
		}
		else {
			url = "labourpassword.jsp";
		}
		
		RequestDispatcher rd = null;
		
		User user = new User();

		DBManager dbManager = new DBManager();
		
		if(DBHandler.changePasswordData(userId, oldPassword, newPassword, dbManager)) {
			user.setUserId(userId);
			user.setPassword(newPassword);

			System.out.println("CHANGE PASSWORD = " + "PASSWORD CHANGED SUCCESSFULLY" +" : User = " + user);
			request.setAttribute("msg", "PASSWORD CHANGED SUCCESSFULLY");
		}
		else {
			user.setUserId(String.valueOf(0));
			System.out.println("CHANGE PASSWORD = " + "INVALID PASSWORD, TRY AGAIN" +" : User = " + user);
			request.setAttribute("msg", "INVALID PASSWORD, TRY AGAIN");
		}
		
		dbManager.close();
		
		rd = request.getRequestDispatcher(url);

		rd.forward(request, response);
				
	}

}
