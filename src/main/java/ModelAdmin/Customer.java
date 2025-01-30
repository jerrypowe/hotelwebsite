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
public class Customer {

    private int ID;
    private String Name;
    private String Address;
    private String PhoneNumber;
    private String Email;
    private String Password;
    private Date Age;

    public Customer() {
    }

    public Customer(int ID, String Name, String Address, String PhoneNumber, String Email, String Password, Date Age) {
        this.ID = ID;
        this.Name = Name;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
        this.Email = Email;
        this.Password = Password;
        this.Age = Age;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public Date getAge() {
        return Age;
    }

    public void setAge(Date Age) {
        this.Age = Age;
    }

    public static boolean isEmpty(Customer cus) {
        return (cus.getID() < 0) && cus.getName().isEmpty();
    }

}
