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
public class ReservationHasService {

    private int reservationid;
    private int serviceid;
    private int quantity;
    private float sales;
    private String cusName;
    private String RoomCode;
    private int totalPrice;
    private Date checkin;
    private Date CheckOut;
    private String PhoneNumber;
    private String ServiceName;

    public ReservationHasService() {
    }

    public ReservationHasService(int reservationid, int serviceid, int quantity, float sales) {
        this.reservationid = reservationid;
        this.serviceid = serviceid;
        this.quantity = quantity;
        this.sales = sales;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getRoomCode() {
        return RoomCode;
    }

    public void setRoomCode(String RoomCode) {
        this.RoomCode = RoomCode;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckOut() {
        return CheckOut;
    }

    public void setCheckOut(Date CheckOut) {
        this.CheckOut = CheckOut;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getServiceName() {
        return ServiceName;
    }

    public void setServiceName(String ServiceName) {
        this.ServiceName = ServiceName;
    }

    public int getReservationid() {
        return reservationid;
    }

    public void setReservationid(int reservationid) {
        this.reservationid = reservationid;
    }

    public int getServiceid() {
        return serviceid;
    }

    public void setServiceid(int serviceid) {
        this.serviceid = serviceid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getSales() {
        return sales;
    }

    public void setSales(float sales) {
        this.sales = sales;
    }

}
