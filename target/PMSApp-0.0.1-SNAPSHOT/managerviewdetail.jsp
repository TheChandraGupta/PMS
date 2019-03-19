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
		<script>
		$(document).ready(function()
		{
			$('#search').keyup(function()
			{
				searchTable($(this).val());
			});
		});
		function searchTable(inputVal)
		{
			var table = $('#details');
			table.find('tr').each(function(index, row)
			{
				var allCells = $(row).find('td');
				if(allCells.length > 0)
				{
					var found = false;
					allCells.each(function(index, td)
					{
						var regExp = new RegExp(inputVal, 'i');
						if(regExp.test($(td).text()))
						{
							found = true;
							return false;
						}
					});
					if(found == true)$(row).show();
						else $(row).hide();
				}
			});
		}
		</script>
		<link rel="stylesheet" href="datatables/dataTables.bootstrap.css">
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
	
	DBManager dbManager = new DBManager();
	
	ArrayList<LabourJobDetail> ljd = DBHandler.allLaborerJobsData(dbManager);
	
	ArrayList<User> users = DBHandler.allLaborersData("0", dbManager);
	
	ArrayList<Job> jobs = DBHandler.allJobsData(dbManager);

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
								<!--<a href="index.html" class="btn btn-white btn-outline btn-rounded btn-sm">Logout</a>-->
							</div> <br><br> 
							<!--<ul class="nav nav-sidebar"> 
								<li class="active">
									<a href="managerviewdetail.html">View Details</a>
								</li> 							
								<li>
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
								<a class="list-group-item active" href="addjob.jsp"><i class="glyphicon glyphicon-file" aria-hidden="true"></i>&nbsp; Add Job</a>
								<a class="list-group-item active" href="labourlistall.jsp"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp; Laborer List</a>
								<a class="list-group-item active" href="labourjoball.jsp"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp; Laborer All Job</a>
								<a class="list-group-item active" href="laboursalaryall.jsp"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp; Laborer Salary</a>
								<a class="list-group-item active" href="managerreport.jsp"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp; Report</a>
								<a class="list-group-item active" href="managerprofile.jsp"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp; Profile</a>
								<a class="list-group-item active" href="managerpassword.jsp"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>&nbsp; Change Password</a>
								<a class="list-group-item" href="index.jsp"><i class="glyphicon glyphicon-off" aria-hidden="true"></i>&nbsp; Logout</a>
							</div>
						</div> 
						<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> 
							<div> 
								<!--<a href="overview.jsp" class="pull-right btn btn-primary btn-outline btn-rounded">Back to Overview</a>  -->
								<h2>View Details</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<form role="form" action="AssignJob" method="post" name="assignjob"> 
											<div class="form-content"> 
												<div class="form-group"> 
												<input type="hidden" name="jobDate" value="0"/>
													<select class="form-control" name="userId"> 
														<option selected value="0">---Select Labour---</option>
														<%
														
														if(users.size() > 0) {
															int i = 0;
															for(i=0; i < users.size(); i++) {
																User u = users.get(i);
														%>
														<option value="<%=u.getUserId() %>"><%=u.getFirstName() + " " + u.getLastName() %></option>
														<%
														
															}
														}
														else {
														
														%>
														<option value="0">No Users are Free</option>
														<%														
														}
														%>
													</select>
												</div> 
												<div class="form-group"> 
													<select class="form-control" name="jobId"> 
														<option selected value="0">---Assign Job---</option>
														<%
														
														if(jobs.size() > 0) {
															int i = 0;
															for(i=0; i < jobs.size(); i++) {
																Job j = jobs.get(i);
														%>
														<option value="<%=j.getJobId() %>"><%=j.getJob() %></option>
														<%
														
															}
														}
														else {
														
														%>
														<option value="0">No Jobs are Present</option>
														<%														
														}
														%>
													</select>
												</div>
												<button type="submit" class="pull-right btn btn-primary">ASSIGN JOB</button> 
											</div>
										</form>  
									</div> 
								</div>
								<div class="jumbotron"> 
									<div class="container"> 
											<table class="table table-bordered table-striped" id="example1">
												<!--<div class="inner-addon right-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i>
													<input name="search" type="text" class="form-control" placeholder="Search Here" id="search" maxlength="50"/>
												</div>
												<br>-->
												<thead>
													<tr>
													  <th align="center">Labour Name</th>
													  <th align="center">Job Name</th>
													  <th align="center">Date</th>
													  <th align="center">Status</th>
													  <th align="center">Remark</th>
													  <th align="center">Detail</th>
													</tr>
												</thead>
												<tbody>
	
												<%
												if(ljd.size() > 0)
												{
													int i=0;
													for(i=0;i<ljd.size();i++) {
														LabourJobDetail l = ljd.get(i);
												%>
													<tr>
														<td align="center"><%=l.getFirstName() + " " + l.getLastName() %></td>
														<td align="center"><%=l.getJob() %></td>
														<td align="center"><%=l.getJobDate() %></td>
														<td align="center">
															<span 
																<% if(l.getRemark().equals("INCOMPLETE")) { %>
																	 class="label label-warning" 
																<% } else { %>
																	 class="label label-success"
																<%} %> ><%=l.getRemark() %>
															</span>
															<input type="hidden" id="<%=i %>" value="<%=l.getLabourJobId() %>">
														</td>
														<td align="center">
																<% if(l.getRemark().equals("INCOMPLETE")) { %>
																	 <form action="JobDone" method="post">
																	 	<input type="hidden" name="labourJobId" value="<%=l.getLabourJobId() %>"/>
																	 	<input type="submit" class="btn btn-primary btn-xs" name="DONE" value="DONE"/>
																	 </form>
																<% } %>
														</td>
														<td align="center"><button class="btn btn-primary btn-xs"  onclick="myFunction('<%=i %>')">Detail</button></td>
													</tr>
												<%
													}
												}
												%> 						
												</tbody>
											</table>
									</div> 
								</div>
			<script>
		function myFunction(ur) {
			//alert("UR: " + ur + " Value: " + document.getElementById(ur).value);
		    var myWindow = window.open("report_labourjobdetailview.jsp?labourJobId="+document.getElementById(ur).value, "", "width=1200,height=700");
		}
		/*function myFunction(ur) {
		    var myWindow = window.open(document.getElementById(ur).value, "", "width=1000,height=500");
		}*/
		</script>
							</div>
						</div> 
					</div> 
				</div> 
			</div>
		</div>  
		<script src="scripts/vendor.js"></script>
		<script src="datatables/jquery.dataTables.min.js"></script>
	    <script src="datatables/dataTables.bootstrap.min.js"></script>
		<script>
	      $(function () {
	        $("#example1").DataTable();
	        $('#example2').DataTable({
	          "paging": true,
	          "lengthChange": false,
	          "searching": false,
	          "ordering": true,
	          "info": true,
	          "autoWidth": false
	        });
	      });
	    </script>
	</body> 
</html> 