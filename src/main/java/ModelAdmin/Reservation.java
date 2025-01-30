/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelAdmin;

import java.sql.Date;

/**
 *
 * @author HP
 */
public class Reservation {

    private int Reservation_ID;
    private int Customer_ID;
    private String Room_Code;
    private int TotalPrice;
    private Date Check_In_Date;
    private Date Check_Out_Date;

    public Reservation() {
    }

    public Reservation(int Reservation_ID, int Customer_ID, String Room_Code, int TotalPrice, Date Check_In_Date, Date Check_Out_Date) {
        this.Reservation_ID = Reservation_ID;
        this.Customer_ID = Customer_ID;
        this.Room_Code = Room_Code;
        this.TotalPrice = TotalPrice;
        this.Check_In_Date = Check_In_Date;
        this.Check_Out_Date = Check_Out_Date;
    }

    public int getReservation_ID() {
        return Reservation_ID;
    }

    public void setReservation_ID(int Reservation_ID) {
        this.Reservation_ID = Reservation_ID;
    }

    public int getCustomer_ID() {
        return Customer_ID;
    }

    public void setCustomer_ID(int Customer_ID) {
        this.Customer_ID = Customer_ID;
    }

    public String getRoom_Code() {
        return Room_Code;
    }

    public void setRoom_Code(String Room_Code) {
        this.Room_Code = Room_Code;
    }

    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public Date getCheck_In_Date() {
        return Check_In_Date;
    }

    public void setCheck_In_Date(Date Check_In_Date) {
        this.Check_In_Date = Check_In_Date;
    }

    public Date getCheck_Out_Date() {
        return Check_Out_Date;
    }

    public void setCheck_Out_Date(Date Check_Out_Date) {
        this.Check_Out_Date = Check_Out_Date;
    }

    public void setRoomCode(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
