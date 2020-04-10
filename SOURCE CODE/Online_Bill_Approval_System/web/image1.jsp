<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbcon.Dbconnection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Bill Approval System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="table.css" type="text/css" rel="stylesheet">
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
                <a href="PrincipalHome.jsp">home</a>
            </li>
             <li>
                <a href="ViewRequest.jsp">View Request</a>
            </li>
             <li>
                <a href="ViewpResponse.jsp">View Response</a>
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
           <h3>View All Request</h3> 
           <table>
                <td><image src="view.jsp?id=<%=id%>" width="500" height="600"/></td>
           </table>
            </center>
        </div>
    </body>
</html>
