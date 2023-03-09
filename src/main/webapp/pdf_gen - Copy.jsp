<%-- 
    Document   : pdf_gen
    Created on : Oct 8, 2022, 3:52:24 PM
    Author     : Acer
--%>


<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfImportedPage"%>
<%@page import="com.itextpdf.text.pdf.PdfReader"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>  
<%@page import="com.itextpdf.text.pdf.PdfWriter"%> 
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.*"%>


<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost/";
String database = "ids_reg";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

//String payment_email =(String) session.getAttribute("email");
String payment_email = "kcice50@gmail.com";
String payment_status ;
String qr_status ;
String pdf_status ;
String email_status ;
String order_name ;
String order_price ;
String text;
%>

<%
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        String sql ="SELECT * FROM `payment` INNER JOIN promos on payment.payment_promoid = promos.promo_id where payment_email ='"+payment_email+"'";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
                payment_status = resultSet.getString("payment_status");
//                qr_status = resultSet.getString("qr_status");
//                pdf_status = resultSet.getString("pdf_status");
                order_name = resultSet.getString("promo_name");
                order_price = resultSet.getString("promo_price");
%>

<%
        try{
            String file_name = "C:\\Users\\Acer\\Documents\\NetBeansProjects\\WebApplication1\\web\\gen_result\\"+payment_email+".pdf";
            Document document = new Document();

            PdfWriter writer = PdfWriter.getInstance(document,new FileOutputStream(file_name));

            document.open();
            
            Paragraph para = new Paragraph("This "+payment_email);
            Paragraph para1 = new Paragraph("                                        ");
            document.add(para);
            document.add(para1);
            
            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100);
            PdfReader reader = new PdfReader("C:\\Users\\Acer\\Documents\\NetBeansProjects\\WebApplication1\\web\\pic\\header2.pdf");
            PdfImportedPage header = writer.getImportedPage(reader, 1);
            PdfPCell cell = new PdfPCell(Image.getInstance(header));
            cell.setColspan(4);
            Paragraph p = new Paragraph();
            table.addCell(cell);
            //Create cells
            for (int row = 1; row <= 10; row++) {
            PdfPCell pdfPCell1 = new PdfPCell(new Paragraph("No."+row));
            PdfPCell pdfPCell2 = new PdfPCell(new Paragraph(payment_email));
            PdfPCell pdfPCell3 = new PdfPCell(new Paragraph(order_name));
            PdfPCell pdfPCell4 = new PdfPCell(new Paragraph(order_price));
            //Add cells to table
            table.addCell(pdfPCell1);
            table.addCell(pdfPCell2);
            table.addCell(pdfPCell3);
            table.addCell(pdfPCell4); }
            
            reader = new PdfReader("C:\\Users\\Acer\\Documents\\NetBeansProjects\\WebApplication1\\web\\pic\\footer.pdf");
            PdfImportedPage footer = writer.getImportedPage(reader, 1);
            cell = new PdfPCell(Image.getInstance(footer));
            cell.setColspan(4);
            table.addCell(cell);
            document.add(table);

            document.close();
            
//            String sqlqr = "UPDATE payment SET pdf_status = 'Suscess' WHERE payment_email ='"+payment_email+"'" ;
//            statement.executeUpdate(sqlqr);
  
//            if(email_status.equals("wait")){ 
//               response.sendRedirect("sendemail.jsp");
//            }
//             
            
        } catch (Exception e) {
			System.err.println(e);
                        response.sendRedirect("error.jsp");
        }
    }
        response.sendRedirect("sendemail.jsp");
%>

<%          
//        if(payment_status.equals("Suscess")){ 
//                    if(email_status.equals("wait")){ 
//                        session.setAttribute("email", payment_email); 
//                        response.sendRedirect("sendemail.jsp");
////                        RequestDispatcher dispatcher = request.getRequestDispatcher("qr_gen.jsp");
////                        dispatcher.forward( request, response );
//                    } 
//                }
//        }                     
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <%= payment_email%>
    </body>
</html>
