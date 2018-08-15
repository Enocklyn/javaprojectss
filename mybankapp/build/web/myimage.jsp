<%-- 
    Document   : myimage
    Created on : 30-Jan-2018, 13:52:44
    Author     : Enocklyn
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
    String accountnumber = request.getParameter("accountsnumber");
     
        //sellecting stuffs from database
  response.setContentType("image/png");
  OutputStream o = response.getOutputStream();
  
Blob image = null;

Connection con = null;
Statement stmt = null;
byte [] imgData =null;

ResultSet rs = null;

String name=null ;
       try {
  Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapp","root","");
   stmt = con.createStatement();
       
        rs = stmt.executeQuery("select picture from cusdetails where accountsnumber='"+accountnumber+"'");
    %>  
  <table cellspacing="120px" style="margin-left: auto; margin-top: auto; margin-right: auto">
      <tr>
         
              <%
        int count = 1;
      while(rs.next()){
       
    image = rs.getBlob("picture");
    count+=1;
    imgData= image.getBytes(1,(int) image.length());
    o.write (imgData);
    
     out.println(count);
     ///retrieving audio data
        
      }
      o.close();
     o.flush();
     rs.close();
   }
  catch (Exception e) {
      response.sendRedirect("checkbalannce.html");

}
          //response.sendRedirect("login.jsp");
              %>
      
    </body>
</html>
