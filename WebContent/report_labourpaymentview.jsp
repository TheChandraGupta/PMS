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

String userId = request.getParameter("userId");

ArrayList<LabourPayment> labourPayment = DBHandler.labourPaymentDetail(userId, dbManager);

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
	      table1.addCell("  Date of Payment");
	      table1.addCell("  " );
	      table1.addCell("  Amount Before");
	      table1.addCell("  " );
	      table1.addCell("  Amount Paid");
	      table1.addCell("  " );
	      table1.addCell("  Amount Remaining");
	      table1.addCell("  " );
	      
	      document.add(table1);
	      document.add(new Paragraph("\n"));
	      
    
    document.close(); //document instance closed
}
catch(Exception de) 
{
        de.printStackTrace();
            System.err.println("document: " + de.getMessage());
            
}


%>