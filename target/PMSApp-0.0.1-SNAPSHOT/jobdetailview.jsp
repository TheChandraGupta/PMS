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
		<link rel="stylesheet" href="styles/style.css"/> 
		<script src="scripts/jquery.min.js"></script>
	</head> 
	<%
	
	String labourJobId = request.getParameter("labourJobId");
	
	DBManager dbManager = new DBManager();
	
	LabourJobDetail labourJobDetail = DBHandler.assignedJobDetail(labourJobId, dbManager);
	
	%>
	<body>
		<div> 			
			<div class="dashboard-page"> 
				<div class="container-fluid"> 
					<div class="row"> 
							<div class="col-sm-8 col-sm-offset-2 col-md-10 col-md-offset-1 main"> 
							<h2>Labour Job Detail</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<form role="form" action="#" method="post" name="managerview">
											<div class="form-content"> 
												<div class="form-group"> 
													<ul class="nav nav-tabs">
														<li role="presentation"><a href="labourjobdetailview.jsp?labourJobId=<%=labourJobId %>">Profile</a></li>
														<li role="presentation" class="active"><a href="jobdetailview.jsp?labourJobId=<%=labourJobId %>">Job Details</a></li>
													</ul>
													<table class="table table-responsive">
														<tr>
															<td><b>Job Name</b></td> 
															<td>: <%=labourJobDetail.getJob() %></td>
														</tr>
														<tr>
															<td><b>Job Date</b></td>
															<td>: <%=labourJobDetail.getJobDate() %></td>
														</tr>
														<tr>
															<td><b>Job Description</b></td>
															<td>: <%=labourJobDetail.getJobDetail() %></td>
														</tr>
														<tr>
															<td><b>Basic Rate</b></td>
															<td>: <span class="label label-success"><%=labourJobDetail.getBasicRate() %></span></td>
														</tr>
														<tr>
															<td><b>DA Rate</b></td>
															<td>: <span class="label label-success"><%=labourJobDetail.getdARate() %></span></td>
														</tr>
														<tr>
															<td><b>Remark</b></td>
															<td>: 
																	<span 
																		<% if(labourJobDetail.getRemark().equals("INCOMPLETE")) { %>
																			 class="label label-warning" 
																		<% } else { %>
																			 class="label label-success"
																		<%} %> ><%=labourJobDetail.getRemark() %>
																	</span>
															</td>
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
		<script src="scripts/vendor.js"></script>
	</body>
</html>