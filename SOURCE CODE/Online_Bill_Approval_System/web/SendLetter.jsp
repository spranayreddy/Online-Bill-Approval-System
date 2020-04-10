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
            <% String username=(String)session.getAttribute("username");%>
            <h2>Welcome <%=username%></h2>
            <form action="LetterServelt" method="post" enctype="multipart/form-data">
            <table cellpadding="10px" cellspacing="10px" border="2px">
                <tr><td>Department Name</td><td><input type="text" name="deptname" required=""></td></tr>
                <tr><td>Your Name</td><td><input type="text" name="name" required=""></td></tr>
                <tr><td>Equipment Name</td><td><input type="text" name="equipment" required=""></td></tr>
                <tr><td>Amount</td><td><input type="text" name="amount" required=""></td></tr>
                <tr><td>Permission Image</td><td><input type="file" name="image" required=""></td></tr>
                <%
                String query="select * from register where designation='principal'";
                try{
                    Connection con=Dbconnection.getConnection();
                    Statement st=con.createStatement();
                    ResultSet r=st.executeQuery(query);
                    while(r.next()){
                        String name=r.getString("email");
                        %>
                 <tr><td>Principal</td><td><input type="text" name="pemail" value="<%=name%>" readonly=""></td></tr>
                <%
                    }
                    
                    
                }catch(Exception e){
                   out.println(e); 
                }
                
                %>
                <tr><td><input type="Submit" value="Submit"></td><td><input type="Reset"></td></tr>
                </table>
            </form>
        </div>
        <div id="left">
            
        </div>
    </body>
</html>
