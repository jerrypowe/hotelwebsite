/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Booking {
   private int Revervation_ID ;
   private int customerID;
   private String room_code;
   private  Double TotalPrice;
   private Date check_in_date;
   private Date check_out_date;

    public Booking(int Revervation_ID, int customerID, String room_code, Double TotalPrice, Date check_in_date, Date check_out_date) {
        this.Revervation_ID = Revervation_ID;
        this.customerID = customerID;
        this.room_code = room_code;
        this.TotalPrice = TotalPrice;
        this.check_in_date = check_in_date;
        this.check_out_date = check_out_date;
    }

    

    public int getRevervation_ID() {
        return Revervation_ID;
    }

    public void setRevervation_ID(int Revervation_ID) {
        this.Revervation_ID = Revervation_ID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getRoom_code() {
        return room_code;
    }

    public void setRoom_code(String room_code) {
        this.room_code = room_code;
    }

    public Double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(Double TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

  
    public Date getCheck_in_date() {
        return check_in_date;
    }

    public void setCheck_in_date(Date check_in_date) {
        this.check_in_date = check_in_date;
    }

    public Date getCheck_out_date() {
        return check_out_date;
    }

    public void setCheck_out_date(Date check_out_date) {
        this.check_out_date = check_out_date;
    }
   
   
    
    
}
