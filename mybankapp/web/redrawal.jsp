<%-- 
    Document   : accmenu
    Created on : 11-Mar-2018, 10:16:15
    Author     : Enocklyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="balance" class="com.lyns.addaccount.addacc"/>

<%@ page import="java.sql.*;"%>
<%@ page import="java.util.*;"%>
<%@page import ="java.util.Vector;"%>
<html>    
<head>
    <script src="javscript/jquery-3.2.1.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <script type="text/javascript">
            $(document).ready(function(){
                
                $("#deposite").click(function(){
                   var accountnumber =$("#accountnumber").val();
                   var amount=$("#amount").val();
                   var  name=$("#name").val();
                   var surname=$("#surname").val();
                   var status=$("#status").val();
                   var phonenumber=$("#phonenumber").val();
                    $("#amount").val("0");
                    $.post("processredrwal.jsp",{accountnumber:accountnumber,amount:amount ,firstname:name, surname:surname,othername:status,phonenumber:phonenumber},function(data){
                    
                   $("#msg1").html(data); 
          
                    });
                
                
                });
                $("#clear").click(function(){
                   $("#amount").val("0"); 
                    
                    
                });
                
                
            });
            
            
            </script>
        
        <title>check balance</title>
        
   
    </head>
    <body  style="background-color:#31b0d5">
        <% 
            /*
            
             $(document).ready(function(){
            
            $("#update").click(function(){
                var mynicki =$("#nicki").val();
                var mydate = $("#mydate").val();
                var mystate = $("#state").val();
                var mytown = $("#town").val();
                
                $.post("processupdate.jsp",{mynicki:mynicki, mydate:mydate, mystate:mystate, mytown:mytown},function(data){
                    $("#msg").html(data);
    
                });
            });
    });       */
            
            try{
                  
          String myname = (String)session.getAttribute("firstname");
         if (myname.equals("null")||myname.equals("")){
               session.setAttribute("error", "you are signed out please just login again");
        response.sendRedirect("index.jsp");
         }else{
             String accountnumber =(String)session.getAttribute ("accountnumber");
          String workername=(String)session.getAttribute("firstname");
          String workersurname =(String) session.getAttribute("surname");
          String status =(String) session.getAttribute("surname");
          Connection con=null;
    PreparedStatement ps=null;
          ResultSet rs =null;
                  
     
     
        Class.forName ("com.mysql.jdbc.Driver");
       con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapp","root","");
        ps=con.prepareStatement("select firstname,surname, phonenumber from cusdetails where accountsnumber=?");
       // ps=conn.prepareStatement("select firstname,surname, phonenumber from cusdetails where accountsnumber=?");
       
        ps.setString(1, accountnumber);
         
          rs = ps.executeQuery();
         if (rs.next()){
        
           String name =rs.getString("firstname");
           String surname =rs.getString("surname");
          String phonenumber =rs.getString("phonenumber");
           name=name.toUpperCase();
           surname=surname.toUpperCase();
       
     
          %>    
             
   <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
       
          <div class="row" style="background-color:#fff; ">
                           <div class="col-md-5 col-lg-5 col-sm-5 ">
                    <%//top banner%>
                    <img src="images/pennybank_1.png" style="width:540px; height:200px; "/>
                    
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    <div><b><p style=" font-size:5em;letter-spacing:1px; ;   ">Penny Susu </p></b><p style="margin-top:0px; margin-right:40px; font-size:25px;   ">Your Trusted Saving App</p></div>   
                    
                    </div></div> 
            
          </div>
               
        </div>
            
            
       <div style="background:#fff; font-family:PEPERTUA;text-shadow:1px 2px 2px #000; " >      
        <nav style="" class=" col-lg-offset-2 col-md-offset-2 col-sm-offset-2">
            
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
 

    <!-- Collect the nav links, forms, and other content for toggling -->
   
    <ul class="nav navbar-nav " style="text-decoration:#fff; font-size:20px; text-shadow:1px 2px 2px #abc;">
         <li><a href="">Home</a></li>
        <li><a href="logout.jsp">logout</a></li>
         </ul>
      
     
    </div><!-- /.navbar-collapse -->
      
        </nav></div>
        <!-- /.container-fluid -->


          
    <% 
        String ipname = request.getServerName();
    
    balance.performcalculation(accountnumber);
    double amount = balance.getsum();
    
     int port =request.getServerPort();
    
    %>
    
    
             <DIV CLASS="row">
           <div class="col-lg-12 col-md-12 col-sm-12 col-lg-offset-1 col-md-offset-1 "> 
               <div style="margin-top:45px; background-color:#abc;  color:#000; text-shadow:1px 2px 2px #000; ">
            <div class="col-lg-3 col-md-3 col-sm-3 ">
     
                
                <div class="media">
              <img src="http://<%=ipname%>:<%=port%>/BankingApp-war/myimage.jsp?accountsnumber=<%=accountnumber%>" style="height:140px;  width:160px; background-color:#abc;  color:#000;  "  class="img-thumbnail" >
           
           
           
           </div>
            
            </div>
              
            <div class="col-lg-5 col-md-5 col-sm-5  col-lg-pull-1 col-md-pull-1">
            
         
   <table class="table " style="text-shadow:1px 2px 2px #fff;">          
              
        
            <tr><td>Name:</td><td> &nbsp; &nbsp; <%=name%>  <%=surname%></td> </tr>
            <tr><td>Account Number: </td><td>&nbsp; &nbsp; <%=accountnumber%></td></tr>
             <tr><td>Phone Number: </td><td>&nbsp; &nbsp;  <%=phonenumber%></td></tr>
             <tr><td>Current Balance: </td><td>&nbsp; &nbsp; GH₵<%=amount%> only</TD></tr>
        
       </table>
             
            </div> 
               
               <div class="col-lg-3 col-md-3 col-xs-3 ">
                 <div style="background-color:#abc;  color:#000; ">
                     <table class="table" style="background-color:#abc;  color:#000;  margin-top:1px; text-shadow:1px 2px 2px #000;"><tr> <td>  
                              <form method="post" action="accmenu.jsp">
            <div   >
            <input type="submit" value="Deposit" class="form-control" style="background-color:#000;color:#FFF;text-shadow:1px 2px 2px #000;  height:2em; width:14em; font-size:15px;">
            <input type="hidden" value="<%=accountnumber%>" name="accountnumber">
            </div>
                </form></td><tr><td>
                                  <form method="post" action="myaacount.jsp">
            <div   >
            <input type="submit" value="back" class="form-control" style="background-color:#000;color:#FFF;  height:2em;text-shadow:1px 2px 2px #000; width:14em; font-size:15px;">
           <input type="hidden" value="redrawal.jsp" name="hidden">
            </div>
                                  </form></td></tr></table>
                     </div></div>   
            
               
               
               </div></DIV></div><hr />
             <div class="row">
                 <div class="col-lg-6 col-md-6 col-sm-6 col-lg-offset-1 col-md-offset-1 ">
             <div class="form well-sm">
                 
                
                 <table class="table" style="background-color:#abc;  color:#000;margin-left:0px;   text-shadow:1px 2px 2px #000;">
                   
                     <tr>
                         
              <td> Amount GH₵:</td><td> <input type="text" id="amount" name="amount" class="form-control" placeholder="0.0"></td>
                
                    <input type="hidden" id="accountnumber" name="accountnumber" value="<%=accountnumber%>">
                 <input type="hidden" id="name" name="name" value="<%=workername%>">
                 <input type="hidden" id="phonenumber" value="<%=phonenumber%>">
                 <input type="hidden" id="surname" name="surname" value="<%=workersurname%>">
                 <input type="hidden" id="status" name="status" value="<%=status%>">
           <td>  </td><td>    <input type="submit" value=" Withdraw " id="deposite" class="form-control" name="deposite" style="background-color:#000;color:#FFF;text-shadow:1px 2px 2px #000;"></td>
                 <td>    <input type="reset" value=" Clear" id="clear" name="clear" class="form-control" style="background-color:#000;color:#FFF; text-shadow:1px 2px 2px #000;"></td>
                </tr> 
                 
                        
             <script type="text/javascript">
                function validate(input){
                    var regex=/[^0-9]/;
                    input.value=input.value.replace(regex,"");
                    
                }

             </script>
                 
                 </table>  <hr />
             
                 
                 
                 
           <div class="well">
           <div id="msg1"  style="color:#00f;"></div>
             </div></div>
            
             </div>
             
            
            
            
            
            </div>
            
                             
                             
             </div>                
                             
                             
                             
                      <%
         } else{
             
        session.setAttribute("incorrect","please account number is incorrect"); 
       %>
       <script type="text/javascript">
           alert(" incorrect accountnumber entered ");
           
       </script>              
              
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                
                  <div style="background-color:#bce; text-shadow:1px 2px 2px #000;">
                      <div class="row">
                      <div class="col-lg-4">
              
           <div class="text-capitalize " style="font-size: 35px;  font-family: Elephant; color:#fff"><img src="images/pennybank.png" alt="image" style="height:120px; width:200px;"> 
           </div> </div><div class="col-lg-8 col-md-8 col-md-pull-1 col-lg-pull-1" ><p style="font-size:40px; font-family:wide latin;  letter-spacing:20px; color:#555;  " >PENNY SUSU </p><div  class="col-md-offset-1 col-md-offset-1" style="font-size:30px; letter-spacing:5px; font-family:perpetua; margin-top:0px; " >your trusted savings app</div></div> 
        
          </div>
               </div></div>
       <div style="background:#fff; font-family:PEPERTUA;text-shadow:1px 2px 2px #000; " >      
        <nav style="" class=" col-lg-offset-2 col-md-offset-2 col-sm-offset-2">
            
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
 

    <!-- Collect the nav links, forms, and other content for toggling -->
   
    <ul class="nav navbar-nav " style="text-decoration:#fff; font-size:20px; text-shadow:1px 2px 2px #abc;">
       
        <li><a href="logout.jsp">logout</a></li>
         </ul>
      
     
    </div><!-- /.navbar-collapse -->
      
        </nav></div>
      
           <!-- /.navbar-collapse -->


                <div class="row">
                    <div class="col-lg-10  col-md-10  col-lg-offset-2 col-md-offset-2 " style="margin-top:55px; ">
                        <div class="row">
                            <div class="col-lg-6  col-md-6  ">
                               <div class="well">
                                <div style="background-color:#abc; color: #fff;">

                                    <div class="h3 " style="background-color:#000;  color:#fff;  margin-top:30px; "><p class="col-lg-offset-3 col-md-offset-3 col-xs-offset-3">Enter <b>Correct</b> Account Number</p></div>

                                    <form method="post" id="form" name="form" action="redrawal.jsp">

                                        <input class="form-control"  type="text" name="accountnumber" id="accountnumber" onkeyup="validater(this)" size="25" style="background-color:#fff;  color:#000;  margin-left:60px; width:20em; height:2em; font-size:18px;" placeholder="accountnumber"><hr />
                                        <input type="submit" class="form-control"  value=" Enter " style="background-color:#000;  color:#fff;  width:6em; height:2em; font-size:18px;margin-left:60px; margin-top:15px; margin-bottom:15px;  "/>
                                    <script type="text/javascript">
                function validate(input){
                    var regex=/[^0-9]/;
                    input.value=input.value.replace(regex,"");
                    
                }
                   function validater(input){
                    var regex=/[^0-9a-zA-Z]/;
                    input.value=input.value.replace(regex,"");
                    
                }

             </script>
                                    </form></div></div>
                                </div> </div></div>
                   

                        </div>
  
        <%
         }
     ps.close();
     con.close();
     rs.close();}
     }catch (Exception ex){
                                  out.println("FATAL ERROR");
                                  %>
                                  <script type="text/javascript">
                                   alert("Please Data Entered Is Incorrect "+ex.toString());
                                   
                                  </script> 
                                  
             <%
                     }%>
       
  

             </body>
</html>
       