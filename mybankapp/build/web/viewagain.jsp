<%-- 
    Document   : viewagain
    Created on : Aug 1, 2018, 12:38:48 PM
    Author     : SirLynS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style='background-color:#269abc '>
                       
        <%
            String location="";
        String firstname="";
        String surname="";
        String middlename="";
        String password="";
        
        int age=(Integer) session.getAttribute("age");
        String phonenumber="";
        String town="";
        String nextofkin="";
        String nextofkinnum="";
        String accountnumber="";
        String nextofkinrela="";
        String phonenumberkin="";
        String date ="";
        
        String getipname= request.getServerName();
        firstname= request.getParameter("firstname");
        date  =request.getParameter("date");
        surname =request.getParameter("surname");
        middlename=request.getParameter("middlename");
        password=request.getParameter("passsword");
        phonenumber =request.getParameter("phonenumber");
        town=request.getParameter("town");
        nextofkin=request.getParameter("nextofkin");
          java.util.Random me = new java.util.Random();
          int  num = me.nextInt(10);
          int num2 = me.nextInt(123);
          
           String accntnumber = "a0"+num +"61"+num2;
         accountnumber =accntnumber;
         nextofkinrela =request.getParameter("rela");
        phonenumberkin=request.getParameter("nextofkinnum");
        location =request.getParameter("location");
        
        %>
        <div class="row">
         
            <div class="col-lg-10 col-sm-10 col-lg-10 col-lg-offset-1 col-sm-1 col-md-offset-1">
                <div class="row" style="background-color:#fff; ">
                <div class="col-md-5 col-lg-5 col-sm-5">
                    <%//top banner%>
                    <img src="images/pennybank_1.png" style="width:540px; height:200px; "/>
                    
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    <div><b><p style=" font-size:5em;letter-spacing:1px; ;   ">Penny Susu </p></b><p style="margin-top:0px; margin-right:40px; font-size:25px;   ">Your Trusted Saving App</p></div>   
                    
                    </div></div>
        
        <div class=" col-md-5 col-sm-5 col-lg-5 col-offset-md-3 col-offset-lg-3 col-sm-offset-2" style="margin-top: 30px;">
        <div class="well">
          <form METHOD="post" id="confirm" style="color:#31b0d5;" name="confirm" action="http://<%=getipname%>:28623/mybankapp/FileUploadServlet" enctype="multipart/form-data">
      
              <input type="hidden" name="accountnumber" value="<%= accountnumber%>">
              
             <input type="hidden" name="firstname" value="<%=firstname%>">
              
             <input type="hidden" name="middlename" value="<%=middlename%>">
              
             <input type="hidden" name="surname" value="<%=surname%>">
              
             <input type="hidden" name="age" value="<%=age%>">
             <input type="hidden" name="date" value="<%=date%>">
              
             <input type="hidden" name="phonenumber" value="<%=phonenumber%>">
               <input type="hidden" name="town" value="<%=town%>">
                <input type="hidden" name="location" value="<%=location%>">
             <input type="hidden" name="nextofkin" value="<%=nextofkin%>">
             <input type="hidden" name="nextofkinrela" value="<%=nextofkinrela%>">
            <input type="hidden" name="phonenumberkin" value="<%=phonenumberkin%>">
            
         
            
              <table class="table" style="font-size:16px; " title="Recheck Your Details ">
             <tr><td><label>Account Number</label></td><td><%=accountnumber%></td></tr>
             
                  <tr><td><label>First Name</label></td><td><%=firstname%></td></tr>
             <tr><td><label>Middle Name</label></td><td><%=middlename%></td></tr>
             <tr><td><label>Surname<label></td><td><%=surname%></td></tr>
             <tr><td><label>Date Of Birth<label></td><td><%=date%></td></tr>
             <tr><td><label>AGE</label></td><td><%=age%></td></tr>
             <tr><td><label>Phone number</label></td><td><%=phonenumber%></td></tr>
             <tr><td><label>Town</label></td><td><%=town%></td></tr>
             <tr><td><label>Location</label></td><td><%=location%></td></tr>
             <tr><td><label>Next_Of_Kin</label></td><td><%=nextofkin%></td></tr>
             <tr><td><label>Relationship</lable></td><td><%=  nextofkinrela%></td></tr>
             <tr><td></label>Next_Of_Kin Phone Number</label></td><td><%=phonenumberkin%></td><hr /></tr>
             <tr><td colspan="2"><h3>Please Enter Your Password And Upload Your Picture <h3></td></tr>
             <tr><td><label for="name">Password</label></td><td><input type="password" class="form-control" name="password"></td></tr>
             
                <tr><td>  
                    
               <label>Upload Your Picture </label>  </td><td>  
                  <INPUT TYPE="FILE" class="form-control" id="picture" NAME="picture" onchange="document.getElementById('blah').src=window.URL.createObjectURL(this.files[0])"></div>
                <div ><img id="blah" width="200"  height="180"></div>
                  </td></tr>
                
                <tr><td><input type="submit" value="Create Account" style="background-color:#000; color:#fff " class="form-control"></td></tr>
                </table>
        
        <div><div></div>
        <div></div><div>
        </div><div>
        </div>
        
        
    </body>
</html>
