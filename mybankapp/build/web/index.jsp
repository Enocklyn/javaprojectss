<%-- 
    Document   : index
    Created on : Jul 31, 2018, 11:03:08 AM
    Author     : SirLynS
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="javscript/jquery-3.2.1.min.js" type="text/javascript"></script>
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>my portal</title>
    </head>
    <body style="background-color:#31b0d5; Color:#000; " >
        <DIV class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
                 <div class="col-lg-12 col-sm-12 col-md-12 ">
         
                <div class="row" style="background-color:#fff; ">
                           <div class="col-md-5 col-lg-5 col-sm-5 ">
                    <%//top banner%>
                    <img src="images/pennybank_1.png" style="width:540px; height:200px; "/>
                    
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                    <div><b><p style=" font-size:5em;letter-spacing:1px; ;   ">Penny Bank </p></b><p style="margin-top:-1px; margin-left:80px; font-size:25px;   ">Your Trusted Saving App</p></div>   
                    
                    </div></div></div>
                
                <div class="col-lg-offset-4 col-xs-offset-4 col-offset-md-4 col-xs-4 col-xs-4 col-md-4">
            
                    <div class="well" style="margin-top:120px; ">
          <div style='background-color:#abc; color:#000;  '>  <h3 style='margin-left:120px; margin-right:50px;  '>Log In  </h3>
           <p id="msg" ></p>   
                 </div>       <form >
                    
                   <table class="table-striped">
                 
                   <tr>

               <td> <label for="name"> Account Number</label>  &nbsp;</td><td> 
                   <input type="text" placeholder="Accountnumber"  name="name" class="form-control" id="name" class="form-control">
                   </td>
                   <tr></tr>
                   
                   <tr><td>
              <label for="name"> Password</label>&nbsp;</td> <td>    <input type="password" name="password" id="password" class="form-control" placeholder="password">
                   </td> </tr>
                   <tr><td><input type="button" name="login" id="login" value="login" class='form-control' style="background-color:#000; color:#ffffff"></td></tr>
               </table>
                   </form>
                 <script type="text/javascript">
                     $(document).ready(function(){
              $("#login").click(function(){
                var password = $("#password").val();
                var accountnumber=$("#name").val();
                
             $.post("checklogin.jsp",{password:password,accountnumber:accountnumber},function(data){
               $("#msg").html(data);
             
               
           });
                
                  });  });  
                 
                 
                 </script>
                    </div>
                </div>
             </div>
                     </DIV>
                   
    </body>
</html>
