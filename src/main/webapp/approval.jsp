<%-- 
    Document   : approval
    Created on : Oct 21, 2022, 4:09:46 PM
    Author     : Acer
--%>

<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String approv=request.getParameter("approv"); 
    request.setAttribute("approv",null);
 %>

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

String payment_email = approv ;
//String payment_email = "kcice50@gmail.com";
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
//                pdf_status = resultSet.getString("pdf_status");
//                email_status = resultSet.getString("email_status");
                
                if(payment_status.equals("Suscess")){ 
                    if(qr_status.equals("wait")){ 
//                        String sqlqr = "UPDATE payment SET qr_status = 'Suscess' WHERE payment_email ='"+payment_email+"'" ;
//                        statement.executeUpdate(sqlqr);
//                          resultSet = null;
                          session.setAttribute("email", payment_email);
//                          if (statement != null){
//                                statement.close();}
                          response.sendRedirect("qr_gen.jsp");  
                        
//                        RequestDispatcher dispatcher = request.getRequestDispatcher("qr_gen.jsp");
//                        dispatcher.forward( request, response );
                    }
                }
        }
//        session.setAttribute("email", payment_email); 
//        response.sendRedirect("qr_gen.jsp");    
        
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Approval!</h1>
        
        
    </body>
</html>
