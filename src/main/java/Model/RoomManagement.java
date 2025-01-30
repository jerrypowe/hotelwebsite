/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class RoomManagement {

    private String room_code;
    private int Room_id;
    private String status;

    public RoomManagement(String room_code, int Room_id, String status) {
        this.room_code = room_code;
        this.Room_id = Room_id;
        this.status = status;
    }

    public String getRoom_code() {
        return room_code;
    }

    public void setRoom_code(String room_code) {
        this.room_code = room_code;
    }

    public int getRoom_id() {
        return Room_id;
    }

    public void setRoom_id(int Room_id) {
        this.Room_id = Room_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
