<%-- 
    Document   : checktoken
    Created on : Mar 3, 2023, 4:42:51 PM
    Author     : paanpun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.auth0.jwt.*"%>
<%@page import="com.auth0.jwt.algorithms.*"%>
<%@page import="com.auth0.jwt.interfaces.*"%>
<%@page import="com.auth0.jwt.JWTVerifier"%>
<%@page import="com.auth0.jwt.exceptions.JWTCreationException.*"%>
<%@page import="com.auth0.jwt.exceptions.*"%>
<%@page import="com.auth0.jwt.exceptions.JWTVerificationException.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.InputStreamReader.*"%>
<%@page import="java.net.URL.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.Random"%>
<%@page import="com.mycompany.idrsproject.DBConnection" %>
<%@page import="java.sql.*"%>
<%
    String url=null;
    try {
        if (request.getParameter("token") != null) {

            String responseToken = request.getParameter("token");

            String secretKey = "C4D47B3E4E5F0AC0D9E8DF78085E5C11041BD58C8D8CB21F9503771EC6BEDED5"; //Merchant SHA Key

            Algorithm algorithm = Algorithm.HMAC256(secretKey);

            JWTVerifier verifier = JWT.require(algorithm).build();
            verifier.verify(responseToken);   //verify signature

            DecodedJWT jwt = JWT.decode(responseToken); //decode encoded payload    
            Map<String, Claim> responseData = jwt.getClaims();

            String paymentToken = responseData.get("paymentToken").toString(); //get the response data
            String paymentUrl = responseData.get("webPaymentUrl").toString(); //get the response data
            //...
//            out.println(responseData);
//            out.println(paymentUrl);
            url = paymentUrl;
            out.println("<script>window.open(" + paymentUrl + ", '_blank')</script>");
//            response.sendRedirect("main.jsp");
        } else {
            out.println("token is null");
        }
    } catch (JWTVerificationException e) {
        //Invalid signature/claims
        e.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
