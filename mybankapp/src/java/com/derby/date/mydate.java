

package com.derby.date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
public class mydate {
    private int age;
    public void setage(int age){
        this.age =age;
    
    }
    public int getage(){
    return age;
    }
    
    public void  mydates (String date ){
    
    //dealing with the year
    int yeardob =Integer.parseInt(date.substring(0,4) );
    int monthdob = Integer.parseInt(date.substring(5,7));
    int daydob =Integer.parseInt(date.substring(8,10));
    DateFormat dateformat =new SimpleDateFormat ("yyyy");
    java.util.Date mydate = new java.util.Date();
    int thisyear = Integer.parseInt(dateformat.format(mydate));
   
    //dealing with month
    dateformat = new SimpleDateFormat("mm");
    mydate = new java.util.Date();
    int thismonth =Integer.parseInt(dateformat.format(mydate));
   
    //dealing with day
    dateformat = new SimpleDateFormat("dd");
    mydate =new java.util.Date();     
    int thisday =Integer.parseInt(dateformat.format(mydate));
    
     age = thisyear - yeardob;
    if (thismonth<monthdob){
    age =age -1;
    }
    if (thismonth==monthdob && thisday<daydob){
    age=age-1;
    
    }
    
    }
    
}
