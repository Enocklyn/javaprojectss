/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lyns.login;
import java.sql.*;


/**
 *
 * @author SirLynS
 */
public class login {
String message ="notvalid";
Connection conn=null;
PreparedStatement ps= null;
ResultSet rs=null;

String firstname;
String lastname;
String accountnumber;
String nextofkin;
public String loation;
String phonenumber;
String Town;
String regdate;
public String getmessage(){
return this.message;
}
public String getfirstname(){

return this.firstname;
}
public String getlastname(){
return  this.lastname;
}
public String getaccountnumber(){
return this.accountnumber;

}
public String getnextofkin(){
return this.nextofkin;
}
public String  getphonenumber(){
return this.phonenumber;
}
public String getTown(){
return this.Town;
}
String getregdate(){
return this.regdate;
}

public String correctcredentials(String accountnumber, String password){

     try{
        Class.forName ("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapp","root","");
  
         ps=conn.prepareStatement("select *  from cusdetails where accountsnumber=? and password=?");
         
         ps.setString(1, accountnumber);
         ps.setString(2, password);
         rs =ps.executeQuery();
       if(rs.next()){
        this.accountnumber=(rs.getString("accountsnumber"));
        this.firstname=(rs.getString("firstname"));
        this.lastname=(rs.getString("surname"));
        this.nextofkin=(rs.getString("nextofkin"));
        this.loation=(rs.getString("location"));
        this.Town=(rs.getString("town"));
        this.regdate=(rs.getString("datet"));
        this.phonenumber=(rs.getString("phonenumber"));
        message="successful";
        }
    rs.close();  ps.close();   conn.close();
     }catch(Exception ex){
     message=("fatal error"+ex);
     }
    
return message;
}    
}
