<%-- 
    Document   : myage
    Created on : 18-Jan-2018, 12:16:03
    Author     : Enocklyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="myage" scope="request" class="com.derby.date.mydate"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       String getdate= request.getParameter("myage");
      myage.mydates(getdate);
      int yourage =myage.getage();
      
      if (yourage<=14){
      %>
      <p style="color:#f00;">please you should be 15 years and above</p>
     <% }else{
      
      session.setAttribute("age", yourage);
      
        %>
       
        <P style="font-size:15px; "><b> <%=yourage%></b></p>
  
        <%}%>
    </body>
</html>
