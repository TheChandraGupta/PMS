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
		
		
    <!-- Date Picker Ui -->
	<link rel="stylesheet" href="dateui/jquery-ui.css" />
    <!-- Load jQuery JS -->
    <script src="dateui/jquery-1.9.1.js"></script>
    <!-- Load jQuery UI Main JS  -->
    <script src="dateui/jquery-ui.js"></script>
    <!-- Load SCRIPT.JS which will create date for input field  -->
    
    <script type="text/javascript">
    $(document).ready(
    		  
    		  /* This is the function that will get executed after the DOM is fully loaded */
    		  function () {
    			  $( "#date" ).datepicker({
    				  dateFormat: 'yy-mm-dd',
    				  minDate: -0,
    				  defaultDate: +0,
    				  changeMonth: true,//this option for allowing user to select month
    			      changeYear: true, //this option for allowing user to select from year range	 
    			    });
    			  $( "#dateto" ).datepicker({
    				  dateFormat: 'yy-mm-dd',
    				  //minDate: -0,
    				  defaultDate: +0,
    				  changeMonth: true,//this option for allowing user to select month
    			      changeYear: true, //this option for allowing user to select from year range
    				  maxDate:+0,
    				  onClose: function(selectedDate) {
    					  $("#datefrom").datepicker("option","minDate", selectedDate)
    				  }
    			    });
    			     $( "#datefrom" ).datepicker({
    			      dateFormat: 'yy-mm-dd',
    				  //minDate: -0,
    				  defaultDate: +0,
    				  changeMonth: true,//this option for allowing user to select month
    			      changeYear: true, //this option for allowing user to select from year range
    				  maxDate:+0,
    				  
    				});
    			    
    		     }

    		);
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
	
	CheckDate checkdate = new CheckDate();
	
	DBManager dbManager = new DBManager();
	
	int labourCountTotal = Report.labourCountTotal(dbManager); // labourCountTotal
	
	int labourCountCurrentMonth = Report.labourCountCurrentMonth(dbManager); // labourCountCurrentMonth
	
	ArrayList<LabourSalary> labourSalary = Report.salaryHighestLabourTopFive(dbManager); // salaryHighestLabourTopFive
	
	ArrayList<LabourPaymentDetail> labourPaymentDetail = Report.paymentHighestLabourTopFive(dbManager); // paymentHighestLabourTopFive
	
	ArrayList<LabourJobDetail2> labourJobDetail1 = Report.jobAssignedHighestLabourTopFive(dbManager); // jobAssignedHighestLabourTopFive
	
	ArrayList<LabourJobDetail2> labourJobDetail2 = Report.jobAssignedDoneHighestLabourTopFive(dbManager); // jobAssignedDoneHighestLabourTopFive
	
	ArrayList<LabourJobDetail2> labourJobDetail3 = Report.jobAssignedLowestLabourTopFive(dbManager); // jobAssignedLowestLabourTopFive
	
	ArrayList<LabourJobDetail2> labourJobDetail4 = Report.jobAssignedDoneLowestLabourTopFive(dbManager); // jobAssignedDoneLowestLabourTopFive
	
	ArrayList<JobAllotmentDetail> jobAllotmentDetail = Report.jobAllotmentHighestTopFive(dbManager);	// jobAllotmentHighestTopFive

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
								
								<h2>Labour Report Generate	</h2> 
								<div class="jumbotron"> 
									<div class="container"> 							
											<table class="table table-bordered table-striped">		
												<tr>
    												<td align="left"><label for="datefrom">DATE FROM</label></td>
    												<td align="left">
      													<input type="text" name="datefrom" id="dateto" placeholder="YYYY-MM-DD" class="form-control" value="<%=checkdate.getDate()%>" readonly />
      												</td>
    											</tr>
												<tr>
													<td align="left"><label for="datefrom">DATE TO</label></td>
												    <td align="left">
												      <input type="text" name="dateto" id="datefrom" placeholder="YYYY-MM-DD" class="form-control" value="<%=checkdate.getDate()%>" readonly/>
													</td>
												</tr>
												<tr>
													<td colspan="2" align="right"><button class="pull-right btn btn-primary" onclick="displayUsersByDate()">CLICK</button></td>
												</tr>
											</table>
									</div> 
								</div>
								<h2>Labour Overall Report</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<table class="table table-bordered table-striped">		
												<tr>
													<th width="300" align="right">Total Labour Registered </th>
													<td align="left"> <%=labourCountTotal %></td>
												</tr>
												<tr>
													<th align="right">Total Labour Registered This Month </th>
													<td align="left"> <%=labourCountCurrentMonth %></td>
												</tr>
										</table> 
									</div> 
								</div>
								<h2>Top Laborers With Maximum Salary</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<table class="table table-bordered table-striped">
											<thead>												
												<tr>
													<th>Si. No.</th>
													<th>NAME</th>
													<th>Email</th>
													<th>Phone</th>
													<th>Total Salary</th>
												</tr>
											</thead>
											<tbody>
											<%
											
											if(labourSalary.size()>0) {
												int i = 0;
												for(i=0; i<labourSalary.size(); i++) {
													LabourSalary l = labourSalary.get(i);
											%>
												<tr>
													<td align="center"><%=i+1 %></td>
													<td align="center"><%=l.getFirstName() + " " + l.getLastName() %></td>
													<td align="center"><%=l.getEmail() %></td>
													<td align="center"><%=l.getPhone() %></td>
													<td align="center"><%=l.getTotalSalary() %></td>
												</tr>
											<%
												}
											}	
											%>
											</tbody>
										</table>	
									</div> 
								</div>
								<h2>Top Laborers With Maximum Payment Paid</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<table class="table table-bordered table-striped">
											<thead>												
												<tr>
													<th>Si. No.</th>
													<th>NAME</th>
													<th>Email</th>
													<th>Phone</th>
													<th>Amount Paid</th>
												</tr>
											</thead>
											<tbody>
											<%
											
											if(labourSalary.size()>0) {
												int i = 0;
												for(i=0; i<labourPaymentDetail.size(); i++) {
													LabourPaymentDetail l = labourPaymentDetail.get(i);
											%>
												<tr>
													<td align="center"><%=i+1 %></td>
													<td align="center"><%=l.getFirstName() + " " + l.getLastName() %></td>
													<td align="center"><%=l.getEmail() %></td>
													<td align="center"><%=l.getPhone() %></td>
													<td align="center"><%=l.getAmount() %></td>
												</tr>
											<%
												}
											}	
											%>
											</tbody>
										</table>	
									</div> 
								</div>							
								<h2>Top Laborers With Maximum Job Assigned</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<table class="table table-bordered table-striped">
											<thead>												
												<tr>
													<th>Si. No.</th>
													<th>NAME</th>
													<th>Email</th>
													<th>Phone</th>
													<th>Total Job</th>
												</tr>
											</thead>
											<tbody>
											<%
											
											if(labourSalary.size()>0) {
												int i = 0;
												for(i=0; i<labourJobDetail1.size(); i++) {
													LabourJobDetail2 l = labourJobDetail1.get(i);
											%>
												<tr>
													<td align="center"><%=i+1 %></td>
													<td align="center"><%=l.getFirstName() + " " + l.getLastName() %></td>
													<td align="center"><%=l.getEmail() %></td>
													<td align="center"><%=l.getPhone() %></td>
													<td align="center"><%=l.getJobCount() %></td>
												</tr>
											<%
												}
											}	
											%>
											</tbody>
										</table>	
									</div> 
								</div>								
								<h2>Top Laborers With Maximum Job Completed</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<table class="table table-bordered table-striped">
											<thead>												
												<tr>
													<th>Si. No.</th>
													<th>NAME</th>
													<th>Email</th>
													<th>Phone</th>
													<th>Total Job</th>
												</tr>
											</thead>
											<tbody>
											<%
											
											if(labourSalary.size()>0) {
												int i = 0;
												for(i=0; i<labourJobDetail2.size(); i++) {
													LabourJobDetail2 l = labourJobDetail2.get(i);
											%>
												<tr>
													<td align="center"><%=i+1 %></td>
													<td align="center"><%=l.getFirstName() + " " + l.getLastName() %></td>
													<td align="center"><%=l.getEmail() %></td>
													<td align="center"><%=l.getPhone() %></td>
													<td align="center"><%=l.getJobCount() %></td>
												</tr>
											<%
												}
											}	
											%>
											</tbody>
										</table>	
									</div> 
								</div>								
								<h2>Top Laborers With Minimum Job Assigned</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<table class="table table-bordered table-striped">
											<thead>												
												<tr>
													<th>Si. No.</th>
													<th>NAME</th>
													<th>Email</th>
													<th>Phone</th>
													<th>Total Job</th>
												</tr>
											</thead>
											<tbody>
											<%
											
											if(labourSalary.size()>0) {
												int i = 0;
												for(i=0; i<labourJobDetail3.size(); i++) {
													LabourJobDetail2 l = labourJobDetail3.get(i);
											%>
												<tr>
													<td align="center"><%=i+1 %></td>
													<td align="center"><%=l.getFirstName() + " " + l.getLastName() %></td>
													<td align="center"><%=l.getEmail() %></td>
													<td align="center"><%=l.getPhone() %></td>
													<td align="center"><%=l.getJobCount() %></td>
												</tr>
											<%
												}
											}	
											%>
											</tbody>
										</table>	
									</div> 
								</div>								
								<h2>Top Laborers With Minimum Job Completed</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<table class="table table-bordered table-striped">
											<thead>												
												<tr>
													<th>Si. No.</th>
													<th>NAME</th>
													<th>Email</th>
													<th>Phone</th>
													<th>Total Job</th>
												</tr>
											</thead>
											<tbody>
											<%
											
											if(labourSalary.size()>0) {
												int i = 0;
												for(i=0; i<labourJobDetail4.size(); i++) {
													LabourJobDetail2 l = labourJobDetail4.get(i);
											%>
												<tr>
													<td align="center"><%=i+1 %></td>
													<td align="center"><%=l.getFirstName() + " " + l.getLastName() %></td>
													<td align="center"><%=l.getEmail() %></td>
													<td align="center"><%=l.getPhone() %></td>
													<td align="center"><%=l.getJobCount() %></td>
												</tr>
											<%
												}
											}	
											%>
											</tbody>
										</table>	
									</div> 
								</div>								
								<h2>Top Jobs With Maximum Allotment</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
										<table class="table table-bordered table-striped">
											<thead>												
												<tr>
													<th>Si. No.</th>
													<th>Job</th>
													<th>Total Allotment</th>
												</tr>
											</thead>
											<tbody>
											<%
											
											if(labourSalary.size()>0) {
												int i = 0;
												for(i=0; i<jobAllotmentDetail.size(); i++) {
													JobAllotmentDetail j = jobAllotmentDetail.get(i);
											%>
												<tr>
													<td align="center"><%=i+1 %></td>
													<td align="center"><%=j.getJob() %></td>
													<td align="center"><%=j.getAllotment() %></td>
												</tr>
											<%
												}
											}	
											%>
											</tbody>
										</table>	
									</div> 
								</div>	
								
								<script type="text/javascript">
									
									function displayUsersByDate() {
									    var myWindow = window.open("labourjoining.jsp?dateFrom="+document.getElementById('dateto').value+ "&dateTo="+document.getElementById('datefrom').value, "", "width=1000,height=600");
									}
								
								</script>
								
							</div>
						</div> 
					</div> 
				</div> 
			</div>
		</div>  
		<script src="scripts/vendor.js"></script>
	</body> 
</html> 