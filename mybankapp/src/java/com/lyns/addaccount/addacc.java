package com.lyns.addaccount;

import java.io.Serializable;
import java.util.*;
import java.sql.*;
import static java.util.Collections.enumeration;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

public class addacc implements Serializable {

    public static final long serialversionid = 8150756503956053844L;
    ResultSet rs;int ab = 0;
    Connection conn;
    PreparedStatement ps ;
    PreparedStatement ps1;
    
    ResultSet rs1;
    ResultSet rs2;  ResultSet rs3;
    double getam = 0;
    double redrawalsum = 0;
     double getdeposum=0.0;
    
  public double getredrawalsum(){
  return this.redrawalsum;
  }
  public double getdeposum(){
  
  return this.getdeposum;
  }
  
    private double sum = 0.0;
    private int finalvalue;
    private String connns = "";
    String firstname = "";
    String surname = "";
    String phonenumber="";
    Enumeration baffour;
    public void setphonenumber(String phonenumber){
    this.phonenumber=phonenumber;
    }
    public String getphonenumber(){
    return phonenumber;
    
    
    }
     public void setfirstname(String firstname){
     this.firstname = firstname;
     }
     public String getfirstname(){
     
        return firstname;
     }
     public void setsurname(String surname){
     this.surname=surname;
     }
     public String getsurname(){
     return surname;
     }
     
    public void setfinalvalue(int finalvalue) {
        this.finalvalue = finalvalue;
    }

    public int getfinalvalue() {

        return finalvalue;
    }

    private String accountsnumber;

    public String getaccountsnumber() {
        return accountsnumber;
    }

    public void setaccountsnumber(String acc) {
        this.accountsnumber = acc;
    }

    public String getconnns() {
        return connns;
    }

    public void setconnns(String me) {
        this.connns = me;
    }

    public void setsum(double sum) {
        this.sum = sum;
    }

    public double getsum() {
        return sum;
    }

    public void performcalculation(String accountnumber) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapp", "root", "");
            Statement stmt = con.createStatement();Statement stmt1 = con.createStatement();Statement stmt2 = con.createStatement();Statement stmt3 = con.createStatement();
            rs = stmt.executeQuery("select amount from deposite where accountnumber ='" + accountnumber + "'");
            rs1 = stmt1.executeQuery("select amount from redrawal where accountnumber ='" + accountnumber + "'");
            rs2 = stmt2.executeQuery("select firstname,surname, phonenumber from cusdetails where accountsnumber='" + accountnumber + "'");
           rs3=stmt3.executeQuery("select accountnumber  from balance where accountnumber='" + accountnumber + "'");
           connns = "connected";
               while (rs.next()) {
                double me = rs.getDouble("amount");
                sum = sum + me;
             getdeposum=sum;
      }
            while (rs1.next()){
               getam = rs1.getDouble("amount");
                redrawalsum = redrawalsum + getam;
                
            }
            while(rs2.next()){
            phonenumber = rs2.getString("phonenumber");
            firstname = rs2.getString("firstname");
                surname = rs2.getString("surname");
            }
         String getamountba=null;
            while (rs3.next()){
            getamountba = rs3.getString("accountnumber");
            }
            if (getamountba == null){
                String sql = "";
                if (redrawalsum > 0) {
                    sum = sum - redrawalsum;
                    //
                     
                    ps1 = con.prepareStatement("UPDATE balance SET accountnumber = ? , firstnamecus = ? , surnamepacus=? , amount=? WHERE accountnumber= ?");
                   ps1.setString(1, accountnumber);
                   ps1.setString(2,firstname);
                   ps1.setString(3, surname);
                   ps1.setDouble(4, sum);
                   ps1.setString(5, accountnumber);
                    ab = ps1.executeUpdate();
                    ps1.close();
                     connns = ab + " updated the balance ermmm thing go check out hahahaha if";
                } else {

                    sum = sum + 0;
                    ps1 = con.prepareStatement("UPDATE balance SET accountnumber = ? , firstnamecus = ? , surnamepacus=? , amount=? WHERE accountnumber= ?");
                   ps1.setString(1, accountnumber);
                   ps1.setString(2,firstname);
                   ps1.setString(3, surname);
                   ps1.setDouble(4, sum);
                   ps1.setString(5, accountnumber);
                 ab = ps1.executeUpdate();
                    ps1.close();
                    
                     connns =" update number 0 <b> "+ab +firstname +sum + surname+" </b>updated the balance ermmm from update side";
                }}else{
                 PreparedStatement ps6 = con.prepareStatement ("insert into balance(accountnumber,firstnamecus,surnamepacus,amount) values(?,?,?,?)");
                  
             ps6.setString(1, accountnumber);
                   ps6.setString(2,firstname);
                   ps6.setString(3, surname);
                   ps6.setDouble(4, sum);
                 
                 ab = ps6.executeUpdate();
                    ps6.close();
                    
                     connns =" update number 0 <b> "+ab +firstname +sum + surname+" </b>updated the balance ermmm thing go from insert side";
            
            
            }con.close();

               
                //FacesMessage facesmsg = new FacesMessage("the  accountnumber  <b>  "+accountsnumber +": has a total sum of money "+getsum()+ "</b> is calulated below: " );
//FacesContext.getCurrentInstance().addMessage(null, facesmsg);
            }
          
         catch (Exception ex) {
            connns = ex.toString() +ab +sum;
        }
    }

}
