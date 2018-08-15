<%-- 
    Document   : checkbalance
    Created on : 13-Sep-2017, 11:16:05
    Author     : Enocklyn
--%>

<%@page import="com.itextpdf.text.html.simpleparser.HTMLWorker"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.tool.xml.XMLWorkerHelper"%>
<%@page import="com.itextpdf.tool.xml.XMLWorker"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="getbalance"  class="com.lyns.addaccount.addacc"/>


<%@ page import="java.sql.*;"%>
<%@ page import="java.util.*;"%>
<%@page import ="java.util.Vector;"%>
<%@page import="java.io.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="javscript/jquery-3.2.1.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
     
        <title>check balance</title>
        
        
        
        <Script type="text/javascript">
       $(document).ready(function(){
           $("#pdf").click(function(){
              var accountnumber=$("#accountnumber1").val(); 
               $.post("generatepdf.jsp",{accountnumber:accountnumber},function(data){
                   $("#pdfmsg").html(data);
                   
                   
               });
               
           });
           
           
           
       });
        
        
        </Script>
    </head>
    <body  style="background-color:#31b0d5"> 
        <%try{
          //  String wheretogo="";
            //     wheretogo=(String) session.getAttribute("status");
         // wheretogo =status;
          //if (wheretogo.equalsIgnoreCase("manager")||wheretogo.equals("IT MANAGER")){
          //wheretogo="manager.jsp";
          //}else
            //  wheretogo="menu.jsp";
          
         // String myname = (String)session.getAttribute("firstname");
        // String surname =(String)session.getAttribute("surname");
          //if (myname.equals("null")||myname.equals("")){
            //   session.setAttribute("error", "you are signed out please just login again");
        //response.sendRedirect("index.jsp");
        // }else{
        %>
    <div class="row">
         <div class="row">
        <div class="col-lg-12 col-md-12 col-xs-12">
       
             <div class="row">
            
            <div class="col-lg-12 col-md-12 col-xs-12  ">
               
             <div class="col-lg-12 col-xs-12 col-md-12 ">
         
                <div class="row" style="background-color:#fff; ">
                           <div class="col-md-5 col-lg-5 col-sm-5 ">
                    <%//top banner%>
                    <img src="images/pennybank_1.png" style="width:540px; height:200px; "/>
                    
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-6">
                    <div><b><p style=" font-size:5em;letter-spacing:1px; ;   ">Penny Bank </p></b><p style="margin-top:0px; margin-right:40px; font-size:25px;   ">Your Trusted Saving App</p></div>   
                    
                    </div></div></div>
              
                
            </div>
          </div>
               
        </div>
            
          <div style="background:#fff; font-family:PEPERTUA;text-shadow:1px 2px 2px #000; " >      
        <nav style="" class=" col-lg-offset-2 col-md-offset-2 col-xs-offset-2">
            
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
 

    <!-- Collect the nav links, forms, and other content for toggling -->
   
    <ul class="nav navbar-nav " style="text-decoration:#fff; font-size:20px; text-shadow:1px 2px 2px #abc;">
     
        <li class="active"><a href ="menu.jsp">Main Menu <span class="sr-only">(current)</span></a></li>
        
        <li><a href="logout.jsp">home</a></li>
         </ul>
     
    </div><!-- /.navbar-collapse -->
      
        </nav></div>
        
        <div class="col-lg-10 col-md-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
 
            
    
                       
                             
                             
                             
                             <div class="row">
          
           
            <div class="col-lg-10 col-md-10 col-sm-10 ">
            
               
                  
        <DIV   class="col-lg-4 col-md-4 col-xs-4 pull-right">
            <P>STATEMENT OF ACCOUNT</P>
            <p>page: 1 of 1</p>
        </div>
           </div></div><hr/>
                             
        
        <%
           
            Connection conn;
            Statement state,state2;
            ResultSet rs,rs2;
            
        String accountnumber=(String)session.getAttribute("accountnumber");
        
        if (accountnumber.equals("")){
        response.sendRedirect("index.jsp");
        
        }else{
            
            
            
            
       getbalance.setaccountsnumber(accountnumber);
       String us=getbalance.getaccountsnumber();
       getbalance.performcalculation(us);
       double newsum= getbalance.getsum();
       String myfirstname = getbalance.getfirstname();
       myfirstname=myfirstname.toUpperCase();
       String mysurname = getbalance.getsurname();
      mysurname =mysurname.toUpperCase();
       String getphonenumber = getbalance.getphonenumber();
  //balance.checkbalances(accountnumber);
       String date="";
       String accountnumberdb="";
       String withdrawaldb="";
       String deposidbt="";
       String Withdrawam="";
       String depoam="";
       
       
       try{
        Class.forName("com.mysql.jdbc.Driver");

        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapp", "root", "");
         
        state = conn.createStatement();
       
        state2 = conn.createStatement();
        
        rs = state.executeQuery("select accountumber,mydate,deposit,depoam,withdrawal,withdrawam  from statementofacc where  accountumber ='" + accountnumber + "'");//transactiondate BETWEEN (CURRENT_DATE() - INTERVAL 1 MONTH) AND CURRENT_DATE()and
        
              
              
        
          int port =request.getServerPort();
        String ipname = request.getServerName();%>    
         <DIV CLASS="row">
          <div class="col-lg-2 col-md-2 col-xs-2 ">
     
                
                <div class="media">
               <img src="http://<%=ipname%>:<%=port%>/mybankapp/myimage.jsp?accountsnumber=<%=accountnumber%>" style="width:240px; height:220px;" alt='picture here' >
           
           
           
           </div></div>
              <div class="col-lg-4 col-md-4 col-xs-4 col-lg-offset-1 col-xs-offset-1 ">
            
         
   <table class="table " >          
              
        
            <tr><td>Name:</td><td> &nbsp; &nbsp; <%=myfirstname%>  <%=mysurname%></td> </tr>
            <tr><td>Account Number: </td><td>&nbsp; &nbsp; <%=accountnumber%></td></tr>
             <tr><td>Phone Number: </td><td>&nbsp; &nbsp;  <%=getphonenumber%></td></tr>
             <tr><td>Current Balance: </td><td>&nbsp; &nbsp; GH₵<%=newsum%> only</TD></tr>
        
       </table>
             
            </div> 
 
           
                  
          <div class="col-lg-3 col-md-3 col-xs-3 col-lg-offset-2 col-md-offset-2 ">
              <div class="row">
                  <div class="col-lg-offset-1 col-md-offset-1">
                 <div style="backgroud-color:#abc;">
                   </div></div>    </div></div>         
         
         
         
         
         </div><hr/>
      <table cellspacing="2px;" height="50%" cellpadding="2px; " class="table table-responsive table-striped"><tr style='color:#fff; font-size: 18px;background-color:#000 '><th>Date (Timestamp)
                </th><th>Withdrawal(s)</th><th>Amount(GHC)</th><th>Deposit</th><th>Amount(GHC)</th><th>Current Balance</th>
                    </tr><tr style="font-family:Times New Roman,Candara; font-size: 25px;  color:#000;">
                       
     
  
                 
          <%
                // Vector  mydate = new Vector();
     //    Vector deposits = new Vector();
       // Vector depoamnt = new Vector();
      // Vector withdraw =new Vector();
      // Vector withamnt =new Vector();
       
      // Enumeration dater;
       
    //   List <String>dater = new ArrayList<String>(); 
   // List <String>dmenum= new ArrayList<String>(); 
   // List <String>damtenum= new ArrayList<String>(); 
  // List <String>wdnum= new ArrayList<String>(); 
  //  List <String>wamtnum= new ArrayList<String>(); 
  
    String dater="";
    String dmenum="";
    String damtenum="";
    String wdnum="";
    String wamtnum="";
    
     // Enumeration dmenum;
    //   Enumeration damtenum;
    //   Enumeration wdnum;
   //    Enumeration wamtnum;

            
            double totaldepo=0.0;
            double totalwith=0.0;
        totaldepo =   getbalance.getdeposum();
        totalwith=getbalance.getredrawalsum();
       while ((rs.next())){
                  
                  dater=(rs.getString("mydate"));
                  wdnum=(rs.getString("withdrawal"));
                   wamtnum=(rs.getString("withdrawam"));
                   
                  
                
                   dmenum=(rs.getString("deposit"));
                   damtenum=(rs.getString("depoam"));
%>
          
                        <tr>
                            <td><%=dater%><p></p></td>
                            <td><%=wdnum%></td>
                            <td><%=wamtnum%></td>
                            <td><%=dmenum%></td>
                            <td><%=damtenum%></td>
                             <td><%=newsum%></td>
                        
                        </tr>
                        <%       

       }
     //  int counts =0;
   //    counts=dater.size()-1;
        %>
                        
                <tr><td></td><td></td><td><p><HR/>Total: <b><%=totalwith%></b></p></td><td>
                                
            </td><td><hr/><p>Total: <b><%=totaldepo%></b></p></td><td><hr />Total Balance:<b><%=newsum%></b></td></tr>
                            
                            
                            <%
                            
                          /*  dater=mydate.elements();
                            damtenum=depoamnt.elements();
                            dmenum=deposits.elements();
                            wdnum=withdraw.elements();
                            wamtnum=withamnt.elements();
                           */
                            %>
                            
                            <%
                                /*
                                
               try{
       //ConverterProperties props =new ConverterProperties();
        String str = "<head>helloo this is </head><table style='color:#abc; border:1px;'><tr><td>Name:</td><td> &nbsp; &nbsp;"+myfirstname + mysurname+"</td> </tr>"+"<tr><td>Account Number: </td><td>&nbsp; &nbsp;" +accountnumber+"</td></tr>"   + "<tr><td>Phone Number: </td><td>&nbsp; &nbsp;" + getphonenumber + "</td></tr>"+  "<tr><td>Current Balance: </td><td>&nbsp; &nbsp; GH₵" + newsum  + "only</TD></tr> </table>"
                
                +"<table ><tr style='color:#fff; font-size: 18px;background-color:#2b542c '><th>Date Deposit"
              + " </th><th>Deposit</th><th>date withdrawals</th><th>withdrawals</th><th>balance</th>";
                
                   
             
        
             Document document = new Document(PageSize.A4);
          PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("c://Users//Enocklyn//Desktop//New folder//pdf.pdf") );
          
          StringBuilder contentbuilder = new StringBuilder();
          BufferedReader in =null;
           String strr= "";
         try{
           in = new BufferedReader(new FileReader("F:/PROJECTS/NetBeansProjects/BankingApp/BankingApp-war/web/dshb.jsp"));
          while((strr=in.readLine())!=null){
          contentbuilder.append(strr);
          }
            }catch(Exception ex){
         ex.printStackTrace();
         }
          String content =contentbuilder.toString();
       
// document.addAuthor("sir lyns");
           HTMLWorker htmlworker =new HTMLWorker(document);
         


//htmlworker.parse(new StringReader("<table>"));
        // while (ddenum.hasMoreElements()){
       // htmlworker.parse(new StringReader("<table><p>"+ddenum.nextElement().toString()+"</p>"));
         
         //        }
       // htmlworker.parse(new StringReader("</table>"));
                 document.open();
      //  HTMLWorker htmlworker =new HTMLWorker(document);
        htmlworker.parse(new StringReader(content));
        
         document.close();
         System.out.println("printing ....");
           }catch(FileNotFoundException ex){
           out.print(ex);
           }
          */ %>
       
       <% rs.close(); conn.close();   }

catch(Exception ex){
                      out.print(ex.toString());
                   }%>
         
<%}}catch (Exception ex){

  response.sendRedirect("index.jsp");
}
%>
 
     </body>
</html>
