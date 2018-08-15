<%-- 
    Document   : checkbalance
    Created on : Aug 4, 2018, 5:32:56 AM
    Author     : SirLynS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="checkbalance" class="com.lyns.addaccount.addacc"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>portal</title>
    </head>
    <body>
         <%
       String   accountnumber=(String)session.getAttribute("accountnumber");
        Double amount=0.0;    
       String firstname=null;
       String phonenumber="";
             String lastname=null;
             firstname=(String)session.getAttribute("firstname");
             lastname=(String)session.getAttribute("lastname");
             accountnumber =(String)session.getAttribute("accountnumber");
             phonenumber =(String)session.getAttribute("phonenumber");
             if (firstname.equals(null)||lastname.equals(null)){
         response.sendRedirect("menu.jsp");
         }else{
             
         checkbalance.performcalculation(accountnumber);
        
        
         amount= checkbalance.getsum();
         
         }%>
         <div class='h4 text-success'>
         <p>Welcome: <%=firstname%> <%=lastname%><hr/></p>
         <p>Phone Number:<%=phonenumber%><hr/></p>
          <p>Your Balance : GHC<%=amount%><hr/></p>
         </div>
    </body>
</html>
