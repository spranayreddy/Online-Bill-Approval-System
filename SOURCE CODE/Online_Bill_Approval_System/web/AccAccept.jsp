<%-- 
    Document   : Accept
    Created on : May 14, 2019, 11:38:18 AM
    Author     : Acer
--%>

<%@page import="com.mail.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mail.AcceptMail"%>
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
    int i=0;
   
      i=st.executeUpdate("update bill set status1='Accepted' where id='"+id+"'");    
    
    if(i>0){
           
     
       response.sendRedirect("ViewRequestfromprince.jsp?msg=success"); 
    }else{
       response.sendRedirect("ViewRequestfromprince.jsp?msg=failed");  
    }
}catch(Exception e){
    out.println(e);
}

%>