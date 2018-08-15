<%-- 
    Document   : menu
    Created on : Jul 31, 2018, 11:59:28 AM
    Author     : SirLynS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="javscript/jquery-3.2.1.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color:#31b0d5; ">
        <%
        try{
        String info="info.jsp";
               String accountnumber =(String)session.getAttribute("accountnumber");
               String ipname=request.getServerName();
                   String firstname=(String)session.getAttribute("firstname");
                   if (firstname.equals("Enock")){
                   info="accmenu.jsp";
                   } 
        
        %>
        <div class='row'>
            
            <div class='col-lg-12 col-md-12 col-sm-12'>
                <div class="col-md-12 col-sm-12 col-lg-12 ">
                 <div class="row" style="background-color:#fff; ">
                <div class="col-md-5 col-lg-5 col-sm-5 ">
                    <%//top banner%>
                    <img src="images/pennybank_1.png" style="width:540px; height:200px; "/>
                    
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    <div><b><p style=" font-size:5em;letter-spacing:1px; ;   ">Penny Bank</p></b><p style="margin-top:0px; margin-right:80px; font-size:25px;   ">Your Trusted Saving App</p></div>   
                    
                    </div></div>
                  <DIV class="row" style="background-color:#fff;" >
                        
                   <nav class="nav">
                       <ul class=" nav navbar-nav navbar">
                           <li><a href="<%=info%>">Info</a></li>
                           <li><a href="index.jsp">Logout</a></li>
                           </ul>
                       </nav>
                    </DIV>
                
                </div>
                <div class="row">
                    <div class="col-md-8 col-sm-8 col-lg-8 col-offset-md-2 col-sm-offset-2 col-offset-lg-2" style="margin-top:30px; ">
                       
                            <table class="table">
               <%
                   
                  
                 String      lastname=(String)session.getAttribute("lastname");
 int port=request.getServerPort();
            
            String nextofkin="";
          String loation="";
                     String phonenumber=(String)session.getAttribute("phonenumber");
if (firstname.equals("null")||lastname.equals("null")){
    
}               

               %>
                     <tr>
                       <td> <img src="http://<%=ipname%>:<%=port%>/mybankapp/myimage.jsp?accountsnumber=<%=accountnumber%>" style="width:240px; height:220px;" alt='picture here' >
                    </td>
                    <td id="info">
                     <p style="color:#fff; font-size:24px; text-decoration:#000;  ">Welcome <%=firstname%> <%=lastname%> <hr /></p>
                    <p  style="color:#fff; font-size:24px; text-decoration:#000;  ">Accoutnumber:<%=accountnumber%> <hr /></p>
                   
                    </td></tr>
                     <tr style="margin-top:300px; ">
                         <td><input type="button" onclick="" class="form-control" id="pinfo" value="Personal Info"></td> &nbsp; &nbsp; &nbsp; &nbsp;
                         <script type="text/javascript">
                     $(document).ready(function(){
              $("#pinfo").click(function(){
               
                
             $.post("personalinfo.jsp",{},function(data){
               $("#info").html(data);
             
               
           });
                
                  });  });  
                 
                 
                 </script>
                         
                 <td><input type="submit"class="form-control" Value="View Transactions" onclick="Clickgo()">
                 <script>
             function Clickgo(){
                  window.location.replace("checkbalance_1.jsp");
       
                 
             }        
             </script>
                 
                 </td></tr>
                     <tr>
                       <td><input type="button" onclick="" class="form-control" value=" Withdraw Processes"></td> &nbsp; &nbsp; &nbsp; &nbsp;
                         <td><input type="submit" class="form-control" Value="Current Balance" id='currentbalance'></td></tr>
                           <script type="text/javascript">
                     $(document).ready(function(){
              $("#currentbalance").click(function(){
               
                
             $.post("checkbalance.jsp",{},function(data){
               $("#info").html(data);
             
               
           });
                
                  });  });  
                 
                 
                 </script>
                     </tr>
                    
                       <tr>
                       <td><input type="button" onclick="" class="form-control" value="Transfer Money"></td> &nbsp; &nbsp; &nbsp; &nbsp;
                         <td><input type="submit" class="form-control" Value="Deposite Processes"></td></tr>
                     
                     </tr>
                     
                     </tr>
                       
                    
                     
                     
                
            
</table>
            <div class=''>
                
            </div>
        <div></div>
        <div>
            
        </div>
        <%}catch (Exception ex){
response.sendRedirect("index.jsp");
}%>
        </div>
    </body>
</html>
