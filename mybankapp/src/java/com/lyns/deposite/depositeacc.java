/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lyns.deposite;
import java.sql.*;

/**
 *
 * @author Enocklyn
 */
public class depositeacc {
 private    String accountsnumber,message;
 private String workerfirstname, workersurname,workerstatus;
 
 public String getmessage(){
 return message;
 }
 
 private double amount=0.0;
 
 public void insertdeposite(String accountsnumber,double amount,String workerfirstname,String workersurname,String workerstatus) throws SQLException{
     this.workerfirstname=workerfirstname;
     this.workersurname=workersurname;
     this.workerstatus=workerstatus;
     
     this.accountsnumber =accountsnumber;
     this.amount =amount;
 
     
 Connection con=null;
 PreparedStatement ps;
 ResultSet rs=null;
   try {
            Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapp", "root", "");
            Statement stmt = con.createStatement();
              ps=con.prepareStatement("select firstname,surname, phonenumber from cusdetails where accountsnumber=?");
       // ps=conn.prepareStatement("select firstname,surname, phonenumber from cusdetails where accountsnumber=?");
       
        ps.setString(1, accountsnumber);
         
          rs = ps.executeQuery();
         if (rs.next()){
         ps = con.prepareStatement ("insert into deposite(accountnumber,firstnamepayer,surnamepayer,othernamepayer,amount) values(?,?,?,?,?)");
                 ps.setString(1,accountsnumber );
                 
                 ps.setString(2, workerfirstname);
                 ps.setString(3,workersurname);
                 ps.setString(4, workerstatus);
                 ps.setDouble(5, amount);
                 int a = ps.executeUpdate();
                 if (a==1){
                 message="succesfuldeposite";
                 
                 }
                 else
                     message=" please check the fields ";
                 String newamount =Double.toString(amount); 
                 
                 String space= " ";
                 space ="  ";
                 
          ps= con.prepareStatement("insert into statementofacc(accountumber,withdrawal,deposit,depoam,withdrawam) values(?,?,?,?,?)");
          
          ps.setString(1, accountsnumber);
          ps.setString(2, space);
          ps.setString(3, accountsnumber);
          ps.setString(4, newamount);
          ps.setString(5, space);
          int ab = ps.executeUpdate();
          if (ab==1){
          message="successfuldeposite plus statementtofacc";
          }
            }else
                message=" this accountnumber is invalid ";
   }catch(Exception ex){
 
       
       
 message=ex.toString();  
   } rs.close(); con.close(); 
 
 } 
  
}
