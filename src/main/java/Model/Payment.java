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
public class Payment {

    private Date Payment_Date;
    private float Total_Amount;
    private String Payment_Method;

    public Payment(Date Payment_Date, float Total_Amount, String Payment_Method) {
        this.Payment_Date = Payment_Date;
        this.Total_Amount = Total_Amount;
        this.Payment_Method = Payment_Method;
    }

    public Date getPayment_Date() {
        return Payment_Date;
    }

    public void setPayment_Date(Date Payment_Date) {
        this.Payment_Date = Payment_Date;
    }

    public float getTotal_Amount() {
        return Total_Amount;
    }

    public void setTotal_Amount(float Total_Amount) {
        this.Total_Amount = Total_Amount;
    }

    public String getPayment_Method() {
        return Payment_Method;
    }

    public void setPayment_Method(String Payment_Method) {
        this.Payment_Method = Payment_Method;
    }

}
