<%-- 
    Document   : image
    Created on : Jun 5, 2019, 10:23:14 AM
    Author     : Jagadeesh K
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbcon.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Bill Approval System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="table.css" rel="stylesheet">
        <style>
            body{
                background:pink;
            }
            ul li{
               float:left;
               width:200px;
               list-style:none;
               font-size:20px;
            }
            ul li a{
                text-transform: uppercase;
                text-decoration: none;
            }
            #right{
                float:right;
                width:50%;
                height:500px;
              border:1px solid pink;
            }
             #left{
                float:left;
                width:49%;
                height:500px;
              border:1px solid pink;
              
              background-size: 500px 500px;
            }
            </style>
    </head>
    <body>
        <div>
            
            
            
         <center><h1>Online Bill Approval System</h1></center>
         <div>
             <center>
        <ul>
            <li>
                <a href="HODHome.jsp">home</a>
            </li>
             <li>
                <a href="SendLetter.jsp">Send Letter</a>
            </li>
             <li>
                <a href="SendBill.jsp">Send Bill</a>
            </li>
            <li>
            <a href="ViewResponse.jsp">View Response</a>
            </li>
            <li>
            <a href="BillResponse.jsp">Bill Response</a>
            </li>
            
            <li>
                <a href="index.html">Logout</a>
            </li>
        
        
        </ul>
             </center>
        </div>
        </div> 
        <div id="right">
            <% String username=(String)session.getAttribute("username");
            String id=request.getParameter("id");%>
            <h2>Welcome <%=username%></h2>
  
        </div>
        <div id="left">
            <center>
                <h3>View Letter</h3> 
           <table>
               
                  
               <td><image src="view.jsp?id=<%=id%>" width="500" height="600"/></td>
               
           </table>
            </center>
        </div>
    </body>
</html>

