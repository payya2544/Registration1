<%-- 
    Document   : sendemail
    Created on : Oct 9, 2022, 5:27:27 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.IOException"%>

<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://127.0.0.1:3306/";
String database = "student?characterEncoding=UTF-8";
String userid = "student";
String password = "uploadfile286";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

String payment_email = (String) session.getAttribute("email");
String payment_status ;
String qr_status ;
String pdf_status ;
String email_status ;
%>

<%
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        String sql ="select * from payment where payment_email ='"+payment_email+"'";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
                payment_status = resultSet.getString("payment_status");
                qr_status = resultSet.getString("qr_status");
                pdf_status = resultSet.getString("pdf_status");
                email_status = resultSet.getString("email_status");
                
%>

<%
        try{
                final String username = "idrs_registeration@outlook.co.th";
		final String passworddd = "Ice1032079";
		String fromEmail = "idrs_registeration@outlook.co.th";
		String toEmail = payment_email;

		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.host", "smtp-mail.outlook.com");
		properties.put("mail.smtp.port", 587);
                properties.put("mail.transpot.protocal", "smtp");
                
                Session session1 = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,passworddd);
			}
		});
                
                MimeMessage msg = new MimeMessage(session1);
		try {
			msg.setFrom(new InternetAddress(fromEmail));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			msg.setSubject("Dear"+payment_email);

			Multipart emailContent = new MimeMultipart();

			//Text body part
			MimeBodyPart textBodyPart = new MimeBodyPart();
			textBodyPart.setText("My multipart text");

			//Attachment body part.
			MimeBodyPart pdfAttachment = new MimeBodyPart();
			pdfAttachment.attachFile("C:\\Users\\Acer\\Documents\\NetBeansProjects\\WebApplication1\\web\\gen_result\\"+payment_email+".pdf");
                        
                        MimeBodyPart pngAttachment = new MimeBodyPart();
			pngAttachment.attachFile("C:\\Users\\Acer\\Documents\\NetBeansProjects\\WebApplication1\\web\\gen_result\\"+payment_email+".jpg");

			//Attach body parts
			emailContent.addBodyPart(textBodyPart);
			emailContent.addBodyPart(pdfAttachment);
                        emailContent.addBodyPart(pngAttachment);

			//Attach multipart to message
			msg.setContent(emailContent);
                        
//                        msg.setText("emailContent");

			Transport.send(msg);
			System.out.println("Sent message");
                        
//                        String sqlqr = "UPDATE payment SET email_status = 'Suscess' WHERE payment_email ='"+payment_email+"'" ;
//                        statement.executeUpdate(sqlqr);
//                        statement.closeOnCompletion();
//                        statement.close();
                        session.removeAttribute("email");
                        response.sendRedirect("dashborad.jsp"); 
                       
		} catch (MessagingException e) {
			e.printStackTrace();
                        response.sendRedirect("error1.jsp");}
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//                        response.sendRedirect("po.jsp");
//		}
          
        } catch (Exception e) {
			System.err.println(e);
                        response.sendRedirect("error2.jsp");
        }
        
        }
        
        
        
%>

<%          
//        if(payment_status.equals("Suscess")){ 
//                    if(email_status.equals("Suscess")&& pdf_status.equals("Suscess") && qr_status.equals("Suscess")){ 
//                        session.setAttribute("email", "null"); 
//                        response.sendRedirect("main.jsp");
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
