<%-- 
    Document   : adminlogin
    Created on : 30 Mar, 2019, 7:55:53 PM
    Author     : VENKAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="dbcon.Dbconnection"%>
<%
    String username=request.getParameter("username");
    session.setAttribute("username",username);
    String password=request.getParameter("password");
    try
    {
      Connection con=Dbconnection.getConnection();
      Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select * from register where username='"+username+"' and password='"+password+"' and designation='accountant'");
      if(rs.next())
      {
       %>
       <script type="text/javascript">
           window.alert("Accountant Login SuccessFully");
           window.location="AccountantHome.jsp";
           
           </script>
        <%
      }
else
{
%>
       <script type="text/javascript">
           window.alert("Accountant Login Fail");
           window.location="Accountant.jsp";
           
           </script>
        <%
}
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>
