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
		<link rel="stylesheet" href="scripts/bootstrap.min.css">
		<script src="scripts/angular.min.js"></script>
		<script>
			var app = angular.module('validationApp', ['UserValidation']);
			angular.module('UserValidation', []).directive('validPasswordC', function () {
				return {
					require: 'ngModel',
					link: function (scope, elm, attrs, ctrl) {
						ctrl.$parsers.unshift(function (viewValue, $scope) {
							var noMatch = viewValue != scope.changepassword.password.$viewValue
							ctrl.$setValidity('noMatch', !noMatch)
						})
					}
				}
			})
			// create angular controller
			app.controller('validationCtrl', function($scope) {
				// function to submit the form after all validation has occurred            
				$scope.submitForm = function(isValid) {
					// check to make sure the form is completely valid
					if (isValid) {
						alert('our form is amazing');
					}
				};
			});
		</script>		
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
								<h2>Change Password</h2>  
								<div class="jumbotron"> 
									<div class="container"> 
										<form role="form" action="ChangePassword" method="post" name="changepassword" ng-app="validationApp" ng-controller="validationCtrl" novalidate> 
											<div class="form-content"> 
												<table class="table table-responsive">
													<div class="form-group"> 
														<tr>
															<tr>
															<%
															
															if(msg != null) {
															
															%>
															
																	<span style="color:red">
																		<%=msg %>
																	</span>
																
															<%
															
															}
															
															%>
															</tr>
															<tr>
																<div class="input-group"> 
																	<div class="input-group-addon">
																		<span class="glyphicon glyphicon-lock"></span> 
																	</div>
																	<input type="password" class="form-control" placeholder="Old Password" name="oldpassword" ng-model="formData.oldpassword" style="height: 30px;" ng-minlength="4" ng-maxlength="32" ng-pattern="/^[a-zA-Z0-9]+(?:\s+[a-zA-Z0-9]+)*$/" required/>
															</tr>
																<tr>
																	<span style="color:red" ng-show="changepassword.oldpassword.$error.required && changepassword.oldpassword.$dirty">Please Enter Your Old Password</span>
																	<span style="color:red" ng-show="!changepassword.oldpassword.$error.required && (changepassword.oldpassword.$error.minlength || changepassword.oldpassword.$error.maxlength) && changepassword.oldpassword.$dirty">Password must be between 4 and 32 Characters.</span>
																	<span style="color:red" ng-show="!changepassword.oldpassword.$error.required && !changepassword.oldpassword.$error.minlength && !changepassword.oldpassword.$error.maxlength && changepassword.oldpassword.$error.pattern && changepassword.oldpassword.$dirty">Password must contain alphabetic or numeric character</span>          
																	<input type="hidden" value="2" name="userType"/>
																	<input type="hidden" value="<%=user.getUserId() %>" name="userId"/>
																</tr>
															</div>
														</tr><tr><br></tr>
														<tr>
															<tr>
																<div class="input-group"> 
																	<div class="input-group-addon">
																		<span class="glyphicon glyphicon-lock"></span> 
																	</div>
																	<input type="password" class="form-control" placeholder="New Password" name="password" ng-model="formData.password" style="height: 30px;" ng-minlength="4" ng-maxlength="32" ng-pattern="/^[a-zA-Z0-9]+(?:\s+[a-zA-Z0-9]+)*$/" required/>
															</tr>
																<tr>
																	<span style="color:red" ng-show="changepassword.password.$error.required && changepassword.password.$dirty">Please Enter Your New Password</span>
																	<span style="color:red" ng-show="!changepassword.password.$error.required && (changepassword.password.$error.minlength || changepassword.password.$error.maxlength) && changepassword.password.$dirty">Password must be between 4 and 32 Characters.</span>
																	<span style="color:red" ng-show="!changepassword.password.$error.required && !changepassword.password.$error.minlength && !changepassword.password.$error.maxlength && changepassword.password.$error.pattern && changepassword.password.$dirty">Password must contain alphabetic or numeric character</span>          
																</tr>
															</div>
														</tr><tr><br></tr>
														<tr>
															<tr>
																<div class="input-group"> 
																	<div class="input-group-addon">
																		<span class="glyphicon glyphicon-lock"></span> 
																	</div>
																	<input type="password" class="form-control" placeholder="Re-Type Password" name="password2" style="height: 30px;" ng-model="formData.password2" valid-password-c required/>
															</tr>
																<tr>
																	<span style="color:red" ng-show="changepassword.password2.$error.required && changepassword.password2.$dirty">Please Confirm Your Password</span>
																	<span style="color:red" ng-show="!changepassword.password2.$error.required && changepassword.password2.$error.noMatch && changepassword.password2.$dirty">Passwords are not matching, Please Check Your Password.</span>        
																</tr>
															</div> 
														</tr><tr><br></tr>
													</div> 
												</table>
												<input type="submit" class="pull-right btn btn-primary" value="CHANGE" ng-disabled="changepassword.$invalid"/>
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