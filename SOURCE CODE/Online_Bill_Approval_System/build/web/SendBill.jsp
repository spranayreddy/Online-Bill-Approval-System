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
            <form action="BillServelt" method="post" enctype="multipart/form-data">
            <table cellpadding="10px" cellspacing="10px" border="2px">
                <tr><td>Department Name</td><td><input type="text" name="deptname" required=""></td></tr>
                <tr><td>HOD Name</td><td><input type="text" name="name" required=""></td></tr>
                <tr><td>Equipment Name</td><td><input type="text" name="equipment" required=""></td></tr>
               <tr><td>Quantity</td><td><input type="number" name="quntity" required=""></td></tr>
                
               <tr><td>Purchased Date</td><td><input type="date" name="purchasedate" required=""></td></tr>
               <tr><td>Amount</td><td><input type="text" name="amount" required=""></td></tr>
                <tr><td>Scanned copy of a bill</td><td><input type="file" name="Bill" required=""></td></tr>
               <tr><td><input type="Submit" value="Submit"></td><td><input type="Reset"></td></tr>
                </table>
            </form>
        </div>
        <div id="left">
            
        </div>
    </body>
</html>
