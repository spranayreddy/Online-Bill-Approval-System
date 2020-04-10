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
            <% String username=(String)session.getAttribute("username");%>
            <h2>Welcome <%=username%></h2>
         </div>
        <div id="left">
            <center>
           <h3>View  Response from Establishment</h3> 
           <table>
               <tr><th>Department</th><th>Name</th><th>Equipment</th><th>Amount</th><th>Image</th><th>Establishment Status</th>
                   <th> Registrar Status</th><th>Send To HOD</th><th>Accountant</th></tr>
               <%
               Connection con=Dbconnection.getConnection();
               Statement st=con.createStatement();
               ResultSet r=st.executeQuery("select * from letter");
               while(r.next()){
                 String  status=r.getString("status1");
                 String  hod=r.getString("hod");
                 String  accountant=r.getString("accountent");
                %>
               <tr>
                   <td><%=r.getString("dept")%></td>
                   <td><%=r.getString("name")%></td>
                   <td><%=r.getString("equipment")%></td>
                   <td><%=r.getString("amount")%></td>
               <td><image src="view.jsp?id=<%=r.getString("id")%>" width="100" height="100"/></td>
               
                 <td><%=r.getString("status1")%></td>     <td>waiting</td>
                 <%if(status.equals("Prepare Proceeding")&& hod.equals("waiting"))
                        {
                   %>
                   <td><a href="SendHod.jsp?id=<%=r.getString("id")%>">Send to Hod</a></td>
                   <%
               }else{
%>
 <td>process info sent to hod</td>
  <%if(accountant.equals("waiting")){
                   %>
                  <td><a href="InAccountant.jsp?id=<%=r.getString("id")%>">Inform Accountant</a></td>
                   <%
               }else{%>
  
<td>Information sent to Accountant</td>
<%}%>
   </tr>
               
               <%
               }
}
               
               %>
           </table>
            </center>
        </div>
    </body>
</html>
