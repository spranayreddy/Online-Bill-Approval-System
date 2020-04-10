<%-- 
    Document   : Accept
    Created on : May 14, 2019, 11:38:18 AM
    Author     : Acer
--%>

<%@page import="com.mail.AcceptMail"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbcon.Dbconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String msg="Hello : "+email+".\n\n your request has been accepted by the Registrar.";
try{
    
    Connection con=Dbconnection.getConnection();
    Statement st=con.createStatement();
    int i=st.executeUpdate("update letter set registrar='Accepted' where id='"+id+"'");
    
    if(i>0){
        AcceptMail.secretMail(msg, email, email);
       response.sendRedirect("ViewPrincipalRequest1.jsp?msg=success"); 
    }else{
       response.sendRedirect("ViewPrincipalRequest1.jsp?msg=failed");  
    }
}catch(Exception e){
    out.println(e);
}

%>