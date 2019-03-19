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
			var app = angular.module('validationApp', ['UserValidation']);
			angular.module('UserValidation', []).directive('validPasswordC', function () {
				return {
					require: 'ngModel',
					link: function (scope, elm, attrs, ctrl) {
						ctrl.$parsers.unshift(function (viewValue, $scope) {
							var noMatch = viewValue != scope.register.password.$viewValue
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
						<h1>REGISTRATION</h1> 
						<form role="form" action="Register" method="post" name="register" ng-app="validationApp" ng-controller="validationCtrl" novalidate> 
							<!--<div class="form-content"> 
								<div class="form-group">--> 
							<table class="table table-responsive">
								<div class="form-group"> 
									<tr>
										<tr>
											<div class="input-group">
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-user"></span> 
												</div>
												<input type="text" class="form-control" placeholder="FirstName" name="fname" style="height: 30px;" ng-model="formData.fname" ng-minlength="4" ng-maxlength="25" ng-pattern="/^[a-zA-Z]+(\s{0,1}[a-zA-Z])*$/" required/> 
										</tr>
											<tr>
												<span style="color:red" ng-show="register.fname.$error.required && register.fname.$dirty">Please Enter Your First Name</span>
												<span style="color:red" ng-show="!register.fname.$error.required && (register.fname.$error.minlength || register.fname.$error.maxlength) && register.fname.$dirty">First Name must be in between 4 to 25 Characters.</span>
												<span style="color:red" ng-show="!register.fname.$error.required && !register.fname.$error.minlength && !register.fname.$error.maxlength && register.fname.$error.pattern && register.fname.$dirty">First Name must contain alphabets only</span>
											</tr>
										</div>
									</tr><tr><br></tr>
									<tr>
										<tr>
											<div class="input-group">
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-user"></span> 
												</div>								
												<input type="text" class="form-control" placeholder="LastName" name="lname" style="height: 30px;" ng-model="formData.lname" ng-minlength="4" ng-maxlength="25" ng-pattern="/^[a-zA-Z]+(\s{0,1}[a-zA-Z])*$/" required/> 
										</tr>
											<tr>
												<span style="color:red" ng-show="register.lname.$error.required && register.lname.$dirty">Please Enter Your Last Name</span>
												<span style="color:red" ng-show="!register.lname.$error.required && (register.lname.$error.minlength || register.lname.$error.maxlength) && register.lname.$dirty">Last Name must be in between 4 to 25 Characters.</span>
												<span style="color:red" ng-show="!register.lname.$error.required && !register.lname.$error.minlength && !register.lname.$error.maxlength && register.lname.$error.pattern && register.lname.$dirty">Last Name must contain alphabets only</span> 
											</tr>
										</div> 
									</tr><tr><br></tr>
									<tr>
										<tr>
											<div class="input-group"> 
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-envelope"></span> 
												</div>
												<input type="email" class="form-control" placeholder="Email" name="email" style="height: 30px;" ng-model="formData.email" required/>
										</tr>
											<tr>
												<span style="color:red" ng-show="register.email.$dirty && register.email.$invalid">
													<span ng-show="register.email.$error.email">Please Enter a Valid Email</span>
													<span ng-show="register.email.$error.required">Please Enter Your Email</span>
												</span>
											</tr>
										</div> 
									</tr><tr><br></tr>
									<tr>
										<tr>
											<div class="input-group"> 
												<div class="input-group-addon">
													<span class="glyphicon glyphicon-phone"></span> 
												</div>
												<input type="number" class="form-control" placeholder="Phone Number" name="phonenumber" ng-model="formData.phonenumber" style="height: 30px;" ng-minlength="10" ng-maxlength="10" ng-pattern="/^[7-9][0-9]{9}$/" required/> 
										</tr>
											<tr>
												<span style="color:red" ng-show="register.phonenumber.$error.required && register.phonenumber.$dirty">Please Enter Your Phonenumber</span>
												<span style="color:red" ng-show="!register.phonenumber.$error.required && (register.phonenumber.$error.minlength || register.phonenumber.$error.maxlength) && register.phonenumber.$dirty">Enter a valid Phonenumber</span>
												<span style="color:red" ng-show="!register.phonenumber.$error.required && !register.phonenumber.$error.minlength && !register.phonenumber.$error.maxlength && register.phonenumber.$error.pattern && register.phonenumber.$dirty">Must contain numeric character only</span>
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
												<span style="color:red" ng-show="register.password.$error.required && register.password.$dirty">Please Enter Your Password</span>
												<span style="color:red" ng-show="!register.password.$error.required && (register.password.$error.minlength || register.password.$error.maxlength) && register.password.$dirty">Password must be between 4 and 32 Characters.</span>
												<span style="color:red" ng-show="!register.password.$error.required && !register.password.$error.minlength && !register.password.$error.maxlength && register.password.$error.pattern && register.password.$dirty">Password must contain alphabetic or numeric character</span>          
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
												<span style="color:red" ng-show="register.password2.$error.required && register.password2.$dirty">Please Confirm Your Password</span>
												<span style="color:red" ng-show="!register.password2.$error.required && register.password2.$error.noMatch && register.password2.$dirty">Passwords are not matching, Please Check Your Password.</span>        
											</tr>
										</div> 
									</tr><tr><br></tr>
								</div> 
							</table>
							<!--<a href="overview.html" class="btn btn-white btn-outline btn-rounded">Register</a> -->
							<input type="submit" class="btn btn-primary btn-outline btn-lg btn-rounded" value="Register" ng-disabled="register.$invalid"/> 
							<div class="form-group">
								<a href="index.jsp" class="form-control input-underline input-lg">Already Resgistered? <i>Click Here</a>
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