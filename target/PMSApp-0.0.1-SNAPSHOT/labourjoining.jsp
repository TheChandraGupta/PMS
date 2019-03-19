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
	
	String dateFrom = request.getParameter("dateFrom");	
	String dateTo = request.getParameter("dateTo");
	
	DBManager dbManager = new DBManager();
	
	ArrayList<User> users = Report.laborerListBetweenDates(dateFrom, dateTo, dbManager);
	int userCount = Report.laborerCountBetweenDates(dateFrom, dateTo, dbManager);

	dbManager.close();
	
	%>
	
	<body>
		<div> 			
			<div class="dashboard-page"> 
				<div class="container-fluid"> 
					<div class="row"> 
							<div class="col-sm-8 col-sm-offset-2 col-md-10 col-md-offset-1 main"> 
							<h2>Laborer List</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
											<table border=0>
												<tr>
													<td align="right" valign="middle" width="400"><h3 style="color:#325641"><b>Total Laborers&nbsp; :</b></h3></td>
													<td align="left" valign="middle" ><b><h3 style="color:#325641"><b>&nbsp; <%=userCount %></b></h3></b></td>
												</tr>
											</table>
											</br>
											<table class="table table-bordered table-striped" id="example1">
												<!--<div class="inner-addon right-addon" id="basic-addon1"><i class="glyphicon glyphicon-search"></i>
													<input name="search" type="text" class="form-control" placeholder="Search Here" id="search" maxlength="50"/>
												</div>
												<br>-->
												<thead>
													<tr>
													  <th align="center">Labour Name</th>
													  <th align="center">Email</th>
													  <th align="center">Phone</th>
													  <th align="center">Join Date</th>
													</tr>
												</thead>
												<tbody>
	
												<%
												if(users.size() > 0)
												{
													int i=0;
													for(i=0;i<users.size();i++) {
														User u = users.get(i);
												%>
													<tr>
														<td align="center"><%=u.getFirstName() + " " + u.getLastName() %></td>
														<td align="center"><%=u.getEmail() %></td>
														<td align="center"><%=u.getPhone() %></td>
														<td align="center"><%=u.getJoinDate() %></td>
													</tr>
												<%
													}
												}
												%> 						
												</tbody>
											</table>
									</div> 
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