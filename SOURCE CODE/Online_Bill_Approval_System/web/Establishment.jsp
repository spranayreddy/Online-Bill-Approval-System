<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
                <a href="index.html">home</a>
            </li>
             <li>
                <a href="Principal.jsp">Principal</a>
            </li>
             <li>
                <a href="HOD.jsp">HOD</a>
            </li>
            <li>
                <a href="Establishment.jsp">Establishment</a>
            </li>
            <li>
                <a href="Accountant.jsp">Accountant</a>
            </li>
            <li>
                <a href="Register.jsp">Registration</a>
            </li>
        <li>
                <a href="Registrar.jsp">Registrar</a>
            </li>

        
        </ul>
             </center>
        </div>
        </div> 
        <div id="right">
            <h2>Welcome To Establishment Login</h2>
  <form name="login" action="EstablishmentLogin.jsp" method="post">
            <table>
                <tr><td>Username</td><td><input type="text" name="username" required></td></tr>
                <tr><td>Password</td><td><input type="password" name="password" required=""></td></tr>
                <tr><td><input type="submit" value="Login"></td><td><input type="Reset"></td></tr>
            </table>
            </form>
        </div>
        <div id="left">
            
        </div>
    </body>
</html>
