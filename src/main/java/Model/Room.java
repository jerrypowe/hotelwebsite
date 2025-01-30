/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Room {
    private int roomid;
    private String roomType;
    private int capacity;
    private double price;
    private String description;
    private String imager;    
    private String imager1;
    private String imager2;
    private String imager3;
    private String imager4;
    private String imager5;
    private String imager6;

    public Room(int roomid,String roomType, int capacity, double price, String description, String imager, String imager1, String imager2, String imager3, String imager4, String imager5, String imager6) {
        this.roomid = roomid;
        this.roomType = roomType;
        this.capacity = capacity;
        this.price = price;
        this.description = description;
        this.imager = imager;
        this.imager1 = imager1;
        this.imager2 = imager2;
        this.imager3 = imager3;
        this.imager4 = imager4;
        this.imager5 = imager5;
        this.imager6 = imager6;
    }

    public Room() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }
    
    
    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImager() {
        return imager;
    }

    public void setImager(String imager) {
        this.imager = imager;
    }

    public String getImager1() {
        return imager1;
    }

    public void setImager1(String imager1) {
        this.imager1 = imager1;
    }

    public String getImager2() {
        return imager2;
    }

    public void setImager2(String imager2) {
        this.imager2 = imager2;
    }

    public String getImager3() {
        return imager3;
    }

    public void setImager3(String imager3) {
        this.imager3 = imager3;
    }

    public String getImager4() {
        return imager4;
    }

    public void setImager4(String imager4) {
        this.imager4 = imager4;
    }

    public String getImager5() {
        return imager5;
    }

    public void setImager5(String imager5) {
        this.imager5 = imager5;
    }

    public String getImager6() {
        return imager6;
    }

    public void setImager6(String imager6) {
        this.imager6 = imager6;
    }

    @Override
    public String toString() {
        return "Room{" + "roomType=" + roomType + ", capacity=" + capacity + ", price=" + price + ", description=" + description + ", imager=" + imager + ", imager1=" + imager1 + ", imager2=" + imager2 + ", imager3=" + imager3 + ", imager4=" + imager4 + ", imager5=" + imager5 + ", imager6=" + imager6 + '}';
    }

     
 }