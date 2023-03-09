<%-- 
    Document   : main
    Created on : Jul 2, 2022, 1:22:28 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/Indexstyle.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>


  <% 
//        if(session.getAttribute("username")== null)
//        {
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('You need to Login first');"); 
//            out.println("location='index.jsp';"); 
//            out.println("</script>");
////            response.sendRedirect("index.jsp");
//            
//        }
//        
  %>
  
  <%
    String approv=request.getParameter("approv"); 
 %>
  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
<!--            <img src="logo.png"width="55" height="48">-->
    <div class="title">Registration</div>
    <div class="content"></div>
        <h1>Registration Successful !</h1>
        <%--<%= approv%>--%>
    </body>
</html>

        

