<%-- 
    Document   : Accept
    Created on : May 14, 2019, 11:38:18 AM
    Author     : Acer
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbcon.Dbconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id=request.getParameter("id");

try{
    
    Connection con=Dbconnection.getConnection();
    Statement st=con.createStatement();
    int i=st.executeUpdate("update letter set status='Accepted',status2='Registrar' where id='"+id+"'");
    
    if(i>0){
       response.sendRedirect("ViewPrincipalRequest.jsp?msg=success"); 
    }else{
       response.sendRedirect("ViewPrincipalRequest.jsp?msg=failed");  
    }
}catch(Exception e){
    out.println(e);
}

%>