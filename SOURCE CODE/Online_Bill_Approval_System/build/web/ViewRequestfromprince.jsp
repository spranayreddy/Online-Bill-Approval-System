<%@page import="dbcon.Dbconnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Bill Approval System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="table.css">
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
                <a href="AccountantHome.jsp">home</a>
            </li>
             <li>
                <a href="ViewRequestfromprince.jsp">View Request from Principal</a>
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
            <table>
               <tr><th>Department</th><th>Name</th><th>Equipment</th><th>Amount</th><th>Image</th><th>Principal Status</th><th> send to HOD</th></tr>
               <%
               Connection con=Dbconnection.getConnection();
               Statement st=con.createStatement();
               ResultSet r=st.executeQuery("select * from bill where status='Accountant' and status1='waiting'");
               while(r.next()){
                 String status=r.getString("status");
                 String status1=r.getString("status1");
                %>
               <tr>
                   <td><%=r.getString("department")%></td>
                   <td><%=r.getString("name")%></td>
                   <td><%=r.getString("equipment")%></td>
                   <td><%=r.getString("amount")%></td>
                    
               <td><image src="view1.jsp?id=<%=r.getString("id")%>" width="100" height="100"/></td>
               <%if(status.equals("Accountant")){
                %>
               <td>Accepted</td>
               <%
             }
if(status.equals("Accountant")&&status1.equals("waiting")){
%>
<td><a href="AccAccept.jsp?id=<%=r.getString("id")%>">CLICK</a></td>
<%
}%>
              
               
               </tr>
               
               <%
               }
               
               %>
           </table>
        </div>
    </body>
</html>
