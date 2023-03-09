<%-- 
    Document   : dashborad
    Created on : Oct 7, 2022, 1:35:27 AM
    Author     : Acer
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
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
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <link rel="stylesheet" href="css/style.css">
     
    
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    
</head>
<body>
    <div class="container">
    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <!--<img src="images/logo.png" alt="">-->
            </div>

            <span class="logo_name">CodingLab</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="#">
                    <i class="uil uil-estate"></i>
                    <span class="link-name">Dahsboard</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-files-landscapes"></i>
                    <span class="link-name">Content</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-chart"></i>
                    <span class="link-name">Analytics</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-thumbs-up"></i>
                    <span class="link-name">Like</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-comments"></i>
                    <span class="link-name">Comment</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-share"></i>
                    <span class="link-name">Share</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
                <li><a href="#">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">Logout</span>
                </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                  <span class="switch"></span>
                </div>
            </li>
            </ul>
        </div>
    </nav>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

<!--            <div class="search-box">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>-->
            
            <!--<img src="images/profile.jpg" alt="">-->
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard1</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                        <i class="uil uil-thumbs-up"></i>
                        <span class="text">Total Likes</span>
                        <span class="number">50,120</span>
                    </div>
                    <div class="box box2">
                        <i class="uil uil-comments"></i>
                        <span class="text">Comments</span>
                        <span class="number">20,120</span>
                    </div>
                    <div class="box box3">
                        <i class="uil uil-share"></i>
                        <span class="text">Total Share</span>
                        <span class="number">10,120</span>
                    </div>
                </div>
            </div>

            <div class="activity">
                <div class="title">
                    <i class="uil uil-clock-three"></i>
                    <span class="text">Recent Activity</span>
                </div>

                <div class="activity-data">
                    <div class="tbl-header">
                    <form action="approval.jsp" method="post">
                    <table id="customers">
                        
                        <tr>
                            <th>Frist Name</th>
                            
                            <th>Email</th>
                            <th>Promo</th>
                            <th>Payment</th>
                            <th>Gen</th>
                            <th>Recipt number</th>
                            
                            <th></th>
                        </tr>
                    <%
                        try{
                            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                            statement=connection.createStatement();
                            String sql ="select * from payment";
                            resultSet = statement.executeQuery(sql);
                            while(resultSet.next()){
                        %>
                        
                        <tr>
                        <td><%=resultSet.getString("payment_id") %></td>
                        
                        <td><%=resultSet.getString("payment_email") %></td>
                        <td><%=resultSet.getString("payment_promoid") %></td>
                        <td><%=resultSet.getString("payment_status") %></td>
                        <td><%=resultSet.getString("qr_status") %></td>
                        <td><input type="number" placeholder="" ></td>
                        <td>
                            <button name="approv" value="<%=resultSet.getString("payment_email")%>" type="submit">Appproval</button>
                            </td>
                        </tr>  
                        <%
                            }
                            connection.close();
                            } catch (Exception e) {
                            e.printStackTrace();
                            }
                            %>
                            </table>
                        </form>

                </div>
               </div>
                
            </div>
        </div>
    </section>

    <script src="script.js"></script>
    </div>
</body>
</html>

