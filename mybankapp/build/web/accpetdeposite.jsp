<%-- 
    Document   : accpetdeposite
    Created on : Aug 5, 2018, 12:15:55 AM
    Author     : SirLynS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="deposite" class="com.lyns.deposite.depositeacc"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
String accountnumber = request.getParameter("accountnumber");
Double amount =Double.parseDouble(request.getParameter("amount"));
String name =request.getParameter("name");
String surname=request.getParameter("surname");
String status=request.getParameter("status");

deposite.insertdeposite(accountnumber, amount, name, surname, status);
String message = deposite.getmessage();

%>
<Script >
    var message = "<%=message%>";
    alert(message);
    </script>
    <p style='color:#2b542c;'><%=message%></p>
    </body>
</html>
