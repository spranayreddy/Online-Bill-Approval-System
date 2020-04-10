<%@page import="java.sql.ResultSet"%>
<%@page import="dbcon.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Bill Approval System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <a href="RegistrarHome.jsp">home</a>
            </li>
             <li>
                <a href="ViewPrincipalRequest1.jsp">View Principal Request</a>
            </li>
                        <li>
                <a href="index.html">Logout</a>
            </li>
        
        
        </ul>
             </center>
        </div>
        </div> 
        <div id="right">
            <div id="right">
            <% String username=(String)session.getAttribute("username");%>
            
         </div>
        <div id="left">
            <center>
           <h3>View All Request</h3> 
           <table align="center">
               <tr><th>Department</th><th>Email</th><th>Name</th><th>Equipment</th><th>Amount</th><th>Image</th><th>Principal Status</th><th>Status</th></tr>
               <%
               Connection con=Dbconnection.getConnection();
               Statement st=con.createStatement();
               ResultSet r=st.executeQuery("select * from letter where status='Registrar'");
               while(r.next()){
                   String status1=r.getString("status");
                %>
               <tr>
                   <td><%=r.getString("dept")%></td>
                   <td><%=r.getString("email")%></td>
                   <td><%=r.getString("name")%></td>
                   <td><%=r.getString("equipment")%></td>
                   <td><%=r.getString("amount")%></td>
                    
               <td><image src="view.jsp?id=<%=r.getString("id")%>" width="100" height="100"/></td>
                <td><%=r.getString("status")%></td>
               <%if(status1.equals("Registrar")){
                   %>
                 <td><a href="Accept3.jsp?id=<%=r.getString("id")%>&email=<%=r.getString("email")%>">waiting</a></td>
               <%
               }%>
               
               </tr>
               
               <%
               }
               
               %>
           </table>
            </center>
        </div>
        <div id="left">
            
        </div>
    </body>
</html>
