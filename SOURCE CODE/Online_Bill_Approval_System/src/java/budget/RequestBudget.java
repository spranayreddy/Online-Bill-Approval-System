/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package budget;

import com.oreilly.servlet.MultipartRequest;
import dbcon.Dbconnection;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(maxFileSize=16*1024*1024)
public class RequestBudget extends HttpServlet {

   final String filepath="E://";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MultipartRequest mr=new MultipartRequest(request,filepath);
        try{
          String uname=mr.getParameter("uname");
          String purpose=mr.getParameter("purpose");
          String hr=mr.getParameter("hr");
          File f=mr.getFile("file");
          String fname=f.getName();
          
          BufferedReader br=new BufferedReader(new FileReader(f));
          StringBuffer sb=new StringBuffer();
          String temp=null;
          while((temp=br.readLine())!=null){
             sb.append(temp);
          }
         String data=sb.toString();
         
          Connection con = Dbconnection.getConnection();
            Statement st = con.createStatement();
        int i=st.executeUpdate("insert into files values(null,'"+uname+"','"+purpose+"','"+hr+"','"+fname+"','"+data+"','waiting','hr')");
        if(i>0){
            response.sendRedirect("RequestBudget.jsp?msg=success");
        }  else{
             response.sendRedirect("RequestBudget.jsp?msg=failed"); 
        }
          
        }catch(Exception e){
            out.println(e);
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
