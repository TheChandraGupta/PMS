<%@page import="javax.swing.border.TitledBorder"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.DocumentException"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.html.HtmlWriter"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.io.*"%>;
<%@page import="java.awt.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%@page import="java.awt.*"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%@page import="java.util.*"%>
<%@ page import="com.deciders.pms.api.database.*" %>
<%@ page import="com.deciders.pms.api.bean.*" %>
<%@ page import="java.util.ArrayList" %>
<%
String str="pdf";

String msg = null;
msg = (String) request.getAttribute("msg");

User user = (User) session.getAttribute("user");

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

try
{ 
    Document document=new Document();
    if(str.equals("pdf"))
    {
        response.setContentType("application/pdf");
        PdfWriter writer = PdfWriter.getInstance(document,response.getOutputStream());
    }
    /*
    conn= DBConnector.getConnection();
    String query = "select * from message";          //Fetching data from table
       ps=conn.prepareStatement(query);                // executing query
       rs=ps.executeQuery();
       */
    document.open();

    /* new paragraph instance initialized and add function write in pdf file*/
    /*
    document.add(new Paragraph("---------------------------------------------------------REPORT---------------------------------------------------------\n\n"));
    document.add(new Paragraph("                              CREATED REPORT BY-Chandra Prakash Gupta\n\n"));
    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    document.addCreationDate();
    
    while(rs.next())
    {
          // fetch & writing records in pdf files
        document.add(new Paragraph("MSG_ID ::"+rs.getString(1)+"\nTIME ::"+rs.getString(5)+"\nNAME ::"+rs.getString(2)+"\nEMAIL ::"+rs.getString(3)+"\nMESSAGE ::"+rs.getString(4)+"\n\n"));
    }
    */

    document.add(new Paragraph("\n"));
    document.add(new Paragraph("\n"));
    Date date = new Date();
    document.add(new Paragraph("Name : " + user.getFirstName() + " " + user.getLastName()));
    document.add(new Paragraph("Email : " + user.getEmail()));
    document.add(new Paragraph("Phone : " + user.getPhone()));
    document.add(new Paragraph("Date : " + date));
    document.add(new Paragraph("Report : " + "Labour Job Report" + "\n\n")); 
    document.add(new Paragraph("\n"));   
    
	//Inserting Table in PDF
 PdfPTable table1 = new PdfPTable(2);
	      
	      PdfPCell cell1 = new PdfPCell(new Paragraph("LABOUR REPORT"));
	      cell1.setColspan(2);
	      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell1.setPadding(10.0f);
	      cell1.setBackgroundColor(new Color(140, 212, 120));
	      
	      table1.addCell(cell1);
	      table1.addCell("  Total Labour Registered ");
	      table1.addCell("  " + labourCountTotal);
	      table1.addCell("  Total Labour Registered This Month");
	      table1.addCell("  " + labourCountCurrentMonth);
	      
	      document.add(table1);
	      document.add(new Paragraph("\n"));
	      
 PdfPTable table2 = new PdfPTable(4);
	      
	      PdfPCell cell2 = new PdfPCell(new Paragraph("TOP LABORERS WITH MAXIMUM SALARY"));
	      cell2.setColspan(4);
	      cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell2.setPadding(10.0f);
	      cell2.setBackgroundColor(new Color(140, 212, 120));
	      
	      table2.addCell(cell2);
	      
	      PdfPCell cell21 = new PdfPCell(new Paragraph("Si. No."));
	      cell21.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell21.setBackgroundColor(new Color(189, 231, 177));
	      table2.addCell(cell21);
	      
	      PdfPCell cell22 = new PdfPCell(new Paragraph("NAME"));
	      cell22.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell22.setBackgroundColor(new Color(189, 231, 177));
	      table2.addCell(cell22);
	      
	      PdfPCell cell23 = new PdfPCell(new Paragraph("EMAIL"));
	      cell23.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell23.setBackgroundColor(new Color(189, 231, 177));
	      table2.addCell(cell23);
	      	      
	      PdfPCell cell24 = new PdfPCell(new Paragraph("SALARY"));
	      cell24.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell24.setBackgroundColor(new Color(189, 231, 177));
	      table2.addCell(cell24);
	      
	      int i = 0;
	      
	      for(i=0; i<labourSalary.size(); i++) {
	    	  
	    	  LabourSalary l = labourSalary.get(i);
	    	  
	    	  table2.addCell(" " + (i+1));
	    	  table2.addCell(" " + l.getFirstName() + " " + l.getLastName());
	    	  table2.addCell(" " + l.getEmail());
	    	  table2.addCell(" " + l.getTotalSalary());	    	  
	    	  
	      }
	      	
	      document.add(table2);
	      
PdfPTable table3 = new PdfPTable(4);
	      
	      PdfPCell cell3 = new PdfPCell(new Paragraph("TOP LABORERS WITH MAXIMUM SALARY"));
	      cell3.setColspan(4);
	      cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell3.setPadding(10.0f);
	      cell3.setBackgroundColor(new Color(140, 212, 120));
	      
	      table3.addCell(cell3);
	      
	      PdfPCell cell31 = new PdfPCell(new Paragraph("Si. No."));
	      cell31.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell31.setBackgroundColor(new Color(189, 231, 177));
	      table3.addCell(cell31);
	      
	      PdfPCell cell32 = new PdfPCell(new Paragraph("NAME"));
	      cell32.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell32.setBackgroundColor(new Color(189, 231, 177));
	      table3.addCell(cell32);
	      
	      PdfPCell cell33 = new PdfPCell(new Paragraph("EMAIL"));
	      cell33.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell33.setBackgroundColor(new Color(189, 231, 177));
	      table3.addCell(cell33);
	      	      
	      PdfPCell cell34 = new PdfPCell(new Paragraph("SALARY"));
	      cell34.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell34.setBackgroundColor(new Color(189, 231, 177));
	      table3.addCell(cell34);
	      
	      for(i=0; i<labourSalary.size(); i++) {
	    	  
	    	  LabourSalary l = labourSalary.get(i);
	    	  
	    	  table3.addCell(" " + (i+1));
	    	  table3.addCell(" " + l.getFirstName() + " " + l.getLastName());
	    	  table3.addCell(" " + l.getEmail());
	    	  table3.addCell(" " + l.getTotalSalary());	    	  
	    	  
	      }
	      	
	      document.add(table3);
    
    document.close(); //document instance closed
}
catch(Exception de) 
{
        de.printStackTrace();
            System.err.println("document: " + de.getMessage());
            
}


%>