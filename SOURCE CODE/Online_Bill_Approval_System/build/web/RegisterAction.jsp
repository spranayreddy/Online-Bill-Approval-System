<%-- 
    Document   : RegisterAction
    Created on : 13 May, 2019, 4:55:47 PM
    Author     : VENKAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="dbcon.Dbconnection"%>
<%
    
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String designation=request.getParameter("designation");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String address=request.getParameter("address");
    String username=request.getParameter("username");
   
    String password=request.getParameter("password");
    try
    {
      Connection con=Dbconnection.getConnection();
      Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select count(*) from register where username='"+username+"'");
      while(rs.next())
      {
          int count=rs.getInt(1);
          if(count==0)
          {
              int i=st.executeUpdate("insert into register values('"+fname+"','"+lname+"','"+designation+"','"+email+"','"+mobile+"','"+address+"','"+username+"','"+password+"')");
              if(i>0)
              {
                  %>
       <script type="text/javascript">
           window.alert("Registration Completed SuccessFully");
           window.location="index.html";
           
           </script>
        <%
              }
else
{
%>
       <script type="text/javascript">
           window.alert("Unable Register Right Now");
           window.location="index.html";
           
           </script>
        <%
}
          }
else
{
%>
       <script type="text/javascript">
           window.alert("The User Name Is Already Exist ");
           window.location="index.html";
           
           </script>
        <%
}
      }
%>
       <script type="text/javascript">
           window.alert("The User Name Is Already Exist ");
           window.location="index.html";
           
           </script>
        <%
    }
      catch(Exception e)
              {
              out.println(e);
              }
      %>
