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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="javscript/jquery-3.2.1.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            $(document).ready(function(){
                
                $("#deposite").click(function(){
                   var accountnumber =$("#accountnumber").val();
                   var amount=$("#amount").val();
                   var  name=$("#name").val();
                   var surname=$("#surname").val();
                   var status=$("#status").val();
                    $("#amount").val("0");
                    $.post("accpetdeposite.jsp",{accountnumber:accountnumber,amount:amount ,name:name, surname:surname,status:status},function(data){
                    
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
        //  String wheretogo ="";  
            try{
          String myname = (String)session.getAttribute("firstname");
          
          //wheretogo=(String) session.getAttribute("status");
         // wheretogo =status;
         // if (wheretogo.equalsIgnoreCase("manager")||wheretogo.equals("IT MANAGER")){
         // wheretogo="manager.jsp";
        //  }else
           //   wheretogo="menu.jsp";
          
         if (myname.equals("null")||myname.equals("")){
           session.setAttribute("error", "you are loged please just login again");
          response.sendRedirect("index.jsp");
         }else{
             String accountnumber = (String)session.getAttribute("accountnumber");
          String name=(String)session.getAttribute("firstname");
          String surname =(String) session.getAttribute("surname");
         String phonenumber =(String)session.getAttribute("phonenumber");
// String status =(String) session.getAttribute("status");
                  
     
     
         // ps=con.prepareStatement("select firstname,surname, phonenumber from cusdetails where accountsnumber=?");
       // ps=conn.prepareStatement("select firstname,surname, phonenumber from cusdetails where accountsnumber=?");
       
       String ipname =request.getServerName();
       int portname = request.getServerPort();
       
       //ps.setString(1, accountnumber);
         
          //rs = ps.executeQuery();
         //if (rs.next()){
        
           //String name =rs.getString("firstname");
          // String surname =rs.getString("surname");
         // String phonenumber =rs.getString("phonenumber");
           //name=name.toUpperCase();
           //surname=surname.toUpperCase();
       
     
          %>    
             
   <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
       
             <div class="row">
            
             <div class="col-lg-12 col-sm-12 col-md-12 ">
         
                <div class="row" style="background-color:#fff; ">
                           <div class="col-md-5 col-lg-5 col-sm-5 ">
                    <%//top banner%>
                    <img src="images/pennybank_1.png" style="width:540px; height:200px; "/>
                    
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    <div><b><p style=" font-size:5em;letter-spacing:1px; ;   ">Penny Susu </p></b><p style="margin-top:0px; margin-right:40px; font-size:25px;   ">Your Trusted Saving App</p></div>   
                    
                    </div></div></div>
               
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
      //  String ipname = request.getServerName();
    
    balance.performcalculation(accountnumber);
    double amount = balance.getsum();
    
     //  String port =request.getServletPath();
    
    %>
    
    
             <DIV CLASS="row">
           <div class="col-lg-12 col-md-12 col-sm-12 col-lg-offset-1 col-md-offset-1 "> 
               <div style="margin-top:45px; text-decoration-color:#2b542c; ">
            <div class="col-lg-3 col-md-3 col-sm-3 ">
     
                
                <div class="media">
             <img src="http://<%=ipname%>:<%=portname%>/mybankapp/myimage.jsp?accountsnumber=<%=accountnumber%>" style="width:240px; height:220px;" alt='picture here' >
           
           
           
           </div>
            
            </div>
              
            <div class="col-lg-5 col-md-5 col-sm-5 col-lg-pull-1 col-md-pull-1 "  >
            
         
   <table class="table" style="text-shadow:0px 1px 1px #999;">          
              
        
            <tr><td>Name:</td><td> &nbsp; &nbsp; <%=name%>  <%=surname%></td> </tr>
            <tr><td>Account Number: </td><td>&nbsp; &nbsp; <%=accountnumber%></td></tr>
             <tr><td>Phone Number: </td><td>&nbsp; &nbsp;  <%=phonenumber%></td></tr>
             <tr><td>Current Balance: </td><td>&nbsp; &nbsp; GH₵ <%=amount%> only</TD></tr>
        
       </table>
             
            </div> 
               
               <div class="col-lg-3 col-md-3 col-xs-3 ">
                 <div style="background-color:#abc;  color:#000; margin-top:0px;">
                     <table class="table" style="background-color:#abc;  color:#000; "><tr> <td>  
                              <form method="post" action="redrawal.jsp">
            <div   >
            <input type="submit" value="Withdraw" class="form-control" style="background-color:#000; color:#fff;   height:2em; width:14em; font-size:15px;">
            <input type="hidden" value="<%=accountnumber%>" name="accountnumber">
            </div>
                </form></td>
                     </table>
            
                     </div> </div> </div> </DIV> </div> <hr />
             
                   <div class="row">
                  
                       
                 <div class="col-lg-6 col-md-6 col-sm-6 col-lg-offset-1 col-md-offset-1">
             
                     
                  <div class="form well-sm">
                 
                
                 <table class="table" style="background-color:#abc; text-shadow:0px 1px 1px #444; color:#000; margin-top:0px; ">
                   
                     <tr>
                         
              <td> <p style=" color:#000;" class="form-control">Amount GH₵:</p></td><td> <input type="text" onkeyup="validate(this)" class="form-control"  style="color:#000;" id="amount" name="amount" placeholder="0.0"></td>
                
                    <input type="hidden" id="accountnumber" name="accountnumber" value="<%=accountnumber%>">
                 <input type="hidden" id="name" name="name" value="<%=name%>">
                 <input type="hidden" id="surname" name="surname" value="<%=surname%>">
                 <input type="hidden" id="status" name="status" value="<%=name%>">
                 <td>  </td><td>    <input type="submit" value=" Deposit "  id="deposite" class="form-control" name="deposite" style="background-color:#000; color:#FFF" onclick="validate()"></td>
           <td>    <input type="reset" value=" Clear" id="clear" name="clear" class="form-control"  on style="background-color:#000;color:#FFF" ></td>
                
             <script type="text/javascript">
                function validate(input){
                    var regex=/[^0-9]/;
                    input.value=input.value.replace(regex,"");
                    
                }

             </script>       
                 </tr> 
                 
                 
                 
                 </table>  <hr />
             
                 
                 
                 
           <div class="well">
           <div id="msg1"  style="color:#00f;">text here</div>
             </div></div>
            
             </div>
         
            
            
            
            
            </div>
            
                             
                             
             </div>                
                             
                             
                             
                      <%
       
             
        %>
                    
              
          
        <!-- /.contain
        <%
         }
   
     }catch (Exception ex){
                                  out.println(ex.toString())   ;
                                out.print("<b>whoo something went wrong please check accountnumber entered </b>"+ex.toString());
                     }%>
    </body>
</html>
