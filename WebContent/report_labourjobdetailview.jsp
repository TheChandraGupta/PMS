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

String labourJobId = request.getParameter("labourJobId");

DBManager dbManager = new DBManager();

LabourJobDetail labourJobDetail = DBHandler.assignedJobDetail(labourJobId, dbManager);

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
    document.add(new Paragraph("Report : " + "Labour Job Detail" + "\n\n")); 
    document.add(new Paragraph("\n"));   
    
	//Inserting Table in PDF
 PdfPTable table1 = new PdfPTable(2);
	      
	      PdfPCell cell1 = new PdfPCell(new Paragraph("PROFILE"));
	      cell1.setColspan(2);
	      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell1.setPadding(10.0f);
	      cell1.setBackgroundColor(new Color(140, 212, 120));
	      
	      table1.addCell(cell1);
	      table1.addCell("  First Name");
	      table1.addCell("  " + labourJobDetail.getFirstName());
	      table1.addCell("  Last Name");
	      table1.addCell("  " + labourJobDetail.getLastName());
	      table1.addCell("  Email");
	      table1.addCell("  " + labourJobDetail.getEmail());
	      table1.addCell("  Phone Number");
	      table1.addCell("  " + labourJobDetail.getPhone());
	      table1.addCell("  User Type");
	      table1.addCell("  " + labourJobDetail.getType());
	      
	      document.add(table1);
	      document.add(new Paragraph("\n"));
	      
 PdfPTable table2 = new PdfPTable(2);
	      
	      PdfPCell cell2 = new PdfPCell(new Paragraph("JOB DETAIL"));
	      cell2.setColspan(2);
	      cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
	      cell2.setPadding(10.0f);
	      cell2.setBackgroundColor(new Color(140, 212, 120));
	      
	      table2.addCell(cell2);
	      table2.addCell("  Job Name");
	      table2.addCell("  " + labourJobDetail.getJob());
	      table2.addCell("  Job Date");
	      table2.addCell("  " + labourJobDetail.getJobDate());
	      table2.addCell("  Job Description");
	      table2.addCell("  " + labourJobDetail.getJobDetail());
	      table2.addCell("  Basic Rate");
	      table2.addCell("  " + labourJobDetail.getBasicRate());
	      table2.addCell("  DA Rate");
	      table2.addCell("  " + labourJobDetail.getdARate());
	      table2.addCell("  Remark");
	      table2.addCell("  " + labourJobDetail.getRemark());
	      
	      document.add(table2);
    
    document.close(); //document instance closed
}
catch(Exception de) 
{
        de.printStackTrace();
            System.err.println("document: " + de.getMessage());
            
}


%>