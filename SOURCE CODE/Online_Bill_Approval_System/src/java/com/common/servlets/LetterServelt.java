/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.common.servlets;


import com.mail.Mail;
import dbcon.Dbconnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


/**
 *
 * @author Acer
 */
@MultipartConfig(maxFileSize=16*1024*1024)
public class LetterServelt extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
       try{
           String username=(String)session.getAttribute("username");
           
           String deptname=request.getParameter("deptname");
            String name=request.getParameter("name");
            String equipment=request.getParameter("equipment");
             String amount=request.getParameter("amount");
             String pemail=request.getParameter("pemail");
             Part image=request.getPart("image");
             
             
             String msg="Hello!! Mr. "+pemail+"(Principal).\n\n You have received a permission letter from "+username+"(HOD).";
             
             
           InputStream inputStream=null;
           if(image!=null){
               inputStream=image.getInputStream();
           }
           Connection con=Dbconnection.getConnection();
           PreparedStatement st=con.prepareStatement("insert into letter values(null,'"+username+"','"+pemail+"','"+deptname+"','"+name+"','"+equipment+"','"+amount+"',?,'waiting','waiting','waiting')");
         st.setBlob(1,inputStream);
           int i=st.executeUpdate();
           if(i>0){
               Mail.secretMail(msg, pemail, pemail);
               response.sendRedirect("SendLetter.jsp?mag=success");
           }else{
             response.sendRedirect("SendLetter.jsp?mag=failed");    
           }
       }catch(Exception e){
        System.out.println(e);
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
