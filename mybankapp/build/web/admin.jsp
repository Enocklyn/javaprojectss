<%-- 
    Document   : admin
    Created on : Jul 31, 2018, 12:29:34 PM
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
    <body style='background-color:#31b0d5;'>
        <%
        String getipname = request.getServerName();
        %>
        <div class='row'>
        <div class='col-lg-10 col-sm-10 col-md-10 col-xs-10'>
             <div class='col-lg-11 col-sm-11 col-md-11 col-xs-11 col-xs-offset-1 col-lg-offset-1 col-md-offset-1'>
           
             <div class="row" style="background-color:#fff; ">
            
                <div class="col-md-5 col-lg-5 col-sm-5 col-xs-5 ">
                    <%//top banner%>
                    <img src="images/pennybank_1.png" style="width:540px; height:200px; "/>
                    
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    <div><b><p style=" font-size:5em;letter-spacing:1px; ;   ">Penny Susu </p></b><p style="margin-top:0px; margin-right:40px; font-size:25px;   ">Your Trusted Saving App</p></div>   
                    
                    </div></div>
                    <DIV class="row" style="background-color:#fff;" >
                        
                   <nav class="nav">
                       <ul class=" nav navbar-nav navbar">
                           <li><a href="Accoutnumber">Admin Actions</a></li>
                           <li><a href="index.jsp">Sign in</a></li>
                           <li><a href='accmenu.jsp'>Make Deposit</a></li>
                           </ul>
                       </nav>
                    </DIV></div></div>
            <div class='row'>
                <div class=" col-sm-5 col-md-5 col-lg-5 col-md-offset-2 col-xs-5 col-sm-offset-2 col-lg-offset-2">
                    <p style="background-color:#000; color:#fff; font-size:28px;  " >Enter Credentials To Create Accounts</p>
                    <div class='jumbotron'>
                        
                        <form METHOD="post" id="confirm" name="confirm" action="viewagain.jsp">
                            <table class="table" >
          
                      
               
                <tr><td>
                  <label for="name">First Name </label></td><td><input type="text" id="firstname" name="firstname" class="form-control" placeholder="FirstName" onkeyup="amworking(this)">
            </td></tr><tr><td>
       
                 
            <label>Middle Name</label>  </td><td>   <INPUT TYPE="TEXT" NAME="middlename" class="form-control" id="smiddlename" placeholder="MiddleName" onkeyup="amworking(this)">
                </td></tr><tr><td>
                
                  <label>Surname</label></td><td><INPUT TYPE="TEXT" NAME="surname" id="surname" class="form-control" placeholder="Surname " onkeyup="amworking(this)">
                </td></tr><tr><td>
             
                
                <label for="name">Select Date Of Birth:</label> </td><td>
                     <INPUT TYPE="date" NAME="date" id="date" class="form-control">
                     </td></tr>
                <script type="text/javascript">
              
                $(document).ready(function(){
              $("#date").change(function(){
                var myage = $("#date").val();
                
             $.post("myage.jsp",{myage:myage},function(data){
               $("#age").html(data);
             
               
           });
                
                  });  });
                
                </script>
                 <tr><td>
                     <label for="name">Age:</label>
              </td><td>
                <div id="age" class="form-control">age</div>
             
              </td></tr><tr><td>
            <label>Phone Number</label></td><td>     <INPUT TYPE="TEXT" NAME="phonenumber" id="phonenumber" class="form-control" placeholder="Phonenumber" onkeyup="checknum(input)"></div>
               
               </td></tr>
        <tr><td>
                         <label>Town</label></td><td>  <INPUT TYPE="TEXT" NAME="town"  id="town" class="form-control" placeholder="Town" onkeyup="amworking(this)"></div>
                
                 </td></tr><tr><td>
               <label for="name">Location</label></td><td><INPUT TYPE="TEXT" NAME="location" id="location" class="form-control" placeholder="Location" onkeyup="amworking(this)"></div>
                
         
               
               </td></tr><tr><td>
                
             <label>Next_Of_kin</label></td><td> <INPUT TYPE="TEXT" NAME="nextofkin" id="nextofkin" class="form-control" placeholder="Name Of Next_Of_KIN" onkeyup="amworking(this)">
              </td></tr><tr><td>

                <label for="name">Relationship </label></td><td><SELECT NAME="rela" id="rela" class="form-group-sm form-control" >
                             <option name="rela" value="son">SON</option>
                                <option name="rela" value="daughter">DAUGHTER</option>
                                
                     <option name="rela" value="husband">HUSBAND</option>
                     <option name="rela" value="wife">WIFE</option>
                     <option name="rela" value="mother">MOTHER</option>
                     <option name="rela" value="father">FATHER</option>
                     <option name="rela" value="brother">BROTHER</option>
                     <option name="rela" value="sister">SISTER</option>
                     <option name="rela" value="other">OTHER</option>
            
        </select>
             </td></tr>
        
        
        
        
        <tr><td>  
                    
               <label>Next_of_kin Tel Number </label>  </td><td>  <div class="form-group-sm"><INPUT TYPE="TEXT" NAME="nextofkinnum" id="nextofkinnum" class="form-control" placeholder="Phonenumber (Next_Of_Kin)" onkeyup="checknum(this)" ></div>
                
                  </td></tr>
        
        
       
        
        <tr><td>
                  
                      <INPUT TYPE="submit" value="Create Accounts" style="background-color:#000;color:#fff; " class="form-control" >
       
            </td></tr>
        
                  </table></form></div></div>
               
        <script type="text/javascript">
            
            function amworking(input){
               // alert ("hello this is javascript");
                var rgex =/[^a-z]/gi;
                input.value=input.value.replace(rgex, "");
            }
            function checkalphanum(input){
                var regex=/[^a-zA-Z0-9]/;
                input.value=input.value.replace(regex,"");
                
            }
            function checknum(input){
                var regex=/[^0-9]/;
                input.value=input.value.replace(regex,"");
                input.value.input.value.replace(regex,"please enter numbers only");
                
            }
            
            </script>
        
       
   
                            
                            
                            
                            
                        </form>
                        </div>
                    </div>
                </div>
            </div>
      
    </body>
</html>
