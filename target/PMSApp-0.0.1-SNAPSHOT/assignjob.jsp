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
	
	String msg = null;
	msg = (String) request.getAttribute("msg");
	
	User user = (User) session.getAttribute("user");
	
	DBManager dbManager = new DBManager();
	
	ArrayList<LabourJobDetail> ljd = DBHandler.allLaborerJobsData(dbManager);

	dbManager.close();
	
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
							<!--<ul class="nav nav-sidebar"> 
								<li>
									<a href="managerviewdetail.html">View Details</a>
								</li> 							
								<li class="active">
									<a href="assignjob.html">Assign Job</a>
								</li> 
								<li>
									<a href="addjob.html">Add Job</a>
								</li> 
								<li>
									<a href="index.html">Logout</a>
								</li> 
							</ul> -->
							<div class="list-group">
								<a class="list-group-item active" href="managerviewdetail.jsp"><i class="glyphicon glyphicon-edit" aria-hidden="true"></i>&nbsp; View Details</a>
								<a class="list-group-item active" href="assignjob.jsp"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>&nbsp; Assign Job</a>
								<a class="list-group-item active" href="addjob.jsp"><i class="glyphicon glyphicon-file" aria-hidden="true"></i>&nbsp; Add Job</a>
								<a class="list-group-item active" href="managerprofile.jsp"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp; Profile</a>
								<a class="list-group-item active" href="managerpassword.jsp"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>&nbsp; Change Password</a>
								<a class="list-group-item" href="index.jsp"><i class="glyphicon glyphicon-off" aria-hidden="true"></i>&nbsp; Logout</a>
							</div>
						</div> 
						<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> 
							<div> 
								<a href="overview.jsp" class="pull-right btn btn-primary btn-outline btn-rounded">Back to Overview</a> 
								<h2>Assign Jobs</h2>  
								<div class="jumbotron"> 
									<div class="container"> 
										<form role="form" action="" method="post" name="assignjob"> 
											<div class="form-content"> 
												<div class="form-group"> 
													<select class="form-control"> 
														<option selected>---Select Labour---</option>
														<option>ABC</option>
													</select>
												</div> 
												<div class="form-group"> 
													<select class="form-control"> 
														<option selected>---Assign Job---</option>
														<option>Clerk</option>
													</select>
												</div> 
												<div class="form-group"> 
													<select class="form-control"> 
														<option value="0">---Date---</option>
														<option selected value="0">Today</option>
														<option value="1">Tomorrow</option>
														<option value="2">Day of Tomorrow</option>
													</select>
												</div> 
												<button type="submit" class="pull-right btn btn-primary">ASSIGN JOB</button> 
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