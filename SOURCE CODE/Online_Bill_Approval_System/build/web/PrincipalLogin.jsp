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
      ResultSet rs=st.executeQuery("select * from register where username='"+username+"' and password='"+password+"' and designation='principal'");
      if(rs.next())
      {
       %>
       <script type="text/javascript">
           window.alert("Principal Login SuccessFully");
           window.location="PrincipalHome.jsp";
           
           </script>
        <%
      }
else
{
%>
       <script type="text/javascript">
           window.alert("Principal Login Fail");
           window.location="Principal.jsp";
           
           </script>
        <%
}
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>
