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
	
	ArrayList<LabourPayment> labourPayment = DBHandler.labourPaymentDetail(user.getUserId(), dbManager);
	
	LabourSalary labourSalary = DBHandler.laborerSalary(user.getUserId(), dbManager);

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
								<!--<a href="login.html" class="btn btn-white btn-outline btn-rounded btn-sm">Logout</a>-->
							</div> <br><br>
							<!--<ul class="nav nav-sidebar"> 
								<li class="active">
									<a href="labourviewdetail.html">View Detail</a>
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
								<!--<a href="overview.jsp" class="pull-right btn btn-primary btn-outline btn-rounded">Back to Overview</a>  -->
								<h2>Payment History</h2> 
								<div class="jumbotron"> 
									<div class="container"> 
											<table border=0>
												<tr>
													<td align="right" valign="middle" width="750"><h3 style="color:#325641"><b>Total Salary&nbsp; :</b></h3></td>
													<td align="left" valign="middle" ><b><h3 style="color:#325641"><b>&nbsp; <%=labourSalary.getTotalSalary() %></b></h3></b></td>
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
													  <th align="center">Date</th>
													  <th align="center">Amount To Pay</th>
													  <th align="center">Amount Paid</th>
													  <th align="center">Amount Remaining</th>
													</tr>
												</thead>
												<tbody>
	
												<%
												if(labourPayment.size() > 0)
												{
													int i=0;
													for(i=0;i<labourPayment.size();i++) {
														LabourPayment l = labourPayment.get(i);
												%>
													<tr>
														<td align="center"><%=l.getPaidDate() %></td>
														<td align="center"><%=l.getAmountBefore() %></td>
														<td align="center"><%=l.getPaidAmount() %></td>
														<td align="center"><%=(Float.parseFloat(l.getAmountBefore()) - Float.parseFloat(l.getPaidAmount())) %></td>
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