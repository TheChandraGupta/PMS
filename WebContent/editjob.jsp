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
		
		<script type="text/javascript">
			function editjobclose() {
				var myWindow = window.close();
			}
		</script>
				
	</head> 
	<%
	
	String jobId = request.getParameter("jobId");
	String job = request.getParameter("job");
	String jobDetail = request.getParameter("jobDetail");
	String basicRate = request.getParameter("basicRate");
	String dARate = request.getParameter("dARate");
		
	%>
	<body>
<!--	<script>
	document.getElementById("addjob").value="<%=job %>";
	document.getElementById("jobdetail").value="<%=jobDetail %>";
	document.getElementById("basicrate").value="<%=basicRate %>";
	document.getElementById("darate").value="<%=dARate %>";
	</script>-->
		<div> 			
			<div class="dashboard-page"> 
				<div class="container-fluid"> 
					<div class="row"> 
							<div class="col-sm-8 col-sm-offset-2 col-md-10 col-md-offset-1 main"> 
							<h2>Labour Job Detail</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<form role="form" action="EditJob" method="post" name="form" onSubmit="editjobclose()" ng-app="validationApp" ng-controller="validationCtrl" novalidate> 
											<div class="form-content"> 
												<div class="form-group">
													<input type="hidden" name="jobId" value="<%=jobId %>" />
													<input type="text" class="form-control" placeholder="Add Jobs" value="<%=job %>" name="addjob" id="addjob" style="height:30px;" ng-model="addjob" ng-minlength="3" ng-maxlength="20" ng-pattern="/^[a-zA-Z0-9._()-]+(?:\s+[a-zA-Z0-9._()-]+)*$/" required> 
											<!-- 		<div>
														<span style="color:red" ng-show="form.addjob.$error.required && form.addjob.$dirty">Add Jobs</span>
														<span style="color:red" ng-show="!form.addjob.$error.required && (form.addjob.$error.minlength || form.addjob.$error.maxlength) && form.addjob.$dirty">Add Job must be in between 3 to 20 Characters.</span>
														<span style="color:red" ng-show="!form.addjob.$error.required && !form.addjob.$error.minlength && !form.addjob.$error.maxlength && form.addjob.$error.pattern && form.addjob.$dirty">Job must contain alphabetic or numeric only</span>
													</div> -->
												</div> 
												<div class="form-group"> 
													<input type="text" class="form-control" placeholder="Job Details" value="<%=jobDetail %>" name="jobdetail" id="jobdetail" style="height:30px;" ng-model="jobdetail" ng-minlength="3" ng-maxlength="100" ng-pattern="/^[a-zA-Z0-9._()-]+(?:\s+[a-zA-Z0-9._()-]+)*$/" required> 
													<!-- <div>
														<span style="color:red" ng-show="form.jobdetail.$error.required && form.jobdetail.$dirty">Add Jobs Details</span>
														<span style="color:red" ng-show="!form.jobdetail.$error.required && (form.jobdetail.$error.minlength || form.jobdetail.$error.maxlength) && form.jobdetail.$dirty">Job Details must be in between 3 to 100 Characters.</span>
														<span style="color:red" ng-show="!form.jobdetail.$error.required && !form.jobdetail.$error.minlength && !form.jobdetail.$error.maxlength && form.jobdetail.$error.pattern && form.jobdetail.$dirty">Job Details must contain alphabetic or numeric only</span>
													</div>-->
												</div> 
												<div class="form-group"> 
													<input type="text" class="form-control" placeholder="Basic Rate" value="<%=basicRate %>" name="basicrate" id="basicrate" style="height:30px;" ng-model="basicrate" ng-minlength="2" ng-maxlength="10" ng-pattern="/^[0-9.]*$/" required> 
													<!-- <div>
														<span style="color:red" ng-show="form.basicrate.$error.required && form.basicrate.$dirty">Add Basic Rate</span>
														<span style="color:red" ng-show="!form.basicrate.$error.required && (form.basicrate.$error.minlength || form.basicrate.$error.maxlength) && form.basicrate.$dirty">Basic Rate must be in between 2 to 10 Characters.</span>
														<span style="color:red" ng-show="!form.basicrate.$error.required && !form.basicrate.$error.minlength && !form.basicrate.$error.maxlength && form.basicrate.$error.pattern && form.basicrate.$dirty">Basic Rate must contain numbers only</span>
													</div>-->
												</div> 
												<div class="form-group"> 
													<input type="text" class="form-control" placeholder="DA Rate" value="<%=dARate %>" name="darate" id="darate" style="height:30px;" ng-model="darate" ng-minlength="2" ng-maxlength="10" ng-pattern="/^[0-9.]*$/" required> 
													<!-- <div>
														<span style="color:red" ng-show="form.darate.$error.required && form.darate.$dirty">Add DA Rate</span>
														<span style="color:red" ng-show="!form.darate.$error.required && (form.darate.$error.minlength || form.darate.$error.maxlength) && form.darate.$dirty">DA Rate must be in between 2 to 10 Characters.</span>
														<span style="color:red" ng-show="!form.darate.$error.required && !form.darate.$error.minlength && !form.darate.$error.maxlength && form.darate.$error.pattern && form.darate.$dirty">DA Rate must contain numbers only</span>
													</div>-->
												</div> 
													<input type="submit" class="pull-right btn btn-primary" value="EDIT" ng-disabled="form.$invalid"/> 
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