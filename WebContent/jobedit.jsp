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
		<link rel="stylesheet" href="scripts/bootstrap.min.css">
		<script src="scripts/angular.min.js"></script>
		<script>
			// create angular app
			var validationApp = angular.module('validationApp', []);	
			// create angular controller
			validationApp.controller('validationCtrl', function($scope) {
				// function to submit the form after all validation has occurred            
				$scope.submitForm = function(isValid) {
					// check to make sure the form is completely valid
					if (isValid) {
					  alert('our form is amazing');
					}	
				};	
			})
		</script>
		
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
			var table = $('#example1');
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
	
	ArrayList<Job> jobs = DBHandler.allJobsData(dbManager);
		
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
								<li>
									<a href="managerviewdetail.html">View Details</a>
								</li> 							
								<li>
									<a href="assignjob.html">Assign Job</a>
								</li> 
								<li class="active">
									<a href="addjob.html">Add Job</a>
								</li> 
								<li>
									<a href="index.html">Logout</a>
								</li> 
							</ul> -->
							<div class="list-group">
								<a class="list-group-item active" href="managerviewdetail.jsp"><i class="glyphicon glyphicon-edit" aria-hidden="true"></i>&nbsp; View Details</a>
								<a class="list-group-item active" href="addjob.jsp"><i class="glyphicon glyphicon-file" aria-hidden="true"></i>&nbsp; Add Job</a>
								<a class="list-group-item active" href="managerprofile.jsp"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp; Profile</a>
								<a class="list-group-item active" href="managerpassword.jsp"><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>&nbsp; Change Password</a>
								<a class="list-group-item" href="index.jsp"><i class="glyphicon glyphicon-off" aria-hidden="true"></i>&nbsp; Logout</a>
							</div>
						</div> 
						<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> 
							<div> 
								<!--<a href="overview.html" class="pull-right btn btn-primary btn-outline btn-rounded">Back to Overview</a>--> 
								<h2>Add Jobs</h2>  
								<div class="jumbotron"> 
									<div class="container"> 
										<form role="form" action="AddJob" method="post" name="form" ng-app="validationApp" ng-controller="validationCtrl" novalidate> 
											<div class="form-content"> 
												<div class="form-group">
													<div>
														<%
															
															if(msg != null) {
															
															%>
															
																	<span style="color:red">
																		<%=msg %>
																	</span>
																
															<%
															
															}
															
															%>
													</div>
													<input type="text" class="form-control" placeholder="Add Jobs" name="addjob" id="addjob" style="height:30px;" ng-model="addjob" ng-minlength="3" ng-maxlength="20" ng-pattern="/^[a-zA-Z0-9._()-]+(?:\s+[a-zA-Z0-9._()-]+)*$/" required> 
													<div>
														<span style="color:red" ng-show="form.addjob.$error.required && form.addjob.$dirty">Add Jobs</span>
														<span style="color:red" ng-show="!form.addjob.$error.required && (form.addjob.$error.minlength || form.addjob.$error.maxlength) && form.addjob.$dirty">Add Job must be in between 3 to 20 Characters.</span>
														<span style="color:red" ng-show="!form.addjob.$error.required && !form.addjob.$error.minlength && !form.addjob.$error.maxlength && form.addjob.$error.pattern && form.addjob.$dirty">Job must contain alphabetic or numeric only</span>
													</div>
												</div> 
												<div class="form-group"> 
													<input type="text" class="form-control" placeholder="Job Details" name="jobdetail" id="jobdetail" style="height:30px;" ng-model="jobdetail" ng-minlength="3" ng-maxlength="100" ng-pattern="/^[a-zA-Z0-9._()-]+(?:\s+[a-zA-Z0-9._()-]+)*$/" required> 
													<div>
														<span style="color:red" ng-show="form.jobdetail.$error.required && form.jobdetail.$dirty">Add Jobs Details</span>
														<span style="color:red" ng-show="!form.jobdetail.$error.required && (form.jobdetail.$error.minlength || form.jobdetail.$error.maxlength) && form.jobdetail.$dirty">Job Details must be in between 3 to 100 Characters.</span>
														<span style="color:red" ng-show="!form.jobdetail.$error.required && !form.jobdetail.$error.minlength && !form.jobdetail.$error.maxlength && form.jobdetail.$error.pattern && form.jobdetail.$dirty">Job Details must contain alphabetic or numeric only</span>
													</div>
												</div> 
												<div class="form-group"> 
													<input type="text" class="form-control" placeholder="Basic Rate" name="basicrate" id="basicrate" style="height:30px;" ng-model="basicrate" ng-minlength="2" ng-maxlength="10" ng-pattern="/^[0-9.]*$/" required> 
													<div>
														<span style="color:red" ng-show="form.basicrate.$error.required && form.basicrate.$dirty">Add Basic Rate</span>
														<span style="color:red" ng-show="!form.basicrate.$error.required && (form.basicrate.$error.minlength || form.basicrate.$error.maxlength) && form.basicrate.$dirty">Basic Rate must be in between 2 to 10 Characters.</span>
														<span style="color:red" ng-show="!form.basicrate.$error.required && !form.basicrate.$error.minlength && !form.basicrate.$error.maxlength && form.basicrate.$error.pattern && form.basicrate.$dirty">Basic Rate must contain numbers only</span>
													</div>
												</div> 
												<div class="form-group"> 
													<input type="text" class="form-control" placeholder="DA Rate" name="darate" id="darate" style="height:30px;" ng-model="darate" ng-minlength="2" ng-maxlength="10" ng-pattern="/^[0-9.]*$/" required> 
													<div>
														<span style="color:red" ng-show="form.darate.$error.required && form.darate.$dirty">Add DA Rate</span>
														<span style="color:red" ng-show="!form.darate.$error.required && (form.darate.$error.minlength || form.darate.$error.maxlength) && form.darate.$dirty">DA Rate must be in between 2 to 10 Characters.</span>
														<span style="color:red" ng-show="!form.darate.$error.required && !form.darate.$error.minlength && !form.darate.$error.maxlength && form.darate.$error.pattern && form.darate.$dirty">DA Rate must contain numbers only</span>
													</div>
												</div> 
													<input type="submit" class="pull-right btn btn-primary" value="ADD" ng-disabled="form.$invalid"/> 
											</div>
										</form>  
									</div>
								</div>
								<div class="jumbotron"> 
									<div class="container"> 
											<table class="table table-bordered table-striped" id="example1">
												<!--<div class="inner-addon right-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i>
													<input name="search" type="text" class="form-control" placeholder="Search Here" id="search" maxlength="50" style="height:35px"/>
												</div>
												<br>-->
												<thead>
													<tr>
													  <th align="center">Job</th>
													  <th align="center">Job Detail</th>
													  <th align="center">Basic Rates</th>
													  <th align="center">DA Rates</th>
													  <th align="center">Edit</th>
													</tr>
												</thead>
												<tbody>
	
												<%
												if(jobs.size() > 0)
												{
													int i=0;
													for(i=0;i<jobs.size();i++) {
														Job j = jobs.get(i);
												%>
													<tr>
														<td align="center"><%=j.getJob() %></td>
														<td align="center"><%=j.getJobDetail() %></td>
														<td align="center"><span class="label label-success"><%=j.getBasicRate() %></span></td>
														<td align="center"><span class="label label-success"><%=j.getdARate() %></span></td>
														<td align="center"><button class="btn btn-primary btn-xs" onclick="myFunction('<%=i %>')">Edit</button>
																<input type="hidden" id="<%=i %>" value="<%=j.getJobId() %>"/>
																<input type="hidden" id="job<%=i %>" value="<%=j.getJob() %>"/>
																<input type="hidden" id="jobDetail<%=i %>" value="<%=j.getJobDetail() %>"/>
																<input type="hidden" id="basicRate<%=i %>" value="<%=j.getBasicRate() %>"/>
																<input type="hidden" id="dARate<%=i %>" value="<%=j.getdARate() %>"/>
														</td>
													</tr>
												<%
													}
												}%>					
												</tbody>
											</table>
									</div> 
								</div>
								
								<script>
		function myFunction(ur) {
			//alert("UR: " + ur + " Value: " + document.getElementById(ur).value);
		    var myWindow = window.open("editjob.jsp?jobId="+document.getElementById(ur).value+
		    		"&job="+document.getElementById("job"+ur).value+
		    		"&jobDetail="+document.getElementById("jobDetail"+ur).value+
		    		"&basicRate="+document.getElementById("basicRate"+ur).value+
		    		"&dARate="+document.getElementById("dARate"+ur).value, "", "width=1000,height=600");
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