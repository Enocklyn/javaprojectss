<%-- 
    Document   : personalinfo
    Created on : Aug 4, 2018, 5:32:28 AM
    Author     : SirLynS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
     String firstname=null;
String lastname=null;

String getaccountnumber="";
String nextofkin="";
String location="";
String phonenumber="";
String Town="";
String regdate="";
firstname=(String)session.getAttribute("firstname");
lastname =(String)session.getAttribute("lastname");
nextofkin=(String)session.getAttribute("nextofkin");
location =(String)session.getAttribute("location");
phonenumber=(String)session.getAttribute("phonenumber");
Town=(String)session.getAttribute("town");
regdate=(String)session.getAttribute("regdate");
            
         if (firstname.equals(null)||lastname.equals(null)){
         response.sendRedirect("menu.jsp");
         }else{
       
       %>
       <div class="h3 text-info">
        <p>Full Name : <%=firstname%> <%=lastname%> <hr/></p>
        <p>Phone Number : <%=phonenumber%> <hr/> </p>
        <p>Next Of Kin :<%=nextofkin%> <hr /></p>
        <p>City/Town : <%=Town%> <hr/> </p>
        <p>Location :<%=location%><hr /></p>
       <%}%>
       </div>
    </body>
</html>
