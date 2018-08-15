<%-- 
    Document   : checklogin
    Created on : Aug 4, 2018, 12:12:20 AM
    Author     : SirLynS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="verify" class="com.lyns.login.login" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
      String accountnumber=request.getParameter("accountnumber");
      String password=request.getParameter("password");
      
      String firstname="";
String lastname="";

String getaccountnumber="";
String nextofkin="";
String location="";
String phonenumber="";
String Town="";
String regdate="";

      verify.correctcredentials(accountnumber, password);
      if (verify.getmessage().equals("successful")){
      firstname=verify.getfirstname();
      lastname=verify.getlastname();
      getaccountnumber =verify.getaccountnumber();
         nextofkin =verify.getnextofkin();
         Town =verify.getTown();
         location=verify.loation;
         
         phonenumber= verify.getphonenumber();
      
      session.setAttribute("location",location);
      session.setAttribute("firstname",firstname);
      session.setAttribute("lastname", lastname);
      session.setAttribute("phonenumber", phonenumber);
      session.setAttribute("regdate", regdate);
      session.setAttribute("town" ,Town);
      session.setAttribute("nextofkin" ,nextofkin);
      session.setAttribute("accountnumber" ,getaccountnumber);
      %>
              
      <script>
          window.location.replace("menu.jsp");
          
      </script>
      <%
          
      }
     
      
      
      else{
      %>
      
      <h4 style="color:#e00">Incorrect Credentials + <%=verify.getmessage()%></h4>
      
      <%
      }
      %>
    </body>
</html>
