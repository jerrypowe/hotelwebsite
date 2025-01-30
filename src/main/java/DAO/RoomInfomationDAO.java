/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ModelAdmin.Room;
import ModelAdmin.Room_manage;
import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class RoomInfomationDAO extends DBContext {

    public List<Room> GetAllFullInfo() {
        List<Room> list = new ArrayList<>();
        Room_manage roomM = new Room_manage();
        String query = "Select  *  from Room";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room(rs.getInt("Room_ID"),
                        rs.getString("Room_Type"),
                        rs.getInt("Capacity"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getString("IMAGER"),
                        rs.getString("IMAGER1"),
                        rs.getString("IMAGER2"),
                        rs.getString("IMAGER3"),
                        rs.getString("IMAGER4"),
                        rs.getString("IMAGER5"),
                        rs.getString("IMAGER6"),
                        rs.getString("IMAGER7")
                );
                list.add(room);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Room> GetAll() {
        List<Room> list = new ArrayList<>();
        Room_manage roomM = new Room_manage();
        String query = "Select  *  from Room";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room room = new Room(rs.getInt("Room_ID"),
                        rs.getString("Room_Type"),
                        rs.getInt("Capacity"),
                        rs.getInt("Price"),
                        rs.getString("Description")
                );
                list.add(room);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Room GetCustomer(String id) {
        Room r = new Room();
        String query = "select * from Room  where Room_ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                r.setID(rs.getInt("Room_ID"));
                r.setType(rs.getString("Room_Type"));
                r.setCapacity(rs.getInt("Capacity"));
                r.setPrice(rs.getInt("Price"));
                r.setDescription(rs.getString("Description"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return r;
    }

    public void Update(Room r) {
        String query = "UPDATE Room SET Room_Type = ?, Capacity = ?, Price = ?,Description = ? WHERE Room_ID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, r.getType());
            pstmt.setInt(2, r.getCapacity());
            pstmt.setInt(3, r.getPrice());
            pstmt.setString(4, r.getDescription());
            pstmt.setInt(5, r.getID());
            pstmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
