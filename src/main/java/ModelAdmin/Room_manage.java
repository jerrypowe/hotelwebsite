/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelAdmin;

/**
 *
 * @author HP
 */
public class Room_manage {

    private String Code;
    private int ID;
//    private boolean Status;
    private boolean available;
    private boolean booked;
    private boolean occupied;

    public Room_manage() {
    }

    public Room_manage(String Code, int ID, boolean available, boolean booked, boolean occupied) {
        this.Code = Code;
        this.ID = ID;
        this.available = available;
        this.booked = booked;
        this.occupied = occupied;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String Code) {
        this.Code = Code;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public boolean isBooked() {
        return booked;
    }

    public void setBooked(boolean booked) {
        this.booked = booked;
    }

    public boolean isOccupied() {
        return occupied;
    }

    public void setOccupied(boolean occupied) {
        this.occupied = occupied;
    }

    public boolean isAvai(String status) {
        boolean avai = false;
        if (status.equals("Available")) {
            avai = true;
        }
        return avai;
    }

    public boolean isBooked(String status) {
        boolean booked = false;
        if (status.equals("Booked")) {
            booked = true;
        }
        return booked;
    }

    public boolean isOccup(String status) {
        boolean occup = false;
        if (status.equals("Occupied")) {
            occup = true;
        }
        return occup;
    }
}
