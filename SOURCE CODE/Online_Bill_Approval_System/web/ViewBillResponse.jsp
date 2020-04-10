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
                <a href="ViewBillRequest.jsp">View Bill Request</a>
            </li>
            <li>
                <a href="ViewBillResponse.jsp">View Bill Response</a>
            </li>
            <li>
                <a href="index.html">Logout</a>
            </li>
        
        
        </ul>
             </center>
        </div>
        </div> 
        <div id="right">
            <% String username=(String)session.getAttribute("username");%>
            <h2>Welcome <%=username%></h2>
         </div>
        <div id="left">
            <center>
           <h3>View All Response</h3> 
           <table>
               <tr><th>Department</th><th>Name</th><th>Email</th><th>Equipment</th><th>Amount</th><th>Image</th><th>Status</th></tr>
               <%
               Connection con=Dbconnection.getConnection();
               Statement st=con.createStatement();
               ResultSet r=st.executeQuery("select * from bill");
               while(r.next()){
                   String status=r.getString("status");
                %>
               <tr>
                   <td><%=r.getString("department")%></td>
                   
                    <td><%=r.getString("name")%></td>
                    <td><%=r.getString("email")%></td>
                   <td><%=r.getString("equipment")%></td>
                   <td><%=r.getString("amount")%></td>
                   
                   <td><a href="image1.jsp?id=<%=r.getString("id")%>"><image src="view1.jsp?id=<%=r.getString("id")%>" width="100" height="100"/></a></td>
              
                   
               <td><%=r.getString("status1")%></td>
              
              
               </tr>
               
               <%
               }
               
               %>
           </table>
            </center>
        </div>
    </body>
</html>
