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
String email=request.getParameter("email");
int amn=Integer.parseInt(request.getParameter("amount"));


String msg="Hello : "+email+".\n\n your request has been accepted by the principal.\n\n  and the amount is less then 500000,"
        + "so, the request forwarded to the Establishment";

String msg1="Hello : "+email+".\n\n your request has been accepted by the principal.\n\n  and the amount is more then 500000,"
        + "so, the request forwarded to the Registrar";
try{
    
    Connection con=Dbconnection.getConnection();
    Statement st=con.createStatement();
    int i=0;
    if(amn<500000){
     i=st.executeUpdate("update letter set status='Establishment' where id='"+id+"'");    
    }else{
      i=st.executeUpdate("update letter set status='Registrar' where id='"+id+"'");    
    }
   
    
    if(i>0){
            if(amn<500000){
                Statement t=con.createStatement();
                ResultSet rs=t.executeQuery("select * from register where designation='Establishment'");
                String ema=null;
                while(rs.next()){
                    ema=rs.getString("email");
                }
                String mg="you received request from the pricipal";
                Mail.secretMail(mg, ema, ema);
        AcceptMail.secretMail(msg, email, email);
            }else{
                 Statement t1=con.createStatement();
                ResultSet rs1=t1.executeQuery("select * from register where designation='Registrar'");
                String ema1=null;
                while(rs1.next()){
                    ema1=rs1.getString("email");
                }
                String mg1="you received request from the pricipal";
                Mail.secretMail(mg1, ema1, ema1);
   
                AcceptMail.secretMail(msg1, email, email);  
            }
       response.sendRedirect("ViewRequest.jsp?msg=success"); 
    }else{
       response.sendRedirect("ViewRequest.jsp?msg=failed");  
    }
}catch(Exception e){
    out.println(e);
}

%>