<%-- 

    Document   : processredrwal
    Created on : 07-Oct-2017, 10:13:38
    Author     : Enocklyn

--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <jsp:useBean id="getbalance"  class="com.lyns.addaccount.addacc"/>

        <title>JSP Page</title>

    </head>

    <body>
        <%
        
        String accountnumber="";
        
        String firstname="";
        
        String surname="";
        
        String othername=" ";
        
        Double amount=0.0;
        
        String phnumber="";
        
        accountnumber = request.getParameter("accountnumber");
        
        firstname=request.getParameter("firstname");
        
        surname=request.getParameter("surname");
        
        othername=request.getParameter("othername");
        
        amount=Double.parseDouble(request.getParameter("amount"));
        
        phnumber=request.getParameter("phonenumber");
        
        Connection con;
        
        PreparedStatement ps;
         
        if(accountnumber.equals("")){
         
         response.sendRedirect("/redrawal.jsp");
        
        }   
        
        else{
             
              
             getbalance.performcalculation(accountnumber);
             
              getbalance.setaccountsnumber(accountnumber);
             
             
             double totalamount = getbalance.getsum();
      
             if (totalamount>amount){
     try{
     
      Class.forName ("com.mysql.jdbc.Driver");
      
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapp","root","");
    
      ps = con.prepareStatement ("insert into redrawal(accountnumber,firstname,surname,othernamepayer,amount,phonenumber) values(?,?,?,?,?,?)");
      
      if ((accountnumber!="")&&(firstname!="")&&(amount!=0.0)){
      
      ps.setString(1, accountnumber);
      
      ps.setString(2,firstname);
      
      ps.setString(3,surname);
      
      ps.setString(4, othername);
      
      ps.setDouble(5, amount);
      
      ps.setString(6, phnumber);
      
      ps.executeUpdate();
      
     
         String newamount =Double.toString(amount); 
                 
                 String space= " ";
                 space ="  ";
                 
          ps= con.prepareStatement("insert into statementofacc(accountumber,withdrawal,deposit,depoam,withdrawam) values(?,?,?,?,?)");
          
          ps.setString(1, accountnumber);
          ps.setString(2,  accountnumber);
          ps.setString(3,space);
          ps.setString(4,space);
          ps.setString(5, newamount);
          int ab = ps.executeUpdate();
          if (ab==1){
         out.print("successful withdrawal... an amount of  GhC"+ amount+" has been withdrawn from your account remaining amount is <b>GHC" +(totalamount-amount)+"</b>");
           }
 
      // out.println("coonected");
      
      //out.print(accountnumber+surname+firstname+othername+phnumber+amount);
           out.print("successful withdrawal... an amount of  GhC"+ amount+" has been withdrawn from your account remaining amount is <b>GHC" +(totalamount-amount)+"</b>");
           }else{
           response.sendRedirect("/redrawal.jsp");
           }
        ps.close();
    //
      con.close(); 
     }catch(Exception ex){
     
  out.print(accountnumber+surname+firstname+othername+phnumber+amount+ex.toString());
     
    
     }
             }else{
             
             out.println("<h3 style='color:#00e;'>Insufficient Balance </h3><br />Your Remaining Amount Is "+ totalamount + " Therefore You Can Not Withdraw .. ");

             }
   }
        %>

        <h1></h1>

    </body>

</html>
