<%-- 
    Document   : SendHod
    Created on : May 14, 2019, 12:14:50 PM
    Author     : Acer
--%>

<%@page import="dbcon.Dbconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id=request.getParameter("id");
try{
    Connection con=Dbconnection.getConnection();
    Statement st=con.createStatement();
    int i=st.executeUpdate("update letter set hod='Proceeding' where id='"+id+"'");
    
    if(i>0){
       response.sendRedirect("ViewpResponse.jsp?msg=success"); 
    }else{
       response.sendRedirect("ViewpResponse.jsp?msg=failed");  
    }
}catch(Exception e){
    out.println(e);
}

%>