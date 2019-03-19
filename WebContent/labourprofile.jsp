<%@ page import="com.deciders.pms.api.database.*" %>
<%@ page import="com.deciders.pms.api.bean.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page errorPage="error.jsp" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js""> 
	<head> 
		<meta charset="utf-8"> 
		<title>PMS</title> 
		<meta name="description"/> 
		<meta name="viewport" content="width=device-width"/> 
		<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
		<script src="bootstrap/jquery.min.js"></script>
		<script src="bootstrap/bootstrap.min.js"></script>		
		<link rel="stylesheet" href="styles/main.css"/> 
	</head> 
	<%
	/*
	HttpSession nSession = request.getSession(false);
	if(nSession == null) {
		System.out.println("SESSION = " + "SESSION EXPIRED, TRY LOGGING AGAIN");
		request.setAttribute("msg", "SESSION EXPIRED, TRY LOGGING AGAIN");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	*/
	String msg = null;
	msg = (String) request.getAttribute("msg");
	
	User user = (User) session.getAttribute("user");
		
	%>
	<body> 
		<div> 			
			<div class="dashboard-page"> 
				<div class="container-fluid"> 
					<div class="row"> 
						<div class="col-sm-3 col-md-2 sidebar"> 
							<div class="text-center"> 
								<h2 class="brand"><%=user.getFirstName() %></h2> 
								<img src="images/flat-avatar.png" class="user-avatar"/><br> 
							</div> <br><br>
							<div class="list-group">
								<a class="list-group-item active" href="labourviewdetail.jsp"><i class="glyphicon glyphicon-edit" aria-hidden="true"></i>&nbsp; My Jobs Details</a>
								<a class="list-group-item active" href="labourallview.jsp"><i class="glyphicon glyphicon-edit" aria-hidden="true"></i>&nbsp; All Jobs Details</a>
								<a class="list-group-item active" href="mypaymenthistory.jsp"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp; Payment Detail</a>
								<a class="list-group-item active" href="labourprofile.jsp"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp; Profile</a>
								<a class="list-group-item active" href="labourpassword.jsp"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>&nbsp; Change Password</a>
								<a class="list-group-item" href="index.jsp"><i class="glyphicon glyphicon-off" aria-hidden="true"></i>&nbsp; Logout</a>
							</div>
						</div> 
						<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> 
							<div> 
								<h2>Profile</h2>  
								<div class="jumbotron"> 
									<div class="container"> 
										<form role="form" action="" method="post" name="assignjob"> 
											<div class="form-content"> 
												<div class="form-group"> 
													<ul class="nav nav-tabs">
														<li role="presentation" class="active"><a href="#">Profile</a></li>
														<!--<li role="presentation"><a href="#">Home</a></li>
														<li role="presentation"><a href="#">Messages</a></li>-->
													</ul>
													<table class="table table-responsive" id="details">
														<tr>
															<td><b>First Name</b></td> 
															<td>: <%=user.getFirstName() %></td>
														</tr>
														<tr>
															<td><b>Last Name</b></td>
															<td>: <%=user.getLastName() %></td>
														</tr>
														<tr>
															<td><b>Email</b></td>
															<td>: <%=user.getEmail() %></td>
														</tr>
														<tr>
															<td><b>Phone Number</b></td>
															<td>: <%=user.getPhone() %></td>
														</tr>
														<tr>
															<td><b>User Type</b></td>
															<td>: <%=user.getType() %></td>
														</tr>
														<tr>
															<td><b>Device Code</b></td>
															<td>: <%=user.getDevice() %></td>
														</tr>
													</table>
												</div> 
											</div>
										</form>  
									</div> 
								</div>
							</div>
						</div> 
					</div> 
				</div> 
			</div>
		</div>  
		<script src="scripts/vendor.js"></script>
	</body> 
</html> 