/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lyns;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;          
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;
@WebServlet("/FileUploadServlet")
@MultipartConfig(maxFileSize=1617721)

public class FileUploadDBServlet extends HttpServlet {
Connection conn=null;
PreparedStatement ps =null;
int a=1;
String message = "";
String getipname="";

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       /* try (PrintWriter out = response.getWriter()) {
               String firstname ="";
        String surname="";
        String middlename="";
        int age=0;
        String location="";
        String phonenumber="";
        String votersid="";
        String town="";
        String relation="";
        String nextofkin="";
        String password="";
        String accountsnumber="";
        Part picture;
        InputStream inputstream=null;
        firstname=request.getParameter("firstname");
        surname=request.getParameter("surname");
        middlename =request.getParameter("middlename");
        age=Integer.parseInt(request.getParameter("age"));
        location=request.getParameter("location");
        votersid = request.getParameter("votersid");
        town=request.getParameter("town");
        relation=request.getParameter("relationship");
        nextofkin=request.getParameter("nextofkin");
        password=request.getParameter("password");
        accountsnumber=request.getParameter("accountsnumber");
         picture=request.getPart("picture");
           picture =request.getPart("picture");
         
         // InputStream inputstream = null;
             
        if (picture!=null){
     
     System.out.println(picture.getName());
     System.out.println(picture.getSize());
     System.out.println(picture.getContentType());
     inputstream = picture.getInputStream();
     }
         out.println("from textfields : "+" picture address:  "+ picture +firstname+ " : " + surname+" : "+ middlename +" : "+ age+location+" : "+votersid+town+" : "+relation+" : "+nextofkin+" : "+password+" : "+accountsnumber+"  "+"done");
             
        if (picture!=null){
     
     System.out.println(picture.getName());
     System.out.println(picture.getSize());
     System.out.println(picture.getContentType());
     inputstream = picture.getInputStream();
     }
    
     try{
        Class.forName ("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapp","root","0241232915");
   out.println("coonected");
      if (inputstream !=null){
            
            
            ps = conn.prepareStatement ("insert into cusdetails(firstname,surname,middlename,age,location,phonenumber,votersid,town,relation,nextofkin,password,accountsnumber,picture) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
           

            ps.setString(1,firstname );
            ps.setString(2, surname);
            ps.setString(3, middlename);
            ps.setInt(4, age);
             ps.setString(5,location);
              ps.setString(6, phonenumber);
               ps.setString(7, votersid);
               ps.setString(8, town);
               ps.setString(9, relation);
               ps.setString(10, nextofkin);
               ps.setString(11, password);
               ps.setString(12, accountsnumber);
              
            if (inputstream!=null){
          
                ps.setBlob(13,inputstream);
                
                int a = ps.executeUpdate();    
         if (a==1){
            message= "Stored wowww";
             out.println("<h1>"+message+"</h1>");
            JOptionPane.showMessageDialog(null, "submited");
             }else
             {message="error try agian"
;                }
            }
            }else{
      message="error try again";
      }
     }catch(Exception ex){
     out.println("<h1>"+ex+"</h1>");
     
     
     } finally {
        if (conn != null) {
            // closes the database connection
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        // sets the message in request scope
        request.setAttribute("Message", message);
         
         
}}*/}
    
public void setmessage(String messages){
this.message=messages;
    

}
public String getmessage(){
return message;
}
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    PrintWriter ps = response.getWriter();
    ps.write(getmessage());
    
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
       try (PrintWriter out = response.getWriter()) {
        String firstname ="";
        String surname=" ";
        String middlename="";
        int age=0;
        String location="";
        String phonenumber="";
       
        String town="";
        String relation="";
        String nextofkin="";
        String nextofkinnum="024";
        String password="";
        String accountsnumber="";
         int pin=0;
        Part picture;
        InputStream inputstream=null;
        firstname=request.getParameter("firstname");
         surname=request.getParameter("surname");
        middlename =request.getParameter("middlename");
        age=Integer.parseInt(request.getParameter("age"));
        location=request.getParameter("location");
        phonenumber=request.getParameter("phonenumber");
          town=request.getParameter("town");
        relation=request.getParameter("nextofkinrela");
        
        nextofkin=request.getParameter("nextofkin");
        nextofkinnum=request.getParameter("phonenumberkin");
        password=request.getParameter("password");
        accountsnumber=request.getParameter("accountnumber");
         picture =request.getPart("picture");
         // InputStream inputstream = null;
       
         
        if (picture!=null){
     
     System.out.println(picture.getName());
     System.out.println(picture.getSize());
     System.out.println(picture.getContentType());
     inputstream = picture.getInputStream();
     }
    PrintWriter me = response.getWriter();
     try{
        Class.forName ("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapp","root","");
      if (inputstream !=null){
            
            
            ps = conn.prepareStatement ("insert into cusdetails(firstname,surname,middlename,age,location,phonenumber,town,relation,nextofkin,nextofkinum,password,accountsnumber,picture) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
           

            ps.setString(1,firstname );
            ps.setString(2, surname);
            ps.setString(3, middlename);
               ps.setInt(4, age);
             ps.setString(5,location);
              ps.setString(6, phonenumber);
               ps.setString(7, town);
                ps.setString(8, relation);
              
               ps.setString(9, nextofkin);
                  ps.setString(10, nextofkinnum);
            
               ps.setString(11, password);
          
              
               ps.setString(12, accountsnumber);
               
              if (inputstream!=null){
          ps.setBlob(13,inputstream);
                int a = ps.executeUpdate();    
         if (a==1){
              getServletContext().getRequestDispatcher("/accountcreated.html").include(request, response);    
           }else{
             message="error try agian";
             setmessage(message);
             
             }
            
            }
            }else{
      message="error try again";
      me.write(message);
      setmessage(message);
      }
     }catch(Exception ex){
      
        
     
     out.println("<h1>"+ex+"</h1>");
     
     me.write(ex.toString());
     getServletContext().getRequestDispatcher("/error.html");    
     
     
     setmessage(ex.toString());
     } finally {
        if (conn != null) {
            // closes the database connection
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
         getServletContext().getRequestDispatcher("/error.html");    
     
     
            }
        }
        // sets the message in request scope
        request.setAttribute("Message", message);
          getServletContext().getRequestDispatcher("/error.html"); 
        
    }
    }
       
           
    
    
    }
   
    

}
