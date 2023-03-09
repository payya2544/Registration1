<%@page import="java.sql.*" %> 
<%@page import="java.io.*" %> 

<%
try
{
    Class.forName("com.mysql.jdbc.Driver");        
    Connection con =  DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/student?characterEncoding=UTF-8","student","uploadfile286");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM payment");          
    while( rs.next() )
    {
       out.print( rs.getString("payment_id") +"<br>" );
    }     
    con.close();
}
catch(Exception e)
{
  out.print(e);  
}
%>