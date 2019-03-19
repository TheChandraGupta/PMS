<%@ page errorPage="error.jsp" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js"> 
	<head> 
		<meta charset="utf-8"> 
		<title>PMS</title> 
		<meta name="description"/> 
		<meta name="viewport" content="width=device-width"/>
		<link rel="stylesheet" href="styles/font-awesome.min.css" />		
		<link rel="stylesheet" href="styles/main.css"/>
		<link rel="stylesheet" href="scripts/bootstrap.min.css">
		<script src="scripts/angular.min.js"></script>
		<script>
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
			});
		</script>			
	</head> 
	
	<%
	
	String msg = null;
	msg = (String) request.getAttribute("msg");
	
	session.invalidate();
	
	%>
	
	<body> 
		<div> 
			<div class="login-page"> 
				<div class="row"> 
					<div class="col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4"> 
						<img src="images/flat-avatar.png" class="user-avatar"/> 
						<h1>LOGIN</h1> 
						<form role="form" action="Login" method="post" name="login" ng-app="validationApp" ng-controller="validationCtrl" novalidate> 
							<!--<div class="form-content"> 
								<div class="form-group">--> 
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
													<span class="glyphicon glyphicon-envelope"></span> 
												</div>
												<input type="email" class="form-control" placeholder="Email" name="email" style="height: 30px;" ng-model="email" required>
										</tr>
											<tr>
												<span style="color:red" ng-show="login.email.$dirty && login.email.$invalid">
													<span ng-show="login.email.$error.email">Please Enter a Valid Email</span>
													<span ng-show="login.email.$error.required">Please Enter Your Email</span>
												</span>
											</tr>										
										</div> 
									</tr><tr><br></tr>
									<tr>
										<tr>
											<div class="input-group">
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-lock"></span> 
												</div>								
												<input type="password" class="form-control" placeholder="Password" name="password" ng-model="formData.password" style="height: 30px;" ng-minlength="4" ng-maxlength="32" ng-pattern="/^[a-zA-Z0-9]+(?:\s+[a-zA-Z0-9]+)*$/" required/>
										</tr>
											<tr>
												<span style="color:red" ng-show="login.password.$error.required && login.password.$dirty">Please Enter Your Password</span>
												<span style="color:red" ng-show="!login.password.$error.required && (login.password.$error.minlength || login.password.$error.maxlength) && login.password.$dirty">Password must be between 4 and 32 Characters.</span>
												<span style="color:red" ng-show="!login.password.$error.required && !login.password.$error.minlength && !login.password.$error.maxlength && login.password.$error.pattern && login.password.$dirty">Password must contain alphabetic or numeric character</span> 
											</tr>
										</div> 
									</tr><tr><br></tr>
								</div> 
							</table>
							<!--<a href="overview.html" class="btn btn-white btn-outline btn-rounded">Login</a> -->
							<input type="submit" class="btn btn-primary btn-outline btn-lg btn-rounded" value="Login" ng-disabled="login.$invalid"/> 
							<div class="form-group">
								<a href="register.jsp" class="form-control input-underline input-lg">Not Registered? <i>Click Here</i></a>
								<a href="forgotpassword.jsp" class="form-control input-underline input-lg">Forgot Password? <i>Click Here</i></a>
							</div>
						</form> 
					</div> 
				</div> 
			</div>
		</div>  
		<script src="scripts/vendor.js"></script>
	</body> 
</html> 